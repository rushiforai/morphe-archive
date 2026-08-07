.class Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/android/ttvecamera/g$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/media/VECameraWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LogCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/media/VECameraWrapper;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/media/VECameraWrapper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public Log(BLjava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    const/4 v0, 0x5

    .line 2
    new-array v1, v0, [B

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    const/4 v2, 0x4

    .line 8
    const/4 v3, 0x3

    .line 9
    const/4 v4, 0x2

    .line 10
    const/4 v5, 0x1

    .line 11
    const/4 v6, 0x0

    .line 12
    filled-new-array {v2, v3, v4, v5, v6}, [I

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    move v3, v6

    .line 17
    :goto_0
    if-ge v3, v0, :cond_1

    .line 18
    .line 19
    aget-byte v4, v1, v3

    .line 20
    .line 21
    if-ne p1, v4, :cond_0

    .line 22
    .line 23
    aget v6, v2, v3

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 30
    .line 31
    new-instance p1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v0, "VECAM-"

    .line 34
    .line 35
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string p3, "toSvr"

    .line 46
    .line 47
    invoke-virtual {p2, p3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    invoke-static {p0, v6, p1, p2}, Lcom/ss/bytertc/media/VECameraWrapper;->access$000(Lcom/ss/bytertc/media/VECameraWrapper;ILjava/lang/String;Z)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :array_0
    .array-data 1
        0x1t
        0x2t
        0x4t
        0x8t
        0x10t
    .end array-data
.end method
