.class public Lcom/immomo/audioeffect/EqEffectInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:F

.field public c:F


# direct methods
.method public constructor <init>([F)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    aget v0, p1, v0

    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/audioeffect/EqEffectInfo;->a:F

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    aget v0, p1, v0

    .line 11
    .line 12
    iput v0, p0, Lcom/immomo/audioeffect/EqEffectInfo;->b:F

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    aget p1, p1, v0

    .line 16
    .line 17
    iput p1, p0, Lcom/immomo/audioeffect/EqEffectInfo;->c:F

    .line 18
    .line 19
    return-void
.end method
