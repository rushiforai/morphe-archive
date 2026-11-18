"""Check the release patch changes only the two intended Moodle resources.

Usage: python tools/verify_apk.py original.apk patched.apk
Requires Node.js for an independent JavaScript syntax check.
"""

import hashlib
from pathlib import Path
import subprocess
import sys
import tempfile
from zipfile import ZipFile

ORIGINAL_SHA256 = "96fdab4bc72376f4a766a1fe47f70e2306391ce5246cda7eff5486f697f8e61d"
CREDENTIALS = "assets/www/29870.ac7792e084efe277.js"
RECONNECT = "assets/www/9122.f5a00099cdd6fc7d.js"


def verify(original_path: Path, patched_path: Path) -> None:
    assert hashlib.sha256(original_path.read_bytes()).hexdigest() == ORIGINAL_SHA256, "Unexpected original APK"
    with ZipFile(original_path) as original, ZipFile(patched_path) as patched:
        original_files = {entry.filename for entry in original.infolist() if not entry.is_dir()}
        patched_files = {entry.filename for entry in patched.infolist() if not entry.is_dir()}
        assert original_files == patched_files, "APK files were added or removed"
        changed = {name for name in original_files if original.read(name) != patched.read(name)}
        assert changed == {CREDENTIALS, RECONNECT}, f"Unexpected changed files: {changed}"

        credentials = patched.read(CREDENTIALS).decode("utf-8")
        reconnect = patched.read(RECONNECT).decode("utf-8")
        # Original mode checks and password-form decisions must survive.
        assert "e.isBrowserSSO=p.CoreLoginHelper.isSSOLoginNeeded(e.siteCheck.code)" in credentials
        assert "e.isBrowserSSO=_.CoreLoginHelper.isSSOLoginNeeded(e.siteConfig.typeoflogin)" in reconnect
        assert "e.showLoginForm&&!e.isBrowserSSO?6:-1" in credentials
        assert "e.showLoginForm&&!e.isBrowserSSO?0:-1" in reconnect
        assert "R.vxM(e.siteCheck?7:-1)" in credentials
        assert "T.vxM(e.siteConfig?1:-1)" in reconnect
        assert "CoreLoginCredentialsPage_Conditional_18_Template,10,7" in credentials
        assert '\"form\",16),R.nVh(7,CoreLoginCredentialsPage_Conditional_18_Conditional_7_Template' in credentials
        assert "openBrowserForSSOLogin(o.siteCheck.siteUrl,2,o.siteCheck.service,o.siteCheck.config?.launchurl)" in credentials
        assert "openBrowserForSSOLogin(this.site.getURL(),2,void 0,this.siteConfig.launchurl,this.redirectData)" in reconnect
        with tempfile.TemporaryDirectory() as folder:
            for name, content in (("credentials.js", credentials), ("reconnect.js", reconnect)):
                assert content.count('"Log in through browser"') == 1
                script = Path(folder) / name
                script.write_text(content, encoding="utf-8")
                subprocess.run(["node", "--check", str(script)], check=True)

    print("PASS: only the intended two resources changed; native login checks and SSO parameters retained; JS syntax valid.")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        raise SystemExit(__doc__)
    verify(Path(sys.argv[1]), Path(sys.argv[2]))
