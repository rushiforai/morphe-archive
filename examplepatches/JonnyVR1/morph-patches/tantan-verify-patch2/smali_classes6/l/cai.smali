.class public Ll/cai;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static c:I = 0x50

.field public static d:I = 0x6

.field public static e:I = 0x50

.field public static f:I = 0x6


# instance fields
.field public a:I

.field public b:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bnl0;->y0()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sget v1, Ll/cai;->e:I

    .line 9
    .line 10
    int-to-float v1, v1

    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sub-int/2addr v0, v1

    .line 16
    iput v0, p0, Ll/cai;->a:I

    .line 17
    .line 18
    sget v1, Ll/cai;->f:I

    .line 19
    .line 20
    int-to-float v1, v1

    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    mul-int/lit8 v1, v1, 0x2

    .line 26
    .line 27
    sub-int/2addr v0, v1

    .line 28
    div-int/lit8 v0, v0, 0x3

    .line 29
    .line 30
    iput v0, p0, Ll/cai;->b:I

    .line 31
    .line 32
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/data/User;)I
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Ll/k9c0;->A:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static b(Lcom/p1/mobile/putong/data/User;)I
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Ll/k9c0;->e:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static c(II)I
    .locals 1

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float p0, p0

    .line 6
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    sub-int/2addr v0, p0

    .line 11
    int-to-float p0, p1

    .line 12
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    mul-int/lit8 p0, p0, 0x2

    .line 17
    .line 18
    sub-int/2addr v0, p0

    .line 19
    div-int/lit8 v0, v0, 0x3

    .line 20
    .line 21
    return v0
.end method

.method public static d(I)I
    .locals 1

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float p0, p0

    .line 6
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    sub-int/2addr v0, p0

    .line 11
    return v0
.end method

.method public static e(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)[I
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->height:I

    .line 4
    .line 5
    const/16 v1, 0x3e8

    .line 6
    .line 7
    if-le v0, v1, :cond_1

    .line 8
    .line 9
    if-le p0, v1, :cond_1

    .line 10
    .line 11
    const/16 v1, 0x2d0

    .line 12
    .line 13
    const/16 v2, 0x500

    .line 14
    .line 15
    if-le v0, p0, :cond_0

    .line 16
    .line 17
    move p0, v1

    .line 18
    move v0, v2

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v0, v1

    .line 21
    move p0, v2

    .line 22
    :cond_1
    :goto_0
    filled-new-array {v0, p0}, [I

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static f(Landroid/widget/TextView;ILjava/lang/String;F)F
    .locals 4

    .line 1
    :goto_0
    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-float v1, p1

    .line 13
    cmpg-float v0, v0, v1

    .line 14
    .line 15
    if-gtz v0, :cond_0

    .line 16
    .line 17
    return p3

    .line 18
    :cond_0
    float-to-double v0, p3

    .line 19
    const-wide v2, 0x3fb999999999999aL    # 0.1

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    sub-double/2addr v0, v2

    .line 25
    double-to-float p3, v0

    .line 26
    goto :goto_0
.end method

.method public static g(Landroid/widget/TextView;I)Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, " "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :goto_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    int-to-float v3, p1

    .line 21
    cmpl-float v2, v2, v3

    .line 22
    .line 23
    if-ltz v2, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    goto :goto_0
.end method

.method public static h(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->frameRate:F

    .line 2
    .line 3
    float-to-int p0, p0

    .line 4
    if-gtz p0, :cond_0

    .line 5
    .line 6
    const/16 p0, 0x1e

    .line 7
    .line 8
    :cond_0
    return p0
.end method
