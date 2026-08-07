.class public Lio/agora/rtc2/PublisherParameters;
.super Ljava/lang/Object;


# instance fields
.field public bitrate:I

.field public defaultLayout:I

.field public extraInfo:Ljava/lang/String;

.field public framerate:I

.field public height:I

.field public injectStreamHeight:I

.field public injectStreamUrl:Ljava/lang/String;

.field public injectStreamWidth:I

.field public lifecycle:I

.field public owner:Z

.field public publishUrl:Ljava/lang/String;

.field public rawStreamUrl:Ljava/lang/String;

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x168

    iput v0, p0, Lio/agora/rtc2/PublisherParameters;->width:I

    const/16 v0, 0x280

    iput v0, p0, Lio/agora/rtc2/PublisherParameters;->height:I

    const/16 v0, 0xf

    iput v0, p0, Lio/agora/rtc2/PublisherParameters;->framerate:I

    const/16 v0, 0x1f4

    iput v0, p0, Lio/agora/rtc2/PublisherParameters;->bitrate:I

    const/4 v0, 0x1

    iput v0, p0, Lio/agora/rtc2/PublisherParameters;->defaultLayout:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Lio/agora/rtc2/PublisherParameters;->owner:Z

    iput v0, p0, Lio/agora/rtc2/PublisherParameters;->lifecycle:I

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/PublisherParameters;->publishUrl:Ljava/lang/String;

    iput-object v0, p0, Lio/agora/rtc2/PublisherParameters;->rawStreamUrl:Ljava/lang/String;

    iput-object v0, p0, Lio/agora/rtc2/PublisherParameters;->extraInfo:Ljava/lang/String;

    iput-object v0, p0, Lio/agora/rtc2/PublisherParameters;->injectStreamUrl:Ljava/lang/String;

    iput v1, p0, Lio/agora/rtc2/PublisherParameters;->injectStreamWidth:I

    iput v1, p0, Lio/agora/rtc2/PublisherParameters;->injectStreamHeight:I

    return-void
.end method
