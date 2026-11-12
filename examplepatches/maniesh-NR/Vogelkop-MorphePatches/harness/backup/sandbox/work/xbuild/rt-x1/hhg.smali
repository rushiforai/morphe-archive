.class public final Lhhg;
.super Laib;
.source "SourceFile"


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Lhhg;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, 0x95cb

    mul-int/lit8 p0, p0, 0x1f

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4cf

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4cf

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4cf

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4cf

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4cf

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4d5

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, "IOSWebSettings(opaque=false, backgroundColor=null, underPageBackgroundColor=null, bounces=true, scrollEnabled=true, showHorizontalScrollIndicator=true, showVerticalScrollIndicator=true, mediaPlaybackRequiresUserGesture=true, isInspectable=false)"

    return-object p0
.end method
