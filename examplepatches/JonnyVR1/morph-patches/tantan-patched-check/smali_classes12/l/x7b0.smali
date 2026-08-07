.class public Ll/x7b0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field pullComm:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pull_comm"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field pullCommV2:Ll/w7b0;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pull_comm_v2"
    .end annotation
.end field

.field pullDelay:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pull_delay"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field


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


# virtual methods
.method public a()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/x7b0;->pullComm:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/w7b0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x7b0;->pullCommV2:Ll/w7b0;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/x7b0;->pullDelay:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
