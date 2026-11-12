.class public final Lghg;
.super Laib;
.source "SourceFile"


# instance fields
.field public q:Z


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-eq p0, p1, :cond_10

    instance-of v0, p1, Lghg;

    if-eqz v0, :cond_e

    check-cast p1, Lghg;

    iget-boolean p0, p0, Lghg;->q:Z

    iget-boolean p1, p1, Lghg;->q:Z

    if-eq p0, p1, :cond_10

    :cond_e
    const/4 p0, 0x0

    return p0

    :cond_10
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-boolean p0, p0, Lghg;->q:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    const v0, -0x6f162c56

    add-int/2addr p0, v0

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4cf

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4d5

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4d5

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4d5

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit8 p0, p0, 0x2

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4d5

    mul-int/lit8 p0, p0, 0x1f

    const v0, 0x2c41add

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-boolean p0, p0, Lghg;->q:Z

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AndroidWebSettings(allowFileAccess=false, textZoom=100, useWideViewPort=false, standardFontFamily=sans-serif, defaultFontSize=16, loadsImagesAutomatically=true, isAlgorithmicDarkeningAllowed=false, safeBrowsingEnabled=true, domStorageEnabled="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p0, ", mediaPlaybackRequiresUserGesture=true, allowProtectedMedia=false, allowMidiSysexMessages=false, hideDefaultVideoPoster=false, layerType=2, enableSandbox=false, sandboxSubdomain=/app/)"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
