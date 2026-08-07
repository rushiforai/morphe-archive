.class public Lcom/ss/bytertc/ktv/data/HotMusicInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public hotName:Ljava/lang/String;

.field public musics:[Lcom/ss/bytertc/ktv/data/MusicInfo;


# direct methods
.method public constructor <init>(Ljava/lang/String;[Lcom/ss/bytertc/ktv/data/MusicInfo;)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/ktv/data/HotMusicInfo;->hotName:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/ktv/data/HotMusicInfo;->musics:[Lcom/ss/bytertc/ktv/data/MusicInfo;

    .line 7
    .line 8
    return-void
.end method
