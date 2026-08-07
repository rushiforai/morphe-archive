.class public Ll/x3r0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:I = 0x7fffffff


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public static a(Ll/w3r0;B)V
    .locals 1

    .line 1
    sget v0, Ll/x3r0;->a:I

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Ll/x3r0;->b(Ll/w3r0;BI)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static b(Ll/w3r0;BI)V
    .locals 3

    .line 1
    if-lez p2, :cond_4

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    packed-switch p1, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    :pswitch_0
    return-void

    .line 8
    :pswitch_1
    invoke-virtual {p0}, Ll/w3r0;->h()Ll/n3r0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    :goto_0
    iget v1, p1, Ll/n3r0;->b:I

    .line 13
    .line 14
    if-ge v0, v1, :cond_0

    .line 15
    .line 16
    iget-byte v1, p1, Ll/n3r0;->a:B

    .line 17
    .line 18
    add-int/lit8 v2, p2, -0x1

    .line 19
    .line 20
    invoke-static {p0, v1, v2}, Ll/x3r0;->b(Ll/w3r0;BI)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p0}, Ll/w3r0;->G()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :pswitch_2
    invoke-virtual {p0}, Ll/w3r0;->j()Ll/y3r0;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :goto_1
    iget v1, p1, Ll/y3r0;->b:I

    .line 35
    .line 36
    if-ge v0, v1, :cond_1

    .line 37
    .line 38
    iget-byte v1, p1, Ll/y3r0;->a:B

    .line 39
    .line 40
    add-int/lit8 v2, p2, -0x1

    .line 41
    .line 42
    invoke-static {p0, v1, v2}, Ll/x3r0;->b(Ll/w3r0;BI)V

    .line 43
    .line 44
    .line 45
    add-int/lit8 v0, v0, 0x1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    invoke-virtual {p0}, Ll/w3r0;->H()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :pswitch_3
    invoke-virtual {p0}, Ll/w3r0;->i()Ll/o3r0;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    :goto_2
    iget v1, p1, Ll/o3r0;->c:I

    .line 57
    .line 58
    if-ge v0, v1, :cond_2

    .line 59
    .line 60
    iget-byte v1, p1, Ll/o3r0;->a:B

    .line 61
    .line 62
    add-int/lit8 v2, p2, -0x1

    .line 63
    .line 64
    invoke-static {p0, v1, v2}, Ll/x3r0;->b(Ll/w3r0;BI)V

    .line 65
    .line 66
    .line 67
    iget-byte v1, p1, Ll/o3r0;->b:B

    .line 68
    .line 69
    invoke-static {p0, v1, v2}, Ll/x3r0;->b(Ll/w3r0;BI)V

    .line 70
    .line 71
    .line 72
    add-int/lit8 v0, v0, 0x1

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_2
    invoke-virtual {p0}, Ll/w3r0;->F()V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :pswitch_4
    invoke-virtual {p0}, Ll/w3r0;->k()Ll/z3r0;

    .line 80
    .line 81
    .line 82
    :goto_3
    invoke-virtual {p0}, Ll/w3r0;->g()Ll/m3r0;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iget-byte p1, p1, Ll/m3r0;->b:B

    .line 87
    .line 88
    if-nez p1, :cond_3

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/w3r0;->D()V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_3
    add-int/lit8 v0, p2, -0x1

    .line 95
    .line 96
    invoke-static {p0, p1, v0}, Ll/x3r0;->b(Ll/w3r0;BI)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ll/w3r0;->E()V

    .line 100
    .line 101
    .line 102
    goto :goto_3

    .line 103
    :pswitch_5
    invoke-virtual {p0}, Ll/w3r0;->f()Ljava/nio/ByteBuffer;

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :pswitch_6
    invoke-virtual {p0}, Ll/w3r0;->d()J

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :pswitch_7
    invoke-virtual {p0}, Ll/w3r0;->c()I

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :pswitch_8
    invoke-virtual {p0}, Ll/w3r0;->l()S

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :pswitch_9
    invoke-virtual {p0}, Ll/w3r0;->b()D

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :pswitch_a
    invoke-virtual {p0}, Ll/w3r0;->a()B

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :pswitch_b
    invoke-virtual {p0}, Ll/w3r0;->y()Z

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_4
    new-instance p0, Lcom/xiaomi/push/hu;

    .line 132
    .line 133
    const-string p1, "Maximum skip depth exceeded"

    .line 134
    .line 135
    invoke-direct {p0, p1}, Lcom/xiaomi/push/hu;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    throw p0

    .line 139
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_0
        :pswitch_8
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
