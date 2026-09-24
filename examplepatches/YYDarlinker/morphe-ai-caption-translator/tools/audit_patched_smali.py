"""Audit the verified YouTube 21.07.247 host integration after apktool --no-res decode."""
import json,re,sys
from pathlib import Path
root=Path(sys.argv[1]); report={}
def read(name):
    matches=list(root.glob("smali*/"+name+".smali"));assert len(matches)==1,(name,len(matches))
    text=matches[0].read_text(encoding="utf-8")
    return re.sub(r"\\u([0-9a-fA-F]{4})",lambda m:chr(int(m.group(1),16)),text)
def instructions(text):
    return [line.strip() for line in text.splitlines() if line.strip() and not line.strip().startswith((".","#"))]
bridge=read("app/yydarlinker/deepseekcaptions/NativeCaptionBridge")
assert "check-cast p0, Lbdxi;" in bridge and "check-cast p0, Lanyg;" in bridge
model=read("anyi"); code=instructions(model)
assert sum("->augmentMetadata(" in x for x in code)==3
assert any("iput-object p3, p0, Lanyi;->a:Lbdxi;" in x for x in code)
for i,line in enumerate(code):
    if "->augmentMetadata(" in line:
        assert code[i+1].startswith("move-result-object")
        assert code[i+2].startswith("check-cast")
        assert code[i+3].startswith(("iget-object","iput-object"))
    if "->augmentTranslations(" in line:
        assert code[i+1].startswith("move-result-object") and code[i+2].startswith("return-object")
manager=instructions(read("anws"))
assert sum("->restoreDecision()I" in x for x in manager)==2 # model-ready gate plus missing-language guard
assert sum("->resolveRemembered(" in x for x in manager)==1
assert sum("->onNativeTrackApplied(" in x for x in manager)==1
assert not any("->onNativeSelection(" in x or "->onNativeSelectionWithReason(" in x for x in manager)
window=read("com/google/android/libraries/youtube/player/subtitles/ui/SubtitleWindowView")
assert "->suppressNativeDraw()Z" in window
editor=read("app/yydarlinker/deepseekcaptions/DeepSeekTextPreference")
assert "Landroid/app/AlertDialog" not in editor
assert "InlineCaptionEditor" in editor
inline=read("app/yydarlinker/deepseekcaptions/InlineCaptionEditor")
assert "startActionMode" in inline and "onTextContextMenuItem" in inline
assert "PasswordTransformationMethod" not in editor
assert "keyInputType" in editor
assert "->merge(" in read("app/yydarlinker/deepseekcaptions/AnchoredCaptionPlan")
assert "SourceFormatPolicy;->json3" in read("app/yydarlinker/deepseekcaptions/RawCaptionSource")
fragment=read("app/morphe/extension/shared/settings/preference/AbstractPreferenceFragment")
assert "->consumePathCopy(" in fragment and "aiCaptionOriginalLongClick" in fragment
assert ".super Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;" in read("app/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference")
assert ".super Landroid/preference/Preference;" in read("app/yydarlinker/deepseekcaptions/AddonSwitchPreference")
assert "onDraw" in read("app/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview")
provider=read("app/yydarlinker/deepseekcaptions/ProviderRequestPolicy")
assert "Return valid JSON only." in provider
report.update(metadata_constructor=True,metadata_readers=2,branch_safe_list_return=True,
              native_memory_on_off=True,native_mode_selection=True,native_draw_guard=True,
              inline_native_editing=True,scoped_copy_handler=True,self_managed_switch=True,style_preview=True,explicit_json_prompt=True)
print(json.dumps(report,indent=2))
