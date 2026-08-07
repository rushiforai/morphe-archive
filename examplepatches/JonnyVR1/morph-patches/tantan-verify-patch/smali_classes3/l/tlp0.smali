.class public Ll/tlp0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;

.field public b:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public c:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tlp0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/tlp0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;

    .line 5
    .line 6
    iget-object v1, p0, Ll/tlp0;->b:Ll/y20;

    .line 7
    .line 8
    iget-boolean p0, p0, Ll/tlp0;->c:Z

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;->j0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;Ll/y20;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public I(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tlp0;->b:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public J(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/tlp0;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->qb:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tlp0;->H(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
