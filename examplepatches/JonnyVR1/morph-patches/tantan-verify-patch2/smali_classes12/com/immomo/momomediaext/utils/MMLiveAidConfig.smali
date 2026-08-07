.class public Lcom/immomo/momomediaext/utils/MMLiveAidConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public hRatio:F

.field public playUrl:Ljava/lang/String;

.field public renderHeight:I

.field public renderWidth:I

.field public wRatio:F

.field public xRatio:F

.field public yRatio:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/momomediaext/utils/MMLiveAidConfig;->playUrl:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveAidConfig;->wRatio:F

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveAidConfig;->hRatio:F

    .line 12
    .line 13
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveAidConfig;->xRatio:F

    .line 14
    .line 15
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveAidConfig;->yRatio:F

    .line 16
    .line 17
    const/16 v0, 0x1e0

    .line 18
    .line 19
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveAidConfig;->renderWidth:I

    .line 20
    .line 21
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveAidConfig;->renderHeight:I

    .line 22
    .line 23
    return-void
.end method
