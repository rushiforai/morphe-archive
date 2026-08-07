.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;
.super Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;
.source "SourceFile"


# instance fields
.field public needCount:I

.field public pictures:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;-><init>()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;->pictures:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method
