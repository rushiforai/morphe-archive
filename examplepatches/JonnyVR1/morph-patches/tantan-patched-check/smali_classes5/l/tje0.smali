.class public Ll/tje0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:I

.field public static final b:I

.field public static final c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0xe

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->f(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/tje0;->a:I

    .line 8
    .line 9
    const/16 v0, 0xc

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->f(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Ll/tje0;->b:I

    .line 16
    .line 17
    const/16 v0, 0xd

    .line 18
    .line 19
    invoke-static {v0}, Ll/qa00;->f(I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sput v0, Ll/tje0;->c:I

    .line 24
    .line 25
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

.method public static a(Landroid/view/View;Landroid/widget/TextView;)V
    .locals 2

    .line 1
    const/4 p0, 0x3

    .line 2
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 3
    .line 4
    .line 5
    const/high16 p0, 0x41200000    # 10.0f

    .line 6
    .line 7
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-virtual {p1, v0, v1, p0, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 17
    .line 18
    .line 19
    sget p0, Ll/qa00;->e:I

    .line 20
    .line 21
    int-to-float p0, p0

    .line 22
    const/high16 v0, 0x3f800000    # 1.0f

    .line 23
    .line 24
    invoke-virtual {p1, p0, v0}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/4 p1, -0x2

    .line 32
    iput p1, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 33
    .line 34
    return-void
.end method

.method public static b(II)Ll/smd0$a;
    .locals 2

    .line 1
    new-instance v0, Ll/smd0$a;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    int-to-float p1, p1

    .line 5
    invoke-direct {v0, v1, p1, p0, v1}, Ll/smd0$a;-><init>(IFIZ)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static c(Lcom/p1/mobile/putong/data/User;Landroid/content/Context;[I)Ljava/lang/CharSequence;
    .locals 13

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->en:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 8
    .line 9
    iget v1, v1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 10
    .line 11
    const/16 v2, 0x2710

    .line 12
    .line 13
    if-le v1, v2, :cond_0

    .line 14
    .line 15
    sget v0, Lcom/p1/mobile/putong/core/R$string;->dn:I

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "10+"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/16 v2, 0x3e8

    .line 25
    .line 26
    if-le v1, v2, :cond_1

    .line 27
    .line 28
    div-int/2addr v1, v2

    .line 29
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget v0, Lcom/p1/mobile/putong/core/R$string;->dn:I

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const/16 v2, 0x64

    .line 41
    .line 42
    if-le v1, v2, :cond_2

    .line 43
    .line 44
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    goto :goto_0

    .line 49
    :cond_2
    const-string v1, "100"

    .line 50
    .line 51
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    const/16 v2, 0x1e

    .line 73
    .line 74
    if-le v0, v2, :cond_3

    .line 75
    .line 76
    const-string v0, "30+"

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 80
    .line 81
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    :goto_1
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ep:I

    .line 86
    .line 87
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-virtual {p1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    new-instance v3, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 101
    .line 102
    const-string v4, "female"

    .line 103
    .line 104
    invoke-static {p0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-eqz p0, :cond_4

    .line 109
    .line 110
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Dp:I

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_4
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Cp:I

    .line 114
    .line 115
    :goto_2
    filled-new-array {v0, v5}, [Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-virtual {p1, p0, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string p0, " "

    .line 127
    .line 128
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    new-instance v3, Landroid/text/SpannableString;

    .line 136
    .line 137
    invoke-direct {v3, v4}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    if-eqz p0, :cond_5

    .line 145
    .line 146
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 147
    .line 148
    .line 149
    move-result v6

    .line 150
    sget v7, Ll/tje0;->a:I

    .line 151
    .line 152
    sget v8, Ll/tje0;->b:I

    .line 153
    .line 154
    move-object v9, p2

    .line 155
    invoke-static/range {v3 .. v9}, Ll/tje0;->m(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;III[I)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v4, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-eqz p0, :cond_5

    .line 163
    .line 164
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    move-object v6, v3

    .line 169
    move v10, v7

    .line 170
    move v11, v8

    .line 171
    move-object v12, v9

    .line 172
    move v9, p0

    .line 173
    move-object v8, v2

    .line 174
    move-object v7, v4

    .line 175
    invoke-static/range {v6 .. v12}, Ll/tje0;->m(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;III[I)V

    .line 176
    .line 177
    .line 178
    :cond_5
    return-object v3
.end method

.method public static d(Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 4
    .line 5
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 6
    .line 7
    iget v2, v2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 8
    .line 9
    invoke-static {v1, v2}, Ll/tje0;->f(Landroid/content/Context;I)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v3, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v3, Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object v3, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v3, Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    sget v2, Lcom/p1/mobile/putong/core/R$string;->In:I

    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    new-array v3, v3, [Ljava/lang/Object;

    .line 40
    .line 41
    invoke-static {v2, v3}, Ll/z090;->a(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    new-instance v3, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v10, ""

    .line 56
    .line 57
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    filled-new-array {v6, v3}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-interface {v3}, Ll/r97;->N()Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    if-eqz v3, :cond_0

    .line 85
    .line 86
    const-string v3, "\u83b7\u53d6SVIP\u89e3\u5bc6\u5979\u662f\u8c01"

    .line 87
    .line 88
    const-string v4, "\u5f00\u901a\u7279\u6743\u7acb\u5373\u548c\u5979\u804a\u5929\uff01"

    .line 89
    .line 90
    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    :cond_0
    move-object v5, v2

    .line 95
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 96
    .line 97
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Jn:I

    .line 98
    .line 99
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    new-instance v3, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 109
    .line 110
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v13

    .line 128
    new-instance v4, Landroid/text/SpannableString;

    .line 129
    .line 130
    invoke-direct {v4, v5}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 134
    .line 135
    check-cast v1, Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 138
    .line 139
    .line 140
    move-result v7

    .line 141
    sget v15, Ll/tje0;->c:I

    .line 142
    .line 143
    sget v16, Ll/tje0;->b:I

    .line 144
    .line 145
    move v8, v15

    .line 146
    move/from16 v9, v16

    .line 147
    .line 148
    invoke-static/range {v4 .. v9}, Ll/tje0;->n(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;III)V

    .line 149
    .line 150
    .line 151
    new-instance v1, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 154
    .line 155
    .line 156
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 157
    .line 158
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 169
    .line 170
    .line 171
    move-result v14

    .line 172
    move-object v11, v4

    .line 173
    move-object v12, v5

    .line 174
    invoke-static/range {v11 .. v16}, Ll/tje0;->n(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;III)V

    .line 175
    .line 176
    .line 177
    return-object v4
.end method

.method public static e(Landroid/content/Context;I)Ll/pf60;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I)",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->en:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const v1, 0x182b8

    .line 8
    .line 9
    .line 10
    if-le p1, v1, :cond_0

    .line 11
    .line 12
    sget p1, Lcom/p1/mobile/putong/core/R$string;->dn:I

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string p0, "99+"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/16 v1, 0x3e8

    .line 22
    .line 23
    if-le p1, v1, :cond_1

    .line 24
    .line 25
    div-int/2addr p1, v1

    .line 26
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    sget v0, Lcom/p1/mobile/putong/core/R$string;->dn:I

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    move-object p0, p1

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/16 p0, 0x64

    .line 39
    .line 40
    if-le p1, p0, :cond_2

    .line 41
    .line 42
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    goto :goto_0

    .line 47
    :cond_2
    const-string p0, "100"

    .line 48
    .line 49
    :goto_0
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.method public static f(Landroid/content/Context;I)Ll/pf60;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I)",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->en:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/16 v1, 0x2710

    .line 8
    .line 9
    if-le p1, v1, :cond_0

    .line 10
    .line 11
    sget p1, Lcom/p1/mobile/putong/core/R$string;->dn:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string p0, "10+"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/16 v1, 0x3e8

    .line 21
    .line 22
    if-lt p1, v1, :cond_1

    .line 23
    .line 24
    div-int/2addr p1, v1

    .line 25
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget v0, Lcom/p1/mobile/putong/core/R$string;->dn:I

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    move-object p0, p1

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/16 p0, 0x64

    .line 38
    .line 39
    if-le p1, p0, :cond_2

    .line 40
    .line 41
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const-string p0, "100"

    .line 47
    .line 48
    :goto_0
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public static g(Lcom/p1/mobile/putong/data/User;Landroid/view/View;Landroid/widget/TextView;)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    sget v0, Ll/tje0;->a:I

    .line 2
    .line 3
    sget v1, Ll/tje0;->b:I

    .line 4
    .line 5
    invoke-static {p0, p1, p2, v0, v1}, Ll/tje0;->h(Lcom/p1/mobile/putong/data/User;Landroid/view/View;Landroid/widget/TextView;II)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static h(Lcom/p1/mobile/putong/data/User;Landroid/view/View;Landroid/widget/TextView;II)Ljava/lang/CharSequence;
    .locals 6

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    invoke-static/range {v0 .. v5}, Ll/tje0;->i(Lcom/p1/mobile/putong/data/User;Landroid/view/View;Landroid/widget/TextView;II[I)Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static i(Lcom/p1/mobile/putong/data/User;Landroid/view/View;Landroid/widget/TextView;II[I)Ljava/lang/CharSequence;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const/16 v4, 0x28

    .line 20
    .line 21
    if-lt v3, v4, :cond_0

    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v3, 0x0

    .line 26
    :goto_0
    invoke-static {}, Ll/e1b;->G0()Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 31
    .line 32
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 33
    .line 34
    invoke-static {v1, v0}, Ll/tje0;->e(Landroid/content/Context;I)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v5, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v5, Ljava/lang/String;

    .line 41
    .line 42
    new-instance v6, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    iget-object v7, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v7, Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast v0, Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v9

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    sget v6, Lcom/p1/mobile/putong/core/R$string;->an:I

    .line 74
    .line 75
    invoke-virtual {v1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    if-eqz v3, :cond_1

    .line 87
    .line 88
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    sget v4, Lcom/p1/mobile/putong/core/R$string;->in:I

    .line 93
    .line 94
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    filled-new-array {v9}, [Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    :goto_1
    move-object v11, v1

    .line 107
    goto :goto_4

    .line 108
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    sget v6, Lcom/p1/mobile/putong/core/R$string;->Zm:I

    .line 113
    .line 114
    invoke-virtual {v1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    if-eqz v4, :cond_2

    .line 119
    .line 120
    move-object v6, v9

    .line 121
    goto :goto_2

    .line 122
    :cond_2
    move-object v6, v0

    .line 123
    :goto_2
    if-eqz v4, :cond_3

    .line 124
    .line 125
    move-object v4, v0

    .line 126
    goto :goto_3

    .line 127
    :cond_3
    move-object v4, v9

    .line 128
    :goto_3
    filled-new-array {v6, v4}, [Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    goto :goto_1

    .line 137
    :goto_4
    new-instance v10, Landroid/text/SpannableString;

    .line 138
    .line 139
    invoke-direct {v10, v11}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    move/from16 v12, p4

    .line 147
    .line 148
    move-object v7, v10

    .line 149
    move-object v8, v11

    .line 150
    move/from16 v11, p3

    .line 151
    .line 152
    move v10, v1

    .line 153
    invoke-static/range {v7 .. v12}, Ll/tje0;->l(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;III)V

    .line 154
    .line 155
    .line 156
    move-object v10, v7

    .line 157
    move-object v11, v8

    .line 158
    if-nez v3, :cond_4

    .line 159
    .line 160
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 161
    .line 162
    .line 163
    move-result v13

    .line 164
    move/from16 v14, p3

    .line 165
    .line 166
    move/from16 v15, p4

    .line 167
    .line 168
    move-object v12, v0

    .line 169
    invoke-static/range {v10 .. v15}, Ll/tje0;->l(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;III)V

    .line 170
    .line 171
    .line 172
    :cond_4
    invoke-static/range {p1 .. p2}, Ll/tje0;->a(Landroid/view/View;Landroid/widget/TextView;)V

    .line 173
    .line 174
    .line 175
    return-object v10
.end method

.method public static j(II)Ll/smd0$a;
    .locals 2

    .line 1
    new-instance v0, Ll/smd0$a;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    int-to-float p1, p1

    .line 5
    invoke-direct {v0, v1, p1, p0, v1}, Ll/smd0$a;-><init>(IFIZ)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static k(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 8
    .line 9
    const-string v1, "male"

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "female"

    .line 24
    .line 25
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public static l(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;III)V
    .locals 2

    .line 1
    sget v0, Ll/qa00;->d:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    new-instance v1, Ll/smd0;

    .line 12
    .line 13
    add-int/2addr p3, p1

    .line 14
    invoke-static {p3, p4}, Ll/tje0;->b(II)Ll/smd0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    const/4 p4, -0x1

    .line 19
    invoke-static {p4, p5}, Ll/tje0;->j(II)Ll/smd0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p5

    .line 23
    filled-new-array {p3, p5}, [Ll/smd0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    const p5, -0x79cb2

    .line 28
    .line 29
    .line 30
    invoke-direct {v1, v0, p5, p4, p3}, Ll/smd0;-><init>(III[Ll/smd0$a;)V

    .line 31
    .line 32
    .line 33
    add-int/2addr p2, p1

    .line 34
    const/16 p3, 0x12

    .line 35
    .line 36
    invoke-virtual {p0, v1, p1, p2, p3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static m(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;III[I)V
    .locals 3

    .line 1
    sget p6, Ll/qa00;->g:I

    .line 2
    .line 3
    const-string v0, "#ffe8aa"

    .line 4
    .line 5
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "#d59d24"

    .line 10
    .line 11
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    new-instance v2, Ll/smd0;

    .line 24
    .line 25
    add-int/2addr p3, p1

    .line 26
    invoke-static {p3, p4}, Ll/tje0;->b(II)Ll/smd0$a;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    const/4 p4, -0x1

    .line 31
    invoke-static {p4, p5}, Ll/tje0;->j(II)Ll/smd0$a;

    .line 32
    .line 33
    .line 34
    move-result-object p4

    .line 35
    filled-new-array {p3, p4}, [Ll/smd0$a;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-direct {v2, p6, v0, v1, p3}, Ll/smd0;-><init>(III[Ll/smd0$a;)V

    .line 40
    .line 41
    .line 42
    sget p3, Ll/qa00;->f:I

    .line 43
    .line 44
    sget p4, Ll/qa00;->c:I

    .line 45
    .line 46
    invoke-virtual {v2, p3, p4, p4, p4}, Ll/smd0;->c(IIII)V

    .line 47
    .line 48
    .line 49
    add-int/2addr p2, p1

    .line 50
    const/16 p3, 0x12

    .line 51
    .line 52
    invoke-virtual {p0, v2, p1, p2, p3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static n(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;III)V
    .locals 6

    .line 1
    sget v0, Ll/qa00;->g:I

    .line 2
    .line 3
    const-string v1, "#ffe8aa"

    .line 4
    .line 5
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const-string v2, "#d59d24"

    .line 10
    .line 11
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    const/4 v5, -0x1

    .line 24
    if-ne v3, v5, :cond_0

    .line 25
    .line 26
    new-instance p0, Ljava/lang/Exception;

    .line 27
    .line 28
    new-instance p3, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string p4, "renderSpanRenderEndSpace childString not find allString\uff1a"

    .line 31
    .line 32
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p1, "--childString\uff1a"

    .line 39
    .line 40
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    new-instance p1, Ll/smd0;

    .line 58
    .line 59
    add-int/2addr p3, v3

    .line 60
    invoke-static {p3, p4}, Ll/tje0;->b(II)Ll/smd0$a;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-static {v5, p5}, Ll/tje0;->j(II)Ll/smd0$a;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    filled-new-array {p2, p3}, [Ll/smd0$a;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-direct {p1, v0, v1, v2, p2}, Ll/smd0;-><init>(III[Ll/smd0$a;)V

    .line 73
    .line 74
    .line 75
    const/4 p2, 0x0

    .line 76
    invoke-virtual {p1, p2}, Ll/smd0;->a(Z)Ll/smd0;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    const/high16 p2, 0x40000000    # 2.0f

    .line 81
    .line 82
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    invoke-virtual {p1, p2}, Ll/smd0;->d(I)V

    .line 87
    .line 88
    .line 89
    add-int/2addr v4, v3

    .line 90
    const/16 p2, 0x12

    .line 91
    .line 92
    invoke-virtual {p0, p1, v3, v4, p2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 93
    .line 94
    .line 95
    return-void
.end method
