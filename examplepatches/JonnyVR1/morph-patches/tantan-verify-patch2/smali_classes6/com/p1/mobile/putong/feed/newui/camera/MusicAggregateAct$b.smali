.class public Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct$b;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->e2(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    add-int/2addr p2, p3

    .line 8
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->g2(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;I)V

    .line 9
    .line 10
    .line 11
    const/high16 p1, 0x43480000    # 200.0f

    .line 12
    .line 13
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 18
    .line 19
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->e2(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 24
    .line 25
    if-gt p2, p1, :cond_0

    .line 26
    .line 27
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->e2(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    int-to-float p2, p2

    .line 32
    int-to-float p1, p1

    .line 33
    div-float/2addr p2, p1

    .line 34
    const/high16 p1, 0x437f0000    # 255.0f

    .line 35
    .line 36
    mul-float/2addr p2, p1

    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->h:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->h:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    float-to-int p2, p2

    .line 49
    const/16 v0, 0xff

    .line 50
    .line 51
    invoke-static {p2, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->h:Landroid/widget/FrameLayout;

    .line 60
    .line 61
    const/4 p2, -0x1

    .line 62
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 63
    .line 64
    .line 65
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 66
    .line 67
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->e2(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    const/high16 p2, 0x42700000    # 60.0f

    .line 72
    .line 73
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    const/4 v0, 0x1

    .line 78
    if-lt p1, p2, :cond_3

    .line 79
    .line 80
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    const/4 p2, 0x5

    .line 85
    if-le p1, p2, :cond_2

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 88
    .line 89
    if-gez p3, :cond_1

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_1
    const/4 v0, 0x0

    .line 93
    :goto_1
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->h2(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;Z)V

    .line 94
    .line 95
    .line 96
    :cond_2
    return-void

    .line 97
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 98
    .line 99
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->h2(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;Z)V

    .line 100
    .line 101
    .line 102
    return-void
.end method
