.class public final Lcv3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ldx3;


# direct methods
.method public synthetic constructor <init>(Ldx3;B)V
    .registers 3

    iput-byte p2, p0, Lcv3;->a:B

    iput-object p1, p0, Lcv3;->b:Ldx3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lxf7;Lcom/opera/android/downloads/DownloadItem;I)Z
    .registers 16

    iget-byte v0, p0, Lcv3;->a:B

    const/high16 v1, -0x80000000

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object p0, p0, Lcv3;->b:Ldx3;

    packed-switch v0, :pswitch_data_fa

    invoke-interface {p2}, Lcom/opera/android/downloads/DownloadItem;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    sget-object v1, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    invoke-static {v0}, LJ/N;->Mo8CJari(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    check-cast p0, Lcom/opera/android/webapps/WebappActivity;

    sget v1, Lcom/opera/android/webapps/WebappActivity;->J:I

    invoke-virtual {p0}, Lcom/opera/android/webapps/WebappActivity;->f0()Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object v1

    if-eqz v0, :cond_4c

    if-eqz v1, :cond_4c

    invoke-interface {p2}, Lcom/opera/android/downloads/DownloadItem;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v4

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    if-ne v4, v1, :cond_4c

    new-instance v1, Lcx3;

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v4

    iget-object v5, v4, Lsf7;->a:Lrf7;

    iget v10, v0, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    const/4 v11, 0x0

    const/4 v8, 0x0

    move-object v6, p1

    move-object v7, p2

    move v9, p3

    invoke-virtual/range {v5 .. v11}, Lrf7;->a(Lxf7;Lcom/opera/android/downloads/DownloadItem;Landroid/net/Uri;IIZ)Lre7;

    move-result-object p1

    invoke-direct {v1, p0, p1, v3}, Lcx3;-><init>(Ldx3;Lre7;B)V

    goto :goto_4d

    :cond_4c
    move v2, v3

    :goto_4d
    return v2

    :pswitch_4e
    move-object v4, p1

    move-object v5, p2

    move v7, p3

    check-cast p0, Ll2b;

    iget-object p1, p0, Ll2b;->W:Ljava/lang/StringBuilder;

    const/16 p2, 0x63

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-interface {v5}, Lcom/opera/android/downloads/DownloadItem;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    sget-object p2, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    invoke-static {p1}, LJ/N;->Mo8CJari(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p1, :cond_6a

    iget v1, p1, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    :cond_6a
    move v8, v1

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p1

    iget-object v3, p1, Lsf7;->a:Lrf7;

    const/4 v6, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v3 .. v9}, Lrf7;->a(Lxf7;Lcom/opera/android/downloads/DownloadItem;Landroid/net/Uri;IIZ)Lre7;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll2b;->N0(Lre7;)V

    return v2

    :pswitch_83
    move-object v4, p1

    move-object v5, p2

    move v7, p3

    check-cast p0, Lcom/opera/android/esim/ui/EsimActivity;

    invoke-virtual {p0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    check-cast p1, Lqdc;

    iget-object p1, p1, Lqdc;->i:Lqcc;

    sget-object p2, Lqcc;->e:Lqcc;

    invoke-virtual {p1, p2}, Lqcc;->d(Lqcc;)Z

    move-result p1

    if-nez p1, :cond_9a

    move v2, v3

    goto :goto_c8

    :cond_9a
    invoke-interface {v5}, Lcom/opera/android/downloads/DownloadItem;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    sget-object p2, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    invoke-static {p1}, LJ/N;->Mo8CJari(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p1, :cond_aa

    iget v1, p1, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    :cond_aa
    move v9, v1

    new-instance p1, Lcx3;

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p2

    iget-object p2, p2, Lsf7;->a:Lrf7;

    move v8, v7

    const/4 v7, 0x0

    const/4 v10, 0x0

    move-object v6, v5

    move-object v5, v4

    move-object v4, p2

    invoke-virtual/range {v4 .. v10}, Lrf7;->a(Lxf7;Lcom/opera/android/downloads/DownloadItem;Landroid/net/Uri;IIZ)Lre7;

    move-result-object p2

    invoke-direct {p1, p0, p2, v3}, Lcx3;-><init>(Ldx3;Lre7;B)V

    :goto_c8
    return v2

    :pswitch_c9
    move-object v4, p1

    move-object v5, p2

    move v7, p3

    invoke-interface {v5}, Lcom/opera/android/downloads/DownloadItem;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    sget-object p2, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    invoke-static {p1}, LJ/N;->Mo8CJari(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p1, :cond_dc

    iget v1, p1, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    :cond_dc
    move v8, v1

    new-instance p1, Lru3;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p2

    iget-object v3, p2, Lsf7;->a:Lrf7;

    const/4 v6, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v3 .. v9}, Lrf7;->a(Lxf7;Lcom/opera/android/downloads/DownloadItem;Landroid/net/Uri;IIZ)Lre7;

    move-result-object p2

    invoke-direct {p1, p0, p2}, Lru3;-><init>(Lcom/opera/android/BrowserActivity;Lre7;)V

    return v2

    nop

    :pswitch_data_fa
    .packed-switch 0x0
        :pswitch_c9
        :pswitch_83
        :pswitch_4e
    .end packed-switch
.end method
