.class Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$1;
.super Ljava/util/HashMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$TanTanAudioPlayType;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$TanTanAudioPlayType;->VOICE_CALL:Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl$TanTanAudioPlayType;

    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 7
    .line 8
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->z2:I

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    return-void
.end method
