#locals 9
    const/16 v0, 0xfa0
    const v1, 0x7f0a0096
    const/4 v2, -0x1
    const/16 v0, 0x7a11
    if-eq p1, v0, :cond_2
    const/16 v0, 0xfa0
    if-eq p1, v0, :cond_3
    const/16 v0, 0x2ee3
    if-eq p1, v0, :cond_0
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/i7A;->onActivityResult(IILandroid/content/Intent;)V
    goto :goto_0
    :cond_0
    const/4 p1, 0x0
    const-string p3, "email"
    if-ne p2, v2, :cond_1
    invoke-static {p0}, Landroidx/lifecycle/IMq;->Ud(Landroidx/lifecycle/djw;)Landroidx/lifecycle/u;
    move-result-object v3
    const/4 v4, 0x0
    const/4 v5, 0x0
    new-instance v6, Lcom/alightcreative/app/motion/activities/main/MainActivity$Wrw;
    invoke-direct {v6, p0, p3, p1}, Lcom/alightcreative/app/motion/activities/main/MainActivity$Wrw;-><init>(Lcom/alightcreative/app/motion/activities/main/MainActivity;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    const/4 v7, 0x3
    const/4 v8, 0x0
    invoke-static/range {v3 .. v8}, LOW/Fq;->fP(LOW/K;Lkotlin/coroutines/CoroutineContext;LOW/XD;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)LOW/E0;
    invoke-direct {p0, v1}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->r4b(I)Z
    goto :goto_0
    :cond_1
    invoke-virtual {p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->vay()LK/Ds0;
    move-result-object p2
    new-instance v0, LK/Nr$MVR;
    invoke-direct {v0, p3, p1}, LK/Nr$MVR;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V
    invoke-interface {p2, v0}, LK/Ds0;->Ud(LK/Nr;)V
    goto :goto_0
    :cond_2
    if-ne p2, v2, :cond_4
    if-eqz p3, :cond_4
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;
    move-result-object v3
    if-eqz v3, :cond_4
    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/alightcreative/importer/xml/ui/ImportActivity;
    move-object/from16 v4, p0
    invoke-direct {v0, v4, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    invoke-virtual {v0, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;
    const-string v1, "application/zip"
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;
    move-object v5, v0
    invoke-virtual/range {v4 .. v5}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    return-void
    :cond_3
    if-ne p2, v2, :cond_4
    invoke-direct {p0, v1}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->r4b(I)Z
    :cond_4
    :goto_0
    return-void