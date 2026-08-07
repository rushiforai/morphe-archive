.class public final Ll/las0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method public constructor <init>(Ll/mas0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 4

    .line 1
    check-cast p1, Ll/g8s0;

    .line 2
    .line 3
    check-cast p2, Ll/g8s0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/g8s0;->d()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p2}, Ll/g8s0;->d()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    cmpg-float p0, p0, v0

    .line 14
    .line 15
    const/4 v0, -0x1

    .line 16
    if-gez p0, :cond_0

    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    invoke-virtual {p1}, Ll/g8s0;->d()F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {p2}, Ll/g8s0;->d()F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    cmpl-float p0, p0, v1

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    if-lez p0, :cond_1

    .line 31
    .line 32
    return v1

    .line 33
    :cond_1
    invoke-virtual {p1}, Ll/g8s0;->b()F

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {p2}, Ll/g8s0;->b()F

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    cmpg-float p0, p0, v2

    .line 42
    .line 43
    if-gez p0, :cond_2

    .line 44
    .line 45
    return v0

    .line 46
    :cond_2
    invoke-virtual {p1}, Ll/g8s0;->b()F

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    invoke-virtual {p2}, Ll/g8s0;->b()F

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    cmpl-float p0, p0, v2

    .line 55
    .line 56
    if-lez p0, :cond_3

    .line 57
    .line 58
    return v1

    .line 59
    :cond_3
    invoke-virtual {p1}, Ll/g8s0;->a()F

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-virtual {p1}, Ll/g8s0;->d()F

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    sub-float/2addr p0, v2

    .line 68
    invoke-virtual {p1}, Ll/g8s0;->c()F

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    invoke-virtual {p1}, Ll/g8s0;->b()F

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    sub-float/2addr v2, p1

    .line 77
    invoke-virtual {p2}, Ll/g8s0;->a()F

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    invoke-virtual {p2}, Ll/g8s0;->d()F

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    sub-float/2addr p1, v3

    .line 86
    invoke-virtual {p2}, Ll/g8s0;->c()F

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    invoke-virtual {p2}, Ll/g8s0;->b()F

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    sub-float/2addr v3, p2

    .line 95
    mul-float/2addr p0, v2

    .line 96
    mul-float/2addr p1, v3

    .line 97
    cmpl-float p2, p0, p1

    .line 98
    .line 99
    if-lez p2, :cond_4

    .line 100
    .line 101
    return v0

    .line 102
    :cond_4
    cmpg-float p0, p0, p1

    .line 103
    .line 104
    if-gez p0, :cond_5

    .line 105
    .line 106
    return v1

    .line 107
    :cond_5
    const/4 p0, 0x0

    .line 108
    return p0
.end method
