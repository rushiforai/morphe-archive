.class public Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "YtFSMUpdateData"
.end annotation


# instance fields
.field public imageData:[B

.field public imageHeight:I

.field public imageWidth:I

.field public final synthetic this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

.field public timeStamp:J


# direct methods
.method public constructor <init>(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->this$0:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;-><init>(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;)V

    return-void
.end method


# virtual methods
.method public mirror()V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :cond_0
    iget v2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->imageHeight:I

    .line 4
    .line 5
    iget v3, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->imageWidth:I

    .line 6
    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    mul-int v2, v1, v3

    .line 10
    .line 11
    add-int/lit8 v1, v1, 0x1

    .line 12
    .line 13
    mul-int/2addr v3, v1

    .line 14
    add-int/lit8 v3, v3, -0x1

    .line 15
    .line 16
    :goto_0
    if-ge v2, v3, :cond_0

    .line 17
    .line 18
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->imageData:[B

    .line 19
    .line 20
    aget-byte v5, v4, v2

    .line 21
    .line 22
    aget-byte v6, v4, v3

    .line 23
    .line 24
    aput-byte v6, v4, v2

    .line 25
    .line 26
    aput-byte v5, v4, v3

    .line 27
    .line 28
    add-int/lit8 v2, v2, 0x1

    .line 29
    .line 30
    add-int/lit8 v3, v3, -0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    mul-int/2addr v3, v2

    .line 34
    :cond_2
    iget v1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->imageHeight:I

    .line 35
    .line 36
    div-int/lit8 v1, v1, 0x2

    .line 37
    .line 38
    if-ge v0, v1, :cond_3

    .line 39
    .line 40
    iget v1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->imageWidth:I

    .line 41
    .line 42
    mul-int v2, v0, v1

    .line 43
    .line 44
    add-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    mul-int/2addr v1, v0

    .line 47
    add-int/lit8 v1, v1, -0x2

    .line 48
    .line 49
    :goto_1
    if-ge v2, v1, :cond_2

    .line 50
    .line 51
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateData;->imageData:[B

    .line 52
    .line 53
    add-int v5, v2, v3

    .line 54
    .line 55
    aget-byte v6, v4, v5

    .line 56
    .line 57
    add-int v7, v1, v3

    .line 58
    .line 59
    aget-byte v8, v4, v7

    .line 60
    .line 61
    aput-byte v8, v4, v5

    .line 62
    .line 63
    aput-byte v6, v4, v7

    .line 64
    .line 65
    add-int/lit8 v5, v5, 0x1

    .line 66
    .line 67
    aget-byte v6, v4, v5

    .line 68
    .line 69
    add-int/lit8 v7, v7, 0x1

    .line 70
    .line 71
    aget-byte v8, v4, v7

    .line 72
    .line 73
    aput-byte v8, v4, v5

    .line 74
    .line 75
    aput-byte v6, v4, v7

    .line 76
    .line 77
    add-int/lit8 v2, v2, 0x2

    .line 78
    .line 79
    add-int/lit8 v1, v1, -0x2

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_3
    return-void
.end method
