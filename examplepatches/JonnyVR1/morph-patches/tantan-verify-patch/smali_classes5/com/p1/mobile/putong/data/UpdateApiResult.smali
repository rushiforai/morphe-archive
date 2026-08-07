.class public Lcom/p1/mobile/putong/data/UpdateApiResult;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/data/UpdateApiResult;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/UpdateApiResult;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "updateapiresult"


# instance fields
.field public appVersion:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public changelog:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public forceDownloadApk:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public forceGoToMarket:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public hasUpdate:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public md5:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public url:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UpdateApiResult$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UpdateApiResult$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/UpdateApiResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/UpdateApiResult$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UpdateApiResult$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/UpdateApiResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/data/UpdateApiResult;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UpdateApiResult;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UpdateApiResult;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/UpdateApiResult;->nullCheck()V

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

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UpdateApiResult;->clone()Lcom/p1/mobile/putong/data/UpdateApiResult;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/UpdateApiResult;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UpdateApiResult;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UpdateApiResult;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->hasUpdate:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/UpdateApiResult;->hasUpdate:Z

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->appVersion:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UpdateApiResult;->appVersion:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->url:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UpdateApiResult;->url:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->md5:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UpdateApiResult;->md5:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->changelog:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UpdateApiResult;->changelog:Ljava/lang/String;

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->forceGoToMarket:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/UpdateApiResult;->forceGoToMarket:Z

    .line 29
    .line 30
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->forceDownloadApk:Z

    .line 31
    .line 32
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/UpdateApiResult;->forceDownloadApk:Z

    .line 33
    .line 34
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UpdateApiResult;->clone()Lcom/p1/mobile/putong/data/UpdateApiResult;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/UpdateApiResult;

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
    check-cast p1, Lcom/p1/mobile/putong/data/UpdateApiResult;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->hasUpdate:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/UpdateApiResult;->hasUpdate:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->appVersion:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UpdateApiResult;->appVersion:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->url:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UpdateApiResult;->url:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->md5:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UpdateApiResult;->md5:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->changelog:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UpdateApiResult;->changelog:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->forceGoToMarket:Z

    .line 60
    .line 61
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/UpdateApiResult;->forceGoToMarket:Z

    .line 62
    .line 63
    if-ne v1, v3, :cond_2

    .line 64
    .line 65
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->forceDownloadApk:Z

    .line 66
    .line 67
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/UpdateApiResult;->forceDownloadApk:Z

    .line 68
    .line 69
    if-ne p0, p1, :cond_2

    .line 70
    .line 71
    return v0

    .line 72
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "updateapiresult"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_7

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->hasUpdate:Z

    .line 8
    .line 9
    const/16 v2, 0x4d5

    .line 10
    .line 11
    const/16 v3, 0x4cf

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    move v1, v3

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    add-int/2addr v0, v1

    .line 19
    mul-int/lit8 v0, v0, 0x29

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->appVersion:Ljava/lang/String;

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move v1, v4

    .line 32
    :goto_1
    add-int/2addr v0, v1

    .line 33
    mul-int/lit8 v0, v0, 0x29

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->url:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    goto :goto_2

    .line 44
    :cond_2
    move v1, v4

    .line 45
    :goto_2
    add-int/2addr v0, v1

    .line 46
    mul-int/lit8 v0, v0, 0x29

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->md5:Ljava/lang/String;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    goto :goto_3

    .line 57
    :cond_3
    move v1, v4

    .line 58
    :goto_3
    add-int/2addr v0, v1

    .line 59
    mul-int/lit8 v0, v0, 0x29

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->changelog:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    :cond_4
    add-int/2addr v0, v4

    .line 70
    mul-int/lit8 v0, v0, 0x29

    .line 71
    .line 72
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->forceGoToMarket:Z

    .line 73
    .line 74
    if-eqz v1, :cond_5

    .line 75
    .line 76
    move v1, v3

    .line 77
    goto :goto_4

    .line 78
    :cond_5
    move v1, v2

    .line 79
    :goto_4
    add-int/2addr v0, v1

    .line 80
    mul-int/lit8 v0, v0, 0x29

    .line 81
    .line 82
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->forceDownloadApk:Z

    .line 83
    .line 84
    if-eqz v1, :cond_6

    .line 85
    .line 86
    move v2, v3

    .line 87
    :cond_6
    add-int/2addr v0, v2

    .line 88
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 89
    .line 90
    :cond_7
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->appVersion:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->appVersion:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->url:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->url:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->md5:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->md5:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->changelog:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UpdateApiResult;->changelog:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/UpdateApiResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
