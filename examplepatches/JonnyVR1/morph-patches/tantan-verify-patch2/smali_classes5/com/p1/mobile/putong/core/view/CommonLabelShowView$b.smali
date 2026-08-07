.class public Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/view/CommonLabelShowView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:F

.field public b:F

.field public c:F

.field public d:F

.field public e:I

.field public f:I

.field public g:F

.field public h:F

.field public i:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/qa00;->e:I

    .line 5
    .line 6
    int-to-float v1, v0

    .line 7
    iput v1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->a:F

    .line 8
    .line 9
    int-to-float v1, v0

    .line 10
    iput v1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->b:F

    .line 11
    .line 12
    int-to-float v1, v0

    .line 13
    iput v1, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->c:F

    .line 14
    .line 15
    int-to-float v0, v0

    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->d:F

    .line 17
    .line 18
    const/16 v0, -0x1a1e

    .line 19
    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->e:I

    .line 21
    .line 22
    const/high16 v0, 0x41200000    # 10.0f

    .line 23
    .line 24
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    int-to-float v0, v0

    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->g:F

    .line 30
    .line 31
    const/high16 v0, 0x40c00000    # 6.0f

    .line 32
    .line 33
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    int-to-float v0, v0

    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->i:F

    .line 39
    .line 40
    const/high16 v0, -0x34000000    # -3.3554432E7f

    .line 41
    .line 42
    iput v0, p0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView$b;->f:I

    .line 43
    .line 44
    return-void
.end method
