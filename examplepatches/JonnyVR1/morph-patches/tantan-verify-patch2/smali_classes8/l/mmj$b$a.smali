.class public Ll/mmj$b$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mmj$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic a:Ll/mmj$b;


# direct methods
.method public constructor <init>(Ll/mmj$b;)V
    .locals 0

    .line 11
    iput-object p1, p0, Ll/mmj$b$a;->a:Ll/mmj$b;

    .line 12
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method public constructor <init>(Ll/mmj$b;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mmj$b$a;->a:Ll/mmj$b;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_4

    .line 5
    .line 6
    const/4 v2, 0x2

    .line 7
    if-eq v0, v2, :cond_3

    .line 8
    .line 9
    const/4 v2, 0x3

    .line 10
    if-ne v0, v2, :cond_2

    .line 11
    .line 12
    iget-object p0, p0, Ll/mmj$b$a;->a:Ll/mmj$b;

    .line 13
    .line 14
    iget-object p1, p0, Ll/mmj$b;->g:Landroid/view/GestureDetector$OnDoubleTapListener;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-boolean v0, p0, Ll/mmj$b;->h:Z

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/mmj$b;->m:Landroid/view/MotionEvent;

    .line 23
    .line 24
    invoke-interface {p1, p0}, Landroid/view/GestureDetector$OnDoubleTapListener;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iput-boolean v1, p0, Ll/mmj$b;->i:Z

    .line 29
    .line 30
    :cond_1
    return-void

    .line 31
    :cond_2
    const-string p0, "Unknown message "

    .line 32
    .line 33
    invoke-static {p0, p1}, Ll/mce;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_3
    iget-object p0, p0, Ll/mmj$b$a;->a:Ll/mmj$b;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/mmj$b;->f()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_4
    iget-object p0, p0, Ll/mmj$b$a;->a:Ll/mmj$b;

    .line 44
    .line 45
    iget-object p1, p0, Ll/mmj$b;->f:Landroid/view/GestureDetector$OnGestureListener;

    .line 46
    .line 47
    iget-object p0, p0, Ll/mmj$b;->m:Landroid/view/MotionEvent;

    .line 48
    .line 49
    invoke-interface {p1, p0}, Landroid/view/GestureDetector$OnGestureListener;->onShowPress(Landroid/view/MotionEvent;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
