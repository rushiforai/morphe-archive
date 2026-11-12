"""Verify default clone outputs, legacy options and rejected historical patches."""
from pathlib import Path
import hashlib
import json
import shutil
import subprocess

root = Path(__file__).resolve().parents[2]
out = root/'local/issue8/auto-clone/options'; out.mkdir(parents=True, exist_ok=True)
records = []
version = json.loads((root/'patches-bundle.json').read_text())['version']
bundle = root/f'build/release/gemini-microg-patches-{version}.mpp'
assert bundle.is_file(), 'Build the release MPP before running these tests'

def run(name, command):
    p = subprocess.run([str(x) for x in command], cwd=root, capture_output=True, text=True, timeout=240)
    (out/(name+'.log')).write_text(p.stdout+p.stderr)
    return p

def checked(name, passed):
    records.append({'test': name, 'passed': bool(passed)})
    (out/'results.json').write_text(json.dumps(records, indent=2)+'\n')
    print(name+': '+('PASS' if passed else 'FAIL'), flush=True)
    assert passed, name

for name, external in [
    ('default-only', []),
    ('official-defaults', ['-p', root/'tools/patches.mpp', '-e', 'Clone app']),
    ('official-enabled', ['-p', root/'tools/patches.mpp', '-e', 'Clone app',
        '-O', 'packageName=Default', '-O', 'updatePermissions=true', '-O', 'updateProviders=true']),
]:
    apk = out/(name+'.apk'); result = out/(name+'.json')
    build = run(name+'-build', [root/'scripts/patch-apk.sh', root/'inputs/gemini-base.apk', apk, result,
        '-p', bundle, *external])
    checked(name+'-fixture-built', build.returncode == 0)
    verify = run(name+'-verify', [root/'scripts/verify-clone-contract.sh', root/'inputs/gemini-base.apk', apk])
    checked(name+'-clone-contract', verify.returncode == 0)

apk = out/'wrong-package.apk'
shutil.copyfile(root/'inputs/gemini-base.apk', apk)
previous = hashlib.sha256(apk.read_bytes()).hexdigest()
custom = run('wrong-package', [root/'scripts/patch-apk.sh', root/'inputs/gemini-base.apk', apk, out/'wrong-package.json',
    '-p', bundle, '-p', root/'tools/patches.mpp', '-e', 'Clone app',
    '-O', 'packageName=com.quicksearch.bond'])
checked('custom-package-rejected', custom.returncode != 0 and 'Unsupported clone package' in custom.stdout+custom.stderr)
checked('custom-package-preserved-output', hashlib.sha256(apk.read_bytes()).hexdigest() == previous)

for i, patch in enumerate(['Account ID Fallback for Clone', 'Account Switch Lock Bypass', 'Account Sync Binder Loop Fix']):
    apk = out/f'experiment-{i}.apk'
    shutil.copyfile(root/'inputs/gemini-base.apk', apk)
    previous = hashlib.sha256(apk.read_bytes()).hexdigest()
    result = run(f'experiment-{i}', [root/'scripts/patch-apk.sh', root/'inputs/google-base.apk', apk, out/f'experiment-{i}.json',
        '--exclusive', '-p', bundle, '-e', patch])
    checked(f'experiment-{i}-blocked-before-output', result.returncode != 0 and 'Unsupported historical experiment' in result.stdout+result.stderr
        and hashlib.sha256(apk.read_bytes()).hexdigest() == previous)
