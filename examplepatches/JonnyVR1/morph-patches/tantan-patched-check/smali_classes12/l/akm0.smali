.class public Ll/akm0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private enableGpuDecode:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "enable_gpu_decode"
    .end annotation
.end field

.field private enableProxy:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "enable_proxy"
    .end annotation
.end field

.field private newConnectionProbe:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "enable_new_connection_probe"
    .end annotation
.end field

.field private playerOptions:Ljava/util/Map;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "player_option"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/akm0;->enableProxy:I

    .line 6
    .line 7
    iput v0, p0, Ll/akm0;->enableGpuDecode:I

    .line 8
    .line 9
    new-instance v1, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Ll/akm0;->playerOptions:Ljava/util/Map;

    .line 15
    .line 16
    iput v0, p0, Ll/akm0;->newConnectionProbe:I

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/akm0;->enableGpuDecode:I

    .line 2
    .line 3
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/akm0;->enableProxy:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/akm0;->newConnectionProbe:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/akm0;->playerOptions:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method
