.class Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "QueueElem"
.end annotation


# instance fields
.field data:[B

.field offset:I

.field size:I

.field final synthetic this$0:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;


# direct methods
.method public constructor <init>(Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$QueueElem;->this$0:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
