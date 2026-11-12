.class public abstract Lrtn;
.super Lptn;
.source "SourceFile"


# instance fields
.field public final b:Lcom/opera/android/browser/WebContentsWrapper;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/WebContentsWrapper;)V
    .registers 3

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    invoke-direct {p0, v0}, Lptn;-><init>(Lorg/chromium/content_public/browser/WebContents;)V

    iput-object p1, p0, Lrtn;->b:Lcom/opera/android/browser/WebContentsWrapper;

    iget-object p1, p1, Lcom/opera/android/browser/WebContentsWrapper;->c:Lh7f;

    invoke-virtual {p1, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public g()V
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lptn;->c(Lorg/chromium/content_public/browser/WebContents;)V

    iget-object v0, p0, Lrtn;->b:Lcom/opera/android/browser/WebContentsWrapper;

    iget-object v0, v0, Lcom/opera/android/browser/WebContentsWrapper;->c:Lh7f;

    invoke-virtual {v0, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public h()V
    .registers 1

    return-void
.end method

.method public webContentsDestroyed()V
    .registers 2

    iget-object v0, p0, Lrtn;->b:Lcom/opera/android/browser/WebContentsWrapper;

    iget-object v0, v0, Lcom/opera/android/browser/WebContentsWrapper;->c:Lh7f;

    invoke-virtual {v0, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method
