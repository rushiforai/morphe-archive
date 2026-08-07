.class public Ll/str;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/data/User;

.field public final b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

.field public final c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

.field public final d:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveActivity;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/str;->a:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    iput-object p3, p0, Ll/str;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 7
    .line 8
    iput-object p4, p0, Ll/str;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 9
    .line 10
    iput-object p1, p0, Ll/str;->d:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/str;->d:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->title:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesItemView;->setTitleText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/str;->d:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->value:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesItemView;->setDescText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/str;->a:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesItemView;->q(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, Ll/str;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object p0, p0, Ll/str;->d:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 36
    .line 37
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesItemView;->B(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->i0:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/str;->H(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
