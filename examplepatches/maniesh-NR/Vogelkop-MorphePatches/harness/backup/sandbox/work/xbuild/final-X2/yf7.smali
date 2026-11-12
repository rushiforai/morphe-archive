.class public final Lyf7;
.super Lxf7;
.source "SourceFile"


# instance fields
.field public final e:Ljava/util/ArrayList;

.field public final f:Lrf7;

.field public g:Z

.field public final h:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Lag7;Lrf7;Lumi;)V
    .registers 6

    new-instance v0, Lcom/opera/android/browser/chromium/OperaBrowserContext;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/opera/android/browser/chromium/OperaBrowserContext;-><init>(Z)V

    invoke-direct {p0, p1, v0, p3}, Lxf7;-><init>(Lag7;Lcom/opera/android/browser/chromium/OperaBrowserContext;Lumi;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lyf7;->e:Ljava/util/ArrayList;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lyf7;->h:Ljava/util/HashMap;

    iput-object p2, p0, Lyf7;->f:Lrf7;

    return-void
.end method


# virtual methods
.method public final onDownloadCreated(Lcom/opera/android/downloads/DownloadItem;Ljava/lang/String;II)V
    .registers 13

    iget-object v0, p0, Lyf7;->h:Ljava/util/HashMap;

    invoke-interface {p1}, Lcom/opera/android/downloads/DownloadItem;->p()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/api/Callback;

    if-nez v0, :cond_16

    iget-boolean v1, p0, Lyf7;->g:Z

    if-nez v1, :cond_16

    invoke-super {p0, p1, p2, p3, p4}, Lxf7;->onDownloadCreated(Lcom/opera/android/downloads/DownloadItem;Ljava/lang/String;II)V

    return-void

    :cond_16
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_45

    const-string p4, "/"

    invoke-virtual {p2, p4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_2f

    new-instance p4, Ljava/io/File;

    invoke-direct {p4, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p2

    :goto_2d
    move-object v4, p2

    goto :goto_34

    :cond_2f
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    goto :goto_2d

    :goto_34
    const/high16 v6, -0x80000000

    const/4 v7, 0x1

    iget-object v1, p0, Lyf7;->f:Lrf7;

    move-object v2, p0

    move-object v3, p1

    move v5, p3

    invoke-virtual/range {v1 .. v7}, Lrf7;->a(Lxf7;Lcom/opera/android/downloads/DownloadItem;Landroid/net/Uri;IIZ)Lre7;

    move-result-object p0

    if-eqz v0, :cond_45

    invoke-interface {v0, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_45
    return-void
.end method
