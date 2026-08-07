.class public Ll/wgx$l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wgx;->E(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/wgx;


# direct methods
.method public constructor <init>(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/wgx$l;->b:Ll/wgx;

    .line 2
    .line 3
    iput-object p2, p0, Ll/wgx$l;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/wgx$l;->b:Ll/wgx;

    .line 2
    .line 3
    invoke-static {p1}, Ll/wgx;->d(Ll/wgx;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Ll/wgx$l;->b:Ll/wgx;

    .line 10
    .line 11
    const/4 p2, 0x1

    .line 12
    invoke-static {p1, p2}, Ll/wgx;->l(Ll/wgx;Z)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    cmpl-float p1, p4, p1

    .line 17
    .line 18
    if-lez p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/wgx$l;->b:Ll/wgx;

    .line 21
    .line 22
    invoke-static {p0}, Ll/wgx;->v(Ll/wgx;)V

    .line 23
    .line 24
    .line 25
    return p2

    .line 26
    :cond_0
    if-nez p1, :cond_1

    .line 27
    .line 28
    iget-object p1, p0, Ll/wgx$l;->b:Ll/wgx;

    .line 29
    .line 30
    iget-object p0, p0, Ll/wgx$l;->a:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    invoke-static {p1, p0}, Ll/wgx;->s(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V

    .line 33
    .line 34
    .line 35
    return p2

    .line 36
    :cond_1
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object p1, p0, Ll/wgx$l;->b:Ll/wgx;

    .line 2
    .line 3
    invoke-static {p1}, Ll/wgx;->d(Ll/wgx;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/wgx$l;->b:Ll/wgx;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-static {p1, v0}, Ll/wgx;->l(Ll/wgx;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/wgx$l;->b:Ll/wgx;

    .line 16
    .line 17
    iget-object p0, p0, Ll/wgx$l;->a:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/wgx;->s(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V

    .line 20
    .line 21
    .line 22
    return v0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method
