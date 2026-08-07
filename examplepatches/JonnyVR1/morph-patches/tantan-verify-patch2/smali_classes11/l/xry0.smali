.class public final Ll/xry0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ll/sqr0;Ll/w3y0;)Ll/fpy0;
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget v0, Ll/mpw0;->a:I

    .line 8
    .line 9
    const/16 v1, 0x1d

    .line 10
    .line 11
    if-lt v0, v1, :cond_6

    .line 12
    .line 13
    iget v1, p1, Ll/sqr0;->z:I

    .line 14
    .line 15
    const/4 v2, -0x1

    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    goto :goto_2

    .line 19
    :cond_0
    iget-object v1, p0, Ll/xry0;->a:Ljava/lang/Boolean;

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 25
    .line 26
    iput-object v1, p0, Ll/xry0;->a:Ljava/lang/Boolean;

    .line 27
    .line 28
    :goto_0
    iget-object p0, p1, Ll/sqr0;->l:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    iget-object v1, p1, Ll/sqr0;->i:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p0, v1}, Ll/a8t0;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_5

    .line 40
    .line 41
    invoke-static {p0}, Ll/mpw0;->u(I)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-ge v0, v1, :cond_2

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    iget v1, p1, Ll/sqr0;->y:I

    .line 49
    .line 50
    invoke-static {v1}, Ll/mpw0;->v(I)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_3

    .line 55
    .line 56
    sget-object p0, Ll/fpy0;->d:Ll/fpy0;

    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_3
    :try_start_0
    iget p1, p1, Ll/sqr0;->z:I

    .line 60
    .line 61
    invoke-static {p1, v1, p0}, Ll/mpw0;->K(III)Landroid/media/AudioFormat;

    .line 62
    .line 63
    .line 64
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    const/16 p1, 0x1f

    .line 66
    .line 67
    const/4 v1, 0x0

    .line 68
    if-lt v0, p1, :cond_4

    .line 69
    .line 70
    invoke-virtual {p2}, Ll/w3y0;->a()Ll/ttx0;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p1, p1, Ll/ttx0;->a:Landroid/media/AudioAttributes;

    .line 75
    .line 76
    invoke-static {p0, p1, v1}, Ll/wry0;->a(Landroid/media/AudioFormat;Landroid/media/AudioAttributes;Z)Ll/fpy0;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0

    .line 81
    :cond_4
    invoke-virtual {p2}, Ll/w3y0;->a()Ll/ttx0;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget-object p1, p1, Ll/ttx0;->a:Landroid/media/AudioAttributes;

    .line 86
    .line 87
    invoke-static {p0, p1, v1}, Ll/vry0;->a(Landroid/media/AudioFormat;Landroid/media/AudioAttributes;Z)Ll/fpy0;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0

    .line 92
    :catch_0
    sget-object p0, Ll/fpy0;->d:Ll/fpy0;

    .line 93
    .line 94
    return-object p0

    .line 95
    :cond_5
    :goto_1
    sget-object p0, Ll/fpy0;->d:Ll/fpy0;

    .line 96
    .line 97
    return-object p0

    .line 98
    :cond_6
    :goto_2
    sget-object p0, Ll/fpy0;->d:Ll/fpy0;

    .line 99
    .line 100
    return-object p0
.end method
