"""Exercise production input guards and strict fingerprints with the actual SDK.

Build the bundle first. Original private APKs are read, never rewritten.
"""
import argparse
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]


def stage_originals(originals: Path, destination: Path) -> None:
    """Copy original bases into the regression fixture; never alter publisher inputs."""
    for app in ('weerplaza', 'nu.nl', 'volkskrant', 'trouw', 'ftm', 'flitsmeister', 'ad', 'nrc'):
        target = destination / app / 'base.apk'
        target.parent.mkdir(parents=True, exist_ok=True)
        directory_base = originals / app / 'base.apk'
        archive = originals / f'{app}-original.apks'
        standalone = originals / f'{app}.apk'
        if directory_base.is_file():
            shutil.copyfile(directory_base, target)
        elif archive.is_file():
            with zipfile.ZipFile(archive) as source:
                try:
                    target.write_bytes(source.read('base.apk'))
                except KeyError as error:
                    raise ValueError(f'{archive.name} needs base.apk') from error
        elif standalone.is_file():
            shutil.copyfile(standalone, target)
        else:
            raise FileNotFoundError(f'No original base.apk, APKS or APK for {app} in {originals}')


def publisher_certificates(output: str) -> list[str]:
    """Extract publisher PEMs from verified apksigner output, excluding stamps."""
    publisher = False
    collecting = None
    result = []
    for line in output.splitlines():
        if 'certificate SHA-256 digest:' in line:
            publisher = line.startswith('Signer ')
        if line == '-----BEGIN CERTIFICATE-----':
            collecting = [line] if publisher else None
        elif collecting is not None:
            collecting.append(line)
            if line == '-----END CERTIFICATE-----':
                result.append('\n'.join(collecting))
                collecting = None
    return result


def apksigner_path() -> str:
    found = shutil.which('apksigner')
    if found:
        return found
    sdk = Path(os.environ.get('ANDROID_HOME') or os.environ.get('ANDROID_SDK_ROOT')
               or Path.home() / 'Library/Android/sdk')
    candidates = sorted(sdk.glob('build-tools/*/apksigner'), reverse=True)
    if not candidates:
        raise RuntimeError('Android SDK apksigner is required for publisher lineage fixtures')
    return str(candidates[0])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--bundle', type=Path)
    parser.add_argument('--originals', type=Path, default=ROOT.parent / 'phone-apks')
    args = parser.parse_args()
    if args.bundle is None:
        version = re.search(r'^version\s*=\s*(\S+)\s*$', (ROOT / 'gradle.properties').read_text(), re.M)
        if version is None:
            parser.error('No project version; specify --bundle')
        args.bundle = ROOT / 'patches/build/libs' / f'patches-{version[1]}.mpp'
    sdk = next((Path.home() / '.gradle/caches/modules-2/files-2.1/app.morphe/morphe-patcher/2.0.1').glob('*/*.jar'))
    desktop = ROOT / '.tools/morphe-desktop-1.19.1-all.jar'
    with tempfile.TemporaryDirectory(prefix='original-input-regression-') as scratch:
        staged = Path(scratch) / 'originals'
        stage_originals(args.originals, staged)
        # The SDK metadata selects one signer for this APK. Exercise both actual
        # publisher lineage certificates independently, without using the source
        # stamp or substituting a synthetic certificate with an invented digest.
        verified = subprocess.run([apksigner_path(), 'verify', '--print-certs', '--print-certs-pem',
                                   str(staged / 'trouw/base.apk')],
                                  capture_output=True, text=True, check=True)
        publishers = publisher_certificates(verified.stdout)
        if len(publishers) != 2:
            raise AssertionError('Expected the two observed DPG publisher lineage certificates')
        (Path(scratch) / 'dpg-publisher-certificates.pem').write_text('\n'.join(publishers))
        cp = f'{sdk}:{desktop}'
        subprocess.run(['javac', '-J-Xmx128m', '-cp', cp, '-d', scratch,
                        str(ROOT / 'tests/OriginalInputRegression.java')], check=True)
        subprocess.run(['java', '-Xmx128m', '-cp', f'{scratch}:{cp}', 'OriginalInputRegression',
                        str(args.bundle.resolve()), str(staged), scratch], check=True)


if __name__ == '__main__':
    main()
