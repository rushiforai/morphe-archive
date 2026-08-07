.class public Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/sei/BaseSei;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SeiBean"
.end annotation


# instance fields
.field private alpha:I

.field private h:F

.field private id:Ljava/lang/String;

.field private mu:I

.field private ol:I

.field private pkmu:I

.field private renderMode:Ljava/lang/String;

.field private vo:F

.field private w:F

.field private x:F

.field private y:F

.field private z:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->x:F

    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->y:F

    .line 8
    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->w:F

    .line 12
    .line 13
    iput v0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->h:F

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput v1, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->z:I

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    iput v2, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->alpha:I

    .line 20
    .line 21
    iput v0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->vo:F

    .line 22
    .line 23
    iput v1, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->pkmu:I

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-nez p1, :cond_1

    .line 7
    .line 8
    return v1

    .line 9
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    if-eq v2, v3, :cond_2

    .line 18
    .line 19
    return v1

    .line 20
    :cond_2
    check-cast p1, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->id:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v3, p1, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_3

    .line 31
    .line 32
    iget v2, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->x:F

    .line 33
    .line 34
    iget v3, p1, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->x:F

    .line 35
    .line 36
    cmpl-float v2, v2, v3

    .line 37
    .line 38
    if-nez v2, :cond_3

    .line 39
    .line 40
    iget v2, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->y:F

    .line 41
    .line 42
    iget v3, p1, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->y:F

    .line 43
    .line 44
    cmpl-float v2, v2, v3

    .line 45
    .line 46
    if-nez v2, :cond_3

    .line 47
    .line 48
    iget v2, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->w:F

    .line 49
    .line 50
    iget v3, p1, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->w:F

    .line 51
    .line 52
    cmpl-float v2, v2, v3

    .line 53
    .line 54
    if-nez v2, :cond_3

    .line 55
    .line 56
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->h:F

    .line 57
    .line 58
    iget p1, p1, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->h:F

    .line 59
    .line 60
    cmpl-float p0, p0, p1

    .line 61
    .line 62
    if-nez p0, :cond_3

    .line 63
    .line 64
    return v0

    .line 65
    :cond_3
    return v1
.end method

.method public getAlpha()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->alpha:I

    .line 2
    .line 3
    return p0
.end method

.method public getH()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->h:F

    .line 2
    .line 3
    return p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMu()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->mu:I

    .line 2
    .line 3
    return p0
.end method

.method public getOl()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->ol:I

    .line 2
    .line 3
    return p0
.end method

.method public getPkmu()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->pkmu:I

    .line 2
    .line 3
    return p0
.end method

.method public getRenderMode()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->renderMode:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVo()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->vo:F

    .line 2
    .line 3
    return p0
.end method

.method public getW()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->w:F

    .line 2
    .line 3
    return p0
.end method

.method public getX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->x:F

    .line 2
    .line 3
    return p0
.end method

.method public getY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->y:F

    .line 2
    .line 3
    return p0
.end method

.method public getZ()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->alpha:I

    .line 2
    .line 3
    return-void
.end method

.method public setH(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->h:F

    .line 2
    .line 3
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMu(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->mu:I

    .line 2
    .line 3
    return-void
.end method

.method public setOl(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->ol:I

    .line 2
    .line 3
    return-void
.end method

.method public setPkmu(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->pkmu:I

    .line 2
    .line 3
    return-void
.end method

.method public setRenderMode(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->renderMode:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVo(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->vo:F

    .line 2
    .line 3
    return-void
.end method

.method public setW(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->w:F

    .line 2
    .line 3
    return-void
.end method

.method public setX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->x:F

    .line 2
    .line 3
    return-void
.end method

.method public setY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->y:F

    .line 2
    .line 3
    return-void
.end method

.method public setZ(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->z:I

    .line 2
    .line 3
    return-void
.end method
