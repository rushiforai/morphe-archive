.class public final Lnz4;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final a:Lty3;

.field public final b:Lcom/opera/android/browser/chromium/ChromiumContainerView;

.field public final c:Lysl;

.field public d:Lcy3;

.field public e:Landroid/view/View;

.field public f:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public g:Z

.field public h:Z

.field public i:Luz4;

.field public j:Lb7f;

.field public final k:Lwa;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContainerView;Lysl;)V
    .registers 5

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v0, Lty3;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lty3;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lnz4;->a:Lty3;

    iput-boolean v1, p0, Lnz4;->h:Z

    new-instance v0, Lwa;

    const/16 v1, 0x8

    invoke-direct {v0, p0, v1}, Lwa;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lnz4;->k:Lwa;

    iput-object p1, p0, Lnz4;->b:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iput-object p2, p0, Lnz4;->c:Lysl;

    return-void
.end method


# virtual methods
.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    iget-object p0, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->J:Lxr5;

    invoke-virtual {p0, p1}, Lxr5;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final onVisibilityChanged(Landroid/view/View;I)V
    .registers 5

    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object v0, p0, Lnz4;->i:Luz4;

    const/4 v1, 0x0

    if-eqz v0, :cond_11

    if-eqz p2, :cond_11

    iput v1, v0, Luz4;->f:I

    iget-object v0, v0, Luz4;->a:Lcom/opera/android/widget/ThumbScroller;

    invoke-virtual {v0, v1, v1}, Lcom/opera/android/widget/ThumbScroller;->d(ZZ)V

    :cond_11
    iget-object v0, p0, Lnz4;->b:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    if-eq p1, v0, :cond_3a

    if-eqz p2, :cond_36

    const/4 p1, 0x4

    const/16 v0, 0x8

    if-eq p2, p1, :cond_1e

    if-ne p2, v0, :cond_3a

    :cond_1e
    iget-boolean p1, p0, Lnz4;->h:Z

    if-nez p1, :cond_3a

    const/4 p1, 0x1

    iput-boolean p1, p0, Lnz4;->h:Z

    iget-object p1, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p1, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->J:Lxr5;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0, v1}, Lorg/chromium/content_public/browser/WebContents;->y1(I)V

    return-void

    :cond_36
    iget-boolean p1, p0, Lnz4;->h:Z

    if-nez p1, :cond_3b

    :cond_3a
    return-void

    :cond_3b
    iput-boolean v1, p0, Lnz4;->h:Z

    iget-object p1, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p1, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->J:Lxr5;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    const/4 p1, 0x2

    invoke-interface {p0, p1}, Lorg/chromium/content_public/browser/WebContents;->y1(I)V

    return-void
.end method
