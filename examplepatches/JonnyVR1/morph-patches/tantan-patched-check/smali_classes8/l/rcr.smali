.class public Ll/rcr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/InputFilter;


# instance fields
.field public a:I

.field public b:Ll/x20;

.field public c:Z


# direct methods
.method public constructor <init>(ILl/x20;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/rcr;->c:Z

    .line 6
    .line 7
    iput p1, p0, Ll/rcr;->a:I

    .line 8
    .line 9
    iput-object p2, p0, Ll/rcr;->b:Ll/x20;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(ILl/x20;Z)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput p1, p0, Ll/rcr;->a:I

    .line 14
    iput-object p2, p0, Ll/rcr;->b:Ll/x20;

    .line 15
    iput-boolean p3, p0, Ll/rcr;->c:Z

    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 5

    .line 1
    iget-boolean p2, p0, Ll/rcr;->c:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-static {p4}, Ll/q8g0;->J(Ljava/lang/CharSequence;)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-interface {p4}, Ljava/lang/CharSequence;->length()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    :goto_0
    iget p3, p0, Ll/rcr;->a:I

    .line 15
    .line 16
    const-string p4, ""

    .line 17
    .line 18
    if-lt p2, p3, :cond_2

    .line 19
    .line 20
    if-lt p5, p6, :cond_2

    .line 21
    .line 22
    iget-object p0, p0, Ll/rcr;->b:Ll/x20;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-interface {p0}, Ll/x20;->call()V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-object p4

    .line 30
    :cond_2
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance p3, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    array-length v0, p1

    .line 44
    const/4 v1, 0x0

    .line 45
    move v2, v1

    .line 46
    :goto_1
    if-ge v2, v0, :cond_5

    .line 47
    .line 48
    aget-char v3, p1, v2

    .line 49
    .line 50
    iget-boolean v4, p0, Ll/rcr;->c:Z

    .line 51
    .line 52
    if-eqz v4, :cond_3

    .line 53
    .line 54
    invoke-static {v3}, Ll/a9g0;->i(C)Z

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-nez v4, :cond_4

    .line 59
    .line 60
    :cond_3
    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_5
    iget v0, p0, Ll/rcr;->a:I

    .line 67
    .line 68
    sub-int/2addr v0, p2

    .line 69
    add-int/2addr v0, p6

    .line 70
    sub-int/2addr v0, p5

    .line 71
    if-gtz v0, :cond_6

    .line 72
    .line 73
    return-object p4

    .line 74
    :cond_6
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    const/4 p4, 0x0

    .line 79
    if-eqz p2, :cond_7

    .line 80
    .line 81
    return-object p4

    .line 82
    :cond_7
    iget-boolean p2, p0, Ll/rcr;->c:Z

    .line 83
    .line 84
    if-eqz p2, :cond_8

    .line 85
    .line 86
    invoke-static {p3}, Ll/q8g0;->J(Ljava/lang/CharSequence;)I

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    goto :goto_2

    .line 91
    :cond_8
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->length()I

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    :goto_2
    if-lt v0, p2, :cond_9

    .line 96
    .line 97
    return-object p4

    .line 98
    :cond_9
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->length()I

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    invoke-virtual {p3, v1, p2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    array-length p2, p1

    .line 106
    move p4, v1

    .line 107
    :goto_3
    if-ge v1, p2, :cond_c

    .line 108
    .line 109
    aget-char p5, p1, v1

    .line 110
    .line 111
    iget-boolean p6, p0, Ll/rcr;->c:Z

    .line 112
    .line 113
    const/4 v2, 0x1

    .line 114
    if-eqz p6, :cond_a

    .line 115
    .line 116
    invoke-static {p5}, Ll/a9g0;->h(C)Z

    .line 117
    .line 118
    .line 119
    move-result p6

    .line 120
    if-eqz p6, :cond_a

    .line 121
    .line 122
    const/4 v2, 0x2

    .line 123
    :cond_a
    add-int/2addr v2, p4

    .line 124
    if-gt v2, v0, :cond_b

    .line 125
    .line 126
    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    move p4, v2

    .line 130
    :cond_b
    add-int/lit8 v1, v1, 0x1

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_c
    return-object p3
.end method
