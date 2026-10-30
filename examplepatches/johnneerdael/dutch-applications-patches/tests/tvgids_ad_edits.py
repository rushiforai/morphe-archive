"""Independently owned native-ad lifetime edits for graph restoration."""
from tvgids_android_vm import ACTIVITY, CTOR, METHOD, VIEW


AD_VIEW_EDITS = [
    dict(owner=ACTIVITY, signature='c(Lrt1;)V', index=14,
         original=['iget-object v0, p0, Lnl/tvgids/MainActivity;->c:Lqj2;'], replacement=['goto/32 @31']),
    dict(owner=VIEW, signature=CTOR, index=102,
         original=['if-eqz p5, @112'], replacement=['goto/32 @128']),
    dict(owner=VIEW, signature=METHOD, index=35, original=[], replacement=['goto/16 @49']),
    dict(owner=VIEW, signature='dispose()V', index=0, original=[], replacement=[
        'iget-object v0, p0, Lwa;->j:Landroid/os/Handler;', 'const/4 v1, 0x0',
        'invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V',
        'iput-object v1, p0, Lwa;->l:Lua;']),
    dict(owner='Lua;', signature='run()V', index=0, original=[], replacement=[
        'move-object/from16 v0, p0', 'iget v0, v0, Lua;->a:I', 'if-nez v0, @4', 'return-void']),
]
