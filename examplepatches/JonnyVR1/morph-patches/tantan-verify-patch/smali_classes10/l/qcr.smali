.class public Ll/qcr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/InputFilter;


# instance fields
.field public a:I

.field public b:Ll/x20;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput p1, p0, Ll/qcr;->a:I

    return-void
.end method

.method public constructor <init>(ILl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/qcr;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/qcr;->b:Ll/x20;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 5

    .line 1
    invoke-static {p4}, Ll/q8g0;->J(Ljava/lang/CharSequence;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget p3, p0, Ll/qcr;->a:I

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    if-lt p2, p3, :cond_1

    .line 10
    .line 11
    if-lt p5, p6, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Ll/qcr;->b:Ll/x20;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ll/x20;->call()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-object v0

    .line 21
    :cond_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance p2, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    array-length p3, p1

    .line 35
    const/4 v1, 0x0

    .line 36
    move v2, v1

    .line 37
    :goto_0
    if-ge v2, p3, :cond_3

    .line 38
    .line 39
    aget-char v3, p1, v2

    .line 40
    .line 41
    invoke-static {v3}, Ll/a9g0;->i(C)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-nez v4, :cond_2

    .line 46
    .line 47
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    iget p0, p0, Ll/qcr;->a:I

    .line 54
    .line 55
    invoke-static {p4}, Ll/q8g0;->J(Ljava/lang/CharSequence;)I

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    sub-int/2addr p0, p3

    .line 60
    add-int/2addr p0, p6

    .line 61
    sub-int/2addr p0, p5

    .line 62
    if-gtz p0, :cond_4

    .line 63
    .line 64
    return-object v0

    .line 65
    :cond_4
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p3

    .line 69
    const/4 p4, 0x0

    .line 70
    if-eqz p3, :cond_5

    .line 71
    .line 72
    return-object p4

    .line 73
    :cond_5
    invoke-static {p2}, Ll/q8g0;->J(Ljava/lang/CharSequence;)I

    .line 74
    .line 75
    .line 76
    move-result p3

    .line 77
    if-lt p0, p3, :cond_6

    .line 78
    .line 79
    return-object p4

    .line 80
    :cond_6
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    .line 81
    .line 82
    .line 83
    move-result p3

    .line 84
    invoke-virtual {p2, v1, p3}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    move p3, v1

    .line 88
    :goto_1
    array-length p4, p1

    .line 89
    if-ge v1, p4, :cond_9

    .line 90
    .line 91
    aget-char p4, p1, v1

    .line 92
    .line 93
    invoke-static {p4}, Ll/a9g0;->h(C)Z

    .line 94
    .line 95
    .line 96
    move-result p4

    .line 97
    if-eqz p4, :cond_7

    .line 98
    .line 99
    const/4 p4, 0x2

    .line 100
    goto :goto_2

    .line 101
    :cond_7
    const/4 p4, 0x1

    .line 102
    :goto_2
    add-int/2addr p4, p3

    .line 103
    if-gt p4, p0, :cond_8

    .line 104
    .line 105
    aget-char p3, p1, v1

    .line 106
    .line 107
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    move p3, p4

    .line 111
    :cond_8
    add-int/lit8 v1, v1, 0x1

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_9
    return-object p2
.end method
