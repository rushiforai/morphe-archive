.class Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/momortc/live/MMLiveTranscoding;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MMLiveVideoImage"
.end annotation


# instance fields
.field height:J

.field posx:J

.field posy:J

.field final synthetic this$0:Lcom/momo/momortc/live/MMLiveTranscoding;

.field url:Ljava/lang/String;

.field width:J


# direct methods
.method public constructor <init>(Lcom/momo/momortc/live/MMLiveTranscoding;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;->this$0:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;->posx:J

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;->posy:J

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;->width:J

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;->height:J

    .line 15
    .line 16
    const-string p1, ""

    .line 17
    .line 18
    iput-object p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;->url:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method
