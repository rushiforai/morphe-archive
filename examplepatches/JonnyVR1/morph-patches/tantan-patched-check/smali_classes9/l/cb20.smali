.class public Ll/cb20;
.super Ll/dh2;
.source "SourceFile"

# interfaces
.implements Ll/arl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cb20$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dh2<",
        "Landroid/widget/LinearLayout;",
        ">;",
        "Ll/arl;"
    }
.end annotation


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

.field public g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public h:Landroid/text/SpannableStringBuilder;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dh2;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J(Ljava/util/List;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)V
    .locals 1

    .line 1
    new-instance v0, Ll/cb20$b;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/cb20$b;-><init>(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxReward;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public K(Landroid/widget/LinearLayout;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->m5:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    new-instance v0, Ll/cb20$a;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/cb20$a;-><init>(Ll/cb20;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final L(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;",
            ")",
            "Ljava/util/List<",
            "Ll/cb20$b;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getRewardsList()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/bb20;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/bb20;-><init>(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public M()V
    .locals 0

    .line 1
    return-void
.end method

.method public N(Landroid/widget/LinearLayout;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->A2:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Ll/cb20;->d:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->L0:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Ll/cb20;->e:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->J1:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 31
    .line 32
    iput-object v0, p0, Ll/cb20;->f:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 33
    .line 34
    sget v0, Ll/mdc0;->m5:I

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 41
    .line 42
    new-instance v1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 43
    .line 44
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v1, p0, Ll/cb20;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 48
    .line 49
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v1, p1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/cb20;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 60
    .line 61
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/dh2;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 70
    .line 71
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-nez p1, :cond_0

    .line 76
    .line 77
    iget-object p1, p0, Ll/dh2;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 78
    .line 79
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 80
    .line 81
    const/4 v1, 0x0

    .line 82
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Landroid/text/SpannableStringBuilder;

    .line 87
    .line 88
    invoke-virtual {p0, p1, v0}, Ll/cb20;->O(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/text/SpannableStringBuilder;)V

    .line 89
    .line 90
    .line 91
    :cond_0
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/text/SpannableStringBuilder;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p2, p0, Ll/cb20;->h:Landroid/text/SpannableStringBuilder;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->getMysteryBoxRecord()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getIconUrl()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/cb20;->d:Lv/VDraweeView;

    .line 15
    .line 16
    sget v2, Ll/qa00;->A:I

    .line 17
    .line 18
    const-string v3, "context_single_room"

    .line 19
    .line 20
    invoke-static {v3, v1, v0, v2, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/cb20;->e:Lv/VText;

    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->getMysteryBoxRecord()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getNum()J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, ""

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/cb20;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->getMysteryBoxRecord()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Ll/cb20;->L(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/cb20;->f:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 67
    .line 68
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public bridge synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cb20;->K(Landroid/widget/LinearLayout;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->c0:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cb20;->N(Landroid/widget/LinearLayout;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
