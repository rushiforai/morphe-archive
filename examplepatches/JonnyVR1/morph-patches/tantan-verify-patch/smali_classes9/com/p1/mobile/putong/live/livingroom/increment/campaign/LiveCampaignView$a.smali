.class public Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;
.super Ll/ef60;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->F()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ef60;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->m(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->i(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    iget-object p0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    add-int/lit8 p1, p1, -0x2

    .line 31
    .line 32
    invoke-virtual {p0, p1, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->i(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const/4 v2, 0x1

    .line 51
    sub-int/2addr v0, v2

    .line 52
    if-ne p1, v0, :cond_2

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 57
    .line 58
    invoke-virtual {p0, v2, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 59
    .line 60
    .line 61
    :cond_2
    :goto_0
    return-void
.end method

.method public onPageSelected(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-gt v0, v1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 16
    .line 17
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->k(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;I)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->j(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)[Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    array-length v0, p1

    .line 27
    const/4 v2, 0x0

    .line 28
    move v3, v2

    .line 29
    :goto_0
    if-ge v3, v0, :cond_1

    .line 30
    .line 31
    aget-object v4, p1, v3

    .line 32
    .line 33
    invoke-virtual {v4, v2}, Landroid/view/View;->setSelected(Z)V

    .line 34
    .line 35
    .line 36
    add-int/lit8 v3, v3, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 40
    .line 41
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->j(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)[Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    array-length p1, p1

    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->i(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-gt v0, p1, :cond_2

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->i(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-lez v0, :cond_2

    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 63
    .line 64
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->j(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)[Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 69
    .line 70
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->i(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    sub-int/2addr v0, v1

    .line 75
    aget-object p1, p1, v0

    .line 76
    .line 77
    invoke-virtual {p1, v1}, Landroid/view/View;->setSelected(Z)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 82
    .line 83
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->i(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 88
    .line 89
    if-nez v0, :cond_3

    .line 90
    .line 91
    invoke-static {v3}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->j(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)[Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    sub-int/2addr p1, v1

    .line 96
    aget-object p1, v0, p1

    .line 97
    .line 98
    invoke-virtual {p1, v1}, Landroid/view/View;->setSelected(Z)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_3
    invoke-static {v3}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->j(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)[Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    aget-object p1, p1, v2

    .line 107
    .line 108
    invoke-virtual {p1, v1}, Landroid/view/View;->setSelected(Z)V

    .line 109
    .line 110
    .line 111
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 112
    .line 113
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->l(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method
