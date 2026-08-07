.class Lcom/core/glcore/util/BeautyScoreHelper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/core/glcore/util/BeautyScoreHelper;->detectBeautyScore(Ll/umw;Ll/omw;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


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
.method public run()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/core/glcore/util/BeautyScoreHelper;->access$300()Lcom/core/glcore/util/FaceBeautyScore;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Lcom/core/glcore/util/BeautyScoreHelper;->access$000()Ll/umw;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/core/glcore/util/BeautyScoreHelper;->access$100()Ll/omw;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {}, Lcom/core/glcore/util/BeautyScoreHelper;->access$200()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {p0, v0, v1, v2}, Lcom/core/glcore/util/FaceBeautyScore;->calculateImageFaceBeautyScore(Ll/umw;Ll/omw;I)F

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const/4 v0, 0x0

    .line 22
    cmpl-float v0, p0, v0

    .line 23
    .line 24
    if-ltz v0, :cond_0

    .line 25
    .line 26
    invoke-static {}, Lcom/core/glcore/util/BeautyScoreHelper;->access$400()[F

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {}, Lcom/core/glcore/util/BeautyScoreHelper;->access$508()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    aput p0, v0, v1

    .line 35
    .line 36
    :cond_0
    const/4 p0, 0x1

    .line 37
    invoke-static {p0}, Lcom/core/glcore/util/BeautyScoreHelper;->access$602(Z)Z

    .line 38
    .line 39
    .line 40
    return-void
.end method
