.class public Ll/bvm0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

.field public c:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/x20;

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Ll/bvm0;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/bvm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 9
    .line 10
    iput-object p2, p0, Ll/bvm0;->c:Ll/nsv;

    .line 11
    .line 12
    iput-object p3, p0, Ll/bvm0;->f:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v1, p0, Ll/bvm0;->c:Ll/nsv;

    .line 5
    .line 6
    iget-object v2, p0, Ll/bvm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 7
    .line 8
    iget-object v3, p0, Ll/bvm0;->d:Ll/x20;

    .line 9
    .line 10
    iget-object v4, p0, Ll/bvm0;->e:Ll/y20;

    .line 11
    .line 12
    iget-object v5, p0, Ll/bvm0;->f:Ljava/lang/String;

    .line 13
    .line 14
    move-object v0, p1

    .line 15
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->e(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/x20;Ll/y20;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public I(Ll/x20;)Ll/bvm0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bvm0;->d:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public J(Ll/y20;)Ll/bvm0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)",
            "Ll/bvm0;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/bvm0;->e:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public K(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bvm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->T7:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bvm0;->H(Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
