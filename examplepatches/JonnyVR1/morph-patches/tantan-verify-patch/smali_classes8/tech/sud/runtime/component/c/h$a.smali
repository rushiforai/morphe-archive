.class public Ltech/sud/runtime/component/c/h$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/c/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field private static a:I = -0x1


# direct methods
.method public static a(Landroid/content/Context;I)I
    .locals 5

    .line 1
    sget v0, Ltech/sud/runtime/component/c/h$a;->a:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x3

    .line 5
    const/4 v3, 0x2

    .line 6
    const/4 v4, 0x1

    .line 7
    if-gez v0, :cond_5

    .line 8
    .line 9
    new-instance v0, Landroid/util/DisplayMetrics;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 12
    .line 13
    .line 14
    check-cast p0, Landroid/app/Activity;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, v0}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 25
    .line 26
    .line 27
    iget p0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 28
    .line 29
    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    if-ne p1, v3, :cond_1

    .line 34
    .line 35
    :cond_0
    if-gt v0, p0, :cond_4

    .line 36
    .line 37
    :cond_1
    if-eq p1, v4, :cond_2

    .line 38
    .line 39
    if-ne p1, v2, :cond_3

    .line 40
    .line 41
    :cond_2
    if-le p0, v0, :cond_3

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_3
    sput v4, Ltech/sud/runtime/component/c/h$a;->a:I

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_4
    :goto_0
    sput v1, Ltech/sud/runtime/component/c/h$a;->a:I

    .line 48
    .line 49
    :cond_5
    :goto_1
    sget p0, Ltech/sud/runtime/component/c/h$a;->a:I

    .line 50
    .line 51
    if-nez p0, :cond_a

    .line 52
    .line 53
    if-eqz p1, :cond_9

    .line 54
    .line 55
    if-eq p1, v4, :cond_8

    .line 56
    .line 57
    if-eq p1, v3, :cond_7

    .line 58
    .line 59
    if-eq p1, v2, :cond_6

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_6
    return v2

    .line 63
    :cond_7
    return v3

    .line 64
    :cond_8
    return v4

    .line 65
    :cond_9
    return v1

    .line 66
    :cond_a
    if-eqz p1, :cond_e

    .line 67
    .line 68
    if-eq p1, v4, :cond_d

    .line 69
    .line 70
    if-eq p1, v3, :cond_c

    .line 71
    .line 72
    if-eq p1, v2, :cond_b

    .line 73
    .line 74
    :goto_2
    const/4 p0, 0x4

    .line 75
    return p0

    .line 76
    :cond_b
    return v3

    .line 77
    :cond_c
    return v4

    .line 78
    :cond_d
    return v1

    .line 79
    :cond_e
    return v2
.end method
