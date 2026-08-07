.class public Lcom/p1/mobile/putong/core/ui/messages/ItemBase;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/x6q;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/ItemBase$BGShape;
    }
.end annotation


# static fields
.field public static j:I

.field public static k:I

.field public static l:F

.field public static m:F

.field public static n:[F

.field public static o:[F

.field public static p:[F

.field public static q:[F

.field public static r:[F

.field public static s:[F

.field public static t:[F

.field public static u:[F


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/Message;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/view/View;

.field public e:Landroid/view/View;

.field public f:Landroid/widget/RelativeLayout;

.field public g:Landroid/view/View;

.field public h:Lcom/p1/mobile/putong/data/User;

.field public i:Z


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    const-string v0, "#eeeeee"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->j:I

    .line 8
    .line 9
    const-string v0, "#00afff"

    .line 10
    .line 11
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->k:I

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Ll/eac0;->i:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/high16 v1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    sub-float/2addr v0, v1

    .line 32
    sput v0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->l:F

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget v1, Ll/eac0;->j:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    sput v0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->m:F

    .line 47
    .line 48
    sget v1, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->l:F

    .line 49
    .line 50
    const/16 v2, 0x8

    .line 51
    .line 52
    new-array v3, v2, [F

    .line 53
    .line 54
    const/4 v4, 0x0

    .line 55
    aput v1, v3, v4

    .line 56
    .line 57
    const/4 v5, 0x1

    .line 58
    aput v1, v3, v5

    .line 59
    .line 60
    const/4 v6, 0x2

    .line 61
    aput v1, v3, v6

    .line 62
    .line 63
    const/4 v7, 0x3

    .line 64
    aput v1, v3, v7

    .line 65
    .line 66
    const/4 v8, 0x4

    .line 67
    aput v1, v3, v8

    .line 68
    .line 69
    const/4 v9, 0x5

    .line 70
    aput v1, v3, v9

    .line 71
    .line 72
    const/4 v10, 0x6

    .line 73
    aput v1, v3, v10

    .line 74
    .line 75
    const/4 v11, 0x7

    .line 76
    aput v1, v3, v11

    .line 77
    .line 78
    sput-object v3, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->n:[F

    .line 79
    .line 80
    new-array v3, v2, [F

    .line 81
    .line 82
    aput v1, v3, v4

    .line 83
    .line 84
    aput v1, v3, v5

    .line 85
    .line 86
    aput v1, v3, v6

    .line 87
    .line 88
    aput v1, v3, v7

    .line 89
    .line 90
    aput v1, v3, v8

    .line 91
    .line 92
    aput v1, v3, v9

    .line 93
    .line 94
    aput v0, v3, v10

    .line 95
    .line 96
    aput v0, v3, v11

    .line 97
    .line 98
    sput-object v3, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->o:[F

    .line 99
    .line 100
    new-array v3, v2, [F

    .line 101
    .line 102
    aput v0, v3, v4

    .line 103
    .line 104
    aput v0, v3, v5

    .line 105
    .line 106
    aput v1, v3, v6

    .line 107
    .line 108
    aput v1, v3, v7

    .line 109
    .line 110
    aput v1, v3, v8

    .line 111
    .line 112
    aput v1, v3, v9

    .line 113
    .line 114
    aput v0, v3, v10

    .line 115
    .line 116
    aput v0, v3, v11

    .line 117
    .line 118
    sput-object v3, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->p:[F

    .line 119
    .line 120
    new-array v3, v2, [F

    .line 121
    .line 122
    aput v0, v3, v4

    .line 123
    .line 124
    aput v0, v3, v5

    .line 125
    .line 126
    aput v1, v3, v6

    .line 127
    .line 128
    aput v1, v3, v7

    .line 129
    .line 130
    aput v1, v3, v8

    .line 131
    .line 132
    aput v1, v3, v9

    .line 133
    .line 134
    aput v1, v3, v10

    .line 135
    .line 136
    aput v1, v3, v11

    .line 137
    .line 138
    sput-object v3, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->q:[F

    .line 139
    .line 140
    new-array v3, v2, [F

    .line 141
    .line 142
    aput v1, v3, v4

    .line 143
    .line 144
    aput v1, v3, v5

    .line 145
    .line 146
    aput v1, v3, v6

    .line 147
    .line 148
    aput v1, v3, v7

    .line 149
    .line 150
    aput v1, v3, v8

    .line 151
    .line 152
    aput v1, v3, v9

    .line 153
    .line 154
    aput v1, v3, v10

    .line 155
    .line 156
    aput v1, v3, v11

    .line 157
    .line 158
    sput-object v3, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->r:[F

    .line 159
    .line 160
    new-array v3, v2, [F

    .line 161
    .line 162
    aput v1, v3, v4

    .line 163
    .line 164
    aput v1, v3, v5

    .line 165
    .line 166
    aput v1, v3, v6

    .line 167
    .line 168
    aput v1, v3, v7

    .line 169
    .line 170
    aput v0, v3, v8

    .line 171
    .line 172
    aput v0, v3, v9

    .line 173
    .line 174
    aput v1, v3, v10

    .line 175
    .line 176
    aput v1, v3, v11

    .line 177
    .line 178
    sput-object v3, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->s:[F

    .line 179
    .line 180
    new-array v3, v2, [F

    .line 181
    .line 182
    aput v1, v3, v4

    .line 183
    .line 184
    aput v1, v3, v5

    .line 185
    .line 186
    aput v0, v3, v6

    .line 187
    .line 188
    aput v0, v3, v7

    .line 189
    .line 190
    aput v0, v3, v8

    .line 191
    .line 192
    aput v0, v3, v9

    .line 193
    .line 194
    aput v1, v3, v10

    .line 195
    .line 196
    aput v1, v3, v11

    .line 197
    .line 198
    sput-object v3, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->t:[F

    .line 199
    .line 200
    new-array v2, v2, [F

    .line 201
    .line 202
    aput v1, v2, v4

    .line 203
    .line 204
    aput v1, v2, v5

    .line 205
    .line 206
    aput v0, v2, v6

    .line 207
    .line 208
    aput v0, v2, v7

    .line 209
    .line 210
    aput v1, v2, v8

    .line 211
    .line 212
    aput v1, v2, v9

    .line 213
    .line 214
    aput v1, v2, v10

    .line 215
    .line 216
    aput v1, v2, v11

    .line 217
    .line 218
    sput-object v2, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->u:[F

    .line 219
    .line 220
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->i:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->i:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->i:Z

    return-void
.end method

.method public static b(D)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    double-to-long p0, p0

    .line 4
    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p1, 0x1

    .line 12
    const/4 v1, -0x1

    .line 13
    invoke-virtual {p0, p1, v1}, Ljava/util/Calendar;->add(II)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->e(Ljava/util/Date;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->t6:I

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->c(Ljava/util/Date;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-static {}, Ll/pzi0;->u()Ljava/text/SimpleDateFormat;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_1
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_2

    .line 59
    .line 60
    sget-object p0, Ll/pzi0;->b:Ljava/text/SimpleDateFormat;

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0

    .line 67
    :cond_2
    sget-object p0, Ll/pzi0;->g:Ljava/text/SimpleDateFormat;

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method

.method public static c(Ljava/util/Date;)Z
    .locals 3

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance v1, Ljava/util/Date;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x3

    .line 21
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-ne v2, v1, :cond_0

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-ne v0, p0, :cond_0

    .line 41
    .line 42
    return v1

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public static d(Ljava/util/Date;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Landroid/text/format/DateUtils;->isToday(J)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static e(Ljava/util/Date;)Z
    .locals 5

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, -0x1

    .line 6
    const/4 v2, 0x6

    .line 7
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->add(II)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-virtual {v1, p0}, Ljava/util/Calendar;->get(I)I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-ne v3, v4, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-ne v0, v1, :cond_0

    .line 37
    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method


# virtual methods
.method public f(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LocalStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->h()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Ll/r97;->G1()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->b:Landroid/widget/TextView;

    .line 19
    .line 20
    const/4 p1, 0x2

    .line 21
    invoke-static {p1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public g(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 9

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    new-instance p1, Ljava/util/Date;

    .line 8
    .line 9
    iget-wide v0, p3, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 10
    .line 11
    double-to-long v0, v0

    .line 12
    invoke-direct {p1, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 13
    .line 14
    .line 15
    :goto_0
    new-instance p4, Ljava/util/Date;

    .line 16
    .line 17
    iget-wide v0, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 18
    .line 19
    double-to-long v0, v0

    .line 20
    invoke-direct {p4, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Ll/r97;->E()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/16 v1, 0x8

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, v3}, Ll/o3z;->e(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->b:Landroid/widget/TextView;

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->c:Landroid/widget/TextView;

    .line 65
    .line 66
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 67
    .line 68
    .line 69
    goto/16 :goto_6

    .line 70
    .line 71
    :cond_2
    :goto_1
    const/4 v0, 0x1

    .line 72
    if-eqz p1, :cond_4

    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/util/Date;->getDate()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    invoke-virtual {p4}, Ljava/util/Date;->getDate()I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-eq p1, v3, :cond_3

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->b:Landroid/widget/TextView;

    .line 86
    .line 87
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 88
    .line 89
    .line 90
    move p1, v2

    .line 91
    goto :goto_3

    .line 92
    :cond_4
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->b:Landroid/widget/TextView;

    .line 93
    .line 94
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->b:Landroid/widget/TextView;

    .line 98
    .line 99
    iget-wide v3, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 100
    .line 101
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->b(D)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    move p1, v0

    .line 109
    :goto_3
    if-eqz p3, :cond_6

    .line 110
    .line 111
    iget-wide v3, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 112
    .line 113
    iget-wide v5, p3, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 114
    .line 115
    const-wide v7, 0x413b774000000000L    # 1800000.0

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    add-double/2addr v5, v7

    .line 121
    cmpl-double p3, v3, v5

    .line 122
    .line 123
    if-ltz p3, :cond_5

    .line 124
    .line 125
    goto :goto_4

    .line 126
    :cond_5
    move v0, p1

    .line 127
    :cond_6
    :goto_4
    if-eqz v0, :cond_8

    .line 128
    .line 129
    invoke-static {p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->d(Ljava/util/Date;)Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->b:Landroid/widget/TextView;

    .line 134
    .line 135
    if-nez p1, :cond_7

    .line 136
    .line 137
    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->b:Landroid/widget/TextView;

    .line 141
    .line 142
    iget-wide p3, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 143
    .line 144
    invoke-static {p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->b(D)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p3

    .line 148
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    .line 150
    .line 151
    goto :goto_5

    .line 152
    :cond_7
    invoke-virtual {p3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 153
    .line 154
    .line 155
    :goto_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->c:Landroid/widget/TextView;

    .line 156
    .line 157
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->c:Landroid/widget/TextView;

    .line 161
    .line 162
    sget-object p3, Ll/pzi0;->h:Ljava/text/SimpleDateFormat;

    .line 163
    .line 164
    iget-wide v3, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 165
    .line 166
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    invoke-virtual {p3, p2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p2

    .line 174
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 175
    .line 176
    .line 177
    goto :goto_6

    .line 178
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->c:Landroid/widget/TextView;

    .line 179
    .line 180
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 181
    .line 182
    .line 183
    :goto_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->c:Landroid/widget/TextView;

    .line 184
    .line 185
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-ne p1, v1, :cond_9

    .line 190
    .line 191
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->b:Landroid/widget/TextView;

    .line 192
    .line 193
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    if-ne p1, v1, :cond_9

    .line 198
    .line 199
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->d:Landroid/view/View;

    .line 200
    .line 201
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 202
    .line 203
    .line 204
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->e:Landroid/view/View;

    .line 205
    .line 206
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 207
    .line 208
    .line 209
    goto :goto_7

    .line 210
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->d:Landroid/view/View;

    .line 211
    .line 212
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 213
    .line 214
    .line 215
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->e:Landroid/view/View;

    .line 216
    .line 217
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 218
    .line 219
    .line 220
    :goto_7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->h()V

    .line 221
    .line 222
    .line 223
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 228
    .line 229
    if-eqz p1, :cond_d

    .line 230
    .line 231
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 236
    .line 237
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 238
    .line 239
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    instance-of p1, p1, Ll/yxz;

    .line 244
    .line 245
    if-eqz p1, :cond_d

    .line 246
    .line 247
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 252
    .line 253
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 254
    .line 255
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    check-cast p1, Ll/yxz;

    .line 260
    .line 261
    iget-boolean p1, p1, Ll/yxz;->M1:Z

    .line 262
    .line 263
    if-eqz p1, :cond_a

    .line 264
    .line 265
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->d:Landroid/view/View;

    .line 266
    .line 267
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 268
    .line 269
    .line 270
    move-result-object p2

    .line 271
    sget p3, Ll/ibc0;->R4:I

    .line 272
    .line 273
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 274
    .line 275
    .line 276
    move-result-object p2

    .line 277
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 278
    .line 279
    .line 280
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->b:Landroid/widget/TextView;

    .line 281
    .line 282
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 283
    .line 284
    .line 285
    move-result-object p2

    .line 286
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 287
    .line 288
    .line 289
    move-result-object p2

    .line 290
    sget p3, Ll/g9c0;->a0:I

    .line 291
    .line 292
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 293
    .line 294
    .line 295
    move-result p2

    .line 296
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 297
    .line 298
    .line 299
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->c:Landroid/widget/TextView;

    .line 300
    .line 301
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 302
    .line 303
    .line 304
    move-result-object p0

    .line 305
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    sget p2, Ll/g9c0;->a0:I

    .line 310
    .line 311
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 312
    .line 313
    .line 314
    move-result p0

    .line 315
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 316
    .line 317
    .line 318
    return-void

    .line 319
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->b:Landroid/widget/TextView;

    .line 320
    .line 321
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 322
    .line 323
    .line 324
    move-result-object p2

    .line 325
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 326
    .line 327
    .line 328
    move-result-object p2

    .line 329
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 330
    .line 331
    .line 332
    move-result-object p3

    .line 333
    invoke-virtual {p3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 334
    .line 335
    .line 336
    move-result-object p3

    .line 337
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 338
    .line 339
    .line 340
    move-result p3

    .line 341
    if-eqz p3, :cond_b

    .line 342
    .line 343
    sget p3, Ll/g9c0;->i:I

    .line 344
    .line 345
    goto :goto_8

    .line 346
    :cond_b
    sget p3, Ll/g9c0;->k:I

    .line 347
    .line 348
    :goto_8
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 349
    .line 350
    .line 351
    move-result p2

    .line 352
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 353
    .line 354
    .line 355
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->c:Landroid/widget/TextView;

    .line 356
    .line 357
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 358
    .line 359
    .line 360
    move-result-object p2

    .line 361
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 362
    .line 363
    .line 364
    move-result-object p2

    .line 365
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 366
    .line 367
    .line 368
    move-result-object p3

    .line 369
    invoke-virtual {p3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 370
    .line 371
    .line 372
    move-result-object p3

    .line 373
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 374
    .line 375
    .line 376
    move-result p3

    .line 377
    if-eqz p3, :cond_c

    .line 378
    .line 379
    sget p3, Ll/g9c0;->i:I

    .line 380
    .line 381
    goto :goto_9

    .line 382
    :cond_c
    sget p3, Ll/g9c0;->k:I

    .line 383
    .line 384
    :goto_9
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 385
    .line 386
    .line 387
    move-result p2

    .line 388
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 389
    .line 390
    .line 391
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->d:Landroid/view/View;

    .line 392
    .line 393
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 394
    .line 395
    .line 396
    :cond_d
    return-void
.end method

.method public getContentLayoutInfo()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "default content"

    .line 2
    .line 3
    return-object p0
.end method

.method public h()V
    .locals 0

    .line 1
    return-void
.end method

.method public message()Lcom/p1/mobile/putong/core/data/Message;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->n0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->e:Landroid/view/View;

    .line 11
    .line 12
    sget v1, Ll/edc0;->m0:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->d:Landroid/view/View;

    .line 19
    .line 20
    sget v1, Ll/edc0;->l0:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/widget/TextView;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->b:Landroid/widget/TextView;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->d:Landroid/view/View;

    .line 31
    .line 32
    sget v1, Ll/edc0;->F4:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Landroid/widget/TextView;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->c:Landroid/widget/TextView;

    .line 41
    .line 42
    sget v0, Ll/edc0;->d0:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->f:Landroid/widget/RelativeLayout;

    .line 51
    .line 52
    return-void
.end method

.method public setLetterUser(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->h:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-void
.end method
