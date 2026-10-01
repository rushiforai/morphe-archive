#locals 17
    move-object/from16 v8, p0
    move-object/from16 v9, p2
    move/from16 v10, p3
    move-object/from16 v11, p4
    const-string v0, "onSuccess"
    invoke-static {v11, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V
    iget-object v0, v8, Lcom/alightcreative/app/motion/activities/main/MainActivity;->l:Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->clear()V
    iget-object v0, v8, Lcom/alightcreative/app/motion/activities/main/MainActivity;->YH:Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->clear()V
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->z0V()Ljava/util/List;
    move-result-object v0
    check-cast v0, Ljava/lang/Iterable;
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    move-result-object v12
    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z
    move-result v0
    const/4 v13, 0x0
    if-eqz v0, :cond_2
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v0
    move-object v14, v0
    check-cast v14, Lcom/alightcreative/app/motion/project/ProjectInfo$Jy6;
    invoke-virtual {v14}, Lcom/alightcreative/app/motion/project/ProjectInfo$Jy6;->getId()Ljava/lang/String;
    move-result-object v0
    invoke-static {v8, v0}, LPxA/IMq;->w(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    move-result-object v15
    const/4 v0, 0x1
    invoke-static {v15, v13, v0, v13}, Lkotlin/io/FilesKt;->readText$default(Ljava/io/File;Ljava/nio/charset/Charset;ILjava/lang/Object;)Ljava/lang/String;
    move-result-object v1
    const/4 v2, 0x0
    const/4 v3, 0x0
    const/4 v4, 0x0
    const/16 v5, 0xe
    const/4 v6, 0x0
    invoke-static/range {v1 .. v6}, Lcom/alightcreative/app/motion/scene/serializer/SceneSerializerKt;->unserializeScene$default(Ljava/lang/String;ZZZILjava/lang/Object;)Lcom/alightcreative/app/motion/scene/Scene;
    move-result-object v7
    invoke-virtual {v14}, Lcom/alightcreative/app/motion/project/ProjectInfo$Jy6;->getId()Ljava/lang/String;
    move-result-object v1
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v4
    const-string v6, "getApplicationContext(...)"
    invoke-static {v4, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->mCb()Lsk/P;
    move-result-object v16
    move/from16 v0, p1
    move-object v2, v15
    move-object v3, v7
    move-object/from16 v5, p2
    move-object v13, v6
    move-object/from16 v6, v16
    move-object/from16 v16, v12
    move-object v12, v7
    move/from16 v7, p3
    invoke-static/range {v0 .. v7}, LCg/NpA;->b2(ILjava/lang/String;Ljava/io/File;Lcom/alightcreative/app/motion/scene/Scene;Landroid/content/Context;Lbi/DXi;Lsk/P;Z)LCg/Jy6;
    move-result-object v0
    iget-object v1, v8, Lcom/alightcreative/app/motion/activities/main/MainActivity;->l:Ljava/util/List;
    invoke-interface {v1, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    iget-object v1, v8, Lcom/alightcreative/app/motion/activities/main/MainActivity;->YH:Ljava/util/List;
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->vay()LK/Ds0;
    move-result-object v1
    new-instance v2, LK/Nr$To;
    invoke-direct {v2, v0}, LK/Nr$To;-><init>(LCg/Jy6;)V
    invoke-interface {v1, v2}, LK/Ds0;->Ud(LK/Nr;)V
    if-eqz v10, :cond_1
    const v0, 0x7f0a00b2
    invoke-virtual {v14}, Lcom/alightcreative/app/motion/project/ProjectInfo$Jy6;->getId()Ljava/lang/String;
    move-result-object v1
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v4
    invoke-static {v4, v13}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->mCb()Lsk/P;
    move-result-object v6
    const/4 v7, 0x1
    move-object v2, v15
    move-object v3, v12
    move-object/from16 v5, p2
    invoke-static/range {v0 .. v7}, LCg/NpA;->b2(ILjava/lang/String;Ljava/io/File;Lcom/alightcreative/app/motion/scene/Scene;Landroid/content/Context;Lbi/DXi;Lsk/P;Z)LCg/Jy6;
    move-result-object v0
    iput-object v0, v8, Lcom/alightcreative/app/motion/activities/main/MainActivity;->R:LCg/Jy6;
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->vay()LK/Ds0;
    move-result-object v0
    new-instance v1, LK/Nr$To;
    iget-object v2, v8, Lcom/alightcreative/app/motion/activities/main/MainActivity;->R:LCg/Jy6;
    if-nez v2, :cond_0
    const-string v2, "templateToggleExportSnapshot"
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V
    const/4 v13, 0x0
    goto :goto_1
    :cond_0
    move-object v13, v2
    :goto_1
    invoke-direct {v1, v13}, LK/Nr$To;-><init>(LCg/Jy6;)V
    invoke-interface {v0, v1}, LK/Ds0;->Ud(LK/Nr;)V
    :cond_1
    move-object/from16 v12, v16
    goto/16 :goto_0
    :cond_2
    const/4 v0, 0x2
    sparse-switch p1, :sswitch_data_0
    goto/16 :goto_4
    :sswitch_0
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->vay()LK/Ds0;
    move-result-object v1
    new-instance v2, LK/Nr$z;
    const-string v3, "projectlist_export_click_cloud"
    const/4 v4, 0x0
    invoke-direct {v2, v3, v4, v0, v4}, LK/Nr$z;-><init>(Ljava/lang/String;Landroid/os/Bundle;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    invoke-interface {v1, v2}, LK/Ds0;->Ud(LK/Nr;)V
    new-instance v0, Landroid/content/Intent;
    const-string v1, "android.intent.action.OPEN_DOCUMENT"
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    const-string v1, "*/*"
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;
    const-string v1, "android.intent.extra.MIME_TYPES"
    const/4 v2, 0x1
    new-array v2, v2, [Ljava/lang/String;
    const-string v3, "application/zip"
    const/4 v4, 0x0
    aput-object v3, v2, v4
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;
    const-string v1, "android.intent.category.OPENABLE"
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;
    const/16 v1, 0x7a11
    move-object/from16 v5, p0
    invoke-virtual {v5, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    invoke-interface {v11, v8}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    goto/16 :goto_4
    :sswitch_1
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->vay()LK/Ds0;
    move-result-object v1
    new-instance v2, LK/Nr$z;
    const-string v3, "projectlist_export_click_template"
    const/4 v4, 0x0
    invoke-direct {v2, v3, v4, v0, v4}, LK/Nr$z;-><init>(Ljava/lang/String;Landroid/os/Bundle;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    invoke-interface {v1, v2}, LK/Ds0;->Ud(LK/Nr;)V
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->z0V()Ljava/util/List;
    move-result-object v1
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->vay()LK/Ds0;
    move-result-object v2
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->mCb()Lsk/P;
    move-result-object v3
    iget-object v4, v8, Lcom/alightcreative/app/motion/activities/main/MainActivity;->l:Ljava/util/List;
    iget-object v5, v8, Lcom/alightcreative/app/motion/activities/main/MainActivity;->YH:Ljava/util/List;
    iget-object v0, v8, Lcom/alightcreative/app/motion/activities/main/MainActivity;->J:Lcom/alightcreative/app/motion/scene/SceneThumbnailMaker;
    if-nez v0, :cond_3
    const-string v0, "shareThumbnailMaker"
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V
    const/4 v6, 0x0
    goto :goto_2
    :cond_3
    move-object v6, v0
    :goto_2
    const/4 v7, 0x1
    move-object/from16 v0, p0
    invoke-static/range {v0 .. v7}, LvNU/NpA;->Zjm(Landroidx/activity/ComponentActivity;Ljava/util/List;LK/Ds0;Lsk/P;Ljava/util/List;Ljava/util/List;Lcom/alightcreative/app/motion/scene/SceneThumbnailMaker;Z)V
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->r()Z
    invoke-interface {v11, v8}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    goto/16 :goto_4
    :sswitch_2
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->vay()LK/Ds0;
    move-result-object v1
    new-instance v2, LK/Nr$z;
    const-string v3, "projectlist_export_click_package"
    const/4 v4, 0x0
    invoke-direct {v2, v3, v4, v0, v4}, LK/Nr$z;-><init>(Ljava/lang/String;Landroid/os/Bundle;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    invoke-interface {v1, v2}, LK/Ds0;->Ud(LK/Nr;)V
    sget-object v0, Lang/XD;->m:Lang/XD;
    new-instance v1, Lcom/alightcreative/app/motion/activities/main/MainActivity$W9;
    invoke-direct {v1, v8, v11}, Lcom/alightcreative/app/motion/activities/main/MainActivity$W9;-><init>(Lcom/alightcreative/app/motion/activities/main/MainActivity;Lkotlin/jvm/functions/Function1;)V
    invoke-direct {v8, v0, v1}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->J1i(Lang/XD;Lkotlin/jvm/functions/Function1;)V
    goto/16 :goto_4
    :sswitch_3
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->z0V()Ljava/util/List;
    move-result-object v1
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->vay()LK/Ds0;
    move-result-object v2
    iget-object v3, v8, Lcom/alightcreative/app/motion/activities/main/MainActivity;->l:Ljava/util/List;
    iget-object v4, v8, Lcom/alightcreative/app/motion/activities/main/MainActivity;->YH:Ljava/util/List;
    invoke-static {v8, v1, v2, v3, v4}, LS4/Nr;->fP(Landroid/app/Activity;Ljava/util/List;LK/Ds0;Ljava/util/List;Ljava/util/List;)V
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->z0V()Ljava/util/List;
    move-result-object v1
    check-cast v1, Ljava/util/Collection;
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->getIndices(Ljava/util/Collection;)Lkotlin/ranges/IntRange;
    move-result-object v1
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    move-result-object v1
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :cond_5
    move-object v2, v1
    check-cast v2, Lkotlin/collections/IntIterator;
    invoke-virtual {v2}, Lkotlin/collections/IntIterator;->nextInt()I
    move-result v2
    iget-object v3, v8, Lcom/alightcreative/app/motion/activities/main/MainActivity;->YH:Ljava/util/List;
    invoke-static {v3, v2}, Lkotlin/collections/CollectionsKt;->getOrNull(Ljava/util/List;I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, LCg/Jy6;
    if-eqz v2, :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->vay()LK/Ds0;
    move-result-object v3
    new-instance v4, LK/Nr$h1;
    const/4 v5, 0x0
    const/4 v6, 0x0
    invoke-direct {v4, v2, v5, v0, v6}, LK/Nr$h1;-><init>(LCg/Jy6;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V
    invoke-interface {v3, v4}, LK/Ds0;->Ud(LK/Nr;)V
    goto :goto_3
    :cond_4
    const/4 v6, 0x0
    goto :goto_3
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->r()Z
    invoke-interface {v11, v8}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    goto :goto_4
    :sswitch_4
    if-nez v9, :cond_6
    return-void
    :cond_6
    sget-object v0, Lang/XD;->c:Lang/XD;
    new-instance v1, Lcom/alightcreative/app/motion/activities/main/MainActivity$Fq;
    invoke-direct {v1, v8, v11, v9, v10}, Lcom/alightcreative/app/motion/activities/main/MainActivity$Fq;-><init>(Lcom/alightcreative/app/motion/activities/main/MainActivity;Lkotlin/jvm/functions/Function1;Lbi/DXi;Z)V
    invoke-direct {v8, v0, v1}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->J1i(Lang/XD;Lkotlin/jvm/functions/Function1;)V
    goto :goto_4
    :sswitch_5
    if-nez v9, :cond_7
    return-void
    :cond_7
    sget-object v0, Lang/XD;->j:Lang/XD;
    new-instance v1, Lcom/alightcreative/app/motion/activities/main/MainActivity$z;
    invoke-direct {v1, v8, v11, v9}, Lcom/alightcreative/app/motion/activities/main/MainActivity$z;-><init>(Lcom/alightcreative/app/motion/activities/main/MainActivity;Lkotlin/jvm/functions/Function1;Lbi/DXi;)V
    invoke-direct {v8, v0, v1}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->J1i(Lang/XD;Lkotlin/jvm/functions/Function1;)V
    goto :goto_4
    :sswitch_6
    if-nez v9, :cond_8
    return-void
    :cond_8
    sget-object v0, Lang/XD;->T:Lang/XD;
    new-instance v1, Lcom/alightcreative/app/motion/activities/main/MainActivity$HS;
    invoke-direct {v1, v8, v11, v9}, Lcom/alightcreative/app/motion/activities/main/MainActivity$HS;-><init>(Lcom/alightcreative/app/motion/activities/main/MainActivity;Lkotlin/jvm/functions/Function1;Lbi/DXi;)V
    invoke-direct {v8, v0, v1}, Lcom/alightcreative/app/motion/activities/main/MainActivity;->J1i(Lang/XD;Lkotlin/jvm/functions/Function1;)V
    :goto_4
    return-void
    nop
    :sswitch_data_0
    .sparse-switch
        0x7f0a007b -> :sswitch_6
        0x7f0a007c -> :sswitch_5
        0x7f0a007f -> :sswitch_4
        0x7f0a0080 -> :sswitch_3
        0x7f0a00b1 -> :sswitch_2
        0x7f0a00b2 -> :sswitch_1
        0x7f0a00c9 -> :sswitch_0
    .end sparse-switch