.class public final Luz4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/widget/ThumbScroller;

.field public final b:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final c:Lorg/chromium/content_public/browser/WebContents;

.field public final d:Lysl;

.field public e:Ls03;

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public final k:I

.field public l:Z

.field public final m:Lty3;

.field public final n:Llb4;

.field public final o:Ltz4;


# direct methods
.method public constructor <init>(Lcom/opera/android/widget/ThumbScroller;Lcom/opera/android/browser/chromium/ChromiumContent;Lysl;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lty3;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lty3;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Luz4;->m:Lty3;

    new-instance v0, Ltz4;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ltz4;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Luz4;->o:Ltz4;

    iput-object p1, p0, Luz4;->a:Lcom/opera/android/widget/ThumbScroller;

    iput-object p2, p0, Luz4;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p2

    iput-object p2, p0, Luz4;->c:Lorg/chromium/content_public/browser/WebContents;

    iput-object p3, p0, Luz4;->d:Lysl;

    new-instance p2, Llb4;

    const/16 p3, 0xe

    invoke-direct {p2, p0, p3}, Llb4;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Luz4;->n:Llb4;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result p2

    int-to-float p2, p2

    const p3, 0x3db851ec    # 0.09f

    mul-float/2addr p2, p3

    float-to-int p2, p2

    iput p2, p0, Luz4;->k:I

    new-instance p2, Lzy9;

    invoke-direct {p2, p0}, Lzy9;-><init>(Ljava/lang/Object;)V

    iput-object p2, p1, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Luz4;->b(Z)V

    return-void
.end method


# virtual methods
.method public final a()Lhuh;
    .registers 1

    iget-object p0, p0, Luz4;->c:Lorg/chromium/content_public/browser/WebContents;

    check-cast p0, Lorg/chromium/content/browser/webcontents/WebContentsImpl;

    iget-object p0, p0, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->g:Lhuh;

    return-object p0
.end method

.method public final b(Z)V
    .registers 7

    iget-boolean v0, p0, Luz4;->l:Z

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput-boolean p1, p0, Luz4;->l:Z

    iget-object v0, p0, Luz4;->o:Ltz4;

    iget-object v1, p0, Luz4;->c:Lorg/chromium/content_public/browser/WebContents;

    iget-object v2, p0, Luz4;->n:Llb4;

    iget-object v3, p0, Luz4;->m:Lty3;

    iget-object v4, p0, Luz4;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p1, :cond_28

    invoke-virtual {v4, v3}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    invoke-virtual {p0}, Luz4;->a()Lhuh;

    move-result-object p0

    iget-object p0, p0, Lhuh;->l:Lh7f;

    invoke-virtual {p0, v2}, Lh7f;->b(Ljava/lang/Object;)Z

    invoke-static {v1}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->e(Lorg/chromium/content_public/browser/WebContents;)Lorg/chromium/content/browser/GestureListenerManagerImpl;

    move-result-object p0

    const/4 p1, 0x2

    invoke-virtual {p0, v0, p1}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->b(Ljw9;I)V

    return-void

    :cond_28
    invoke-virtual {v4, v3}, Lcom/opera/android/browser/chromium/ChromiumContent;->y(Liz4;)V

    invoke-virtual {p0}, Luz4;->a()Lhuh;

    move-result-object p0

    iget-object p0, p0, Lhuh;->l:Lh7f;

    invoke-virtual {p0, v2}, Lh7f;->c(Ljava/lang/Object;)Z

    invoke-static {v1}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->e(Lorg/chromium/content_public/browser/WebContents;)Lorg/chromium/content/browser/GestureListenerManagerImpl;

    move-result-object p0

    invoke-virtual {p0, v0}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->h(Ljw9;)V

    return-void
.end method
