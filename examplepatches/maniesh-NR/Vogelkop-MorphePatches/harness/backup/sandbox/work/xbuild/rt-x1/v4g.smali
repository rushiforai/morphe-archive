.class public final Lv4g;
.super Lcej;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lp94;Lqsh;Landroid/graphics/Bitmap;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lv4g;->a:B

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lv4g;->c:Ljava/lang/Object;

    .line 17
    iput-object p2, p0, Lv4g;->d:Ljava/lang/Object;

    .line 18
    iput-object p3, p0, Lv4g;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ls9i;Lodf;ZLlld;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Lv4g;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv4g;->c:Ljava/lang/Object;

    iput-object p2, p0, Lv4g;->d:Ljava/lang/Object;

    iput-boolean p3, p0, Lv4g;->b:Z

    iput-object p4, p0, Lv4g;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 29

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lv4g;->a:B

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    packed-switch v2, :pswitch_data_10e

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v6, v0, Lv4g;->d:Ljava/lang/Object;

    check-cast v6, Lqsh;

    iget-object v6, v6, Lqsh;->b:Ljava/lang/Object;

    check-cast v6, Ln1;

    iget-object v7, v6, Ln1;->b:Ljava/lang/Object;

    check-cast v7, Landroid/content/res/Resources;

    const v8, 0x7f140c4d

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Lqxh;

    invoke-direct {v8, v7}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    new-instance v7, Ldco;

    invoke-direct {v7, v0, v5}, Ldco;-><init>(Lv4g;B)V

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v8, v5}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v5

    const/4 v9, 0x0

    if-nez v5, :cond_41

    move-object/from16 v20, v9

    move-object/from16 v21, v20

    goto :goto_45

    :cond_41
    move-object/from16 v21, v7

    move-object/from16 v20, v8

    :goto_45
    invoke-interface {v6}, Lcco;->u()Ljava/lang/String;

    move-result-object v5

    new-instance v7, Lqxh;

    invoke-direct {v7, v5}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    new-instance v5, Ldco;

    invoke-direct {v5, v0, v4}, Ldco;-><init>(Lv4g;B)V

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v7, v4}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-nez v4, :cond_66

    move-object/from16 v18, v9

    move-object/from16 v19, v18

    goto :goto_6a

    :cond_66
    move-object/from16 v19, v5

    move-object/from16 v18, v7

    :goto_6a
    iget-object v4, v6, Ln1;->b:Ljava/lang/Object;

    check-cast v4, Landroid/content/res/Resources;

    const v5, 0x7f1415b2

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-instance v15, Lqxh;

    invoke-direct {v15, v4}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    iget-object v4, v0, Lv4g;->e:Ljava/lang/Object;

    check-cast v4, Landroid/graphics/Bitmap;

    if-eqz v4, :cond_87

    new-instance v9, Lroj;

    const/16 v4, 0x14

    invoke-direct {v9, v0, v2, v4}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    :cond_87
    move-object v11, v9

    new-instance v0, Lqf;

    new-instance v10, Lgua;

    const/4 v13, 0x0

    const/16 v17, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/16 v22, 0x1

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-direct/range {v10 .. v25}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    invoke-direct {v0, v1, v10, v3}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    return-object v0

    :pswitch_a2
    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v6, Lqf;

    iget-object v7, v0, Lv4g;->c:Ljava/lang/Object;

    check-cast v7, Ls9i;

    new-instance v8, Lu4g;

    invoke-direct {v8, v0, v2, v5}, Lu4g;-><init>(Lv4g;Landroid/content/Context;B)V

    new-instance v5, Lu4g;

    invoke-direct {v5, v0, v2, v4}, Lu4g;-><init>(Lv4g;Landroid/content/Context;B)V

    iget-boolean v0, v0, Lv4g;->b:Z

    iget-object v4, v7, Ls9i;->c:Ljava/lang/Object;

    move-object v15, v4

    check-cast v15, Lpxh;

    iget-object v4, v7, Ls9i;->b:Ljava/lang/Object;

    move-object v14, v4

    check-cast v14, Lrxh;

    iget-object v4, v7, Ls9i;->d:Ljava/lang/Object;

    check-cast v4, Lrxh;

    invoke-static {v2, v4}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v9

    const/16 v24, 0x0

    if-nez v9, :cond_d3

    move-object/from16 v19, v24

    move-object/from16 v20, v19

    goto :goto_d7

    :cond_d3
    move-object/from16 v19, v4

    move-object/from16 v20, v8

    :goto_d7
    iget-object v4, v7, Ls9i;->e:Ljava/lang/Object;

    check-cast v4, Lrxh;

    invoke-static {v2, v4}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v2

    if-nez v2, :cond_e6

    move-object/from16 v17, v24

    move-object/from16 v18, v17

    goto :goto_ea

    :cond_e6
    move-object/from16 v17, v4

    move-object/from16 v18, v5

    :goto_ea
    new-instance v11, Llxh;

    const v2, 0x7f0805aa

    invoke-direct {v11, v2}, Llxh;-><init>(I)V

    new-instance v2, Ldxh;

    const v4, 0x7f0400f5

    invoke-direct {v2, v4}, Ldxh;-><init>(I)V

    new-instance v9, Lgua;

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v16, 0x0

    const/16 v21, 0x1

    move/from16 v23, v0

    move-object/from16 v22, v2

    invoke-direct/range {v9 .. v24}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    invoke-direct {v6, v1, v9, v3}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    return-object v6

    :pswitch_data_10e
    .packed-switch 0x0
        :pswitch_a2
    .end packed-switch
.end method

.method public final onFinished(Lhjm;)V
    .registers 3

    iget-byte v0, p0, Lv4g;->a:B

    packed-switch v0, :pswitch_data_34

    iget-boolean p1, p0, Lv4g;->b:Z

    if-nez p1, :cond_13

    const/4 p1, 0x1

    iput-boolean p1, p0, Lv4g;->b:Z

    iget-object p1, p0, Lv4g;->d:Ljava/lang/Object;

    check-cast p1, Lqsh;

    invoke-virtual {p1}, Lqsh;->d()V

    :cond_13
    iget-object p0, p0, Lv4g;->c:Ljava/lang/Object;

    check-cast p0, Lp94;

    invoke-virtual {p0}, Lp94;->run()V

    return-void

    :pswitch_1b
    sget-object v0, Lhjm;->b:Lhjm;

    if-ne p1, v0, :cond_33

    iget-object p1, p0, Lv4g;->e:Ljava/lang/Object;

    check-cast p1, Llld;

    iget-object p1, p1, Llld;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;

    iget-object v0, p1, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->d:Lv4g;

    if-ne v0, p0, :cond_33

    const/4 p0, 0x0

    iput-object p0, p1, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->d:Lv4g;

    iget-wide p0, p1, Lcom/opera/android/browser/passwordmanager/PasswordManagerDialogRequest;->e:J

    invoke-static {p0, p1}, LJ/N;->MB6ulApe(J)V

    :cond_33
    return-void

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
