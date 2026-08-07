.class public Ll/tfe;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:F

.field private b:F

.field private c:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/tfe;->a:F

    .line 6
    .line 7
    iput v0, p0, Ll/tfe;->b:F

    .line 8
    .line 9
    iput v0, p0, Ll/tfe;->c:F

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()F
    .locals 0

    .line 1
    iget p0, p0, Ll/tfe;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public b(F)F
    .locals 1

    .line 1
    iget v0, p0, Ll/tfe;->c:F

    .line 2
    .line 3
    invoke-static {v0}, Ll/a2j0;->e(F)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Ll/tfe;->a:F

    .line 10
    .line 11
    sub-float/2addr p1, v0

    .line 12
    iget p0, p0, Ll/tfe;->c:F

    .line 13
    .line 14
    div-float/2addr p1, p0

    .line 15
    return p1

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public c()F
    .locals 0

    .line 1
    iget p0, p0, Ll/tfe;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public d(FZ)Z
    .locals 2

    .line 1
    iget v0, p0, Ll/tfe;->a:F

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    cmpl-float p2, p1, v0

    .line 7
    .line 8
    if-ltz p2, :cond_1

    .line 9
    .line 10
    iget p0, p0, Ll/tfe;->b:F

    .line 11
    .line 12
    cmpg-float p0, p1, p0

    .line 13
    .line 14
    if-gtz p0, :cond_1

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    cmpl-float p2, p1, v0

    .line 18
    .line 19
    if-ltz p2, :cond_1

    .line 20
    .line 21
    iget p0, p0, Ll/tfe;->b:F

    .line 22
    .line 23
    cmpg-float p0, p1, p0

    .line 24
    .line 25
    if-gez p0, :cond_1

    .line 26
    .line 27
    return v1

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public e(FF)V
    .locals 0

    .line 1
    iput p1, p0, Ll/tfe;->a:F

    .line 2
    .line 3
    iput p2, p0, Ll/tfe;->b:F

    .line 4
    .line 5
    sub-float/2addr p2, p1

    .line 6
    iput p2, p0, Ll/tfe;->c:F

    .line 7
    .line 8
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Ll/tfe;->a:F

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ","

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget p0, p0, Ll/tfe;->b:F

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
