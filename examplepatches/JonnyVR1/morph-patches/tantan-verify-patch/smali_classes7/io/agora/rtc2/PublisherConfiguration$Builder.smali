.class public Lio/agora/rtc2/PublisherConfiguration$Builder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/PublisherConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private params:Lio/agora/rtc2/PublisherParameters;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lio/agora/rtc2/PublisherParameters;

    invoke-direct {v0}, Lio/agora/rtc2/PublisherParameters;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/PublisherConfiguration$Builder;->params:Lio/agora/rtc2/PublisherParameters;

    return-void
.end method

.method public static synthetic access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/PublisherConfiguration$Builder;->params:Lio/agora/rtc2/PublisherParameters;

    return-object p0
.end method


# virtual methods
.method public bitRate(I)Lio/agora/rtc2/PublisherConfiguration$Builder;
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/PublisherConfiguration$Builder;->params:Lio/agora/rtc2/PublisherParameters;

    iput p1, v0, Lio/agora/rtc2/PublisherParameters;->bitrate:I

    return-object p0
.end method

.method public build()Lio/agora/rtc2/PublisherConfiguration;
    .locals 2

    new-instance v0, Lio/agora/rtc2/PublisherConfiguration;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lio/agora/rtc2/PublisherConfiguration;-><init>(Lio/agora/rtc2/PublisherConfiguration$Builder;Lio/agora/rtc2/PublisherConfiguration$1;)V

    return-object v0
.end method

.method public defaultLayout(I)Lio/agora/rtc2/PublisherConfiguration$Builder;
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/PublisherConfiguration$Builder;->params:Lio/agora/rtc2/PublisherParameters;

    iput p1, v0, Lio/agora/rtc2/PublisherParameters;->defaultLayout:I

    return-object p0
.end method

.method public extraInfo(Ljava/lang/String;)Lio/agora/rtc2/PublisherConfiguration$Builder;
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/PublisherConfiguration$Builder;->params:Lio/agora/rtc2/PublisherParameters;

    iput-object p1, v0, Lio/agora/rtc2/PublisherParameters;->extraInfo:Ljava/lang/String;

    return-object p0
.end method

.method public frameRate(I)Lio/agora/rtc2/PublisherConfiguration$Builder;
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/PublisherConfiguration$Builder;->params:Lio/agora/rtc2/PublisherParameters;

    iput p1, v0, Lio/agora/rtc2/PublisherParameters;->framerate:I

    return-object p0
.end method

.method public injectStream(Ljava/lang/String;II)Lio/agora/rtc2/PublisherConfiguration$Builder;
    .locals 1

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    iget-object v0, p0, Lio/agora/rtc2/PublisherConfiguration$Builder;->params:Lio/agora/rtc2/PublisherParameters;

    iput-object p1, v0, Lio/agora/rtc2/PublisherParameters;->injectStreamUrl:Ljava/lang/String;

    iput p2, v0, Lio/agora/rtc2/PublisherParameters;->injectStreamWidth:I

    iput p3, v0, Lio/agora/rtc2/PublisherParameters;->injectStreamHeight:I

    :cond_0
    return-object p0
.end method

.method public owner(Z)Lio/agora/rtc2/PublisherConfiguration$Builder;
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/PublisherConfiguration$Builder;->params:Lio/agora/rtc2/PublisherParameters;

    iput-boolean p1, v0, Lio/agora/rtc2/PublisherParameters;->owner:Z

    return-object p0
.end method

.method public publishUrl(Ljava/lang/String;)Lio/agora/rtc2/PublisherConfiguration$Builder;
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/PublisherConfiguration$Builder;->params:Lio/agora/rtc2/PublisherParameters;

    iput-object p1, v0, Lio/agora/rtc2/PublisherParameters;->publishUrl:Ljava/lang/String;

    return-object p0
.end method

.method public rawStreamUrl(Ljava/lang/String;)Lio/agora/rtc2/PublisherConfiguration$Builder;
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/PublisherConfiguration$Builder;->params:Lio/agora/rtc2/PublisherParameters;

    iput-object p1, v0, Lio/agora/rtc2/PublisherParameters;->rawStreamUrl:Ljava/lang/String;

    return-object p0
.end method

.method public size(II)Lio/agora/rtc2/PublisherConfiguration$Builder;
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/PublisherConfiguration$Builder;->params:Lio/agora/rtc2/PublisherParameters;

    iput p1, v0, Lio/agora/rtc2/PublisherParameters;->width:I

    iput p2, v0, Lio/agora/rtc2/PublisherParameters;->height:I

    return-object p0
.end method

.method public streamLifeCycle(I)Lio/agora/rtc2/PublisherConfiguration$Builder;
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/PublisherConfiguration$Builder;->params:Lio/agora/rtc2/PublisherParameters;

    iput p1, v0, Lio/agora/rtc2/PublisherParameters;->lifecycle:I

    return-object p0
.end method
