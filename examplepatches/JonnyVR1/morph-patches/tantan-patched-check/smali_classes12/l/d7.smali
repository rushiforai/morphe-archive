.class public abstract Ll/d7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/b13;

.field public final b:Ll/slj;


# direct methods
.method public constructor <init>(Ll/b13;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/d7;->a:Ll/b13;

    .line 5
    .line 6
    new-instance v0, Ll/slj;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ll/slj;-><init>(Ll/b13;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/d7;->b:Ll/slj;

    .line 12
    .line 13
    return-void
.end method

.method public static a(Ll/b13;)Ll/d7;
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/b13;->f(I)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    new-instance v0, Ll/q;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/q;-><init>(Ll/b13;)V

    .line 11
    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    const/4 v1, 0x2

    .line 15
    invoke-virtual {p0, v1}, Ll/b13;->f(I)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    new-instance v0, Ll/jt0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/jt0;-><init>(Ll/b13;)V

    .line 24
    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_1
    const/4 v1, 0x4

    .line 28
    invoke-static {p0, v0, v1}, Ll/slj;->g(Ll/b13;II)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eq v2, v1, :cond_5

    .line 33
    .line 34
    const/4 v1, 0x5

    .line 35
    if-eq v2, v1, :cond_4

    .line 36
    .line 37
    invoke-static {p0, v0, v1}, Ll/slj;->g(Ll/b13;II)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const/16 v2, 0xc

    .line 42
    .line 43
    if-eq v1, v2, :cond_3

    .line 44
    .line 45
    const/16 v2, 0xd

    .line 46
    .line 47
    if-eq v1, v2, :cond_2

    .line 48
    .line 49
    const/4 v1, 0x7

    .line 50
    invoke-static {p0, v0, v1}, Ll/slj;->g(Ll/b13;II)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    const-string v1, "11"

    .line 55
    .line 56
    const-string v2, "13"

    .line 57
    .line 58
    const-string v3, "15"

    .line 59
    .line 60
    const-string v4, "17"

    .line 61
    .line 62
    const-string v5, "310"

    .line 63
    .line 64
    const-string v6, "320"

    .line 65
    .line 66
    packed-switch v0, :pswitch_data_0

    .line 67
    .line 68
    .line 69
    const-string v0, "unknown decoder: "

    .line 70
    .line 71
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    const/4 p0, 0x0

    .line 83
    return-object p0

    .line 84
    :pswitch_0
    new-instance v0, Ll/o;

    .line 85
    .line 86
    invoke-direct {v0, p0, v6, v4}, Ll/o;-><init>(Ll/b13;Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-object v0

    .line 90
    :pswitch_1
    new-instance v0, Ll/o;

    .line 91
    .line 92
    invoke-direct {v0, p0, v5, v4}, Ll/o;-><init>(Ll/b13;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-object v0

    .line 96
    :pswitch_2
    new-instance v0, Ll/o;

    .line 97
    .line 98
    invoke-direct {v0, p0, v6, v3}, Ll/o;-><init>(Ll/b13;Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-object v0

    .line 102
    :pswitch_3
    new-instance v0, Ll/o;

    .line 103
    .line 104
    invoke-direct {v0, p0, v5, v3}, Ll/o;-><init>(Ll/b13;Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    return-object v0

    .line 108
    :pswitch_4
    new-instance v0, Ll/o;

    .line 109
    .line 110
    invoke-direct {v0, p0, v6, v2}, Ll/o;-><init>(Ll/b13;Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-object v0

    .line 114
    :pswitch_5
    new-instance v0, Ll/o;

    .line 115
    .line 116
    invoke-direct {v0, p0, v5, v2}, Ll/o;-><init>(Ll/b13;Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-object v0

    .line 120
    :pswitch_6
    new-instance v0, Ll/o;

    .line 121
    .line 122
    invoke-direct {v0, p0, v6, v1}, Ll/o;-><init>(Ll/b13;Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    return-object v0

    .line 126
    :pswitch_7
    new-instance v0, Ll/o;

    .line 127
    .line 128
    invoke-direct {v0, p0, v5, v1}, Ll/o;-><init>(Ll/b13;Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    return-object v0

    .line 132
    :cond_2
    new-instance v0, Ll/n;

    .line 133
    .line 134
    invoke-direct {v0, p0}, Ll/n;-><init>(Ll/b13;)V

    .line 135
    .line 136
    .line 137
    return-object v0

    .line 138
    :cond_3
    new-instance v0, Ll/m;

    .line 139
    .line 140
    invoke-direct {v0, p0}, Ll/m;-><init>(Ll/b13;)V

    .line 141
    .line 142
    .line 143
    return-object v0

    .line 144
    :cond_4
    new-instance v0, Ll/l;

    .line 145
    .line 146
    invoke-direct {v0, p0}, Ll/l;-><init>(Ll/b13;)V

    .line 147
    .line 148
    .line 149
    return-object v0

    .line 150
    :cond_5
    new-instance v0, Ll/k;

    .line 151
    .line 152
    invoke-direct {v0, p0}, Ll/k;-><init>(Ll/b13;)V

    .line 153
    .line 154
    .line 155
    return-object v0

    .line 156
    nop

    .line 157
    :pswitch_data_0
    .packed-switch 0x38
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final b()Ll/slj;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d7;->b:Ll/slj;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ll/b13;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d7;->a:Ll/b13;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract d()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation
.end method
