.class public Ll/e9j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a1j0;


# instance fields
.field public a:J

.field public b:I


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
.method public a(Ll/nyv;)Ll/nyv;
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget v2, p0, Ll/e9j;->b:I

    .line 6
    .line 7
    add-int/lit8 v2, v2, 0x1

    .line 8
    .line 9
    iput v2, p0, Ll/e9j;->b:I

    .line 10
    .line 11
    iget-wide v2, p0, Ll/e9j;->a:J

    .line 12
    .line 13
    const-wide/16 v4, 0x0

    .line 14
    .line 15
    cmp-long v4, v2, v4

    .line 16
    .line 17
    if-eqz v4, :cond_2

    .line 18
    .line 19
    sub-long v2, v0, v2

    .line 20
    .line 21
    invoke-static {}, Ll/msh0;->h()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    mul-int/lit16 v4, v4, 0x3e8

    .line 26
    .line 27
    int-to-long v4, v4

    .line 28
    cmp-long v2, v2, v4

    .line 29
    .line 30
    if-ltz v2, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget v2, p0, Ll/e9j;->b:I

    .line 34
    .line 35
    invoke-static {}, Ll/msh0;->g()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-lt v2, v3, :cond_1

    .line 40
    .line 41
    iget-wide v2, p0, Ll/e9j;->a:J

    .line 42
    .line 43
    sub-long/2addr v0, v2

    .line 44
    invoke-static {}, Ll/msh0;->h()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    mul-int/lit16 p0, p0, 0x3e8

    .line 49
    .line 50
    int-to-long v2, p0

    .line 51
    cmp-long p0, v0, v2

    .line 52
    .line 53
    if-gez p0, :cond_1

    .line 54
    .line 55
    invoke-static {}, Ll/msh0;->g()I

    .line 56
    .line 57
    .line 58
    const/4 p0, 0x0

    .line 59
    return-object p0

    .line 60
    :cond_1
    return-object p1

    .line 61
    :cond_2
    :goto_0
    iput-wide v0, p0, Ll/e9j;->a:J

    .line 62
    .line 63
    iget v0, p0, Ll/e9j;->b:I

    .line 64
    .line 65
    invoke-static {}, Ll/msh0;->g()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    sub-int/2addr v0, v1

    .line 70
    if-lez v0, :cond_3

    .line 71
    .line 72
    new-instance v1, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    iget-object v2, p1, Ll/nyv;->b:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v2, "  warning\uff01 warning\uff01 warning\uff01\u4e0a\u4e00\u6b21\u53d1\u751f\u4e22\u5f03 \u5171\u4e22\u5f03 \uff1a "

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iput-object v0, p1, Ll/nyv;->b:Ljava/lang/String;

    .line 95
    .line 96
    :cond_3
    const/4 v0, 0x0

    .line 97
    iput v0, p0, Ll/e9j;->b:I

    .line 98
    .line 99
    return-object p1
.end method
