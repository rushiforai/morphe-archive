.class public final Ll/mmj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mmj$b;,
        Ll/mmj$a;
    }
.end annotation


# instance fields
.field public final a:Ll/mmj$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V
    .locals 1

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, p1, p2, v0}, Ll/mmj;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/mmj$b;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2, p3}, Ll/mmj$b;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/mmj;->a:Ll/mmj$a;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mmj;->a:Ll/mmj$a;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/mmj$a;->b(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mmj;->a:Ll/mmj$a;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/mmj$a;->a(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mmj;->a:Ll/mmj$a;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/mmj$a;->c(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
