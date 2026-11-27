package patches.gboard.features.sharedmodel

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.smali.ExternalLabel
import patches.gboard.Constants.COMPATIBILITY_GBOARD
import patches.gboard.shared.*
import patches.gboard.shared.runtimeabi.*

/** Shared suggestions use the native inline surface but never impersonate a native decoder candidate ID. */
internal val gboardSharedCompletionPatch=bytecodePatch(description="Connect optional shared-model Smart Compose to Gboard's native inline surface.") {
 compatibleWith(COMPATIBILITY_GBOARD)
 dependsOn(gboardSharedModelPatch,patches.gboard.features.featureflags.gboardInlineSuggestionsFlagValuePatch)
 execute {
  listOf(
   GboardMethodTarget("Laemy;","g",listOf("Landroid/view/inputmethod/EditorInfo;"),"V"),
   GboardMethodTarget("Laemy;","x",emptyList(),"Z"),
   GboardMethodTarget("Laemy;","n",listOf("Laemx;"),"V"),
   GboardMethodTarget("Laemy;","r",listOf("Laegy;","Z"),"Z"),
   GboardMethodTarget("Laemy;","v",listOf("Laegy;"),"V"),
   GboardMethodTarget("Laegv;","<init>",emptyList(),"V"),
   GboardMethodTarget("Laegv;","a",emptyList(),"Laegy;"),
   GboardMethodTarget("Laegx;","values",emptyList(),"[Laegx;")
  ).forEach{it.resolve(this)}
  listOf(
   GboardFieldTarget("Laemy;","d","Landroid/content/Context;"),GboardFieldTarget("Laemy;","g","Laegy;"),GboardFieldTarget("Laemy;","R","Laegy;"),
   GboardFieldTarget("Laemy;","k","Landroid/graphics/Rect;"),GboardFieldTarget("Laegy;","m","Ljava/lang/Object;"),
   GboardFieldTarget("Laegv;","a","Ljava/lang/CharSequence;"),GboardFieldTarget("Laegv;","c","Ljava/lang/String;"),
   GboardFieldTarget("Laegv;","e","Laegx;"),GboardFieldTarget("Laegv;","m","Ljava/lang/Object;"),GboardFieldTarget("Laegv;","w","I")
  ).forEach{it.resolve(this)}
  check(mutableClass("Laegx;").superclass=="Ljava/lang/Enum;"){"Completion candidate enum drift"}
  listOf("O","P","Q","u").forEach{GboardFieldTarget("Laemy;",it,"Z").resolve(this)}
  addHelperMethodIfMissing("Laemy;","morpheSharedCurrent",emptyList(),"Laegy;",1,2,"""
   iget-object v0, p0, Laemy;->R:Laegy;
   return-object v0
  """)
  addHelperMethodIfMissing("Laemy;","morpheSharedClear",emptyList(),"V",1,2,"""
   const/4 v0, 0x0
   iput-object v0, p0, Laemy;->g:Laegy;
   invoke-direct {p0, v0}, Laemy;->v(Laegy;)V
   return-void
  """)
  addHelperMethodIfMissing("Laemy;","morpheSharedAllowed",emptyList(),"Z",1,2,"""
   iget-boolean v0, p0, Laemy;->O:Z
   if-nez v0, :blocked
   iget-boolean v0, p0, Laemy;->P:Z
   if-nez v0, :blocked
   iget-boolean v0, p0, Laemy;->Q:Z
   if-nez v0, :blocked
   iget-boolean v0, p0, Laemy;->u:Z
   if-eqz v0, :blocked
   const/4 v0, 0x1
   return v0
   :blocked
   const/4 v0, 0x0
   return v0
  """)
  val candidate=GboardMethodTarget("Laemy;","r",listOf("Laegy;","Z"),"Z").resolve(this)
  candidate.addInstructions(0,"""
   ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_COMPLETION_FILTER,"p0 .. p1")}
   move-result-object p1
  """)
  val start=GboardMethodTarget("Laemy;","g",listOf("Landroid/view/inputmethod/EditorInfo;"),"V").resolve(this)
  // Do not assume the native method preserves its receiver register at every return.
  val stockStart="morpheSharedStock_g"
  check(mutableClass("Laemy;").methods.none{it.name==stockStart}){"Completion start wrapper already exists"}
  start.name=stockStart
  addHelperMethodIfMissing("Laemy;","g",listOf("Landroid/view/inputmethod/EditorInfo;"),"V",start.accessFlags,2,"""
   invoke-virtual/range {p0 .. p1}, Laemy;->$stockStart(Landroid/view/inputmethod/EditorInfo;)V
   ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_COMPLETION_REMEMBER,"p0")}
   return-void
  """)
  val eligible=GboardMethodTarget("Laemy;","x",emptyList(),"Z").resolve(this)
  check(eligible.implementation!!.registerCount>1)
  eligible.addInstructionsWithLabels(0,"""
   ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_COMPLETION_ELIGIBILITY,"p0")}
   move-result v0
   if-ltz v0, :original
   return v0
  """,ExternalLabel("original",eligible.implementation!!.instructions.first()))
  val accept=GboardMethodTarget("Laemy;","n",listOf("Laemx;"),"V").resolve(this)
  check(accept.implementation!!.registerCount>2)
  accept.addInstructionsWithLabels(0,"""
   ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_COMPLETION_ACCEPT,"p0")}
   move-result v0
   if-eqz v0, :original
   return-void
  """,ExternalLabel("original",accept.implementation!!.instructions.first()))
 }
}
