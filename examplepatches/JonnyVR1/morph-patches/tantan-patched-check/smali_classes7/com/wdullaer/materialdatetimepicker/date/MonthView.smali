.class public abstract Lcom/wdullaer/materialdatetimepicker/date/MonthView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/date/MonthView$b;,
        Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;
    }
.end annotation


# static fields
.field protected static N:I = 0x20

.field protected static O:I = 0xa

.field protected static P:I = 0x1

.field protected static Q:I

.field protected static R:I

.field protected static S:I

.field protected static T:I

.field protected static U:I


# instance fields
.field protected final A:Ljava/util/Calendar;

.field private final B:Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;

.field protected C:I

.field protected D:Lcom/wdullaer/materialdatetimepicker/date/MonthView$b;

.field private E:Z

.field protected F:I

.field protected G:I

.field protected H:I

.field protected I:I

.field protected J:I

.field protected K:I

.field protected L:I

.field private M:I

.field protected a:Lcom/wdullaer/materialdatetimepicker/date/a;

.field protected b:I

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field protected e:Landroid/graphics/Paint;

.field protected f:Landroid/graphics/Paint;

.field protected g:Landroid/graphics/Paint;

.field protected h:Landroid/graphics/Paint;

.field private final i:Ljava/util/Formatter;

.field private final j:Ljava/lang/StringBuilder;

.field protected k:I

.field protected l:I

.field protected m:I

.field protected n:I

.field protected o:I

.field protected p:I

.field protected q:I

.field protected r:Z

.field protected s:I

.field protected t:I

.field protected u:I

.field protected v:I

.field protected w:I

.field protected x:I

.field protected y:I

.field private final z:Ljava/util/Calendar;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 266
    invoke-direct {p0, p1, v0, v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/wdullaer/materialdatetimepicker/date/a;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/wdullaer/materialdatetimepicker/date/a;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->b:I

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->k:I

    .line 9
    .line 10
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->l:I

    .line 11
    .line 12
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->m:I

    .line 13
    .line 14
    sget v1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->N:I

    .line 15
    .line 16
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->q:I

    .line 17
    .line 18
    iput-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->r:Z

    .line 19
    .line 20
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->s:I

    .line 21
    .line 22
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->t:I

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->u:I

    .line 26
    .line 27
    const/4 v2, 0x7

    .line 28
    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->v:I

    .line 29
    .line 30
    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->w:I

    .line 31
    .line 32
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->x:I

    .line 33
    .line 34
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->y:I

    .line 35
    .line 36
    const/4 v0, 0x6

    .line 37
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->C:I

    .line 38
    .line 39
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->M:I

    .line 40
    .line 41
    iput-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->a:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    iput-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->A:Ljava/util/Calendar;

    .line 52
    .line 53
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    iput-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->z:Ljava/util/Calendar;

    .line 58
    .line 59
    sget p3, Lcom/wdullaer/materialdatetimepicker/R$string;->e:I

    .line 60
    .line 61
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p3

    .line 65
    iput-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->c:Ljava/lang/String;

    .line 66
    .line 67
    sget p3, Lcom/wdullaer/materialdatetimepicker/R$string;->p:I

    .line 68
    .line 69
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    iput-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->d:Ljava/lang/String;

    .line 74
    .line 75
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->a:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 76
    .line 77
    if-eqz p3, :cond_0

    .line 78
    .line 79
    invoke-interface {p3}, Lcom/wdullaer/materialdatetimepicker/date/a;->z()Z

    .line 80
    .line 81
    .line 82
    move-result p3

    .line 83
    if-eqz p3, :cond_0

    .line 84
    .line 85
    sget p3, Ll/q9c0;->o:I

    .line 86
    .line 87
    invoke-static {p1, p3}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 88
    .line 89
    .line 90
    move-result p3

    .line 91
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->F:I

    .line 92
    .line 93
    sget p3, Ll/q9c0;->i:I

    .line 94
    .line 95
    invoke-static {p1, p3}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 96
    .line 97
    .line 98
    move-result p3

    .line 99
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->H:I

    .line 100
    .line 101
    sget p3, Ll/q9c0;->k:I

    .line 102
    .line 103
    invoke-static {p1, p3}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 104
    .line 105
    .line 106
    move-result p3

    .line 107
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->K:I

    .line 108
    .line 109
    sget p3, Ll/q9c0;->m:I

    .line 110
    .line 111
    invoke-static {p1, p3}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 112
    .line 113
    .line 114
    move-result p3

    .line 115
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->J:I

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_0
    sget p3, Ll/q9c0;->n:I

    .line 119
    .line 120
    invoke-static {p1, p3}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 121
    .line 122
    .line 123
    move-result p3

    .line 124
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->F:I

    .line 125
    .line 126
    sget p3, Ll/q9c0;->h:I

    .line 127
    .line 128
    invoke-static {p1, p3}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 129
    .line 130
    .line 131
    move-result p3

    .line 132
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->H:I

    .line 133
    .line 134
    sget p3, Ll/q9c0;->j:I

    .line 135
    .line 136
    invoke-static {p1, p3}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 137
    .line 138
    .line 139
    move-result p3

    .line 140
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->K:I

    .line 141
    .line 142
    sget p3, Ll/q9c0;->l:I

    .line 143
    .line 144
    invoke-static {p1, p3}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 145
    .line 146
    .line 147
    move-result p3

    .line 148
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->J:I

    .line 149
    .line 150
    :goto_0
    sget p3, Ll/q9c0;->u:I

    .line 151
    .line 152
    invoke-static {p1, p3}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 153
    .line 154
    .line 155
    move-result p3

    .line 156
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->G:I

    .line 157
    .line 158
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->a:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 159
    .line 160
    invoke-interface {p3}, Lcom/wdullaer/materialdatetimepicker/date/a;->u()I

    .line 161
    .line 162
    .line 163
    move-result p3

    .line 164
    iput p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->I:I

    .line 165
    .line 166
    sget p3, Ll/q9c0;->u:I

    .line 167
    .line 168
    invoke-static {p1, p3}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->L:I

    .line 173
    .line 174
    new-instance p1, Ljava/lang/StringBuilder;

    .line 175
    .line 176
    const/16 p3, 0x32

    .line 177
    .line 178
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 179
    .line 180
    .line 181
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->j:Ljava/lang/StringBuilder;

    .line 182
    .line 183
    new-instance p3, Ljava/util/Formatter;

    .line 184
    .line 185
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-direct {p3, p1, v2}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;Ljava/util/Locale;)V

    .line 190
    .line 191
    .line 192
    iput-object p3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->i:Ljava/util/Formatter;

    .line 193
    .line 194
    sget p1, Ll/mac0;->c:I

    .line 195
    .line 196
    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    sput p1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->Q:I

    .line 201
    .line 202
    sget p1, Ll/mac0;->f:I

    .line 203
    .line 204
    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 205
    .line 206
    .line 207
    move-result p1

    .line 208
    sput p1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->R:I

    .line 209
    .line 210
    sget p1, Ll/mac0;->e:I

    .line 211
    .line 212
    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    sput p1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->S:I

    .line 217
    .line 218
    sget p1, Ll/mac0;->g:I

    .line 219
    .line 220
    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    sput p1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->T:I

    .line 225
    .line 226
    sget p1, Ll/mac0;->b:I

    .line 227
    .line 228
    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    sput p1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->U:I

    .line 233
    .line 234
    sget p1, Ll/mac0;->a:I

    .line 235
    .line 236
    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthHeaderSize()I

    .line 241
    .line 242
    .line 243
    move-result p2

    .line 244
    sub-int/2addr p1, p2

    .line 245
    div-int/2addr p1, v0

    .line 246
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->q:I

    .line 247
    .line 248
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthViewTouchHelper()Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->B:Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;

    .line 253
    .line 254
    invoke-static {p0, p1}, Ll/kkl0;->j0(Landroid/view/View;Ll/fb;)V

    .line 255
    .line 256
    .line 257
    invoke-static {p0, v1}, Ll/kkl0;->t0(Landroid/view/View;I)V

    .line 258
    .line 259
    .line 260
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->E:Z

    .line 261
    .line 262
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->k()V

    .line 263
    .line 264
    .line 265
    return-void
.end method

.method public static synthetic a(Lcom/wdullaer/materialdatetimepicker/date/MonthView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->m(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->g()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->w:I

    .line 6
    .line 7
    add-int v2, v0, v1

    .line 8
    .line 9
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->v:I

    .line 10
    .line 11
    div-int/2addr v2, p0

    .line 12
    add-int/2addr v0, v1

    .line 13
    rem-int/2addr v0, p0

    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    add-int/2addr v2, p0

    .line 20
    return v2
.end method

.method private getMonthAndYearString()Ljava/lang/String;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "MMMM yyyy"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/format/DateFormat;->getBestDateTimePattern(Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, Ljava/text/SimpleDateFormat;

    .line 12
    .line 13
    invoke-direct {v2, v1, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, v1}, Ljava/text/SimpleDateFormat;->applyLocalizedPattern(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->j:Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->z:Ljava/util/Calendar;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v2, p0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method private j(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 6
    .line 7
    const-string v1, "EEEEE"

    .line 8
    .line 9
    invoke-direct {v0, v1, p0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method private m(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->a:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 2
    .line 3
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->o:I

    .line 4
    .line 5
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->n:I

    .line 6
    .line 7
    invoke-interface {v0, v1, v2, p1}, Lcom/wdullaer/materialdatetimepicker/date/a;->e0(III)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->D:Lcom/wdullaer/materialdatetimepicker/date/MonthView$b;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 19
    .line 20
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->o:I

    .line 21
    .line 22
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->n:I

    .line 23
    .line 24
    invoke-direct {v1, v2, v3, p1}, Lcom/wdullaer/materialdatetimepicker/date/b$a;-><init>(III)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v0, p0, v1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$b;->a(Lcom/wdullaer/materialdatetimepicker/date/MonthView;Lcom/wdullaer/materialdatetimepicker/date/b$a;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->B:Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    invoke-virtual {p0, p1, v0}, Ll/dpf;->sendEventForVirtualView(II)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private p(ILjava/util/Calendar;)Z
    .locals 3

    .line 1
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->o:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p2, v1}, Ljava/util/Calendar;->get(I)I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    if-ne v0, v2, :cond_0

    .line 9
    .line 10
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->n:I

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    invoke-virtual {p2, v0}, Ljava/util/Calendar;->get(I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-ne p0, v0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x5

    .line 20
    invoke-virtual {p2, p0}, Ljava/util/Calendar;->get(I)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-ne p1, p0, :cond_0

    .line 25
    .line 26
    return v1

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method


# virtual methods
.method public abstract c(Landroid/graphics/Canvas;IIIIIIIII)V
.end method

.method public d(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthHeaderSize()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget v1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->S:I

    .line 6
    .line 7
    div-int/lit8 v1, v1, 0x2

    .line 8
    .line 9
    sub-int/2addr v0, v1

    .line 10
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->p:I

    .line 11
    .line 12
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->b:I

    .line 13
    .line 14
    mul-int/lit8 v2, v2, 0x2

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->v:I

    .line 18
    .line 19
    mul-int/lit8 v2, v2, 0x2

    .line 20
    .line 21
    div-int/2addr v1, v2

    .line 22
    const/4 v2, 0x0

    .line 23
    :goto_0
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->v:I

    .line 24
    .line 25
    if-ge v2, v3, :cond_0

    .line 26
    .line 27
    mul-int/lit8 v4, v2, 0x2

    .line 28
    .line 29
    add-int/lit8 v4, v4, 0x1

    .line 30
    .line 31
    mul-int/2addr v4, v1

    .line 32
    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->b:I

    .line 33
    .line 34
    add-int/2addr v4, v5

    .line 35
    iget v5, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->u:I

    .line 36
    .line 37
    add-int/2addr v5, v2

    .line 38
    rem-int/2addr v5, v3

    .line 39
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->A:Ljava/util/Calendar;

    .line 40
    .line 41
    const/4 v6, 0x7

    .line 42
    invoke-virtual {v3, v6, v5}, Ljava/util/Calendar;->set(II)V

    .line 43
    .line 44
    .line 45
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->A:Ljava/util/Calendar;

    .line 46
    .line 47
    invoke-direct {p0, v3}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->j(Ljava/util/Calendar;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    int-to-float v4, v4

    .line 52
    int-to-float v5, v0

    .line 53
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->h:Landroid/graphics/Paint;

    .line 54
    .line 55
    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 56
    .line 57
    .line 58
    add-int/lit8 v2, v2, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    return-void
.end method

.method public dispatchHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->B:Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/dpf;->dispatchHoverEvent(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->dispatchHoverEvent(Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public e(Landroid/graphics/Canvas;)V
    .locals 14

    .line 1
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->q:I

    .line 2
    .line 3
    sget v2, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->Q:I

    .line 4
    .line 5
    add-int/2addr v1, v2

    .line 6
    div-int/lit8 v1, v1, 0x2

    .line 7
    .line 8
    sget v2, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->P:I

    .line 9
    .line 10
    sub-int/2addr v1, v2

    .line 11
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthHeaderSize()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    add-int/2addr v1, v2

    .line 16
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->p:I

    .line 17
    .line 18
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->b:I

    .line 19
    .line 20
    mul-int/lit8 v3, v3, 0x2

    .line 21
    .line 22
    sub-int/2addr v2, v3

    .line 23
    int-to-float v2, v2

    .line 24
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->v:I

    .line 25
    .line 26
    int-to-float v3, v3

    .line 27
    const/high16 v4, 0x40000000    # 2.0f

    .line 28
    .line 29
    mul-float/2addr v3, v4

    .line 30
    div-float v11, v2, v3

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->g()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    const/4 v12, 0x1

    .line 37
    move v6, v1

    .line 38
    move v13, v2

    .line 39
    move v4, v12

    .line 40
    :goto_0
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->w:I

    .line 41
    .line 42
    if-gt v4, v1, :cond_1

    .line 43
    .line 44
    mul-int/lit8 v1, v13, 0x2

    .line 45
    .line 46
    add-int/2addr v1, v12

    .line 47
    int-to-float v1, v1

    .line 48
    mul-float/2addr v1, v11

    .line 49
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->b:I

    .line 50
    .line 51
    int-to-float v2, v2

    .line 52
    add-float/2addr v1, v2

    .line 53
    float-to-int v5, v1

    .line 54
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->q:I

    .line 55
    .line 56
    sget v2, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->Q:I

    .line 57
    .line 58
    add-int/2addr v2, v1

    .line 59
    div-int/lit8 v2, v2, 0x2

    .line 60
    .line 61
    sget v3, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->P:I

    .line 62
    .line 63
    sub-int/2addr v2, v3

    .line 64
    int-to-float v3, v5

    .line 65
    sub-float v7, v3, v11

    .line 66
    .line 67
    float-to-int v7, v7

    .line 68
    add-float/2addr v3, v11

    .line 69
    float-to-int v8, v3

    .line 70
    sub-int v9, v6, v2

    .line 71
    .line 72
    add-int v10, v9, v1

    .line 73
    .line 74
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->o:I

    .line 75
    .line 76
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->n:I

    .line 77
    .line 78
    move-object v0, p0

    .line 79
    move-object v1, p1

    .line 80
    invoke-virtual/range {v0 .. v10}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->c(Landroid/graphics/Canvas;IIIIIIIII)V

    .line 81
    .line 82
    .line 83
    add-int/2addr v13, v12

    .line 84
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->v:I

    .line 85
    .line 86
    if-ne v13, v1, :cond_0

    .line 87
    .line 88
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->q:I

    .line 89
    .line 90
    add-int/2addr v6, v1

    .line 91
    const/4 v1, 0x0

    .line 92
    move v13, v1

    .line 93
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_1
    return-void
.end method

.method public f(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->p:I

    .line 2
    .line 3
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->b:I

    .line 4
    .line 5
    mul-int/lit8 v1, v1, 0x2

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    div-int/lit8 v0, v0, 0x2

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthHeaderSize()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sget v2, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->S:I

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    div-int/lit8 v1, v1, 0x2

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthAndYearString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    int-to-float v0, v0

    .line 24
    int-to-float v1, v1

    .line 25
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->f:Landroid/graphics/Paint;

    .line 26
    .line 27
    invoke-virtual {p1, v2, v0, v1, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public g()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->M:I

    .line 2
    .line 3
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->u:I

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->v:I

    .line 8
    .line 9
    add-int/2addr v0, p0

    .line 10
    :cond_0
    sub-int/2addr v0, v1

    .line 11
    return v0
.end method

.method public getAccessibilityFocus()Lcom/wdullaer/materialdatetimepicker/date/b$a;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->B:Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dpf;->getFocusedVirtualView()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ltz v0, :cond_0

    .line 8
    .line 9
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/date/b$a;

    .line 10
    .line 11
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->o:I

    .line 12
    .line 13
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->n:I

    .line 14
    .line 15
    invoke-direct {v1, v2, p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/b$a;-><init>(III)V

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public getMonth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getMonthHeaderSize()I
    .locals 0

    .line 1
    sget p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->T:I

    .line 2
    .line 3
    return p0
.end method

.method public getMonthViewTouchHelper()Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;-><init>(Lcom/wdullaer/materialdatetimepicker/date/MonthView;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public getYear()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public h(FF)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->i(FF)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x1

    .line 6
    if-lt p1, p2, :cond_1

    .line 7
    .line 8
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->w:I

    .line 9
    .line 10
    if-le p1, p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return p1

    .line 14
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 15
    return p0
.end method

.method public i(FF)I
    .locals 3

    .line 1
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->b:I

    .line 2
    .line 3
    int-to-float v1, v0

    .line 4
    cmpg-float v2, p1, v1

    .line 5
    .line 6
    if-ltz v2, :cond_1

    .line 7
    .line 8
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->p:I

    .line 9
    .line 10
    sub-int/2addr v2, v0

    .line 11
    int-to-float v2, v2

    .line 12
    cmpl-float v2, p1, v2

    .line 13
    .line 14
    if-lez v2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthHeaderSize()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    int-to-float v2, v2

    .line 22
    sub-float/2addr p2, v2

    .line 23
    float-to-int p2, p2

    .line 24
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->q:I

    .line 25
    .line 26
    div-int/2addr p2, v2

    .line 27
    sub-float/2addr p1, v1

    .line 28
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->v:I

    .line 29
    .line 30
    int-to-float v1, v1

    .line 31
    mul-float/2addr p1, v1

    .line 32
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->p:I

    .line 33
    .line 34
    sub-int/2addr v1, v0

    .line 35
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->b:I

    .line 36
    .line 37
    sub-int/2addr v1, v0

    .line 38
    int-to-float v0, v1

    .line 39
    div-float/2addr p1, v0

    .line 40
    float-to-int p1, p1

    .line 41
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->g()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    sub-int/2addr p1, v0

    .line 46
    add-int/lit8 p1, p1, 0x1

    .line 47
    .line 48
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->v:I

    .line 49
    .line 50
    mul-int/2addr p2, p0

    .line 51
    add-int/2addr p1, p2

    .line 52
    return p1

    .line 53
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 54
    return p0
.end method

.method public k()V
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->f:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->f:Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->f:Landroid/graphics/Paint;

    .line 18
    .line 19
    sget v2, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->R:I

    .line 20
    .line 21
    int-to-float v2, v2

    .line 22
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->f:Landroid/graphics/Paint;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->d:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v2, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->f:Landroid/graphics/Paint;

    .line 37
    .line 38
    iget v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->F:I

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->f:Landroid/graphics/Paint;

    .line 44
    .line 45
    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->f:Landroid/graphics/Paint;

    .line 51
    .line 52
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Landroid/graphics/Paint;

    .line 58
    .line 59
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->g:Landroid/graphics/Paint;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->g:Landroid/graphics/Paint;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->g:Landroid/graphics/Paint;

    .line 73
    .line 74
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->I:I

    .line 75
    .line 76
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->g:Landroid/graphics/Paint;

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->g:Landroid/graphics/Paint;

    .line 85
    .line 86
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->g:Landroid/graphics/Paint;

    .line 90
    .line 91
    const/16 v4, 0xff

    .line 92
    .line 93
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 94
    .line 95
    .line 96
    new-instance v0, Landroid/graphics/Paint;

    .line 97
    .line 98
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 99
    .line 100
    .line 101
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->h:Landroid/graphics/Paint;

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->h:Landroid/graphics/Paint;

    .line 107
    .line 108
    sget v4, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->S:I

    .line 109
    .line 110
    int-to-float v4, v4

    .line 111
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->h:Landroid/graphics/Paint;

    .line 115
    .line 116
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->H:I

    .line 117
    .line 118
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->h:Landroid/graphics/Paint;

    .line 122
    .line 123
    invoke-static {}, Ll/na00;->a()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    invoke-static {v4}, Ll/ooj0;->a(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->h:Landroid/graphics/Paint;

    .line 135
    .line 136
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->h:Landroid/graphics/Paint;

    .line 140
    .line 141
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->h:Landroid/graphics/Paint;

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 147
    .line 148
    .line 149
    new-instance v0, Landroid/graphics/Paint;

    .line 150
    .line 151
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 152
    .line 153
    .line 154
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->e:Landroid/graphics/Paint;

    .line 155
    .line 156
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->e:Landroid/graphics/Paint;

    .line 160
    .line 161
    sget v1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->Q:I

    .line 162
    .line 163
    int-to-float v1, v1

    .line 164
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->e:Landroid/graphics/Paint;

    .line 168
    .line 169
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->e:Landroid/graphics/Paint;

    .line 173
    .line 174
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 175
    .line 176
    .line 177
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->e:Landroid/graphics/Paint;

    .line 178
    .line 179
    const/4 v0, 0x0

    .line 180
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 181
    .line 182
    .line 183
    return-void
.end method

.method public l(III)Z
    .locals 7

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->a:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/wdullaer/materialdatetimepicker/date/a;->n3()[Ljava/util/Calendar;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    array-length v1, p0

    .line 12
    move v2, v0

    .line 13
    :goto_0
    if-ge v2, v1, :cond_7

    .line 14
    .line 15
    aget-object v3, p0, v2

    .line 16
    .line 17
    const/4 v4, 0x1

    .line 18
    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    if-ge p1, v5, :cond_1

    .line 23
    .line 24
    goto :goto_2

    .line 25
    :cond_1
    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    if-le p1, v5, :cond_2

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_2
    const/4 v5, 0x2

    .line 33
    invoke-virtual {v3, v5}, Ljava/util/Calendar;->get(I)I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    if-ge p2, v6, :cond_3

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_3
    invoke-virtual {v3, v5}, Ljava/util/Calendar;->get(I)I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    if-le p2, v5, :cond_4

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_4
    const/4 v5, 0x5

    .line 48
    invoke-virtual {v3, v5}, Ljava/util/Calendar;->get(I)I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    if-ge p3, v6, :cond_5

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_5
    invoke-virtual {v3, v5}, Ljava/util/Calendar;->get(I)I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-le p3, v3, :cond_6

    .line 60
    .line 61
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_6
    return v4

    .line 65
    :cond_7
    :goto_2
    return v0
.end method

.method public n(Lcom/wdullaer/materialdatetimepicker/date/b$a;)Z
    .locals 2

    .line 1
    iget v0, p1, Lcom/wdullaer/materialdatetimepicker/date/b$a;->b:I

    .line 2
    .line 3
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->o:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_1

    .line 6
    .line 7
    iget v0, p1, Lcom/wdullaer/materialdatetimepicker/date/b$a;->c:I

    .line 8
    .line 9
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->n:I

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    iget p1, p1, Lcom/wdullaer/materialdatetimepicker/date/b$a;->d:I

    .line 14
    .line 15
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->w:I

    .line 16
    .line 17
    if-le p1, v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->B:Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;->c(I)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public o()V
    .locals 1

    .line 1
    const/4 v0, 0x6

    .line 2
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->C:I

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->f(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->d(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->e(Landroid/graphics/Canvas;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->q:I

    .line 6
    .line 7
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->C:I

    .line 8
    .line 9
    mul-int/2addr p2, v0

    .line 10
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthHeaderSize()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    add-int/2addr p2, v0

    .line 15
    add-int/lit8 p2, p2, 0x5

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->p:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->B:Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dpf;->invalidateRoot()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, v0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->h(FF)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-ltz p1, :cond_1

    .line 22
    .line 23
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->m(I)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return v1
.end method

.method public setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->E:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/View;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setDatePickerController(Lcom/wdullaer/materialdatetimepicker/date/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->a:Lcom/wdullaer/materialdatetimepicker/date/a;

    .line 2
    .line 3
    return-void
.end method

.method public setMonthParams(Ljava/util/HashMap;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "month"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const-string v2, "year"

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 19
    .line 20
    const-string p1, "You must specify month and year for this view"

    .line 21
    .line 22
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    const-string v1, "height"

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Ljava/lang/Integer;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->q:I

    .line 48
    .line 49
    sget v3, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->O:I

    .line 50
    .line 51
    if-ge v1, v3, :cond_2

    .line 52
    .line 53
    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->q:I

    .line 54
    .line 55
    :cond_2
    const-string v1, "selected_day"

    .line 56
    .line 57
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-eqz v3, :cond_3

    .line 62
    .line 63
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Ljava/lang/Integer;

    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->s:I

    .line 74
    .line 75
    :cond_3
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Ljava/lang/Integer;

    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->n:I

    .line 86
    .line 87
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Ljava/lang/Integer;

    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->o:I

    .line 98
    .line 99
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const/4 v1, 0x0

    .line 104
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->r:Z

    .line 105
    .line 106
    const/4 v2, -0x1

    .line 107
    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->t:I

    .line 108
    .line 109
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->z:Ljava/util/Calendar;

    .line 110
    .line 111
    const/4 v3, 0x2

    .line 112
    iget v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->n:I

    .line 113
    .line 114
    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->set(II)V

    .line 115
    .line 116
    .line 117
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->z:Ljava/util/Calendar;

    .line 118
    .line 119
    iget v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->o:I

    .line 120
    .line 121
    const/4 v4, 0x1

    .line 122
    invoke-virtual {v2, v4, v3}, Ljava/util/Calendar;->set(II)V

    .line 123
    .line 124
    .line 125
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->z:Ljava/util/Calendar;

    .line 126
    .line 127
    const/4 v3, 0x5

    .line 128
    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->set(II)V

    .line 129
    .line 130
    .line 131
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->z:Ljava/util/Calendar;

    .line 132
    .line 133
    const/4 v5, 0x7

    .line 134
    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->M:I

    .line 139
    .line 140
    const-string v2, "week_start"

    .line 141
    .line 142
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v5

    .line 146
    if-eqz v5, :cond_4

    .line 147
    .line 148
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    check-cast p1, Ljava/lang/Integer;

    .line 153
    .line 154
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->u:I

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_4
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->z:Ljava/util/Calendar;

    .line 162
    .line 163
    invoke-virtual {p1}, Ljava/util/Calendar;->getFirstDayOfWeek()I

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->u:I

    .line 168
    .line 169
    :goto_1
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->z:Ljava/util/Calendar;

    .line 170
    .line 171
    invoke-virtual {p1, v3}, Ljava/util/Calendar;->getActualMaximum(I)I

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->w:I

    .line 176
    .line 177
    :cond_5
    :goto_2
    iget p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->w:I

    .line 178
    .line 179
    if-ge v1, p1, :cond_6

    .line 180
    .line 181
    add-int/lit8 v1, v1, 0x1

    .line 182
    .line 183
    invoke-direct {p0, v1, v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->p(ILjava/util/Calendar;)Z

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    if-eqz p1, :cond_5

    .line 188
    .line 189
    iput-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->r:Z

    .line 190
    .line 191
    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->t:I

    .line 192
    .line 193
    goto :goto_2

    .line 194
    :cond_6
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->b()I

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->C:I

    .line 199
    .line 200
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->B:Lcom/wdullaer/materialdatetimepicker/date/MonthView$a;

    .line 201
    .line 202
    invoke-virtual {p0}, Ll/dpf;->invalidateRoot()V

    .line 203
    .line 204
    .line 205
    return-void
.end method

.method public setOnDayClickListener(Lcom/wdullaer/materialdatetimepicker/date/MonthView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->D:Lcom/wdullaer/materialdatetimepicker/date/MonthView$b;

    .line 2
    .line 3
    return-void
.end method

.method public setSelectedDay(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->s:I

    .line 2
    .line 3
    return-void
.end method
