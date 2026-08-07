.class public Ll/wim;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:F = 1.05f


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/view/View;Ll/q3d0;)Ll/pf60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/q3d0;",
            ")",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget p0, p1, Ll/q3d0;->a:I

    .line 9
    .line 10
    :goto_0
    new-instance p1, Ll/pf60;

    .line 11
    .line 12
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-static {p0}, Ll/wim;->c(I)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-direct {p1, v0, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-object p1
.end method

.method public static b(Ljava/lang/String;Landroid/view/View;Ll/q3d0;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/wim;->a(Landroid/view/View;Ll/q3d0;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p2, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p2, Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p2, :cond_1

    .line 25
    .line 26
    new-instance p2, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p0, "?format="

    .line 35
    .line 36
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 40
    .line 41
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string p0, "x"

    .line 45
    .line 46
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 50
    .line 51
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string p0, "?format=max_"

    .line 68
    .line 69
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 73
    .line 74
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string p0, "xX"

    .line 78
    .line 79
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method

.method public static c(I)I
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    int-to-float p0, p0

    .line 6
    sget v0, Ll/wim;->a:F

    .line 7
    .line 8
    const/high16 v1, 0x42800000    # 64.0f

    .line 9
    .line 10
    mul-float/2addr v1, v0

    .line 11
    cmpg-float v1, p0, v1

    .line 12
    .line 13
    if-gez v1, :cond_1

    .line 14
    .line 15
    const/16 p0, 0x40

    .line 16
    .line 17
    return p0

    .line 18
    :cond_1
    const/high16 v1, 0x42c00000    # 96.0f

    .line 19
    .line 20
    mul-float/2addr v1, v0

    .line 21
    cmpg-float v1, p0, v1

    .line 22
    .line 23
    if-gtz v1, :cond_2

    .line 24
    .line 25
    const/16 p0, 0x60

    .line 26
    .line 27
    return p0

    .line 28
    :cond_2
    const/high16 v1, 0x43000000    # 128.0f

    .line 29
    .line 30
    mul-float/2addr v1, v0

    .line 31
    cmpg-float v1, p0, v1

    .line 32
    .line 33
    if-gtz v1, :cond_3

    .line 34
    .line 35
    const/16 p0, 0x80

    .line 36
    .line 37
    return p0

    .line 38
    :cond_3
    const/high16 v1, 0x43340000    # 180.0f

    .line 39
    .line 40
    mul-float/2addr v1, v0

    .line 41
    cmpg-float v1, p0, v1

    .line 42
    .line 43
    if-gtz v1, :cond_4

    .line 44
    .line 45
    const/16 p0, 0xb4

    .line 46
    .line 47
    return p0

    .line 48
    :cond_4
    const/high16 v1, 0x43960000    # 300.0f

    .line 49
    .line 50
    mul-float/2addr v1, v0

    .line 51
    cmpg-float v1, p0, v1

    .line 52
    .line 53
    if-gtz v1, :cond_5

    .line 54
    .line 55
    const/16 p0, 0x12c

    .line 56
    .line 57
    return p0

    .line 58
    :cond_5
    const/high16 v1, 0x43f00000    # 480.0f

    .line 59
    .line 60
    mul-float/2addr v1, v0

    .line 61
    cmpg-float v1, p0, v1

    .line 62
    .line 63
    if-gtz v1, :cond_6

    .line 64
    .line 65
    const/16 p0, 0x1e0

    .line 66
    .line 67
    return p0

    .line 68
    :cond_6
    const/high16 v1, 0x44200000    # 640.0f

    .line 69
    .line 70
    mul-float/2addr v1, v0

    .line 71
    cmpg-float v1, p0, v1

    .line 72
    .line 73
    if-gtz v1, :cond_7

    .line 74
    .line 75
    const/16 p0, 0x280

    .line 76
    .line 77
    return p0

    .line 78
    :cond_7
    const/high16 v1, 0x44340000    # 720.0f

    .line 79
    .line 80
    mul-float/2addr v0, v1

    .line 81
    cmpg-float p0, p0, v0

    .line 82
    .line 83
    if-gtz p0, :cond_8

    .line 84
    .line 85
    const/16 p0, 0x2d0

    .line 86
    .line 87
    return p0

    .line 88
    :cond_8
    const/16 p0, 0x3c0

    .line 89
    .line 90
    return p0
.end method
