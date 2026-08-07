.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;
.super Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;
.source "SourceFile"

# interfaces
.implements Ll/stl;


# instance fields
.field public B:Ll/etg;

.field public C:Ll/dtg;

.field public D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

.field public E:Landroid/widget/RelativeLayout;

.field public F:Lv/VText;

.field public G:Lv/VText;

.field public H:Lv/VLinear;

.field public I:Ll/ie80;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public C()V
    .locals 1

    .line 1
    new-instance v0, Ll/etg;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/etg;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->B:Ll/etg;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ll/etg;->s(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public Z(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->Z(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->C:Ll/dtg;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ll/dtg;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/dtg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->C:Ll/dtg;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->C:Ll/dtg;

    .line 16
    .line 17
    invoke-virtual {v0, p1, p2, p3}, Ll/dtg;->n(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->Y(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public getPlayerView()Lcom/p1/mobile/putong/feed/ui/PlayerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public l0(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 10
    .line 11
    int-to-float p4, p4

    .line 12
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p4

    .line 16
    iput p4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 17
    .line 18
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {p4, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->Z(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public mute(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Ll/s1j;->a(Lcom/p1/mobile/putong/feed/data/Moment;)Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->K(Z)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public pause()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Ll/s1j;->a(Lcom/p1/mobile/putong/feed/data/Moment;)Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->D()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->M()V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public play()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Ll/s1j;->a(Lcom/p1/mobile/putong/feed/data/Moment;)Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->I:Ll/ie80;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Ll/ye80;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/ye80;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->I:Ll/ie80;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->I:Ll/ie80;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->N()V

    .line 39
    .line 40
    .line 41
    :cond_2
    :goto_0
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->B:Ll/etg;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/etg;->f()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->a:Landroid/view/View;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->B:Ll/etg;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/etg;->k()Lv/VLinear;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->b:Lv/VLinear;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->B:Ll/etg;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/etg;->p()Landroid/widget/TextView;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->c:Landroid/widget/TextView;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->B:Ll/etg;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/etg;->q()Lv/VText;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->d:Lv/VText;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->B:Ll/etg;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/etg;->e()Lv/VLinear;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->B:Ll/etg;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/etg;->m()Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->B:Ll/etg;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/etg;->n()Lv/VText;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->g:Lv/VText;

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->B:Ll/etg;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/etg;->j()Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->h:Landroid/view/View;

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->B:Ll/etg;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/etg;->o()Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->B:Ll/etg;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/etg;->g()Landroid/widget/LinearLayout;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->w:Landroid/widget/LinearLayout;

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->B:Ll/etg;

    .line 82
    .line 83
    invoke-virtual {v0}, Ll/etg;->h()Landroid/widget/RelativeLayout;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->E:Landroid/widget/RelativeLayout;

    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->B:Ll/etg;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/etg;->r()Lv/VLinear;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->H:Lv/VLinear;

    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->B:Ll/etg;

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/etg;->i()Lv/VText;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->F:Lv/VText;

    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->B:Ll/etg;

    .line 106
    .line 107
    invoke-virtual {v0}, Ll/etg;->l()Lv/VText;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->G:Lv/VText;

    .line 112
    .line 113
    return-void
.end method

.method public stop()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Ll/s1j;->a(Lcom/p1/mobile/putong/feed/data/Moment;)Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->R()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method
