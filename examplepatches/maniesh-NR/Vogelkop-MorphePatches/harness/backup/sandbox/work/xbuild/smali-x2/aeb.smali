.class public final Laeb;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final k:Lu1b;


# instance fields
.field public final a:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final b:Lu59;

.field public final c:Lcom/opera/android/Lazy;

.field public final d:Ljava/util/List;

.field public final e:Lty3;

.field public final f:Lbp;

.field public g:Lzdb;

.field public h:Ljava/lang/String;

.field public i:J

.field public j:J


# direct methods
.method static constructor <clinit>()V
    .registers 14

    const-string v5, "opera-offline"

    const-string v6, "opera-jump"

    const-string v0, "http"

    const-string v1, "https"

    const-string v2, "inline"

    const-string v3, "javascript"

    const-string v4, "opera-distiller"

    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    move-result-object v13

    const-string v7, "about"

    const-string v8, "blob"

    const-string v9, "chrome"

    const-string v10, "content"

    const-string v11, "data"

    const-string v12, "file"

    invoke-static/range {v7 .. v13}, Lu1b;->t(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Lu1b;

    move-result-object v0

    sput-object v0, Laeb;->k:Lu1b;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lcom/opera/android/Lazy;Ljava/util/List;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lty3;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Lty3;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Laeb;->e:Lty3;

    new-instance v1, Lbp;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    const/4 v2, -0x2

    iput v2, v1, Lbp;->a:I

    iput-object v1, p0, Laeb;->f:Lbp;

    iput-object p1, p0, Laeb;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    new-instance v1, Lu59;

    const/16 v2, 0x13

    invoke-direct {v1, p1, v2}, Lu59;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Laeb;->b:Lu59;

    iput-object p2, p0, Laeb;->c:Lcom/opera/android/Lazy;

    iput-object p3, p0, Laeb;->d:Ljava/util/List;

    new-instance p2, Lzdb;

    invoke-direct {p2, p0, p0}, Lzdb;-><init>(Laeb;Laeb;)V

    iput-object p2, p0, Laeb;->g:Lzdb;

    invoke-virtual {p1, v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Laeb;->c:Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvo7;

    iget-object p0, p0, Lvo7;->h:Luo7;

    if-nez p0, :cond_e

    const/4 p0, 0x0

    return-object p0

    :cond_e
    iget-object p0, p0, Luo7;->b:Lqo7;

    iget-object p0, p0, Lqo7;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final b()Lorg/chromium/content_public/browser/WebContents;
    .registers 2

    iget-object p0, p0, Laeb;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 p0, 0x0

    return-object p0

    :cond_a
    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    return-object p0
.end method

.method public final c(Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 10

    iget-object v0, p0, Laeb;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object v0

    iget v2, p1, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    iget-boolean v3, p1, Lorg/chromium/content_public/browser/NavigationHandle;->q:Z

    iget-boolean v4, p1, Lorg/chromium/content_public/browser/NavigationHandle;->p:Z

    invoke-interface {v0}, Lorg/chromium/content_public/browser/NavigationController;->t()I

    move-result v5

    invoke-interface {v0}, Lorg/chromium/content_public/browser/NavigationController;->d()Z

    move-result v6

    iget-boolean v7, p1, Lorg/chromium/content_public/browser/NavigationHandle;->b:Z

    iget-object v1, p0, Laeb;->f:Lbp;

    invoke-virtual/range {v1 .. v7}, Lbp;->d0(IZZIZZ)V

    return-void
.end method

.method public final d()Z
    .registers 2

    iget-object p0, p0, Laeb;->b:Lu59;

    invoke-virtual {p0}, Lu59;->F()Lb2l;

    move-result-object p0

    if-eqz p0, :cond_12

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->l:Llqm;

    sget-object v0, Llqm;->i:Llqm;

    if-ne p0, v0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method
