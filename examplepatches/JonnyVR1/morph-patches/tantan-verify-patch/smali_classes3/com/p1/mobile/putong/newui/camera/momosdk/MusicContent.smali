.class public Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;
.implements Ljava/io/Serializable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE_FILE:I = 0x3

.field public static final TYPE_TEMP_FILE:I = 0x2

.field public static final TYPE_URI:I = 0x1

.field public static final UNKNOWN_STRING:Ljava/lang/String; = "\u672a\u77e5"


# instance fields
.field public album:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public artist:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public endMillTime:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public isFromSameFilm:Z

.field public length:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public musicType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public path:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public size:J
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public source:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public startMillTime:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public state:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public type:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public updatetime:J
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public uri:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 111
    iput-wide v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->size:J

    const/4 v2, 0x0

    .line 112
    iput v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 113
    iput v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 114
    iput v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    const/4 v3, -0x1

    .line 115
    iput v3, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->state:I

    .line 116
    iput-boolean v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->isFromSameFilm:Z

    .line 117
    iput-wide v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->updatetime:J

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->size:J

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iput v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 10
    .line 11
    iput v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 12
    .line 13
    iput v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 14
    .line 15
    const/4 v3, -0x1

    .line 16
    iput v3, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->state:I

    .line 17
    .line 18
    iput-boolean v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->isFromSameFilm:Z

    .line 19
    .line 20
    iput-wide v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->updatetime:J

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    iput-wide v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->size:J

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->name:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->uri:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->length:I

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->album:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->artist:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iput v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iput v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 87
    .line 88
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->musicType:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->source:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_0

    .line 105
    .line 106
    const/4 v2, 0x1

    .line 107
    :cond_0
    iput-boolean v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->isFromSameFilm:Z

    .line 108
    .line 109
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 4

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 119
    iput-wide v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->size:J

    const/4 v2, 0x0

    .line 120
    iput v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 121
    iput v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 122
    iput v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    const/4 v3, -0x1

    .line 123
    iput v3, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->state:I

    .line 124
    iput-boolean v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->isFromSameFilm:Z

    .line 125
    iput-wide v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->updatetime:J

    .line 126
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->setData(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 4

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 128
    iput-wide v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->size:J

    const/4 v2, 0x0

    .line 129
    iput v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 130
    iput v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 131
    iput v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    const/4 v3, -0x1

    .line 132
    iput v3, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->state:I

    .line 133
    iput-boolean v2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->isFromSameFilm:Z

    .line 134
    iput-wide v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->updatetime:J

    .line 135
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->setData(Lorg/json/JSONObject;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getAlbum()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->album:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getArtist()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->artist:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLength()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->length:I

    .line 2
    .line 3
    return p0
.end method

.method public getMusicType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->musicType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSize()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->size:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->source:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getState()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->state:I

    .line 2
    .line 3
    return p0
.end method

.method public getUpdatetime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->updatetime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getUri()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->uri:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isCroped()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->length:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 6
    .line 7
    sub-int/2addr v1, p0

    .line 8
    if-le v0, v1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public isDeepEquals(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 17
    .line 18
    iget v2, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 19
    .line 20
    if-ne v1, v2, :cond_0

    .line 21
    .line 22
    iget p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 23
    .line 24
    iget p1, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 25
    .line 26
    if-ne p0, p1, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_0
    return v0
.end method

.method public isFile()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public isMusicEquals(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    return v0
.end method

.method public isMusicUriEquals(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->uri:Ljava/lang/String;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->uri:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    return v0
.end method

.method public isRemote()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isTemp()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public resetState()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->state:I

    .line 3
    .line 4
    return-void
.end method

.method public setAlbum(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->album:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setArtist(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->artist:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setData(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->id:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-wide v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->size:J

    .line 6
    .line 7
    iput-wide v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->size:J

    .line 8
    .line 9
    iget v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->name:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->name:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->uri:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->uri:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 24
    .line 25
    iget v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->length:I

    .line 26
    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->length:I

    .line 28
    .line 29
    iget-object v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->album:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->album:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->artist:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->artist:Ljava/lang/String;

    .line 36
    .line 37
    iget v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 38
    .line 39
    iput v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 40
    .line 41
    iget v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 42
    .line 43
    iput v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 44
    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->musicType:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->musicType:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->source:Ljava/lang/String;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->source:Ljava/lang/String;

    .line 52
    .line 53
    iget-boolean p1, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->isFromSameFilm:Z

    .line 54
    .line 55
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->isFromSameFilm:Z

    .line 56
    .line 57
    return-void
.end method

.method public setData(Lorg/json/JSONObject;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 58
    const-string v0, "music_id"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->id:Ljava/lang/String;

    .line 59
    const-string v0, "title"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->name:Ljava/lang/String;

    .line 60
    const-string v0, "url"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->setUri(Ljava/lang/String;)V

    .line 61
    const-string v0, "type"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->musicType:Ljava/lang/String;

    .line 62
    const-string v0, "source"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->source:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLength(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->length:I

    .line 2
    .line 3
    return-void
.end method

.method public setMusicType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->musicType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSize(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->size:J

    .line 2
    .line 3
    return-void
.end method

.method public setSource(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->source:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setState(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->state:I

    .line 2
    .line 3
    return-void
.end method

.method public setUpdatetime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->updatetime:J

    .line 2
    .line 3
    return-void
.end method

.method public setUri(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->uri:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "http"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "MusicContent{id=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', size="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->size:J

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", type="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", name=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->name:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', uri=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->uri:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', path=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "\', length="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->length:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", album=\'"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->album:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, "\', artist=\'"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->artist:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, "\', startMillTime="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ", endMillTime="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ", musicType="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->musicType:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, ", source="

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->source:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const/16 p0, 0x7d

    .line 134
    .line 135
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->size:J

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 9
    .line 10
    .line 11
    iget p2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->name:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->uri:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget p2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->length:I

    .line 32
    .line 33
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->album:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->artist:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget p2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 49
    .line 50
    .line 51
    iget p2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->musicType:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->source:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->isFromSameFilm:Z

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeByte(B)V

    .line 69
    .line 70
    .line 71
    return-void
.end method
