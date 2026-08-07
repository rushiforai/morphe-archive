.class public Lcom/p1/mobile/putong/data/Audio;
.super Lcom/p1/mobile/putong/data/Media;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/Audio;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "audio"


# instance fields
.field public audioRead:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public duration:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Audio$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Audio$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/Audio;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Media;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/IdealTag;)Lcom/p1/mobile/putong/data/IdealTag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/IdealTag;->clone()Lcom/p1/mobile/putong/data/IdealTag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/MediaLabel;)Lcom/p1/mobile/putong/data/MediaLabel;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/Audio;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Audio;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Audio;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Audio;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 110
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Audio;->clone()Lcom/p1/mobile/putong/data/Audio;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/Audio;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Audio;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Audio;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MediaMeta;->clone()Lcom/p1/mobile/putong/data/MediaMeta;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 35
    .line 36
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 39
    .line 40
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Media;->isPortrait:Z

    .line 41
    .line 42
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Media;->isPortrait:Z

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 45
    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    new-instance v2, Ll/aa1;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/aa1;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 58
    .line 59
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 60
    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    new-instance v2, Ll/ba1;

    .line 64
    .line 65
    invoke-direct {v2}, Ll/ba1;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 73
    .line 74
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->tagIdealInfo:Ljava/util/List;

    .line 75
    .line 76
    if-eqz v1, :cond_3

    .line 77
    .line 78
    new-instance v2, Ll/ca1;

    .line 79
    .line 80
    invoke-direct {v2}, Ll/ca1;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->tagIdealInfo:Ljava/util/List;

    .line 88
    .line 89
    :cond_3
    iget v1, p0, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 90
    .line 91
    iput v1, v0, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 92
    .line 93
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Audio;->audioRead:Z

    .line 94
    .line 95
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Audio;->audioRead:Z

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Audio;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 98
    .line 99
    if-eqz p0, :cond_4

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->clone()Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Audio;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 106
    .line 107
    :cond_4
    return-object v0
.end method

.method public bridge synthetic clone()Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Audio;->clone()Lcom/p1/mobile/putong/data/Audio;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Audio;->clone()Lcom/p1/mobile/putong/data/Audio;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Audio;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    move-object v1, p1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/data/Audio;

    .line 13
    .line 14
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/data/Media;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    return v2

    .line 21
    :cond_2
    iget p1, p0, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 22
    .line 23
    iget v3, v1, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 24
    .line 25
    cmpl-float p1, p1, v3

    .line 26
    .line 27
    if-nez p1, :cond_3

    .line 28
    .line 29
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/Audio;->audioRead:Z

    .line 30
    .line 31
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/Audio;->audioRead:Z

    .line 32
    .line 33
    if-ne p1, v3, :cond_3

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Audio;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 36
    .line 37
    iget-object p1, v1, Lcom/p1/mobile/putong/data/Audio;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 38
    .line 39
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_3

    .line 44
    .line 45
    return v0

    .line 46
    :cond_3
    return v2
.end method

.method public format32()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "http"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Audio;->withExtension()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p0, "?format=32"

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 34
    .line 35
    return-object p0
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "audio"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    invoke-super {p0}, Lcom/p1/mobile/putong/data/Media;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 12
    .line 13
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    add-int/2addr v0, v1

    .line 18
    mul-int/lit8 v0, v0, 0x29

    .line 19
    .line 20
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Audio;->audioRead:Z

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    const/16 v1, 0x4cf

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/16 v1, 0x4d5

    .line 28
    .line 29
    :goto_0
    add-int/2addr v0, v1

    .line 30
    mul-int/lit8 v0, v0, 0x29

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Audio;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    const/4 v1, 0x0

    .line 42
    :goto_1
    add-int/2addr v0, v1

    .line 43
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 44
    .line 45
    :cond_2
    return v0
.end method

.method public nullCheck()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/data/Media;->nullCheck()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public withExtension()Ljava/lang/String;
    .locals 5

    .line 1
    sget-object v0, Ll/uqb0;->X:Ll/hj5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    .line 8
    .line 9
    const-string v1, "http"

    .line 10
    .line 11
    const-string v2, ".m4a"

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidAudioExt:Z

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    return-object v3

    .line 30
    :cond_0
    invoke-virtual {v3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    :cond_1
    return-object p0

    .line 54
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 55
    .line 56
    const-string v3, ".mp3"

    .line 57
    .line 58
    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iget-object v4, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    return-object v4

    .line 67
    :cond_3
    invoke-virtual {v4, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget-object v4, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 72
    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    invoke-virtual {v4, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0

    .line 80
    :cond_4
    invoke-virtual {v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz v0, :cond_5

    .line 87
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    :cond_5
    return-object p0
.end method
