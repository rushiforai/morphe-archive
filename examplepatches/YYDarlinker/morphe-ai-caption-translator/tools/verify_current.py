"""Current source -> both unit suites -> explicit candidate; never calls a model or publishes."""
from __future__ import annotations

import argparse
from datetime import datetime, timezone
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import uuid
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
TEST_TASKS = (':translation-core:testDebugUnitTest', ':extensions:extension:testDebugUnitTest')
BUILD_TASKS = (':ui-preview:assembleDebug', ':patches:buildAndroid')


def write_json(path, data):
    path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')


def sha(path):
    return hashlib.sha256(long_path(path).read_bytes()).hexdigest()


def long_path(path):
    """Python/Win32 report copies need extended paths for long Gradle testcase HTML names."""
    value = str(path.resolve())
    if os.name == 'nt' and not value.startswith('\\\\?\\'):
        value = '\\\\?\\UNC\\' + value[2:] if value.startswith('\\\\') else '\\\\?\\' + value
    return Path(value)


def copy_reports(source, destination):
    shutil.copytree(long_path(source), long_path(destination), dirs_exist_ok=True)


def git(*args):
    return subprocess.check_output(['git', *args], cwd=ROOT).decode('utf-8').strip()


def source_manifest():
    """Build/test/verification inputs, including untracked source; excludes narrative/evidence/cache."""
    prefixes = ('caption-contracts/', 'caption-shared/', 'translation-core/', 'infrastructure/',
                'application-host/', 'presentation/', 'ui/', 'ui-preview/', 'patches/', 'extensions/',
                'localization/', 'gradle/', 'tools/workspace/', '.github/')
    roots = {'build.gradle.kts', 'settings.gradle.kts', 'gradle.properties', 'gradlew', 'gradlew.bat',
             '.releaserc', 'package.json', 'package-lock.json', 'docs/core-provenance.json', 'docs/ui-preservation.json'}
    files = sorted(set(git('ls-files', '-z').split('\0') + git('ls-files', '--others', '--exclude-standard', '-z').split('\0')))
    rows = []
    for name in files:
        if not name or name.endswith('.md') or '__pycache__' in Path(name).parts:
            continue
        if name in roots or name.startswith(prefixes) or name.startswith('tools/') and len(Path(name).parts) == 2:
            p = ROOT / name
            if p.is_file():
                rows.append(dict(path=name, sha256=sha(p), size=p.stat().st_size))
    fingerprint = hashlib.sha256(json.dumps(rows, sort_keys=True, separators=(',', ':')).encode()).hexdigest()
    return dict(scope=source_manifest.__doc__, files=rows, sha256=fingerprint)


def require_task(receipt, task):
    row = receipt.get('tasks', {}).get(task)
    if not receipt.get('success') or not row or row.get('failure') or not row.get('executed'):
        raise ValueError(f'required task not successful in this Gradle invocation: {task}')
    if row.get('skipped') and row.get('skip_message') not in ('UP-TO-DATE', 'FROM-CACHE'):
        raise ValueError(f'required task skipped without valid reuse: {task}: {row.get("skip_message")}')
    return row


def collect_tests(receipt, archive):
    modules = {}
    for task in TEST_TASKS:
        outcome = require_task(receipt, task)
        xml_dir = Path(outcome['xml'])
        files = sorted(xml_dir.glob('TEST-*.xml'))
        if not files:
            raise ValueError(f'missing required JUnit reports: {task}: {xml_dir}')
        counts = dict(tests=0, failures=0, errors=0, skipped=0)
        for p in files:
            suite = ET.parse(long_path(p)).getroot()
            if suite.tag != 'testsuite':
                raise ValueError(f'expected JUnit testsuite: {p}')
            for key in counts:
                value = int(suite.attrib[key])
                if value < 0:
                    raise ValueError(f'negative JUnit count: {p}')
                counts[key] += value
        if counts['tests'] <= 0 or counts['failures'] or counts['errors'] or counts['skipped'] >= counts['tests']:
            raise ValueError(f'required module has no effective tests or has failures: {task}: {counts}')
        module = task.removesuffix(':testDebugUnitTest').strip(':')
        dst = archive / module.replace(':', '-')
        copy_reports(xml_dir, dst)
        html = Path(outcome['html'])
        if html.is_dir():
            copy_reports(html, dst.with_name(dst.name + '-html'))
        modules[module] = dict(**counts, task=task, xml=str(xml_dir), html=str(html), archived_xml=str(dst),
                               outcome=outcome, execution='gradle-confirmed reuse' if outcome.get('skip_message') in ('UP-TO-DATE', 'FROM-CACHE') else 'executed',
                               reports=[dict(file=p.name, sha256=sha(p)) for p in files])
    return modules


class Steps:
    def __init__(self, evidence, summary):
        self.evidence, self.summary = evidence, summary

    def run(self, name, argv):
        log = self.evidence / (name + '.log')
        row = dict(name=name, command=[str(x) for x in argv], log=str(log), started_at=datetime.now(timezone.utc).isoformat())
        self.summary['commands'].append(row)
        print(f'[{name}] running; log: {log}', flush=True)
        with log.open('w', encoding='utf-8') as out:
            result = subprocess.run([str(x) for x in argv], cwd=ROOT, stdout=out, stderr=subprocess.STDOUT)
        row.update(exit_code=result.returncode, finished_at=datetime.now(timezone.utc).isoformat())
        print(f'[{name}] exit {result.returncode}', flush=True)
        if result.returncode:
            raise RuntimeError(f'{name} failed with exit {result.returncode}; see {log}')


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--run-id', default=datetime.now(timezone.utc).strftime('%Y%m%dT%H%M%SZ') + '-' + uuid.uuid4().hex[:8])
    parser.add_argument('--evidence-dir', type=Path)
    parser.add_argument('--mode', choices=('candidate', 'release'), default='candidate')
    parser.add_argument('--version')
    parser.add_argument('--build-id')
    parser.add_argument('--offline', action='store_true')
    parser.add_argument('--rerun-tests', action='store_true', help='force these two Test tasks only')
    a = parser.parse_args(argv)
    if not re.fullmatch(r'[A-Za-z0-9][A-Za-z0-9._-]*', a.run_id):
        parser.error('run ID must be a simple directory name')
    evidence = (a.evidence_dir or ROOT / 'validation/runs' / a.run_id).resolve()
    if not evidence.is_relative_to(ROOT / 'validation/runs'):
        parser.error('evidence must stay under this repository validation/runs')
    candidate = ROOT / 'build/maintenance/M1a' / a.run_id
    # Refuse to overwrite an earlier run or delivery.
    evidence.mkdir(parents=True, exist_ok=False)
    candidate.mkdir(parents=True, exist_ok=False)
    summary = dict(run_id=a.run_id, mode=a.mode, status='failed', commands=[], tests={},
                   evidence=str(evidence), candidate_directory=str(candidate),
                   composition=dict(status='not executed', reason='requires explicit original APK, official MPP, Patcher and selection; not part of this source/candidate run'),
                   remote_ci='not run by local verification', device='not run', real_model_api='not called')
    steps = Steps(evidence, summary)
    py = [sys.executable, '-X', 'utf8']
    try:
        summary.update(branch=git('branch', '--show-current'), head=git('rev-parse', 'HEAD'), python=sys.version)
        (evidence / 'working-tree-status.txt').write_text(git('status', '--short', '--untracked-files=all') + '\n', encoding='utf-8')
        before = source_manifest()
        write_json(evidence / 'source-manifest.json', before)
        summary['source_fingerprint'] = before['sha256']
        text = (ROOT / 'gradle.properties').read_text(encoding='utf-8-sig')
        def prop(key):
            values = re.findall(r'^\s*' + re.escape(key) + r'\s*=\s*(\S+)\s*$', text, re.M)
            if len(values) != 1:
                raise ValueError(f'expected one {key} property')
            return values[0]
        version = a.version or prop('version')
        if version != prop('version'):
            raise ValueError('expected version differs from current source')
        build_id = a.build_id or (f'release-{version}' if a.mode == 'release' else prop('captionBuildId'))
        if a.mode == 'release' and build_id != f'release-{version}':
            raise ValueError('release requires release-<version> build ID')
        if a.mode == 'candidate' and build_id != prop('captionBuildId'):
            raise ValueError('expected build ID differs from current source')
        summary.update(version=version, build_id=build_id)
        steps.run('localization', py + ['tools/check_localization.py'])
        steps.run('source-boundaries', py + ['tools/verify_integration.py', '--source-only', '--output', evidence / 'source-boundaries.json'])
        steps.run('release-contract', py + ['.github/scripts/test_release_contract.py'])
        steps.run('verification-contract', py + ['tools/test_verification.py', '--output', evidence / 'verification-contract.json'])
        steps.run('workspace-contract', py + ['tools/test_workspace.py', '--output', evidence / 'workspace-contract.json'])
        if a.mode == 'candidate':
            steps.run('metadata', py + ['.github/scripts/validate_morphe_metadata.py', '--mode', 'published'])
        gradle = [str(ROOT / 'gradlew.bat')] if os.name == 'nt' else ['bash', str(ROOT / 'gradlew')]
        receipt_path = evidence / 'gradle-receipt.json'
        build_root = 'build/n39/gradle' if a.mode == 'release' else (candidate / 'gradle').relative_to(ROOT).as_posix()
        tasks = TEST_TASKS + BUILD_TASKS + ((':patches:generatePatchesList',) if a.mode == 'release' else ())
        command = gradle + list(tasks) + ['--no-daemon', '--no-parallel', '--console=plain',
                '--init-script', 'tools/verification.init.gradle', '-Pverification.receipt=' + str(receipt_path),
                '-Pverification.buildRoot=' + build_root, '-Ptranslation.live=false', '-Pscheduler.output=' + str(evidence / 'test-evidence')]
        if a.mode == 'release':
            command += ['-PcaptionBuildId=' + build_id]
        if a.rerun_tests:
            command += ['-Pverification.rerunTests=true']
        if os.name == 'nt':
            command += ['--init-script', 'tools/workspace/workspace.init.gradle']
        if a.offline:
            command += ['--offline']
        steps.run('gradle', command)
        receipt = json.loads(receipt_path.read_text(encoding='utf-8'))
        summary['tools'] = dict(gradle=receipt['gradle_version'], java=receipt['java_version'], python=sys.version,
                                gradle_user_home=os.environ.get('GRADLE_USER_HOME'), temp=os.environ.get('TEMP'),
                                android_user_home=os.environ.get('ANDROID_USER_HOME'))
        if (receipt['version'], receipt['build_id']) != (version, build_id):
            raise ValueError('evaluated Gradle identity differs from expected source identity')
        summary['tests'] = collect_tests(receipt, evidence / 'tests')
        for task in BUILD_TASKS:
            require_task(receipt, task)
        if a.mode == 'release':
            require_task(receipt, ':patches:generatePatchesList')
            steps.run('metadata', py + ['.github/scripts/validate_morphe_metadata.py', version])
        paths = receipt['paths']
        artifacts = {}
        for key in ('mpp', 'mpe', 'ui_apk'):
            source = Path(paths[key])
            target = candidate / source.name
            if receipt.get('artifact_hashes', {}).get(key) != sha(source):
                raise ValueError(f'{key} differs from output captured at Gradle completion')
            shutil.copyfile(source, target)
            if sha(source) != sha(target):
                raise ValueError('candidate copy differs from build output')
            artifacts[key] = dict(path=str(target), sha256=sha(target), size=target.stat().st_size,
                                  build_output=str(source), build_output_sha256=sha(source))
        summary['artifacts'] = artifacts
        steps.run('bundle', py + ['.github/scripts/verify_bundle.py', '--mode', a.mode, '--version', version, '--build-id', build_id,
                   '--mpp', artifacts['mpp']['path'], '--mpe', artifacts['mpe']['path'], '--output', evidence / 'bundle.json'])
        steps.run('boundaries', py + ['tools/verify_integration.py', '--core-classes', paths['core_classes'],
                   '--mpp', artifacts['mpp']['path'], '--mpe', artifacts['mpe']['path'], '--ui-apk', artifacts['ui_apk']['path'], '--output', evidence / 'boundaries.json'])
        after = source_manifest()
        write_json(evidence / 'source-manifest-after.json', after)
        if after != before:
            raise ValueError('source/build/verification inputs changed during verification; rerun affected checks')
        summary['source_unchanged_during_verification'] = True
        write_json(evidence / 'summary.json', summary)
        steps.run('credential-scan', py + ['tools/scan_delivery_credentials.py', '--path', evidence, '--path', artifacts['mpp']['path'],
                   '--path', artifacts['mpe']['path'], '--path', artifacts['ui_apk']['path'], '--output', evidence / 'credential-scan.json'])
        summary['status'] = 'passed'
    except Exception as exc:
        summary['error'] = str(exc)
        print(str(exc), file=sys.stderr, flush=True)
    finally:
        summary['finished_at'] = datetime.now(timezone.utc).isoformat()
        # Preserve available reports even on an unsuccessful Gradle subprocess.
        receipt_file = evidence / 'gradle-receipt.json'
        if summary['status'] != 'passed' and receipt_file.is_file():
            try:
                receipt = json.loads(receipt_file.read_text(encoding='utf-8'))
                for task, row in receipt.get('tasks', {}).items():
                    for kind in ('xml', 'html'):
                        if row.get(kind) and Path(row[kind]).is_dir():
                            copy_reports(Path(row[kind]), evidence / 'failed-reports' / (task.strip(':').replace(':', '-') + '-' + kind))
            except Exception as exc:
                summary['report_archive_error'] = str(exc)
        write_json(evidence / 'summary.json', summary)
        print(f'Verification {summary["status"]}: {evidence / "summary.json"}', flush=True)
    return 0 if summary['status'] == 'passed' else 1


if __name__ == '__main__':
    raise SystemExit(main())
