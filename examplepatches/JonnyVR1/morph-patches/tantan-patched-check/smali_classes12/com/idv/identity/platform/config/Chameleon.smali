.class public Lcom/idv/identity/platform/config/Chameleon;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public maxWaitTime:Ljava/lang/Long;

.field public triggering:[I

.field public whiteBalance:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
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
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/idv/identity/platform/config/Chameleon;->whiteBalance:Ljava/util/List;

    .line 10
    .line 11
    const-wide/16 v0, 0x1f4

    .line 12
    .line 13
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/idv/identity/platform/config/Chameleon;->maxWaitTime:Ljava/lang/Long;

    .line 18
    .line 19
    return-void
.end method
