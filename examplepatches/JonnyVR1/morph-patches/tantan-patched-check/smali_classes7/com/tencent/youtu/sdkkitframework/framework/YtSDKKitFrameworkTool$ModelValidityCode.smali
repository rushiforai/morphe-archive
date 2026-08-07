.class public final enum Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ModelValidityCode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;",
        ">;"
    }
.end annotation


# static fields
.field public static final synthetic $VALUES:[Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

.field public static final enum CREATE_MD5_ERROR:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

.field public static final enum MODEL_FILE_MISS:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

.field public static final enum NOT_FOUND_MODEL_DIR:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

.field public static final enum NOT_FOUND_MODEL_MD5:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

.field public static final enum READ_MD5_ERROR:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

.field public static final enum TARGET_MD5_NOT_FOUND:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

.field public static final enum VALIDITY_ERROR:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

.field public static final enum VALIDITY_OK:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;


# direct methods
.method public static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 2
    .line 3
    const-string v1, "VALIDITY_OK"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->VALIDITY_OK:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 10
    .line 11
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 12
    .line 13
    const-string v2, "NOT_FOUND_MODEL_DIR"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->NOT_FOUND_MODEL_DIR:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 20
    .line 21
    new-instance v2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 22
    .line 23
    const-string v3, "NOT_FOUND_MODEL_MD5"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->NOT_FOUND_MODEL_MD5:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 30
    .line 31
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 32
    .line 33
    const-string v4, "READ_MD5_ERROR"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->READ_MD5_ERROR:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 40
    .line 41
    new-instance v4, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 42
    .line 43
    const-string v5, "VALIDITY_ERROR"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->VALIDITY_ERROR:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 50
    .line 51
    new-instance v5, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 52
    .line 53
    const-string v6, "TARGET_MD5_NOT_FOUND"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v5, v6, v7}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->TARGET_MD5_NOT_FOUND:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 60
    .line 61
    new-instance v6, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 62
    .line 63
    const-string v7, "CREATE_MD5_ERROR"

    .line 64
    .line 65
    const/4 v8, 0x6

    .line 66
    invoke-direct {v6, v7, v8}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;-><init>(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    sput-object v6, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->CREATE_MD5_ERROR:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 70
    .line 71
    new-instance v7, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 72
    .line 73
    const-string v8, "MODEL_FILE_MISS"

    .line 74
    .line 75
    const/4 v9, 0x7

    .line 76
    invoke-direct {v7, v8, v9}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;-><init>(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    sput-object v7, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->MODEL_FILE_MISS:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 80
    .line 81
    filled-new-array/range {v0 .. v7}, [Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->$VALUES:[Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 86
    .line 87
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;
    .locals 1

    .line 1
    const-class v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->$VALUES:[Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFrameworkTool$ModelValidityCode;

    .line 8
    .line 9
    return-object v0
.end method
