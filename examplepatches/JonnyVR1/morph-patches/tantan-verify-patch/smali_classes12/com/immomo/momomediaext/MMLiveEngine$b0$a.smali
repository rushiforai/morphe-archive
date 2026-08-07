.class Lcom/immomo/momomediaext/MMLiveEngine$b0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveEngine$b0;->onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:[Lcom/immomo/mediacore/audio/AudioVolumeWeight;

.field final synthetic b:Lcom/immomo/momomediaext/MMLiveEngine$b0;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine$b0;[Lcom/immomo/mediacore/audio/AudioVolumeWeight;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$b0$a;->b:Lcom/immomo/momomediaext/MMLiveEngine$b0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine$b0$a;->a:[Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$b0$a;->b:Lcom/immomo/momomediaext/MMLiveEngine$b0;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$b0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$b0$a;->a:[Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$b0$a;->b:Lcom/immomo/momomediaext/MMLiveEngine$b0;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$b0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/immomo/momomediaext/MMLiveEngine$b0$a;->a:[Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$b0$a;->b:Lcom/immomo/momomediaext/MMLiveEngine$b0;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$b0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 34
    .line 35
    invoke-virtual {v0, v1, p0}, Ll/enw;->e0([Lcom/immomo/mediacore/audio/AudioVolumeWeight;Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method
