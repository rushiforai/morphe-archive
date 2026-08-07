.class public Ll/nly;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberManagerSettleItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

.field public final c:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/x20;

.field public e:Ll/x20;

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
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
    iput-object v0, p0, Ll/nly;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/nly;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 9
    .line 10
    iput-object p2, p0, Ll/nly;->c:Ll/nsv;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberManagerSettleItemView;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v1, p0, Ll/nly;->c:Ll/nsv;

    .line 5
    .line 6
    iget-object v2, p0, Ll/nly;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 7
    .line 8
    iget-object v3, p0, Ll/nly;->d:Ll/x20;

    .line 9
    .line 10
    iget-object v4, p0, Ll/nly;->e:Ll/x20;

    .line 11
    .line 12
    iget-object v5, p0, Ll/nly;->f:Ll/y20;

    .line 13
    .line 14
    iget-object v6, p0, Ll/nly;->g:Ljava/lang/String;

    .line 15
    .line 16
    move-object v0, p1

    .line 17
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberManagerSettleItemView;->s0(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/x20;Ll/x20;Ll/y20;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public I(Ll/x20;)Ll/nly;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nly;->d:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public J(Ll/y20;)Ll/nly;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)",
            "Ll/nly;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nly;->f:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public K(Ll/x20;)Ll/nly;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nly;->e:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public L(Ljava/lang/String;)Ll/nly;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nly;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->ka:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberManagerSettleItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nly;->H(Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberManagerSettleItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
