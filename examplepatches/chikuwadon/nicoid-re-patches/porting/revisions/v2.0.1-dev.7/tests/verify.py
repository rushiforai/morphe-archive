"""Cross-feature integrity contracts for the complete effective v2 source overlay."""
from pathlib import Path
from tempfile import TemporaryDirectory
import importlib.util

root=Path(__file__).resolve().parents[1]
revisions=root.parent
repo=root.parents[2]
spec=importlib.util.spec_from_file_location("audit_dev7_stage",root/"patch_207.py")
module=importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
with TemporaryDirectory() as folder:
    module.stage(revisions/"v2.0.0-dev.1/java/e/e/a",folder)
    stage=Path(folder)
    data=(stage/"NicoliveData.java").read_text()
    diagnostics=(stage/"NicoliveDiagnostics.java").read_text()
    browser=(stage/"NicoliveBrowser.java").read_text()
    activity=(stage/"NicoliveActivity.java").read_text()
    service=(stage/"NicoliveService.java").read_text()
    retained=(stage/"RetainedPlayback137.java").read_text()
    scroll=(root/"java/e/e/a/SmoothTabRestore204.java").read_text()
    builder=(root/"build_mpp.py").read_text()
    workflow=(repo/".github/workflows/private-build.yml").read_text()
    assertions={
      "bounded network parser": "FRAME_STALLED" in data and "emptyReads>8" in data,
      "race-safe trace persistence": "eventRevision==snapshotRevision" in diagnostics,
      "precompiled redaction": "SECRET_PATTERN.matcher(s)" in diagnostics,
      "authorized thumbnail": "accountCookie" in browser and "missingHistory" in browser,
      "posted feedback duration": "Toast.LENGTH_SHORT" in activity,
      "long-press playback menu": 'showProgramActions(program)' in activity,
      "live media ownership": "clearMediaSession();" in service and "cancelNotification();" in service,
      "retained media ownership": "clearKeeperNotification(keeper);" in retained,
      "restore is never masked": "setForeground(" not in scroll,
      "pending top cancellation": "if(position<0||justApplied(list,position,top))return;" in scroll,
      "native tab reflection arity": 'native_arity = "    const/4 v12, 0x3"' in builder,
      "8-tab cache configured later": "tab_host.replace(lru_anchor" in builder,
      "new source overlay": "from patch_207 import OVERRIDES, stage" in builder,
      "avoid duplicate Java class": 'p.name != "SmoothTabRestore204.java"' in builder,
      "versioned MPP artifact": "nicoid-re-v2.0.1-dev.7-mpp" in workflow,
    }
    for name,passed in assertions.items():
        if not passed:raise AssertionError(name)
    print("PASS:",len(assertions),"full-source integration, media, and security contracts")
