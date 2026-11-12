.class public final Lzzi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwyi;


# instance fields
.field public final a:J

.field public final b:La0j;

.field public final c:Lhuh;

.field public final d:Lorg/chromium/content_public/browser/WebContents;

.field public e:Z


# direct methods
.method public constructor <init>(Lorg/chromium/content_public/browser/WebContents;Lhuh;Lxr5;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzzi;->d:Lorg/chromium/content_public/browser/WebContents;

    iput-object p2, p0, Lzzi;->c:Lhuh;

    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0708c9

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    const v1, 0x7f0708c8

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    invoke-static {p1, v0, p2}, LJ/N;->MVHplMws(Ljava/lang/Object;II)J

    move-result-wide p1

    iput-wide p1, p0, Lzzi;->a:J

    new-instance p1, La0j;

    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, La0j;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lzzi;->b:La0j;

    invoke-virtual {p3, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final a(IFF)V
    .registers 7

    iget-object p2, p0, Lzzi;->d:Lorg/chromium/content_public/browser/WebContents;

    iget-wide v0, p0, Lzzi;->a:J

    const/4 p3, 0x1

    if-eq p1, p3, :cond_21

    const/4 v2, 0x3

    if-eq p1, v2, :cond_16

    const/4 p2, 0x4

    if-ne p1, p2, :cond_2d

    const/4 p1, 0x0

    iput-boolean p1, p0, Lzzi;->e:Z

    iget-object p0, p0, Lzzi;->b:La0j;

    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_16
    iput-boolean p3, p0, Lzzi;->e:Z

    new-instance p1, Lcom/opera/android/browser/selection_zoom/SelectionZoomController$BitmapCallback;

    invoke-direct {p1, p0}, Lcom/opera/android/browser/selection_zoom/SelectionZoomController$BitmapCallback;-><init>(Lzzi;)V

    invoke-static {v0, v1, p2, p1}, LJ/N;->MQwJK6f8(JLjava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_21
    iget-boolean p1, p0, Lzzi;->e:Z

    if-eqz p1, :cond_2d

    new-instance p1, Lcom/opera/android/browser/selection_zoom/SelectionZoomController$BitmapCallback;

    invoke-direct {p1, p0}, Lcom/opera/android/browser/selection_zoom/SelectionZoomController$BitmapCallback;-><init>(Lzzi;)V

    invoke-static {v0, v1, p2, p1}, LJ/N;->MQwJK6f8(JLjava/lang/Object;Ljava/lang/Object;)V

    :cond_2d
    return-void
.end method

.method public final b()V
    .registers 1

    return-void
.end method

.method public final c(Lix5;)V
    .registers 2

    return-void
.end method

.method public final e(Z)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final g(Ljava/lang/String;)V
    .registers 2

    return-void
.end method
