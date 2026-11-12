.class public final Lez;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lfz;Lhz;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lez;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lez;->b:Ljava/lang/Object;

    iput-object p1, p0, Lez;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 11
    iput-byte p3, p0, Lez;->a:B

    iput-object p1, p0, Lez;->b:Ljava/lang/Object;

    iput-object p2, p0, Lez;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 33

    move-object/from16 v0, p0

    iget-byte v1, v0, Lez;->a:B

    sget-object v2, Luvg;->d:Luvg;

    const-string v3, "xx"

    const-string v4, ""

    const/4 v5, 0x4

    const/4 v6, 0x2

    const/4 v7, 0x3

    const/4 v8, 0x1

    const/4 v9, 0x0

    iget-object v10, v0, Lez;->b:Ljava/lang/Object;

    iget-object v0, v0, Lez;->c:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_236

    move-object/from16 v1, p1

    check-cast v1, Landroid/net/Uri;

    check-cast v10, Lue9;

    if-eqz v1, :cond_22

    invoke-virtual {v10, v1}, Lue9;->run(Ljava/lang/Object;)V

    goto :goto_27

    :cond_22
    check-cast v0, Landroid/net/Uri;

    invoke-static {v0, v10}, Lzwg;->v(Landroid/net/Uri;Lcom/opera/api/Callback;)V

    :goto_27
    return-void

    :pswitch_28
    move-object/from16 v1, p1

    check-cast v1, Landroid/util/SparseBooleanArray;

    check-cast v10, Lnh4;

    invoke-virtual {v10}, Lnh4;->r()Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lqh4;

    if-nez v2, :cond_51

    check-cast v0, Lcsh;

    iget v0, v0, Lcsh;->d:I

    move v2, v9

    :goto_3b
    if-ge v2, v0, :cond_48

    invoke-virtual {v1, v2}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v3

    if-nez v3, :cond_45

    move v8, v9

    goto :goto_48

    :cond_45
    add-int/lit8 v2, v2, 0x1

    goto :goto_3b

    :cond_48
    :goto_48
    sget-object v0, Lt0i;->b:Lp0i;

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v10, v0}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_51
    return-void

    :pswitch_52
    move-object/from16 v1, p1

    check-cast v1, Lj7m;

    iget-object v11, v1, Lj7m;->a:Ljava/lang/Object;

    check-cast v11, Lcj9;

    iget-object v12, v1, Lj7m;->b:Ljava/lang/Object;

    check-cast v12, Luvg;

    iget-object v1, v1, Lj7m;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    check-cast v10, Lbhi;

    sget-object v13, Lt0i;->b:Lp0i;

    check-cast v0, Ltze;

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    move-object/from16 v25, v9

    check-cast v25, Ljava/lang/String;

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v26, v8

    check-cast v26, Ljava/lang/String;

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v23, v6

    check-cast v23, Ljava/lang/String;

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v21, v6

    check-cast v21, Ljava/lang/String;

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-nez v1, :cond_92

    move-object v14, v4

    goto :goto_93

    :cond_92
    move-object v14, v1

    :goto_93
    iget-object v1, v0, Ltze;->l:Ldw3;

    invoke-virtual {v1}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v22, v1

    check-cast v22, Ljava/lang/String;

    iget-object v1, v0, Ltze;->b:Ldw3;

    invoke-virtual {v1}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Ljava/lang/String;

    iget-object v1, v0, Ltze;->c:Ldw3;

    invoke-virtual {v1}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Ljava/lang/String;

    iget-object v1, v11, Lcj9;->a:Ljava/lang/String;

    if-nez v1, :cond_b7

    move-object v15, v3

    goto :goto_b8

    :cond_b7
    move-object v15, v1

    :goto_b8
    iget-object v1, v0, Ltze;->j:Lhga;

    invoke-virtual {v1}, Lhga;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v16, v1

    check-cast v16, Ljava/lang/String;

    iget-object v1, v11, Lcj9;->e:Ljava/lang/String;

    iget-object v3, v0, Ltze;->f:Lkw3;

    invoke-virtual {v3}, Lkw3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_d7

    sget-object v3, Llcl;->c:Llcl;

    :goto_d4
    move-object/from16 v17, v3

    goto :goto_da

    :cond_d7
    sget-object v3, Llcl;->b:Llcl;

    goto :goto_d4

    :goto_da
    iget-object v3, v0, Ltze;->k:Ldw3;

    invoke-virtual {v3}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v27, v3

    check-cast v27, Lou9;

    if-ne v12, v2, :cond_eb

    sget-object v2, Lncl;->c:Lncl;

    :goto_e8
    move-object/from16 v24, v2

    goto :goto_ee

    :cond_eb
    sget-object v2, Lncl;->b:Lncl;

    goto :goto_e8

    :goto_ee
    iget-object v2, v0, Ltze;->n:Llw3;

    invoke-virtual {v2}, Llw3;->get()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v28, v2

    check-cast v28, Lebb;

    iget-object v0, v0, Ltze;->o:Lew3;

    invoke-virtual {v0}, Lew3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    new-instance v13, Ljcl;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    move-object/from16 v18, v1

    invoke-direct/range {v13 .. v29}, Ljcl;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Llcl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lncl;Ljava/lang/String;Ljava/lang/String;Lou9;Lebb;Ljava/lang/Integer;)V

    invoke-virtual {v10, v13}, Lbhi;->resumeWith(Ljava/lang/Object;)V

    return-void

    :pswitch_113
    move-object/from16 v1, p1

    check-cast v1, Lj7m;

    iget-object v11, v1, Lj7m;->a:Ljava/lang/Object;

    check-cast v11, Lcj9;

    iget-object v12, v1, Lj7m;->b:Ljava/lang/Object;

    check-cast v12, Luvg;

    iget-object v1, v1, Lj7m;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    check-cast v10, Lbhi;

    sget-object v13, Lt0i;->b:Lp0i;

    check-cast v0, Lmpe;

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    move-object/from16 v26, v9

    check-cast v26, Ljava/lang/String;

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v27, v8

    check-cast v27, Ljava/lang/String;

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v24, v6

    check-cast v24, Ljava/lang/String;

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v22, v6

    check-cast v22, Ljava/lang/String;

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-nez v1, :cond_153

    move-object v14, v4

    goto :goto_154

    :cond_153
    move-object v14, v1

    :goto_154
    iget-object v1, v0, Lmpe;->l:Ljv1;

    invoke-virtual {v1}, Ljv1;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v23, v1

    check-cast v23, Ljava/lang/String;

    iget-object v1, v0, Lmpe;->b:Ljv1;

    invoke-virtual {v1}, Ljv1;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Ljava/lang/String;

    iget-object v1, v0, Lmpe;->c:Ljv1;

    invoke-virtual {v1}, Ljv1;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v21, v1

    check-cast v21, Ljava/lang/String;

    iget-object v1, v11, Lcj9;->b:Ljava/lang/String;

    iget-object v4, v11, Lcj9;->a:Ljava/lang/String;

    if-nez v4, :cond_17a

    move-object v15, v3

    goto :goto_17b

    :cond_17a
    move-object v15, v4

    :goto_17b
    iget-object v3, v0, Lmpe;->j:Lhga;

    invoke-virtual {v3}, Lhga;->get()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v17, v3

    check-cast v17, Ljava/lang/String;

    iget-object v3, v11, Lcj9;->e:Ljava/lang/String;

    iget-object v4, v0, Lmpe;->f:Luu1;

    invoke-virtual {v4}, Luu1;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_19a

    sget-object v4, Lmcl;->c:Lmcl;

    :goto_197
    move-object/from16 v18, v4

    goto :goto_19d

    :cond_19a
    sget-object v4, Lmcl;->b:Lmcl;

    goto :goto_197

    :goto_19d
    iget-object v4, v0, Lmpe;->k:Ljv1;

    invoke-virtual {v4}, Ljv1;->get()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v28, v4

    check-cast v28, Lou9;

    if-ne v12, v2, :cond_1ae

    sget-object v2, Locl;->c:Locl;

    :goto_1ab
    move-object/from16 v25, v2

    goto :goto_1b1

    :cond_1ae
    sget-object v2, Locl;->b:Locl;

    goto :goto_1ab

    :goto_1b1
    iget-object v0, v0, Lmpe;->n:Ljv1;

    invoke-virtual {v0}, Ljv1;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v29, v0

    check-cast v29, Lebb;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v30

    new-instance v13, Lkcl;

    move-object/from16 v16, v1

    move-object/from16 v19, v3

    invoke-direct/range {v13 .. v30}, Lkcl;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lmcl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Locl;Ljava/lang/String;Ljava/lang/String;Lou9;Lebb;I)V

    invoke-virtual {v10, v13}, Lbhi;->resumeWith(Ljava/lang/Object;)V

    return-void

    :pswitch_1d2
    move-object/from16 v1, p1

    check-cast v1, Lgu9;

    iget-object v1, v1, Lgu9;->w:Ljava/lang/String;

    check-cast v0, Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvo7;

    new-instance v2, Lorg/chromium/url/GURL;

    invoke-direct {v2, v1}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v2, v9}, Lvo7;->a(Lorg/chromium/url/GURL;Z)Luo7;

    invoke-static {v1}, Lwqm;->I(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Llqm;->p:Llqm;

    invoke-static {v0, v1, v9}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    invoke-static {v0, v8, v0}, Lo18;->t(Lvx3;ZLvx3;)V

    return-void

    :pswitch_1f9
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    check-cast v10, Lhz;

    check-cast v0, Lfz;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v10, Lhz;->b:Ljava/lang/Object;

    check-cast v2, Liz;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_21f

    iget v1, v0, Lfz;->f:I

    if-ge v1, v7, :cond_21f

    iget-object v1, v2, Liz;->b:Lt9f;

    iget-object v3, v2, Liz;->d:Landroid/net/Uri;

    iget-object v4, v2, Liz;->e:Ljava/lang/String;

    invoke-virtual {v0, v1, v3, v4, v10}, Lfz;->a(Lt9f;Landroid/net/Uri;Ljava/lang/String;Lhz;)V

    invoke-virtual {v2}, Liz;->a()V

    goto :goto_235

    :cond_21f
    iget-object v1, v2, Liz;->f:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22a

    invoke-virtual {v2}, Liz;->a()V

    :cond_22a
    iget-object v0, v2, Liz;->h:Lig;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    const-wide/32 v1, 0xea60

    invoke-static {v0, v1, v2}, Lvml;->d(Ljava/lang/Runnable;J)V

    :goto_235
    return-void

    :pswitch_data_236
    .packed-switch 0x0
        :pswitch_1f9
        :pswitch_1d2
        :pswitch_113
        :pswitch_52
        :pswitch_28
    .end packed-switch
.end method
