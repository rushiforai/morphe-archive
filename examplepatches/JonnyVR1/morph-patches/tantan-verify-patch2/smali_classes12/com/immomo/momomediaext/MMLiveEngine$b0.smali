.class Lcom/immomo/momomediaext/MMLiveEngine$b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mediacore/coninf/MRtcAudioHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/MMLiveEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/momomediaext/MMLiveEngine;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$b0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/immomo/momomediaext/MMLiveEngine$b0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/immomo/momomediaext/MMLiveEngine$b0$a;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine$b0$a;-><init>(Lcom/immomo/momomediaext/MMLiveEngine$b0;[Lcom/immomo/mediacore/audio/AudioVolumeWeight;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
