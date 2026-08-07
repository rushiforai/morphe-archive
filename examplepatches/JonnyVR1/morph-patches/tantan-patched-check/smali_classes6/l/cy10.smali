.class public Ll/cy10;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/String;Lcom/p1/mobile/putong/data/Music;)Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;
    .locals 3

    .line 1
    invoke-static {p0}, Ll/l120;->e(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 6
    .line 7
    invoke-direct {v1}, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Music;->describe:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v2, v1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->artist:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v2, v1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->id:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Music;->name:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v2, v1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->name:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p0, v1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 23
    .line 24
    iput v0, v1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->length:I

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    iput p0, v1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 28
    .line 29
    iput v0, v1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 30
    .line 31
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Music;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AudioMedia;->url:Ljava/lang/String;

    .line 34
    .line 35
    iput-object p0, v1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->uri:Ljava/lang/String;

    .line 36
    .line 37
    const/4 p0, 0x2

    .line 38
    iput p0, v1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 39
    .line 40
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Music;->source:Ljava/lang/String;

    .line 41
    .line 42
    iput-object p0, v1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->source:Ljava/lang/String;

    .line 43
    .line 44
    return-object v1
.end method
