.class public Ll/kmj$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/kmj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic a:Ll/kmj;


# direct methods
.method public constructor <init>(Ll/kmj;)V
    .locals 0

    .line 11
    iput-object p1, p0, Ll/kmj$a;->a:Ll/kmj;

    .line 12
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method public constructor <init>(Ll/kmj;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kmj$a;->a:Ll/kmj;

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
    iget-object p1, p0, Ll/kmj$a;->a:Ll/kmj;

    .line 13
    .line 14
    invoke-static {p1}, Ll/kmj;->b(Ll/kmj;)Ll/kmj$b;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Ll/kmj$a;->a:Ll/kmj;

    .line 21
    .line 22
    invoke-static {p1}, Ll/kmj;->d(Ll/kmj;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iget-object v0, p0, Ll/kmj$a;->a:Ll/kmj;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    invoke-static {v0}, Ll/kmj;->b(Ll/kmj;)Ll/kmj$b;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p0, p0, Ll/kmj$a;->a:Ll/kmj;

    .line 35
    .line 36
    invoke-static {p0}, Ll/kmj;->a(Ll/kmj;)Landroid/view/MotionEvent;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {p1, p0}, Ll/kmj$b;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    invoke-static {v0, v1}, Ll/kmj;->e(Ll/kmj;Z)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void

    .line 48
    :cond_2
    const-string p0, "Unknown message "

    .line 49
    .line 50
    invoke-static {p0, p1}, Ll/mce;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_3
    iget-object p0, p0, Ll/kmj$a;->a:Ll/kmj;

    .line 55
    .line 56
    invoke-static {p0}, Ll/kmj;->f(Ll/kmj;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_4
    iget-object p1, p0, Ll/kmj$a;->a:Ll/kmj;

    .line 61
    .line 62
    invoke-static {p1}, Ll/kmj;->c(Ll/kmj;)Ll/kmj$c;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object p0, p0, Ll/kmj$a;->a:Ll/kmj;

    .line 67
    .line 68
    invoke-static {p0}, Ll/kmj;->a(Ll/kmj;)Landroid/view/MotionEvent;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-interface {p1, p0}, Ll/kmj$c;->onShowPress(Landroid/view/MotionEvent;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method
