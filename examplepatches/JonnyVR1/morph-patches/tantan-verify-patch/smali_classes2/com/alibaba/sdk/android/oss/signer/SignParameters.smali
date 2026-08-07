.class public Lcom/alibaba/sdk/android/oss/signer/SignParameters;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final AUTHORIZATION_PREFIX:Ljava/lang/String; = "OSS "

.field public static final NEW_LINE:Ljava/lang/String; = "\n"

.field public static final SIGNED_PARAMTERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 28

    .line 1
    const-string v26, "tagging"

    .line 2
    .line 3
    const-string v27, "objectMeta"

    .line 4
    .line 5
    const-string v1, "bucketInfo"

    .line 6
    .line 7
    const-string v2, "acl"

    .line 8
    .line 9
    const-string v3, "uploads"

    .line 10
    .line 11
    const-string v4, "location"

    .line 12
    .line 13
    const-string v5, "cors"

    .line 14
    .line 15
    const-string v6, "logging"

    .line 16
    .line 17
    const-string v7, "website"

    .line 18
    .line 19
    const-string v8, "referer"

    .line 20
    .line 21
    const-string v9, "lifecycle"

    .line 22
    .line 23
    const-string v10, "delete"

    .line 24
    .line 25
    const-string v11, "append"

    .line 26
    .line 27
    const-string v12, "uploadId"

    .line 28
    .line 29
    const-string v13, "partNumber"

    .line 30
    .line 31
    const-string v14, "security-token"

    .line 32
    .line 33
    const-string v15, "position"

    .line 34
    .line 35
    const-string v16, "response-cache-control"

    .line 36
    .line 37
    const-string v17, "response-content-disposition"

    .line 38
    .line 39
    const-string v18, "response-content-encoding"

    .line 40
    .line 41
    const-string v19, "response-content-language"

    .line 42
    .line 43
    const-string v20, "response-content-type"

    .line 44
    .line 45
    const-string v21, "response-expires"

    .line 46
    .line 47
    const-string v22, "x-oss-process"

    .line 48
    .line 49
    const-string v23, "sequential"

    .line 50
    .line 51
    const-string v24, "symlink"

    .line 52
    .line 53
    const-string v25, "restore"

    .line 54
    .line 55
    filled-new-array/range {v1 .. v27}, [Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    sput-object v0, Lcom/alibaba/sdk/android/oss/signer/SignParameters;->SIGNED_PARAMTERS:Ljava/util/List;

    .line 64
    .line 65
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
