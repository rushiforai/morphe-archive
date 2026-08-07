.class Lio/agora/base/internal/video/EglRenderer$Color;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/EglRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Color"
.end annotation


# instance fields
.field public alpha:F

.field public blue:F

.field public green:F

.field public red:F

.field final synthetic this$0:Lio/agora/base/internal/video/EglRenderer;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/EglRenderer;I)V
    .locals 1

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/EglRenderer$Color;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    shr-int/lit8 p1, p2, 0x18

    .line 7
    .line 8
    and-int/lit16 p1, p1, 0xff

    .line 9
    .line 10
    int-to-float p1, p1

    .line 11
    const/high16 v0, 0x437f0000    # 255.0f

    .line 12
    .line 13
    div-float/2addr p1, v0

    .line 14
    iput p1, p0, Lio/agora/base/internal/video/EglRenderer$Color;->red:F

    .line 15
    .line 16
    shr-int/lit8 p1, p2, 0x10

    .line 17
    .line 18
    and-int/lit16 p1, p1, 0xff

    .line 19
    .line 20
    int-to-float p1, p1

    .line 21
    div-float/2addr p1, v0

    .line 22
    iput p1, p0, Lio/agora/base/internal/video/EglRenderer$Color;->green:F

    .line 23
    .line 24
    shr-int/lit8 p1, p2, 0x8

    .line 25
    .line 26
    and-int/lit16 p1, p1, 0xff

    .line 27
    .line 28
    int-to-float p1, p1

    .line 29
    div-float/2addr p1, v0

    .line 30
    iput p1, p0, Lio/agora/base/internal/video/EglRenderer$Color;->blue:F

    .line 31
    .line 32
    and-int/lit16 p1, p2, 0xff

    .line 33
    .line 34
    int-to-float p1, p1

    .line 35
    div-float/2addr p1, v0

    .line 36
    iput p1, p0, Lio/agora/base/internal/video/EglRenderer$Color;->alpha:F

    .line 37
    .line 38
    return-void
.end method
