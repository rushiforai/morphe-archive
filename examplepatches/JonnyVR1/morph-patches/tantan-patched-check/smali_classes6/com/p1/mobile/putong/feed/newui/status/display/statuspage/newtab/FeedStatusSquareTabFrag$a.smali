.class public Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->q6()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Ll/c2i;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$a;->i:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(Landroid/view/ViewGroup;Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$a;->i:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->s5(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$a;->i:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 15
    .line 16
    const-class v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->F5(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 23
    .line 24
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->u5(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$a;->i:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->s5(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    :goto_0
    return-void

    .line 36
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$a;->i:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->s5(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const/4 p2, 0x0

    .line 43
    invoke-virtual {p1, p2}, Lv/VPager;->setScrollble(Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$a;->i:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->s5(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$a$a;

    .line 53
    .line 54
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$a$a;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$a;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public bridge synthetic j(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/c2i;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$a;->s(Ll/c2i;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic m(Ljava/lang/Object;IJLandroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Ll/c2i;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$a;->t(Ll/c2i;IJLandroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Ll/c2i;I)V
    .locals 5

    .line 1
    iget p0, p1, Ll/c2i;->a:I

    .line 2
    .line 3
    const/4 p2, 0x3

    .line 4
    const-string v0, "p_state_explore"

    .line 5
    .line 6
    if-ne p0, p2, :cond_0

    .line 7
    .line 8
    iget-object p0, p1, Ll/c2i;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 11
    .line 12
    const-string p1, "receiver_user_id"

    .line 13
    .line 14
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    filled-new-array {p0}, [Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "e_state_explore_fake_user"

    .line 23
    .line 24
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const-string p2, ""

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    if-ne p0, v1, :cond_1

    .line 32
    .line 33
    iget-object p0, p1, Ll/c2i;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    move-object p0, p2

    .line 39
    :goto_0
    const-string v2, "state_id"

    .line 40
    .line 41
    invoke-static {v2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iget v2, p1, Ll/c2i;->a:I

    .line 46
    .line 47
    if-ne v2, v1, :cond_2

    .line 48
    .line 49
    const-string v2, "state"

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    const-string v2, "audio_room"

    .line 53
    .line 54
    :goto_1
    const-string v3, "e_state_type"

    .line 55
    .line 56
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    iget v3, p1, Ll/c2i;->a:I

    .line 61
    .line 62
    if-ne v3, v1, :cond_3

    .line 63
    .line 64
    iget-object v3, p1, Ll/c2i;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 65
    .line 66
    iget-object v3, v3, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 67
    .line 68
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_3
    move-object v3, p2

    .line 72
    :goto_2
    const-string v4, "user_id"

    .line 73
    .line 74
    invoke-static {v4, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    iget v4, p1, Ll/c2i;->a:I

    .line 79
    .line 80
    if-ne v4, v1, :cond_4

    .line 81
    .line 82
    iget-object p1, p1, Ll/c2i;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 83
    .line 84
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 85
    .line 86
    iget-object p2, p1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 87
    .line 88
    :cond_4
    const-string p1, "owner_id"

    .line 89
    .line 90
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    filled-new-array {p0, v2, v3, p1}, [Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    const-string p1, "e_state"

    .line 99
    .line 100
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public t(Ll/c2i;IJLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/cmg;->t0()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/jka;->I7()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$p;->f()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$a;->i:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->M5()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->A5(I)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag$a;->i:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->w5(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method
