.class public final Ll/qf60$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qf60$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qf60;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
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
.method public a(I[F)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/qf60$a;->d([F)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/qf60$a;->b([F)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Ll/qf60$a;->c([F)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final b([F)Z
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    aget p0, p1, p0

    .line 3
    .line 4
    const p1, 0x3d4ccccd    # 0.05f

    .line 5
    .line 6
    .line 7
    cmpg-float p0, p0, p1

    .line 8
    .line 9
    if-gtz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final c([F)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    aget v0, p1, p0

    .line 3
    .line 4
    const/high16 v1, 0x41200000    # 10.0f

    .line 5
    .line 6
    cmpl-float v1, v0, v1

    .line 7
    .line 8
    if-ltz v1, :cond_0

    .line 9
    .line 10
    const/high16 v1, 0x42140000    # 37.0f

    .line 11
    .line 12
    cmpg-float v0, v0, v1

    .line 13
    .line 14
    if-gtz v0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    aget p1, p1, v0

    .line 18
    .line 19
    const v1, 0x3f51eb85    # 0.82f

    .line 20
    .line 21
    .line 22
    cmpg-float p1, p1, v1

    .line 23
    .line 24
    if-gtz p1, :cond_0

    .line 25
    .line 26
    return v0

    .line 27
    :cond_0
    return p0
.end method

.method public final d([F)Z
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    aget p0, p1, p0

    .line 3
    .line 4
    const p1, 0x3f733333    # 0.95f

    .line 5
    .line 6
    .line 7
    cmpl-float p0, p0, p1

    .line 8
    .line 9
    if-ltz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method
