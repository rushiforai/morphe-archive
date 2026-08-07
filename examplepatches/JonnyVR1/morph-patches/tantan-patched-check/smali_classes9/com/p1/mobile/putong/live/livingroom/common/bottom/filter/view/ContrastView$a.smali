.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->k()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-eq p1, v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x3

    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->h(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-interface {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;->b()V

    .line 37
    .line 38
    .line 39
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->j(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;Z)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;

    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->j(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;Z)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;

    .line 53
    .line 54
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;->a()V

    .line 71
    .line 72
    .line 73
    :cond_3
    :goto_0
    return-void
.end method
