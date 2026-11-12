.class public final Lcom/opera/android/browser/OperaDownloadManagerDelegate;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;
    }
.end annotation


# direct methods
.method public static onShowDownloadPathDialog(ZJLcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;Ljava/lang/String;Z)V
    .registers 17
    .param p3    # Lcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v0, v0, Lsf7;->a:Lrf7;

    if-eqz p0, :cond_15

    const-wide/high16 v1, 0x4000000000000000L    # 2.0

    goto :goto_17

    :cond_15
    const-wide/16 v1, 0x0

    :goto_17
    or-long/2addr v1, p1

    invoke-virtual {v0, v1, v2}, Lrf7;->d(J)Lre7;

    move-result-object v3

    if-nez v3, :cond_38

    new-instance v3, Ljkf;

    new-instance v4, Likf;

    move v5, p0

    move-wide v6, p1

    move-object v8, p3

    move-object v9, p4

    move/from16 v10, p5

    invoke-direct/range {v4 .. v10}, Likf;-><init>(ZJLcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;Ljava/lang/String;Z)V

    new-instance p0, Lvdf;

    const/4 p1, 0x3

    invoke-direct {p0, p3, p1}, Lvdf;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v3, v1, v2, v4, p0}, Ljkf;-><init>(JLikf;Lvdf;)V

    invoke-virtual {v0, v3}, Lrf7;->b(Lqf7;)V

    return-void

    :cond_38
    iget-object p0, v3, Lre7;->a:Lxf7;

    new-instance p1, Lbu3;

    const/4 p2, 0x1

    move/from16 v10, p5

    invoke-direct {p1, p2, v3, p3, v10}, Lbu3;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object p2, v3, Lre7;->d:Landroid/net/Uri;

    const/4 p3, 0x0

    if-nez p2, :cond_65

    iget-object p2, p0, Lxf7;->d:Lag7;

    iget-object p2, p2, Lag7;->b:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p2

    invoke-virtual {p2}, Lcom/opera/android/settings/SettingsManager;->m()Landroid/net/Uri;

    move-result-object p2

    iget-object v0, v3, Lre7;->d:Landroid/net/Uri;

    invoke-virtual {p2, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_65

    iput-object p2, v3, Lre7;->d:Landroid/net/Uri;

    iput-object p3, v3, Lre7;->e:Landroid/net/Uri;

    :cond_65
    iput-object p4, v3, Lre7;->p:Ljava/lang/String;

    iget-object p2, v3, Lre7;->d:Landroid/net/Uri;

    iget-object p0, p0, Lxf7;->c:Lumi;

    new-instance v0, La32;

    const/4 v1, 0x7

    invoke-direct {v0, v3, p2, p4, v1}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance p2, Lge5;

    const/16 p4, 0xe

    invoke-direct {p2, v3, p1, p4}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p2}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    invoke-virtual {p0, p3, p3}, Loml;->a(Ljava/lang/Object;Ljri;)V

    return-void
.end method

.method public static openDownload(ZJ)V
    .registers 6

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v0, v0, Lsf7;->a:Lrf7;

    if-eqz p0, :cond_15

    const-wide/high16 v1, 0x4000000000000000L    # 2.0

    goto :goto_17

    :cond_15
    const-wide/16 v1, 0x0

    :goto_17
    or-long/2addr p1, v1

    invoke-virtual {v0, p1, p2}, Lrf7;->d(J)Lre7;

    move-result-object p0

    if-eqz p0, :cond_106

    iget-object p1, p0, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {p1}, Lcom/opera/android/downloads/DownloadItem;->m()I

    move-result p1

    if-eqz p1, :cond_5f

    const/4 p2, 0x1

    if-eq p1, p2, :cond_5f

    const/4 p2, 0x2

    if-ne p1, p2, :cond_106

    iget-object p1, p0, Lre7;->x:Lcx3;

    if-eqz p1, :cond_106

    iget-byte p2, p1, Lcx3;->b:B

    packed-switch p2, :pswitch_data_108

    goto :goto_5e

    :pswitch_36
    invoke-virtual {p0}, Lre7;->g()Landroid/net/Uri;

    move-result-object p2

    if-eqz p2, :cond_5e

    invoke-virtual {p0}, Lre7;->f()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Lrf7;->g(Lre7;)Lo29;

    move-result-object v1

    invoke-static {v0}, Ls29;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lre7;->m:Ljava/lang/String;

    iget-object p1, p1, Lcx3;->c:Ldx3;

    invoke-virtual {p1}, Ldx3;->F()Ljv0;

    move-result-object p1

    new-instance v2, Lu92;

    invoke-direct {v2, p2, v1, p0, v0}, Lu92;-><init>(Landroid/net/Uri;Lo29;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    sget-object p2, Lx92;->d:Lx92;

    invoke-interface {p1, p0, p2}, Ljv0;->j(Ljava/util/List;Lx92;)V

    :cond_5e
    :goto_5e
    :pswitch_5e
    return-void

    :cond_5f
    iget-object p1, p0, Lre7;->x:Lcx3;

    if-eqz p1, :cond_106

    iget-byte p2, p1, Lcx3;->b:B

    const/4 v0, -0x6

    packed-switch p2, :pswitch_data_110

    invoke-virtual {p0}, Lre7;->h()Ljava/io/File;

    move-result-object p2

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lre7;->f()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p2, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p0

    iget-object p1, p1, Lcx3;->c:Ldx3;

    check-cast p1, Ll2b;

    if-nez p0, :cond_87

    sget-object p0, Lb3b;->a:[Lb3b;

    invoke-virtual {p1, v0}, Ll2b;->E0(I)V

    goto/16 :goto_106

    :cond_87
    iget-object p0, p1, Ll2b;->W:Ljava/lang/StringBuilder;

    const/16 p2, 0x66

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ll2b;->C0(Ljava/io/File;)V

    goto/16 :goto_106

    :pswitch_93
    iget-object p2, p0, Lre7;->m:Ljava/lang/String;

    const-string v1, "text/csv"

    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_a0

    sget-object p2, Lj2b;->c:Lj2b;

    goto :goto_a2

    :cond_a0
    sget-object p2, Lj2b;->d:Lj2b;

    :goto_a2
    invoke-virtual {p0}, Lre7;->h()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lre7;->f()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result p0

    iget-object p1, p1, Lcx3;->c:Ldx3;

    check-cast p1, Lcom/opera/android/import_data/ImportChromeDataActivity;

    if-nez p0, :cond_c1

    sget-object p0, Lb3b;->a:[Lb3b;

    sget p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->d0:I

    invoke-virtual {p1, p2, v0}, Lcom/opera/android/import_data/ImportChromeDataActivity;->S0(Lj2b;I)V

    goto :goto_106

    :cond_c1
    sget p0, Lcom/opera/android/import_data/ImportChromeDataActivity;->d0:I

    sget-object p0, Lj2b;->c:Lj2b;

    if-ne p2, p0, :cond_d9

    new-instance p0, Lcom/opera/android/autofill/PasswordImporter;

    new-instance p2, Ld06;

    invoke-direct {p2, p1}, Ld06;-><init>(Ljava/lang/Object;)V

    invoke-direct {p0, p2}, Lcom/opera/android/autofill/PasswordImporter;-><init>(Lm4g;)V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/autofill/PasswordImporter;->a(Ljava/lang/String;)V

    goto :goto_106

    :cond_d9
    sget-object p0, Lj2b;->d:Lj2b;

    if-ne p2, p0, :cond_106

    sget-object p0, Lvml;->d:Lumi;

    new-instance p2, Lzr9;

    const/4 v0, 0x7

    invoke-direct {p2, p1, v2, v0}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p0, p2}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    goto :goto_106

    :pswitch_ee
    iget-object p2, p1, Lcx3;->c:Ldx3;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v0, v0, Lsf7;->a:Lrf7;

    invoke-virtual {p1, p0}, Lcx3;->e(Lre7;)Lvwh;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, p0, p2, p1, v1}, Lrf7;->p(Lre7;Landroid/content/Context;Lvwh;Z)V

    :cond_106
    :goto_106
    return-void

    nop

    :pswitch_data_108
    .packed-switch 0x0
        :pswitch_36
        :pswitch_5e
    .end packed-switch

    :pswitch_data_110
    .packed-switch 0x0
        :pswitch_ee
        :pswitch_93
    .end packed-switch
.end method
