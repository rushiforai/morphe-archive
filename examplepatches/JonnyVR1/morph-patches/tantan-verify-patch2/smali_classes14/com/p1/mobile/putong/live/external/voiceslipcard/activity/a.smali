.class public Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;

.field public final b:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;

.field public c:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;

.field public d:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;ZLcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;->d:Z

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;->b:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;->c:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;

    .line 5
    .line 6
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;->d:Z

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->p(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->r(Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;->b:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;

    .line 12
    .line 13
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->t(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;->w()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public K()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;->c:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public bridge synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;->H(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->P1:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;->I(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;->J(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
