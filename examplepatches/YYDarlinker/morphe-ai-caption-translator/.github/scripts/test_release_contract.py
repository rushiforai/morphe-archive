import json, os, subprocess, sys, tempfile, unittest
from pathlib import Path
from datetime import datetime
ROOT=Path(__file__).resolve().parents[2]
SCRIPT=ROOT/".github/scripts/validate_morphe_metadata.py"
class ReleaseContractTest(unittest.TestCase):
    def validate(self, mutate=None, mutate_files=None):
        with tempfile.TemporaryDirectory() as tmp:
            dst=Path(tmp)
            for name in ("patches-bundle.json","patches-list.json","gradle.properties","CHANGELOG.md"):
                (dst/name).write_bytes((ROOT/name).read_bytes())
            data=json.loads((dst/"patches-bundle.json").read_text(encoding="utf-8"))
            version=data["version"]
            if mutate: mutate(data)
            (dst/"patches-bundle.json").write_text(json.dumps(data),encoding="utf-8")
            if mutate_files: mutate_files(dst)
            env=dict(os.environ,GITHUB_REPOSITORY="YYDarlinker/morphe-ai-caption-translator")
            return subprocess.run([sys.executable,str(SCRIPT),version],cwd=dst,env=env,capture_output=True).returncode
    def test_current_contract(self): self.assertEqual(0,self.validate())
    def test_reject_duplicate_patch_names(self):
        def duplicate(dst):
            p=dst/"patches-list.json";data=json.loads(p.read_text(encoding="utf-8"));data["patches"].append(data["patches"][0]);p.write_text(json.dumps(data),encoding="utf-8")
        self.assertNotEqual(0,self.validate(mutate_files=duplicate))
    def test_reject_utc_suffix(self): self.assertNotEqual(0,self.validate(lambda d:d.update(created_at=d["created_at"]+"Z")))
    def test_reject_old_repository(self): self.assertNotEqual(0,self.validate(lambda d:d.update(download_url=d["download_url"].replace("morphe-ai-caption-translator","youtube-ai-caption-translator"))))
    def test_reject_mismatched_version(self): self.assertNotEqual(0,self.validate(lambda d:d.update(version="9.9.9")))
    def test_reject_missing_download(self): self.assertNotEqual(0,self.validate(lambda d:d.pop("download_url")))
    def test_reject_conflict(self):
        self.assertNotEqual(0,self.validate(mutate_files=lambda p:(p/"gradle.properties").write_text("<<<<<<< HEAD\nversion = 1.0.6\n=======\nversion = 1.0.6\n>>>>>>> other\n")))
    def test_reject_duplicate_version(self):
        self.assertNotEqual(0,self.validate(mutate_files=lambda p:(p/"gradle.properties").write_text((p/"gradle.properties").read_text()+"\nversion = 1.0.6\n")))
    def test_reject_stale_changelog(self):
        self.assertNotEqual(0,self.validate(mutate_files=lambda p:(p/"CHANGELOG.md").write_text("## [0.0.0] stale\n")))
    def test_reject_literal_newline(self):
        self.assertNotEqual(0,self.validate(lambda d:d.update(description=d["description"]+"`n")))
    def test_reject_impossible_date(self):
        self.assertNotEqual(0,self.validate(lambda d:d.update(created_at="2026-02-31T12:00:00")))
if __name__=="__main__": unittest.main()
