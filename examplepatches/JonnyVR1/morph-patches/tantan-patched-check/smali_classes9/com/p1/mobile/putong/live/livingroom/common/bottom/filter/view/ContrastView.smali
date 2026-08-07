.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;
.super Lv/VImage;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;

.field public e:Z

.field public f:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->e:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->k()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Lv/VImage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->e:Z

    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->k()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VImage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->e:Z

    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->k()V

    return-void
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->e:Z

    return p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->d:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->e:Z

    return-void
.end method

.method private k()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$a;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->f:Landroid/os/Handler;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    const/4 v1, 0x3

    .line 7
    const/4 v2, 0x2

    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->f:Landroid/os/Handler;

    .line 14
    .line 15
    invoke-virtual {p1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->f:Landroid/os/Handler;

    .line 19
    .line 20
    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->f:Landroid/os/Handler;

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->f:Landroid/os/Handler;

    .line 30
    .line 31
    invoke-virtual {p1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->f:Landroid/os/Handler;

    .line 35
    .line 36
    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->f:Landroid/os/Handler;

    .line 40
    .line 41
    invoke-virtual {p0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 42
    .line 43
    .line 44
    :goto_0
    return v0
.end method

.method public setOnContrastListener(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->d:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;

    .line 2
    .line 3
    return-void
.end method
