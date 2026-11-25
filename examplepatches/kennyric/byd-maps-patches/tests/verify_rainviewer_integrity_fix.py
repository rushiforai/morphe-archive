"""Exercise the emitted no-attestation path and one-time anonymous-session migration."""
import argparse
from pathlib import Path
from verify_dumpert import Smali, canonicalize
from rtl_vm import Memory, Reference, parse, execute

APP="Lcom/lucky_apps/rainviewer/RVApplication;"


def verify(root: Path, original: Path):
    actual,before=Smali(root),Smali(original)
    code=canonicalize(actual.body("Ljz5;","b(ILft0;)Ljava/lang/Object;"))
    assert code[:2]==["const/4 v0, 0x0","return-object v0"],"Attestation entry is still active"
    def no_call(method,args):raise AssertionError("Disabled token path called "+method)
    assert execute(parse(actual.body("Ljz5;","b(ILft0;)Ljava/lang/Object;")),{},no_call,memory=Memory())==0
    for sig in ["c(Lft0;)Ljava/lang/Object;","d(Lcom/google/android/play/core/integrity/StandardIntegrityManager$StandardIntegrityTokenProvider;Lft0;)Ljava/lang/Object;"]:
        assert canonicalize(actual.body("Ljz5;",sig))==canonicalize(before.body("Ljz5;",sig)),"SDK token code was rewritten"
    for sig in ["d(Ljava/lang/String;)V","e(Ljava/lang/String;Ljava/lang/String;)Z"]:
        assert canonicalize(actual.body("Lsl;",sig))==canonicalize(before.body("Lsl;",sig)),"Server refusal was hidden"
    class StartupReached(Exception):pass
    marker="morphe_integrity_session_reset_v1"
    for migrated, failed_commit in [(True,None),(False,None),(False,1),(False,2),(False,3)]:
        data={n:{"key_key":"old-key","sec_key":"old-secret","other_setting":"retained"} for n in ["authorization_prefs","com.lucky_apps.data.preferences"]}
        data["morphe_rainviewer_integrity"]={marker:migrated}
        commits=0
        def call(method,args):
            nonlocal commits
            if method=="Landroid/app/Application;->onCreate()V":return
            if method=="Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;":return Reference(data[args[1]],"Landroid/content/SharedPreferences;")
            if method=="Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z":return int(args[0].value.get(args[1],args[2]))
            if method=="Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;":return Reference((args[0].value,dict(args[0].value)),"Landroid/content/SharedPreferences$Editor;")
            if method=="Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;":args[0].value[1].pop(args[1],None);return args[0]
            if method=="Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;":args[0].value[1][args[1]]=bool(args[2]);return args[0]
            if method=="Landroid/content/SharedPreferences$Editor;->commit()Z":
                commits+=1
                if commits==failed_commit:return 0
                target,staged=args[0].value;target.clear();target.update(staged);return 1
            if method==APP+"->g()Lzz0;":raise StartupReached()
            raise AssertionError("Unexpected migration call: "+method)
        def launch():
            try:execute(parse(actual.body(APP,"onCreate()V")),{"p0":Reference({},APP)},call,memory=Memory())
            except StartupReached:pass
            else:raise AssertionError("Original startup did not resume")
        launch()
        assert data["morphe_rainviewer_integrity"][marker]==(migrated or failed_commit is None)
        for index,n in enumerate(["authorization_prefs","com.lucky_apps.data.preferences"],1):
            assert data[n]["other_setting"]=="retained"
            retained=migrated or (failed_commit is not None and failed_commit<=index)
            assert ("key_key" in data[n])==retained and ("sec_key" in data[n])==retained
            data[n].update(key_key="renewed-key",sec_key="renewed-secret")
        # Persisted success skips all commits; failure retries on the next launch.
        expected_retained=migrated or failed_commit is None
        commits=0;failed_commit=None;launch()
        for n in ["authorization_prefs","com.lucky_apps.data.preferences"]:
            assert data[n]["other_setting"]=="retained"
            assert ("key_key" in data[n])==expected_retained
        assert data["morphe_rainviewer_integrity"][marker]
        assert commits==(0 if expected_retained else 3)
    print("No-attestation path and migration success/failure/restart effects verified; server status checks preserved")


if __name__=="__main__":
    p=argparse.ArgumentParser();p.add_argument("decoded",type=Path);p.add_argument("original",type=Path);a=p.parse_args();verify(a.decoded,a.original)
