.class public Ll/jrg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public b:Landroid/graphics/Point;

.field public c:Landroid/widget/PopupWindow;

.field public d:Lcom/p1/mobile/putong/feed/data/Moment;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/graphics/Point;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jrg;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/jrg;->b:Landroid/graphics/Point;

    .line 7
    .line 8
    iput-object p3, p0, Ll/jrg;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 9
    .line 10
    iput-object p4, p0, Ll/jrg;->e:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jrg;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/jrg;->b()V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;

    .line 14
    .line 15
    iget-object v1, p0, Ll/jrg;->a:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/jrg;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    iget-object v2, p0, Ll/jrg;->e:Ljava/lang/String;

    .line 23
    .line 24
    new-instance v3, Ll/irg;

    .line 25
    .line 26
    invoke-direct {v3, p0}, Ll/irg;-><init>(Ll/jrg;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->k(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ll/x20;)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Landroid/widget/PopupWindow;

    .line 33
    .line 34
    const/4 v2, -0x2

    .line 35
    invoke-direct {v1, v0, v2, v2}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 36
    .line 37
    .line 38
    iput-object v1, p0, Ll/jrg;->c:Landroid/widget/PopupWindow;

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Ll/jrg;->c:Landroid/widget/PopupWindow;

    .line 45
    .line 46
    sget v2, Ll/fgc0;->l:I

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Ll/jrg;->a:Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_1

    .line 58
    .line 59
    iget-object v1, p0, Ll/jrg;->a:Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-nez v1, :cond_1

    .line 66
    .line 67
    const/4 v1, 0x2

    .line 68
    new-array v1, v1, [I

    .line 69
    .line 70
    invoke-virtual {p1, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedAttitudeTipsView;->l()V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/jrg;->c:Landroid/widget/PopupWindow;

    .line 77
    .line 78
    iget-object p0, p0, Ll/jrg;->b:Landroid/graphics/Point;

    .line 79
    .line 80
    iget v1, p0, Landroid/graphics/Point;->x:I

    .line 81
    .line 82
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 83
    .line 84
    const v2, 0x800033

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, p1, v2, v1, p0}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 88
    .line 89
    .line 90
    :cond_1
    :goto_0
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jrg;->c:Landroid/widget/PopupWindow;

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
    iget-object v0, p0, Ll/jrg;->c:Landroid/widget/PopupWindow;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/jrg;->c:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    :cond_1
    return-void
.end method
