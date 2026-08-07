.class public Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;
.super Landroidx/fragment/app/FragmentPagerAdapter;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;Landroidx/fragment/app/FragmentManager;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroidx/fragment/app/FragmentPagerAdapter;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->V(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getItem(I)Landroidx/fragment/app/Fragment;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->V(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroidx/fragment/app/Fragment;

    .line 12
    .line 13
    return-object p0
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    if-eq p1, p0, :cond_1

    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    if-eq p1, p0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "\u804a\u5929\u5ba4"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    const-string p0, "\u6700\u65b0"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->P(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 3

    .line 1
    sput p1, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->u:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->P(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->Q(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 24
    .line 25
    const-string v2, "\u6700\u65b0"

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->W(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)Ll/l4g0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->Y(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;Ll/l4g0;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->Q(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 52
    .line 53
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->T(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)Ll/l4g0;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->Y(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;Ll/l4g0;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 61
    .line 62
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->Q(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 67
    .line 68
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->R(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 81
    .line 82
    if-eqz v0, :cond_2

    .line 83
    .line 84
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->T(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)Ll/l4g0;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Ll/l4g0;->g()V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_2
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->P(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 97
    .line 98
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->Q(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 103
    .line 104
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->R(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_3

    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 119
    .line 120
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->W(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)Ll/l4g0;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v0}, Ll/l4g0;->g()V

    .line 125
    .line 126
    .line 127
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 128
    .line 129
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->S(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)Ll/l4g0;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0}, Ll/l4g0;->r()V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$b;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 137
    .line 138
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->X(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;I)V

    .line 139
    .line 140
    .line 141
    return-void
.end method
