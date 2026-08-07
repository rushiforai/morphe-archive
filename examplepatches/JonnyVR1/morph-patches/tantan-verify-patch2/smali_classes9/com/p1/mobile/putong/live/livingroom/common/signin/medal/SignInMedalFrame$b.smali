.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$b;
.super Landroidx/viewpager/widget/ViewPager$m;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->n(Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$b;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$b;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$b;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;

    .line 6
    .line 7
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager$m;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$b;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->f(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$b;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$b;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->medals:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->g(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$b;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 22
    .line 23
    .line 24
    return-void
.end method
