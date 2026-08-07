.class public Lorg/fourthline/cling/support/model/TransportSettings;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private playMode:Lorg/fourthline/cling/support/model/PlayMode;

.field private recQualityMode:Lorg/fourthline/cling/support/model/RecordQualityMode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    sget-object v0, Lorg/fourthline/cling/support/model/PlayMode;->NORMAL:Lorg/fourthline/cling/support/model/PlayMode;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportSettings;->playMode:Lorg/fourthline/cling/support/model/PlayMode;

    .line 17
    sget-object v0, Lorg/fourthline/cling/support/model/RecordQualityMode;->NOT_IMPLEMENTED:Lorg/fourthline/cling/support/model/RecordQualityMode;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportSettings;->recQualityMode:Lorg/fourthline/cling/support/model/RecordQualityMode;

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/PlayMode;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lorg/fourthline/cling/support/model/PlayMode;->NORMAL:Lorg/fourthline/cling/support/model/PlayMode;

    .line 5
    .line 6
    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportSettings;->playMode:Lorg/fourthline/cling/support/model/PlayMode;

    .line 7
    .line 8
    sget-object v0, Lorg/fourthline/cling/support/model/RecordQualityMode;->NOT_IMPLEMENTED:Lorg/fourthline/cling/support/model/RecordQualityMode;

    .line 9
    .line 10
    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportSettings;->recQualityMode:Lorg/fourthline/cling/support/model/RecordQualityMode;

    .line 11
    .line 12
    iput-object p1, p0, Lorg/fourthline/cling/support/model/TransportSettings;->playMode:Lorg/fourthline/cling/support/model/PlayMode;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/PlayMode;Lorg/fourthline/cling/support/model/RecordQualityMode;)V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    sget-object v0, Lorg/fourthline/cling/support/model/PlayMode;->NORMAL:Lorg/fourthline/cling/support/model/PlayMode;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportSettings;->playMode:Lorg/fourthline/cling/support/model/PlayMode;

    .line 20
    sget-object v0, Lorg/fourthline/cling/support/model/RecordQualityMode;->EP:Lorg/fourthline/cling/support/model/RecordQualityMode;

    .line 21
    iput-object p1, p0, Lorg/fourthline/cling/support/model/TransportSettings;->playMode:Lorg/fourthline/cling/support/model/PlayMode;

    .line 22
    iput-object p2, p0, Lorg/fourthline/cling/support/model/TransportSettings;->recQualityMode:Lorg/fourthline/cling/support/model/RecordQualityMode;

    return-void
.end method


# virtual methods
.method public getPlayMode()Lorg/fourthline/cling/support/model/PlayMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/TransportSettings;->playMode:Lorg/fourthline/cling/support/model/PlayMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecQualityMode()Lorg/fourthline/cling/support/model/RecordQualityMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/TransportSettings;->recQualityMode:Lorg/fourthline/cling/support/model/RecordQualityMode;

    .line 2
    .line 3
    return-object p0
.end method
