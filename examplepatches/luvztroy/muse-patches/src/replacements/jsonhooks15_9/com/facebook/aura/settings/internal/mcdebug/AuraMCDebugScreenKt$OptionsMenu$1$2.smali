.class public final Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;
.super LX/DvA;
.implements LX/FcA;

.method public final invoke(LX/365;I)LX/75C;
    .locals 58
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LX/365;",
            "I)",
            "LX/HDM<",
            "Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;",
            ">;"
        }
    .end annotation

    const v0, 0x63ae5862

    move-object/from16 v4, p1

    invoke-interface {v4, v0}, LX/365;->Afm(I)V

    move-object/from16 v1, p0

    iget-object v0, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$onOpenOverlayConfigs:Lkotlin/jvm/functions/Function0;

    const/16 v33, 0x2

    const/4 v15, 0x1

    const/4 v6, 0x0

    const/16 v47, 0x3

    if-eqz v0, :cond_0

    iget-object v7, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$overlayConfigsMenuItem:Ljava/lang/String;

    const/4 v8, 0x0

    sget-object v17, LX/6ID;->A00:LX/6IE;

    new-instance v5, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    move-object v9, v8

    move-object v10, v8

    move-object v11, v8

    move v12, v6

    move v13, v6

    move v14, v6

    move/from16 v16, v6

    move/from16 v18, v15

    move/from16 v19, v15

    invoke-direct/range {v5 .. v19}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/3MT;LX/6pg;LX/3MT;ZZZZZLX/6ID;II)V

    iget-object v0, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$forceRefreshMenuItem:Ljava/lang/String;

    new-instance v3, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    move-object/from16 v21, v8

    move-object/from16 v22, v8

    move-object/from16 v23, v8

    move-object/from16 v24, v8

    move/from16 v25, v6

    move/from16 v26, v6

    move/from16 v27, v6

    move/from16 v28, v15

    move/from16 v29, v6

    move-object/from16 v30, v17

    move/from16 v31, v15

    move/from16 v32, v15

    move-object/from16 v18, v3

    move-object/from16 v20, v0

    invoke-direct/range {v18 .. v32}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/3MT;LX/6pg;LX/3MT;ZZZZZLX/6ID;II)V

    iget-object v0, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$forceEmergencyPushMenuItem:Ljava/lang/String;

    new-instance v2, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    move-object/from16 v34, v0

    move-object/from16 v35, v8

    move-object/from16 v36, v8

    move-object/from16 v37, v8

    move-object/from16 v38, v8

    move/from16 v39, v6

    move/from16 v40, v6

    move/from16 v41, v6

    move/from16 v42, v15

    move/from16 v43, v6

    move-object/from16 v44, v17

    move/from16 v45, v15

    move/from16 v46, v15

    move-object/from16 v32, v2

    invoke-direct/range {v32 .. v46}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/3MT;LX/6pg;LX/3MT;ZZZZZLX/6ID;II)V

    iget-object v1, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$clearOverridesMenuItem:Ljava/lang/String;

    new-instance v0, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    move-object/from16 v46, v0

    move-object/from16 v48, v1

    move-object/from16 v49, v8

    move-object/from16 v50, v8

    move-object/from16 v51, v8

    move-object/from16 v52, v8

    move/from16 v53, v6

    move/from16 v54, v6

    move/from16 v55, v6

    move/from16 v56, v15

    move/from16 v57, v15

    move-object/from16 p0, v17

    move/from16 p1, v15

    move/from16 p2, v15

    invoke-direct/range {v46 .. v60}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/3MT;LX/6pg;LX/3MT;ZZZZZLX/6ID;II)V

    new-instance v7, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    const/4 v8, 0x4

    const-string v9, "Export modified flags"

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x1

    const/16 v18, 0x0

    sget-object v19, LX/6ID;->A00:LX/6IE;

    const/16 v20, 0x1

    const/16 v21, 0x1

    invoke-direct/range {v7 .. v21}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/3MT;LX/6pg;LX/3MT;ZZZZZLX/6ID;II)V

    new-instance v22, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    const/16 v23, 0x5

    const-string v24, "Import flags"

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x1

    const/16 v33, 0x0

    sget-object v34, LX/6ID;->A00:LX/6IE;

    const/16 v35, 0x1

    const/16 v36, 0x1

    invoke-direct/range {v22 .. v36}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/3MT;LX/6pg;LX/3MT;ZZZZZLX/6ID;II)V

    move-object/from16 v38, v7

    move-object/from16 v39, v22

    const/16 v7, 0x6

    new-array v7, v7, [Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    const/4 v8, 0x1

    aput-object v3, v7, v8

    const/4 v8, 0x2

    aput-object v2, v7, v8

    const/4 v8, 0x3

    aput-object v0, v7, v8

    const/4 v8, 0x4

    aput-object v38, v7, v8

    const/4 v8, 0x5

    aput-object v39, v7, v8

    move-object v0, v7

    :goto_0
    invoke-static {v0}, LX/7jY;->A07([Ljava/lang/Object;)LX/7Nv;

    move-result-object v0

    invoke-static {v4}, LX/001;->A1O(Ljava/lang/Object;)V

    return-object v0

    :cond_0
    iget-object v0, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$forceRefreshMenuItem:Ljava/lang/String;

    const/16 v17, 0x0

    sget-object v26, LX/6ID;->A00:LX/6IE;

    new-instance v3, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    move-object v14, v3

    move-object/from16 v16, v0

    move-object/from16 v18, v17

    move-object/from16 v19, v17

    move-object/from16 v20, v17

    move/from16 v21, v6

    move/from16 v22, v6

    move/from16 v23, v6

    move/from16 v24, v15

    move/from16 v25, v6

    move/from16 v27, v15

    move/from16 v28, v15

    invoke-direct/range {v14 .. v28}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/3MT;LX/6pg;LX/3MT;ZZZZZLX/6ID;II)V

    iget-object v0, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$forceEmergencyPushMenuItem:Ljava/lang/String;

    new-instance v2, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    move-object/from16 v27, v2

    move/from16 v28, v33

    move-object/from16 v29, v0

    move-object/from16 v31, v17

    move-object/from16 v32, v17

    move-object/from16 v33, v17

    move/from16 v34, v6

    move/from16 v35, v6

    move/from16 v36, v6

    move/from16 v37, v15

    move/from16 v38, v6

    move/from16 v40, v15

    move/from16 v41, v15

    move-object/from16 v30, v17

    move-object/from16 v39, v26

    invoke-direct/range {v27 .. v41}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/3MT;LX/6pg;LX/3MT;ZZZZZLX/6ID;II)V

    iget-object v1, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$clearOverridesMenuItem:Ljava/lang/String;

    new-instance v0, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    move-object/from16 v27, v0

    move/from16 v28, v47

    move-object/from16 v29, v1

    move/from16 v38, v15

    invoke-direct/range {v27 .. v41}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/3MT;LX/6pg;LX/3MT;ZZZZZLX/6ID;II)V

    new-instance v7, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    const/4 v8, 0x4

    const-string v9, "Export modified flags"

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x1

    const/16 v18, 0x0

    sget-object v19, LX/6ID;->A00:LX/6IE;

    const/16 v20, 0x1

    const/16 v21, 0x1

    invoke-direct/range {v7 .. v21}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/3MT;LX/6pg;LX/3MT;ZZZZZLX/6ID;II)V

    new-instance v22, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    const/16 v23, 0x5

    const-string v24, "Import flags"

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x1

    const/16 v33, 0x0

    sget-object v34, LX/6ID;->A00:LX/6IE;

    const/16 v35, 0x1

    const/16 v36, 0x1

    invoke-direct/range {v22 .. v36}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/3MT;LX/6pg;LX/3MT;ZZZZZLX/6ID;II)V

    move-object/from16 v38, v7

    move-object/from16 v39, v22

    const/4 v7, 0x5

    new-array v7, v7, [Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    const/4 v8, 0x0

    aput-object v3, v7, v8

    const/4 v8, 0x1

    aput-object v2, v7, v8

    const/4 v8, 0x2

    aput-object v0, v7, v8

    const/4 v8, 0x3

    aput-object v38, v7, v8

    const/4 v8, 0x4

    aput-object v39, v7, v8

    move-object v0, v7

    goto/16 :goto_0
.end method
