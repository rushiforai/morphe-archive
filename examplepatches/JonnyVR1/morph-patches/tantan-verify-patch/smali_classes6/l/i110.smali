.class public Ll/i110;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;Landroid/view/View;)V
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->S:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 5
    .line 6
    sget v0, Ll/hdc0;->a1:I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 15
    .line 16
    return-void
.end method
