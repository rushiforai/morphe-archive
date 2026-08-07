.class public Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public mode:Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceMode;

.field public provider:Lcom/ss/bytertc/engine/IMediaPlayerCustomSourceProvider;

.field public type:Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceStreamType;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;->provider:Lcom/ss/bytertc/engine/IMediaPlayerCustomSourceProvider;

    .line 22
    sget-object v0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceMode;->PUSH:Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceMode;

    iput-object v0, p0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;->mode:Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceMode;

    .line 23
    sget-object v0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceStreamType;->RAW:Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceStreamType;

    iput-object v0, p0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;->type:Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceStreamType;

    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/IMediaPlayerCustomSourceProvider;Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceMode;Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceStreamType;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;->provider:Lcom/ss/bytertc/engine/IMediaPlayerCustomSourceProvider;

    .line 6
    .line 7
    sget-object v0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceMode;->PUSH:Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceMode;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;->mode:Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceMode;

    .line 10
    .line 11
    sget-object v0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceStreamType;->RAW:Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceStreamType;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;->mode:Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceMode;

    .line 14
    .line 15
    iput-object p3, p0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;->type:Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceStreamType;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;->provider:Lcom/ss/bytertc/engine/IMediaPlayerCustomSourceProvider;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "MediaPlayerCustomSource{provider=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;->provider:Lcom/ss/bytertc/engine/IMediaPlayerCustomSourceProvider;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', MediaPlayerCustomSourceMode=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;->mode:Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceMode;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', MediaPlayerCustomSourceStreamType=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;->type:Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceStreamType;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p0, "\'}"

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method
