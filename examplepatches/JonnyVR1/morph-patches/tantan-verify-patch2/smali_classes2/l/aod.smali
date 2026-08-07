.class public Ll/aod;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rce;


# instance fields
.field public final a:Landroid/content/res/Resources;

.field public final b:Ll/rce;


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;Ll/rce;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/aod;->a:Landroid/content/res/Resources;

    .line 5
    .line 6
    iput-object p2, p0, Ll/aod;->b:Ll/rce;

    .line 7
    .line 8
    return-void
.end method

.method public static c(Ll/ib5;)Z
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/ib5;->x()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ll/ib5;->x()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static d(Ll/ib5;)Z
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/ib5;->V()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/ib5;->V()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, -0x1

    .line 12
    if-eq p0, v0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method


# virtual methods
.method public a(Ll/db5;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public b(Ll/db5;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "DefaultDrawableFactory#createDrawable"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    instance-of v0, p1, Ll/ib5;

    .line 13
    .line 14
    if-eqz v0, :cond_4

    .line 15
    .line 16
    check-cast p1, Ll/ib5;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 19
    .line 20
    iget-object p0, p0, Ll/aod;->a:Landroid/content/res/Resources;

    .line 21
    .line 22
    invoke-interface {p1}, Ll/ab5;->b0()Landroid/graphics/Bitmap;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-direct {v0, p0, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1}, Ll/aod;->d(Ll/ib5;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_2

    .line 34
    .line 35
    invoke-static {p1}, Ll/aod;->c(Ll/ib5;)Z

    .line 36
    .line 37
    .line 38
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    if-nez p0, :cond_2

    .line 40
    .line 41
    invoke-static {}, Ll/i9j;->d()Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    invoke-static {}, Ll/i9j;->b()V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-object v0

    .line 51
    :cond_2
    :try_start_1
    new-instance p0, Ll/a660;

    .line 52
    .line 53
    invoke-interface {p1}, Ll/ib5;->V()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-interface {p1}, Ll/ib5;->x()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    invoke-direct {p0, v0, v1, p1}, Ll/a660;-><init>(Landroid/graphics/drawable/Drawable;II)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    .line 63
    .line 64
    invoke-static {}, Ll/i9j;->d()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_3

    .line 69
    .line 70
    invoke-static {}, Ll/i9j;->b()V

    .line 71
    .line 72
    .line 73
    :cond_3
    return-object p0

    .line 74
    :cond_4
    :try_start_2
    iget-object v0, p0, Ll/aod;->b:Ll/rce;

    .line 75
    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    invoke-interface {v0, p1}, Ll/rce;->a(Ll/db5;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_6

    .line 83
    .line 84
    iget-object p0, p0, Ll/aod;->b:Ll/rce;

    .line 85
    .line 86
    invoke-interface {p0, p1}, Ll/rce;->b(Ll/db5;)Landroid/graphics/drawable/Drawable;

    .line 87
    .line 88
    .line 89
    move-result-object p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 90
    invoke-static {}, Ll/i9j;->d()Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-eqz p1, :cond_5

    .line 95
    .line 96
    invoke-static {}, Ll/i9j;->b()V

    .line 97
    .line 98
    .line 99
    :cond_5
    return-object p0

    .line 100
    :cond_6
    invoke-static {}, Ll/i9j;->d()Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    const/4 p1, 0x0

    .line 105
    if-eqz p0, :cond_7

    .line 106
    .line 107
    invoke-static {}, Ll/i9j;->b()V

    .line 108
    .line 109
    .line 110
    :cond_7
    return-object p1

    .line 111
    :catchall_0
    move-exception p0

    .line 112
    invoke-static {}, Ll/i9j;->d()Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_8

    .line 117
    .line 118
    invoke-static {}, Ll/i9j;->b()V

    .line 119
    .line 120
    .line 121
    :cond_8
    throw p0
.end method
