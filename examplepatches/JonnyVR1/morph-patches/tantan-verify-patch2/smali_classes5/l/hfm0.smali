.class public Ll/hfm0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:[Ljava/lang/CharSequence;

.field public static b:[Ljava/lang/CharSequence;

.field public static c:[Ljava/lang/CharSequence;

.field public static d:[Ljava/lang/CharSequence;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [Ljava/lang/CharSequence;

    .line 3
    .line 4
    sput-object v1, Ll/hfm0;->a:[Ljava/lang/CharSequence;

    .line 5
    .line 6
    const/4 v1, 0x5

    .line 7
    new-array v1, v1, [Ljava/lang/CharSequence;

    .line 8
    .line 9
    sput-object v1, Ll/hfm0;->b:[Ljava/lang/CharSequence;

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    new-array v1, v1, [Ljava/lang/CharSequence;

    .line 13
    .line 14
    sput-object v1, Ll/hfm0;->c:[Ljava/lang/CharSequence;

    .line 15
    .line 16
    new-array v0, v0, [Ljava/lang/CharSequence;

    .line 17
    .line 18
    sput-object v0, Ll/hfm0;->d:[Ljava/lang/CharSequence;

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget v2, Ll/f9c0;->d:I

    .line 13
    .line 14
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-direct {v1, p0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    add-int/2addr p1, p2

    .line 34
    const/16 p2, 0x21

    .line 35
    .line 36
    invoke-virtual {v0, v1, p0, p1, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 37
    .line 38
    .line 39
    return-object v0
.end method

.method public static b(Landroid/content/Context;Ll/cfm0;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 4

    .line 1
    new-instance v0, Ljava/util/Random;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Ll/cfm0;->b:Lcom/p1/mobile/putong/data/Visitor;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Visitor;->recommendationType:Ljava/lang/String;

    .line 9
    .line 10
    const-string v2, "online"

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x2

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-static {p2}, Ll/hfm0;->c(Lcom/p1/mobile/putong/data/User;)V

    .line 20
    .line 21
    .line 22
    sget-object p0, Ll/hfm0;->a:[Ljava/lang/CharSequence;

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Ljava/util/Random;->nextInt(I)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    aget-object p0, p0, p1

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    iget-object v1, p1, Ll/cfm0;->b:Lcom/p1/mobile/putong/data/Visitor;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Visitor;->recommendationType:Ljava/lang/String;

    .line 34
    .line 35
    const-string v3, "sameCity"

    .line 36
    .line 37
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-static {p0, p2, p3}, Ll/hfm0;->e(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object p0, Ll/hfm0;->b:[Ljava/lang/CharSequence;

    .line 47
    .line 48
    const/4 p1, 0x5

    .line 49
    invoke-virtual {v0, p1}, Ljava/util/Random;->nextInt(I)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    aget-object p0, p0, p1

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_1
    iget-object p3, p1, Ll/cfm0;->b:Lcom/p1/mobile/putong/data/Visitor;

    .line 57
    .line 58
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Visitor;->recommendationType:Ljava/lang/String;

    .line 59
    .line 60
    const-string v1, "visitCount"

    .line 61
    .line 62
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    if-eqz p3, :cond_2

    .line 67
    .line 68
    iget-object p1, p1, Ll/cfm0;->b:Lcom/p1/mobile/putong/data/Visitor;

    .line 69
    .line 70
    iget p1, p1, Lcom/p1/mobile/putong/data/Visitor;->visitCount:I

    .line 71
    .line 72
    invoke-static {p0, p2, p1}, Ll/hfm0;->f(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;I)V

    .line 73
    .line 74
    .line 75
    sget-object p0, Ll/hfm0;->c:[Ljava/lang/CharSequence;

    .line 76
    .line 77
    const/4 p1, 0x3

    .line 78
    invoke-virtual {v0, p1}, Ljava/util/Random;->nextInt(I)I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    aget-object p0, p0, p1

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_2
    invoke-static {p2}, Ll/hfm0;->d(Lcom/p1/mobile/putong/data/User;)V

    .line 86
    .line 87
    .line 88
    sget-object p0, Ll/hfm0;->d:[Ljava/lang/CharSequence;

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Ljava/util/Random;->nextInt(I)I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    aget-object p0, p0, p1

    .line 95
    .line 96
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Ll/hfm0;->a:[Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, "\u5979\u6b63\u5728\u7b49\u4f60\u6765\u804a\u5929"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v1, "\u4ed6\u6b63\u5728\u7b49\u4f60\u6765\u804a\u5929"

    .line 13
    .line 14
    :goto_0
    const/4 v2, 0x0

    .line 15
    aput-object v1, v0, v2

    .line 16
    .line 17
    sget-object v0, Ll/hfm0;->a:[Ljava/lang/CharSequence;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const-string p0, "\u5979\u521a\u597d\u5728\u7ebf"

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    const-string p0, "\u4ed6\u521a\u597d\u5728\u7ebf"

    .line 29
    .line 30
    :goto_1
    const/4 v1, 0x1

    .line 31
    aput-object p0, v0, v1

    .line 32
    .line 33
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Ll/hfm0;->d:[Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, "\u5979\u5f88\u53d7\u6b22\u8fce"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v1, "\u4ed6\u5f88\u53d7\u6b22\u8fce"

    .line 13
    .line 14
    :goto_0
    const/4 v2, 0x0

    .line 15
    aput-object v1, v0, v2

    .line 16
    .line 17
    sget-object v0, Ll/hfm0;->d:[Ljava/lang/CharSequence;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const-string p0, "\u5979\u5bf9\u4f60\u5f88\u611f\u5174\u8da3"

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    const-string p0, "\u4ed6\u5bf9\u4f60\u5f88\u611f\u5174\u8da3"

    .line 29
    .line 30
    :goto_1
    const/4 v1, 0x1

    .line 31
    aput-object p0, v0, v1

    .line 32
    .line 33
    return-void
.end method

.method public static e(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Ll/hfm0;->b:[Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, "\u5979\u4e5f\u5728%s"

    .line 10
    .line 11
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {p0, v1, p2}, Ll/hfm0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string v1, "\u4ed6\u4e5f\u5728%s"

    .line 25
    .line 26
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {p0, v1, p2}, Ll/hfm0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    :goto_0
    const/4 v2, 0x0

    .line 39
    aput-object v1, v0, v2

    .line 40
    .line 41
    sget-object v0, Ll/hfm0;->b:[Ljava/lang/CharSequence;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    const-string v1, "\u5979\u5728%s\u60f3\u8ba4\u8bc6\u4f60"

    .line 50
    .line 51
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {p0, v1, p2}, Ll/hfm0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    const-string v1, "\u4ed6\u4e5f\u5728%s\u60f3\u8ba4\u8bc6\u4f60"

    .line 65
    .line 66
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-static {p0, v1, p2}, Ll/hfm0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    :goto_1
    const/4 v2, 0x1

    .line 79
    aput-object v1, v0, v2

    .line 80
    .line 81
    sget-object v0, Ll/hfm0;->b:[Ljava/lang/CharSequence;

    .line 82
    .line 83
    const-string v1, "\u4f60\u4eec\u90fd\u5728%s"

    .line 84
    .line 85
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-static {p0, v1, p2}, Ll/hfm0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    const/4 v2, 0x2

    .line 98
    aput-object v1, v0, v2

    .line 99
    .line 100
    sget-object v0, Ll/hfm0;->b:[Ljava/lang/CharSequence;

    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_2

    .line 107
    .line 108
    const-string v1, "\u5979\u4e5f\u5728%s\u60f3\u8ba4\u8bc6\u65b0\u670b\u53cb"

    .line 109
    .line 110
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-static {p0, v1, p2}, Ll/hfm0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    goto :goto_2

    .line 123
    :cond_2
    const-string v1, "\u4ed6\u4e5f\u5728%s\u60f3\u8ba4\u8bc6\u65b0\u670b\u53cb"

    .line 124
    .line 125
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-static {p0, v1, p2}, Ll/hfm0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    :goto_2
    const/4 v2, 0x3

    .line 138
    aput-object v1, v0, v2

    .line 139
    .line 140
    sget-object v0, Ll/hfm0;->b:[Ljava/lang/CharSequence;

    .line 141
    .line 142
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-eqz p1, :cond_3

    .line 147
    .line 148
    const-string p1, "\u5979\u4e5f\u5728%s\u60f3\u8ba4\u8bc6\u540c\u57ce\u7684\u670b\u53cb"

    .line 149
    .line 150
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-static {p0, p1, p2}, Ll/hfm0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    goto :goto_3

    .line 163
    :cond_3
    const-string p1, "\u4ed6\u4e5f\u5728%s\u60f3\u8ba4\u8bc6\u540c\u57ce\u7684\u670b\u53cb"

    .line 164
    .line 165
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-static {p0, p1, p2}, Ll/hfm0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    :goto_3
    const/4 p1, 0x4

    .line 178
    aput-object p0, v0, p1

    .line 179
    .line 180
    return-void
.end method

.method public static f(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;I)V
    .locals 3

    .line 1
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/visitor/e;->c(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    sget-object v0, Ll/hfm0;->c:[Ljava/lang/CharSequence;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const-string v1, "\u5979\u9891\u7e41\u8bbf\u95ee\u4e86\u4f60%s\u56de"

    .line 14
    .line 15
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {p0, v1, p2}, Ll/hfm0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string v1, "\u4ed6\u9891\u7e41\u8bbf\u95ee\u4e86\u4f60%s\u56de"

    .line 29
    .line 30
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {p0, v1, p2}, Ll/hfm0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    :goto_0
    const/4 v2, 0x0

    .line 43
    aput-object v1, v0, v2

    .line 44
    .line 45
    sget-object v0, Ll/hfm0;->c:[Ljava/lang/CharSequence;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    const-string v1, "\u5979\u5fcd\u4e0d\u4f4f\u770b\u4e86\u4f60%s\u6b21"

    .line 54
    .line 55
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {p0, v1, p2}, Ll/hfm0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    const-string v1, "\u4ed6\u5fcd\u4e0d\u4f4f\u770b\u4e86\u4f60%s\u6b21"

    .line 69
    .line 70
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-static {p0, v1, p2}, Ll/hfm0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    :goto_1
    const/4 v2, 0x1

    .line 83
    aput-object v1, v0, v2

    .line 84
    .line 85
    sget-object v0, Ll/hfm0;->c:[Ljava/lang/CharSequence;

    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-eqz p1, :cond_2

    .line 92
    .line 93
    const-string p1, "\u5979\u5077\u5077\u770b\u8fc7\u4f60%s\u6b21"

    .line 94
    .line 95
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-static {p0, p1, p2}, Ll/hfm0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    goto :goto_2

    .line 108
    :cond_2
    const-string p1, "\u4ed6\u5077\u5077\u770b\u8fc7\u4f60%s\u6b21"

    .line 109
    .line 110
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-static {p0, p1, p2}, Ll/hfm0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    :goto_2
    const/4 p1, 0x2

    .line 123
    aput-object p0, v0, p1

    .line 124
    .line 125
    return-void
.end method
