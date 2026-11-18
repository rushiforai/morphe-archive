"""Owned native OSB regions, restored before original graph verification."""
OSB_EDITS=[
 dict(owner='Ljz3;',signature='<init>()V',index=16,original=[],replacement=['const-string v0, ""','goto/32 @25']),
 *[dict(owner='Ljz3;',signature=sig,index=0,original=[],replacement=['return-void']) for sig in (
  'g(ILjava/util/Map;)V','h(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V','i(ILjava/util/Map;)V','k()V','onResume(Lwb3;)V')],
 dict(owner='Ljz3;',signature='d()Ljava/lang/String;',index=0,original=[],replacement=['const/4 v0, 0x0','return-object v0']),
 dict(owner='Lqc0;',signature='run()V',index=0,original=[],replacement=[
  'move-object/from16 v0, p0','iget v0, v0, Lqc0;->a:I','const/4 v1, 0x1','if-ne v0, v1, @5','return-void']),
 dict(owner='Lxs8;',signature='i()V',index=0,original=[],replacement=[
  'const/4 v0, 0x0','iput-boolean v0, p0, Lxs8;->b:Z','iget-object v0, p0, Lxs8;->c:Ljava/lang/Object;',
  'instance-of v1, v0, Ljava/util/LinkedList;','if-eqz v1, @7','check-cast v0, Ljava/util/LinkedList;',
  'invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V','return-void']),
 dict(owner='Lxs8;',signature='k(Ljava/lang/String;Ljava/lang/String;)V',index=0,original=[],replacement=['return-void']),
 dict(owner='Lda;',signature='onMethodCall(Lin3;Lln3;)V',index=409,
      original=['iget-object v0, v1, Lin3;->b:Ljava/lang/Object;'],replacement=['goto/32 @418']),
 dict(owner='Lda;',signature='onMethodCall(Lin3;Lln3;)V',index=705,original=[],replacement=['const-string v4, ""','goto/32 @746']),
 dict(owner='Lda;',signature='onMethodCall(Lin3;Lln3;)V',index=755,
      original=['move-object/from16 v0, p2'],replacement=['return-void']),
]
