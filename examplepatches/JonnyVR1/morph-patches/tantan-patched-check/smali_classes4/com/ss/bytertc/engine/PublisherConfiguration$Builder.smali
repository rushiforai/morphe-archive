.class public Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/engine/PublisherConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private params:Lcom/ss/bytertc/engine/PublisherParameters;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/ss/bytertc/engine/PublisherParameters;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/ss/bytertc/engine/PublisherParameters;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->params:Lcom/ss/bytertc/engine/PublisherParameters;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;)Lcom/ss/bytertc/engine/PublisherParameters;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->params:Lcom/ss/bytertc/engine/PublisherParameters;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public audioChannels(I)Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->params:Lcom/ss/bytertc/engine/PublisherParameters;

    .line 2
    .line 3
    iput p1, v0, Lcom/ss/bytertc/engine/PublisherParameters;->audiochannels:I

    .line 4
    .line 5
    return-object p0
.end method

.method public audioKBitrate(I)Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->params:Lcom/ss/bytertc/engine/PublisherParameters;

    .line 2
    .line 3
    div-int/lit16 p1, p1, 0x3e8

    .line 4
    .line 5
    iput p1, v0, Lcom/ss/bytertc/engine/PublisherParameters;->audioKBitrate:I

    .line 6
    .line 7
    return-object p0
.end method

.method public audioSampleRate(I)Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->params:Lcom/ss/bytertc/engine/PublisherParameters;

    .line 2
    .line 3
    iput p1, v0, Lcom/ss/bytertc/engine/PublisherParameters;->audiosamplerate:I

    .line 4
    .line 5
    return-object p0
.end method

.method public build()Lcom/ss/bytertc/engine/PublisherConfiguration;
    .locals 2

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/PublisherConfiguration;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/ss/bytertc/engine/PublisherConfiguration;-><init>(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;Lcom/ss/bytertc/engine/PublisherConfiguration$1;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public defaultLayout(I)Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->params:Lcom/ss/bytertc/engine/PublisherParameters;

    .line 2
    .line 3
    iput p1, v0, Lcom/ss/bytertc/engine/PublisherParameters;->defaultLayout:I

    .line 4
    .line 5
    return-object p0
.end method

.method public extraInfo(Ljava/lang/String;)Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->params:Lcom/ss/bytertc/engine/PublisherParameters;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/ss/bytertc/engine/PublisherParameters;->extraInfo:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public frameRate(I)Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->params:Lcom/ss/bytertc/engine/PublisherParameters;

    .line 2
    .line 3
    iput p1, v0, Lcom/ss/bytertc/engine/PublisherParameters;->framerate:I

    .line 4
    .line 5
    return-object p0
.end method

.method public kBitRate(I)Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->params:Lcom/ss/bytertc/engine/PublisherParameters;

    .line 2
    .line 3
    iput p1, v0, Lcom/ss/bytertc/engine/PublisherParameters;->kBitrate:I

    .line 4
    .line 5
    return-object p0
.end method

.method public liftCycle(I)Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->params:Lcom/ss/bytertc/engine/PublisherParameters;

    .line 2
    .line 3
    iput p1, v0, Lcom/ss/bytertc/engine/PublisherParameters;->lifecycle:I

    .line 4
    .line 5
    return-object p0
.end method

.method public owner(Z)Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->params:Lcom/ss/bytertc/engine/PublisherParameters;

    .line 2
    .line 3
    iput-boolean p1, v0, Lcom/ss/bytertc/engine/PublisherParameters;->owner:Z

    .line 4
    .line 5
    return-object p0
.end method

.method public publishUrl(Ljava/lang/String;)Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->params:Lcom/ss/bytertc/engine/PublisherParameters;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/ss/bytertc/engine/PublisherParameters;->mosaicStream:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public size(II)Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->params:Lcom/ss/bytertc/engine/PublisherParameters;

    .line 2
    .line 3
    iput p1, v0, Lcom/ss/bytertc/engine/PublisherParameters;->width:I

    .line 4
    .line 5
    iput p2, v0, Lcom/ss/bytertc/engine/PublisherParameters;->height:I

    .line 6
    .line 7
    return-object p0
.end method
