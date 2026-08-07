.class public final Ll/ypr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:I

.field public final i:I

.field public final j:I

.field public final k:I


# direct methods
.method public constructor <init>(IIIIIIIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/ypr0;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/ypr0;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/ypr0;->c:I

    .line 9
    .line 10
    iput p4, p0, Ll/ypr0;->d:I

    .line 11
    .line 12
    iput p5, p0, Ll/ypr0;->e:I

    .line 13
    .line 14
    iput p6, p0, Ll/ypr0;->f:I

    .line 15
    .line 16
    iput p7, p0, Ll/ypr0;->g:I

    .line 17
    .line 18
    iput p8, p0, Ll/ypr0;->h:I

    .line 19
    .line 20
    iput p9, p0, Ll/ypr0;->i:I

    .line 21
    .line 22
    iput p10, p0, Ll/ypr0;->j:I

    .line 23
    .line 24
    iput p11, p0, Ll/ypr0;->k:I

    .line 25
    .line 26
    return-void
.end method

.method public static a(Ljava/lang/String;)Ll/ypr0;
    .locals 14
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x7

    .line 2
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    const-string v0, ","

    .line 7
    .line 8
    invoke-static {p0, v0}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v0, 0x0

    .line 13
    const/4 v1, -0x1

    .line 14
    move v3, v1

    .line 15
    move v4, v3

    .line 16
    move v5, v4

    .line 17
    move v6, v5

    .line 18
    move v7, v6

    .line 19
    move v8, v7

    .line 20
    move v9, v8

    .line 21
    move v10, v9

    .line 22
    move v11, v10

    .line 23
    move v12, v11

    .line 24
    :goto_0
    array-length v13, p0

    .line 25
    if-ge v0, v13, :cond_1

    .line 26
    .line 27
    aget-object v2, p0, v0

    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v2}, Ll/wnw0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 38
    .line 39
    .line 40
    move-result v13

    .line 41
    sparse-switch v13, :sswitch_data_0

    .line 42
    .line 43
    .line 44
    goto/16 :goto_1

    .line 45
    .line 46
    :sswitch_0
    const-string v13, "outlinecolour"

    .line 47
    .line 48
    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_0

    .line 53
    .line 54
    move v6, v0

    .line 55
    goto/16 :goto_1

    .line 56
    .line 57
    :sswitch_1
    const-string v13, "alignment"

    .line 58
    .line 59
    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_0

    .line 64
    .line 65
    move v4, v0

    .line 66
    goto :goto_1

    .line 67
    :sswitch_2
    const-string v13, "borderstyle"

    .line 68
    .line 69
    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_0

    .line 74
    .line 75
    move v12, v0

    .line 76
    goto :goto_1

    .line 77
    :sswitch_3
    const-string v13, "fontsize"

    .line 78
    .line 79
    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_0

    .line 84
    .line 85
    move v7, v0

    .line 86
    goto :goto_1

    .line 87
    :sswitch_4
    const-string v13, "name"

    .line 88
    .line 89
    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_0

    .line 94
    .line 95
    move v3, v0

    .line 96
    goto :goto_1

    .line 97
    :sswitch_5
    const-string v13, "bold"

    .line 98
    .line 99
    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_0

    .line 104
    .line 105
    move v8, v0

    .line 106
    goto :goto_1

    .line 107
    :sswitch_6
    const-string v13, "primarycolour"

    .line 108
    .line 109
    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-eqz v2, :cond_0

    .line 114
    .line 115
    move v5, v0

    .line 116
    goto :goto_1

    .line 117
    :sswitch_7
    const-string v13, "strikeout"

    .line 118
    .line 119
    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_0

    .line 124
    .line 125
    move v11, v0

    .line 126
    goto :goto_1

    .line 127
    :sswitch_8
    const-string v13, "underline"

    .line 128
    .line 129
    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    if-eqz v2, :cond_0

    .line 134
    .line 135
    move v10, v0

    .line 136
    goto :goto_1

    .line 137
    :sswitch_9
    const-string v13, "italic"

    .line 138
    .line 139
    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    if-eqz v2, :cond_0

    .line 144
    .line 145
    move v9, v0

    .line 146
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_1
    if-eq v3, v1, :cond_2

    .line 150
    .line 151
    new-instance v2, Ll/ypr0;

    .line 152
    .line 153
    invoke-direct/range {v2 .. v13}, Ll/ypr0;-><init>(IIIIIIIIIII)V

    .line 154
    .line 155
    .line 156
    return-object v2

    .line 157
    :cond_2
    const/4 p0, 0x0

    .line 158
    return-object p0

    .line 159
    :sswitch_data_0
    .sparse-switch
        -0x4642c5d0 -> :sswitch_9
        -0x3d363934 -> :sswitch_8
        -0xb7325a4 -> :sswitch_7
        -0x43a3db2 -> :sswitch_6
        0x2e3a85 -> :sswitch_5
        0x337a8b -> :sswitch_4
        0x15d92cd0 -> :sswitch_3
        0x2dbc6505 -> :sswitch_2
        0x695fa1e3 -> :sswitch_1
        0x76840c8e -> :sswitch_0
    .end sparse-switch
.end method
