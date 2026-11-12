.class public final Lxgo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final a:Lg94;

.field public final b:Lu2p;

.field public final c:Lfio;

.field public d:J

.field public e:F

.field public f:F


# direct methods
.method public constructor <init>(Lg94;Lu2p;Lfio;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxgo;->a:Lg94;

    iput-object p2, p0, Lxgo;->b:Lu2p;

    iput-object p3, p0, Lxgo;->c:Lfio;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 16

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    iget-object v1, p0, Lxgo;->a:Lg94;

    const/4 v2, 0x2

    const/4 v3, 0x0

    iget-object v4, p0, Lxgo;->c:Lfio;

    const/4 v5, 0x1

    if-eqz v0, :cond_61

    if-eq v0, v5, :cond_32

    if-ne v0, v2, :cond_60

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    iget-wide v9, p0, Lxgo;->d:J

    iget v11, p0, Lxgo;->e:F

    iget v12, p0, Lxgo;->f:F

    iget-object v7, p0, Lxgo;->c:Lfio;

    move-object v8, p2

    invoke-static/range {v6 .. v12}, Lbwg;->g(Landroid/content/Context;Lfio;Landroid/view/MotionEvent;JFF)Z

    move-result p0

    if-nez p0, :cond_60

    iget-byte p0, v4, Lfio;->a:B

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_60

    if-ne p0, v2, :cond_60

    invoke-interface {p1, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    return v3

    :cond_32
    move-object v8, p2

    iget v11, p0, Lxgo;->e:F

    iget v12, p0, Lxgo;->f:F

    const/4 p2, 0x0

    iput p2, p0, Lxgo;->e:F

    iput p2, p0, Lxgo;->f:F

    iget-object p2, p0, Lxgo;->b:Lu2p;

    if-eqz p2, :cond_4e

    invoke-virtual {v8}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-double v6, v0

    invoke-virtual {v8}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-double v9, v0

    iput-wide v6, p2, Laoo;->f:D

    iput-wide v9, p2, Laoo;->g:D

    :cond_4e
    iget-byte p2, v4, Lfio;->a:B

    if-ne p2, v2, :cond_60

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    iget-object v7, p0, Lxgo;->c:Lfio;

    iget-wide v9, p0, Lxgo;->d:J

    invoke-static/range {v6 .. v12}, Lbwg;->g(Landroid/content/Context;Lfio;Landroid/view/MotionEvent;JFF)Z

    move-result p0

    if-nez p0, :cond_8b

    :cond_60
    return v3

    :cond_61
    move-object v8, p2

    invoke-virtual {v8}, Landroid/view/MotionEvent;->getX()F

    move-result p2

    iput p2, p0, Lxgo;->e:F

    invoke-virtual {v8}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    iput p2, p0, Lxgo;->f:F

    iget-byte p2, v4, Lfio;->a:B

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_7b

    if-ne p2, v2, :cond_7b

    invoke-interface {v0, v5}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_7b
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    iput-wide v6, p0, Lxgo;->d:J

    iget-byte p0, v4, Lfio;->a:B

    const/4 p2, 0x4

    if-ne p0, p2, :cond_8f

    iget-byte p0, v4, Lfio;->e:B

    and-int/2addr p0, p2

    if-eqz p0, :cond_8f

    :cond_8b
    invoke-interface {v1, p1}, Lg94;->l(Ljava/lang/Object;)V

    return v5

    :cond_8f
    return v3
.end method
