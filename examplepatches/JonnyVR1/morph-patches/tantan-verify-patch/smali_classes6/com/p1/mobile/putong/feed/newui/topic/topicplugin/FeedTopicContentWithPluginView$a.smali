.class public Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->h0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$a;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$a;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->Z(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView$a;->a:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->d:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedAggregationTabLayout;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Landroid/view/ViewGroup;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Landroid/view/ViewGroup;

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Landroid/widget/TextView;

    .line 28
    .line 29
    invoke-static {v0}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
