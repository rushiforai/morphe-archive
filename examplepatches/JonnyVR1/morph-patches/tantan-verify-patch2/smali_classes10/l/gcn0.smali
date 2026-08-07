.class public Ll/gcn0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;

.field public final b:I

.field public c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;ILl/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;",
            "I",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gcn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;

    .line 5
    .line 6
    iput p2, p0, Ll/gcn0;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/gcn0;->c:Ll/y20;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/gcn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;

    .line 5
    .line 6
    iget v1, p0, Ll/gcn0;->b:I

    .line 7
    .line 8
    iget-object p0, p0, Ll/gcn0;->c:Ll/y20;

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;ILl/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->Y8:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gcn0;->H(Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
