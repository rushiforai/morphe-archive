.class public Ll/bwg;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile b:Ll/bwg;


# instance fields
.field public a:Landroid/widget/PopupWindow;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Ll/bwg;
    .locals 2

    .line 1
    sget-object v0, Ll/bwg;->b:Ll/bwg;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/bwg;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/bwg;->b:Ll/bwg;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/bwg;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/bwg;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/bwg;->b:Ll/bwg;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/bwg;->b:Ll/bwg;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public b(Lcom/p1/mobile/android/app/Act;Landroid/graphics/Point;Landroid/view/View;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/bwg;->c()V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/awg;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/awg;-><init>(Ll/bwg;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p4, p5, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedClipBoardTipsView;->f(Ljava/lang/String;ZLl/x20;)V

    .line 22
    .line 23
    .line 24
    new-instance p4, Landroid/widget/PopupWindow;

    .line 25
    .line 26
    const/4 p5, -0x2

    .line 27
    invoke-direct {p4, v0, p5, p5}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 28
    .line 29
    .line 30
    iput-object p4, p0, Ll/bwg;->a:Landroid/widget/PopupWindow;

    .line 31
    .line 32
    const/4 p5, 0x1

    .line 33
    invoke-virtual {p4, p5}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 34
    .line 35
    .line 36
    iget-object p4, p0, Ll/bwg;->a:Landroid/widget/PopupWindow;

    .line 37
    .line 38
    sget p5, Ll/fgc0;->l:I

    .line 39
    .line 40
    invoke-virtual {p4, p5}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 44
    .line 45
    .line 46
    move-result p4

    .line 47
    if-nez p4, :cond_1

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-nez p1, :cond_1

    .line 54
    .line 55
    const/4 p1, 0x2

    .line 56
    new-array p1, p1, [I

    .line 57
    .line 58
    invoke-virtual {p3, p1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/bwg;->a:Landroid/widget/PopupWindow;

    .line 62
    .line 63
    iget p1, p2, Landroid/graphics/Point;->x:I

    .line 64
    .line 65
    iget p2, p2, Landroid/graphics/Point;->y:I

    .line 66
    .line 67
    const p4, 0x800033

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p3, p4, p1, p2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 71
    .line 72
    .line 73
    :cond_1
    :goto_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bwg;->a:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/bwg;->a:Landroid/widget/PopupWindow;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/bwg;->a:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    :cond_1
    return-void
.end method
