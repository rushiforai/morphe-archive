.class public Ll/ob0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Ljava/util/Calendar;

.field public l:Lcn/qqtheme/framework/wheelview/WheelView;

.field public m:Lcn/qqtheme/framework/wheelview/WheelView;

.field public n:Lcn/qqtheme/framework/wheelview/WheelView;

.field public o:Landroid/view/View;

.field public p:Ljava/util/GregorianCalendar;

.field public q:Ljava/util/GregorianCalendar;

.field public r:Ljava/util/GregorianCalendar;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x3

    .line 10
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const/4 v3, 0x5

    .line 15
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const/4 v4, 0x7

    .line 20
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    const/16 v5, 0x8

    .line 25
    .line 26
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    const/16 v6, 0xa

    .line 31
    .line 32
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    const/16 v7, 0xc

    .line 37
    .line 38
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v7

    .line 42
    filled-new-array/range {v1 .. v7}, [Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, p0, Ll/ob0;->a:Ljava/util/ArrayList;

    .line 51
    .line 52
    const/16 v1, 0x76c

    .line 53
    .line 54
    iput v1, p0, Ll/ob0;->b:I

    .line 55
    .line 56
    iput v0, p0, Ll/ob0;->d:I

    .line 57
    .line 58
    iput v0, p0, Ll/ob0;->e:I

    .line 59
    .line 60
    iput v1, p0, Ll/ob0;->f:I

    .line 61
    .line 62
    iput v1, p0, Ll/ob0;->g:I

    .line 63
    .line 64
    iput v0, p0, Ll/ob0;->h:I

    .line 65
    .line 66
    iput v0, p0, Ll/ob0;->i:I

    .line 67
    .line 68
    new-instance v0, Ljava/util/GregorianCalendar;

    .line 69
    .line 70
    const-string v1, "UTC"

    .line 71
    .line 72
    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 77
    .line 78
    invoke-direct {v0, v2, v3}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;Ljava/util/Locale;)V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Ll/ob0;->p:Ljava/util/GregorianCalendar;

    .line 82
    .line 83
    new-instance v0, Ljava/util/GregorianCalendar;

    .line 84
    .line 85
    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-direct {v0, v2, v3}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;Ljava/util/Locale;)V

    .line 90
    .line 91
    .line 92
    iput-object v0, p0, Ll/ob0;->q:Ljava/util/GregorianCalendar;

    .line 93
    .line 94
    new-instance v0, Ljava/util/GregorianCalendar;

    .line 95
    .line 96
    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-direct {v0, v1, v3}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;Ljava/util/Locale;)V

    .line 101
    .line 102
    .line 103
    iput-object v0, p0, Ll/ob0;->r:Ljava/util/GregorianCalendar;

    .line 104
    .line 105
    iput-object p1, p0, Ll/ob0;->j:Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    iput-object p2, p0, Ll/ob0;->o:Landroid/view/View;

    .line 108
    .line 109
    return-void
.end method

.method public static synthetic a(Ll/ob0;Lcn/qqtheme/framework/wheelview/WheelView;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ob0;->t(Lcn/qqtheme/framework/wheelview/WheelView;II)V

    return-void
.end method

.method public static synthetic b(Ll/ob0;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ob0;->u(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/ob0;Lcn/qqtheme/framework/wheelview/WheelView;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ob0;->r(Lcn/qqtheme/framework/wheelview/WheelView;II)V

    return-void
.end method

.method public static synthetic d(Ll/ob0;Lcn/qqtheme/framework/wheelview/WheelView;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ob0;->s(Lcn/qqtheme/framework/wheelview/WheelView;II)V

    return-void
.end method

.method public static bridge synthetic e(Ll/ob0;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob0;->o:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/ob0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ob0;->d:I

    return p0
.end method

.method public static bridge synthetic g(Ll/ob0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ob0;->c:I

    return p0
.end method

.method public static bridge synthetic h(Ll/ob0;Landroid/view/View;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ob0;->n(Landroid/view/View;II)V

    return-void
.end method

.method public static bridge synthetic i(Ll/ob0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ob0;->o(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic j(Ll/ob0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ob0;->v(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final k(II)I
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p2, v0, :cond_1

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/ob0;->q(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/16 p0, 0x1d

    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    const/16 p0, 0x1c

    .line 14
    .line 15
    return p0

    .line 16
    :cond_1
    iget-object p0, p0, Ll/ob0;->a:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    const/16 p0, 0x1f

    .line 29
    .line 30
    return p0

    .line 31
    :cond_2
    const/16 p0, 0x1e

    .line 32
    .line 33
    return p0
.end method

.method public final l()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ob0;->q:Ljava/util/GregorianCalendar;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Ll/ob0;->c:I

    .line 9
    .line 10
    iget-object v0, p0, Ll/ob0;->q:Ljava/util/GregorianCalendar;

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr v0, v1

    .line 18
    iput v0, p0, Ll/ob0;->d:I

    .line 19
    .line 20
    iget-object v0, p0, Ll/ob0;->q:Ljava/util/GregorianCalendar;

    .line 21
    .line 22
    const/4 v1, 0x5

    .line 23
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Ll/ob0;->e:I

    .line 28
    .line 29
    return-void
.end method

.method public final m(Lcn/qqtheme/framework/wheelview/WheelView;IIIZZ)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ob0;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-eqz p6, :cond_0

    .line 4
    .line 5
    new-instance p6, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;

    .line 6
    .line 7
    const-string v0, "%02d"

    .line 8
    .line 9
    invoke-direct {p6, p0, p2, p3, v0}, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;-><init>(Landroid/content/Context;IILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance p6, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;

    .line 14
    .line 15
    invoke-direct {p6, p0, p2, p3}, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;-><init>(Landroid/content/Context;II)V

    .line 16
    .line 17
    .line 18
    :goto_0
    invoke-virtual {p1, p6}, Lcn/qqtheme/framework/wheelview/WheelView;->setViewAdapter(Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;)V

    .line 19
    .line 20
    .line 21
    sget p0, Ll/c9c0;->b:I

    .line 22
    .line 23
    invoke-virtual {p6, p0}, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;->setTextColor(I)V

    .line 24
    .line 25
    .line 26
    const/16 p0, 0x14

    .line 27
    .line 28
    invoke-virtual {p6, p0}, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;->setTextSize(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p5}, Lcn/qqtheme/framework/wheelview/WheelView;->setCyclic(Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p4}, Lcn/qqtheme/framework/wheelview/WheelView;->setCurrentItem(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final n(Landroid/view/View;II)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/ob0;->n:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/adc0;->Rf:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcn/qqtheme/framework/wheelview/WheelView;

    .line 12
    .line 13
    iput-object p1, p0, Ll/ob0;->n:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 14
    .line 15
    new-instance v0, Ll/lb0;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/lb0;-><init>(Ll/ob0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lcn/qqtheme/framework/wheelview/WheelView;->addChangingListener(Lcn/qqtheme/framework/wheelview/OnWheelChangedListener;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/ob0;->n:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 24
    .line 25
    new-instance v0, Ll/ob0$c;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/ob0$c;-><init>(Ll/ob0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0}, Lcn/qqtheme/framework/wheelview/WheelView;->addScrollingListener(Lcn/qqtheme/framework/wheelview/OnWheelScrollListener;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0, p2, p3}, Ll/ob0;->k(II)I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    iget p1, p0, Ll/ob0;->e:I

    .line 38
    .line 39
    if-le p1, v4, :cond_1

    .line 40
    .line 41
    iput v4, p0, Ll/ob0;->e:I

    .line 42
    .line 43
    :cond_1
    const/4 p1, 0x0

    .line 44
    iput p1, p0, Ll/ob0;->i:I

    .line 45
    .line 46
    iget p2, p0, Ll/ob0;->d:I

    .line 47
    .line 48
    iget-object p3, p0, Ll/ob0;->q:Ljava/util/GregorianCalendar;

    .line 49
    .line 50
    const/4 v0, 0x2

    .line 51
    invoke-virtual {p3, v0}, Ljava/util/Calendar;->get(I)I

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    add-int/lit8 p3, p3, 0x1

    .line 56
    .line 57
    if-ne p2, p3, :cond_2

    .line 58
    .line 59
    iget p2, p0, Ll/ob0;->c:I

    .line 60
    .line 61
    iget p3, p0, Ll/ob0;->g:I

    .line 62
    .line 63
    if-eq p2, p3, :cond_3

    .line 64
    .line 65
    iget p3, p0, Ll/ob0;->f:I

    .line 66
    .line 67
    if-ne p2, p3, :cond_2

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    move-object v1, p0

    .line 71
    goto :goto_1

    .line 72
    :cond_3
    :goto_0
    iget-object p2, p0, Ll/ob0;->q:Ljava/util/GregorianCalendar;

    .line 73
    .line 74
    const/4 p3, 0x5

    .line 75
    invoke-virtual {p2, p3}, Ljava/util/Calendar;->get(I)I

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    iget-object v0, p0, Ll/ob0;->r:Ljava/util/GregorianCalendar;

    .line 80
    .line 81
    invoke-virtual {v0, p3}, Ljava/util/Calendar;->get(I)I

    .line 82
    .line 83
    .line 84
    move-result p3

    .line 85
    iget v0, p0, Ll/ob0;->c:I

    .line 86
    .line 87
    iget v1, p0, Ll/ob0;->g:I

    .line 88
    .line 89
    if-ne v0, v1, :cond_4

    .line 90
    .line 91
    iget-object v2, p0, Ll/ob0;->n:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 92
    .line 93
    iget p3, p0, Ll/ob0;->e:I

    .line 94
    .line 95
    add-int/lit8 p3, p3, -0x1

    .line 96
    .line 97
    add-int/lit8 v0, p2, -0x1

    .line 98
    .line 99
    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    const/4 v6, 0x0

    .line 104
    const/4 v7, 0x1

    .line 105
    const/4 v3, 0x1

    .line 106
    move-object v1, p0

    .line 107
    invoke-virtual/range {v1 .. v7}, Ll/ob0;->m(Lcn/qqtheme/framework/wheelview/WheelView;IIIZZ)V

    .line 108
    .line 109
    .line 110
    iget-object p0, v1, Ll/ob0;->n:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 111
    .line 112
    new-instance p3, Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 113
    .line 114
    invoke-direct {p3, p1, p2}, Lcn/qqtheme/framework/wheelview/ItemsRange;-><init>(II)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, p3}, Lcn/qqtheme/framework/wheelview/WheelView;->setEnableRange(Lcn/qqtheme/framework/wheelview/ItemsRange;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_4
    move-object v1, p0

    .line 122
    iget p0, v1, Ll/ob0;->f:I

    .line 123
    .line 124
    if-ne v0, p0, :cond_5

    .line 125
    .line 126
    iget-object v2, v1, Ll/ob0;->n:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 127
    .line 128
    iget p0, v1, Ll/ob0;->e:I

    .line 129
    .line 130
    add-int/lit8 p0, p0, -0x1

    .line 131
    .line 132
    add-int/lit8 p3, p3, -0x1

    .line 133
    .line 134
    invoke-static {p0, p3}, Ljava/lang/Math;->max(II)I

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    const/4 v6, 0x0

    .line 139
    const/4 v7, 0x1

    .line 140
    const/4 v3, 0x1

    .line 141
    invoke-virtual/range {v1 .. v7}, Ll/ob0;->m(Lcn/qqtheme/framework/wheelview/WheelView;IIIZZ)V

    .line 142
    .line 143
    .line 144
    iget-object p0, v1, Ll/ob0;->n:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 145
    .line 146
    new-instance p1, Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 147
    .line 148
    invoke-direct {p1, p3, v4}, Lcn/qqtheme/framework/wheelview/ItemsRange;-><init>(II)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->setEnableRange(Lcn/qqtheme/framework/wheelview/ItemsRange;)V

    .line 152
    .line 153
    .line 154
    :cond_5
    return-void

    .line 155
    :goto_1
    iget-object v2, v1, Ll/ob0;->n:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 156
    .line 157
    iget p0, v1, Ll/ob0;->e:I

    .line 158
    .line 159
    add-int/lit8 v5, p0, -0x1

    .line 160
    .line 161
    const/4 v6, 0x1

    .line 162
    const/4 v7, 0x1

    .line 163
    const/4 v3, 0x1

    .line 164
    invoke-virtual/range {v1 .. v7}, Ll/ob0;->m(Lcn/qqtheme/framework/wheelview/WheelView;IIIZZ)V

    .line 165
    .line 166
    .line 167
    iget-object p0, v1, Ll/ob0;->n:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 168
    .line 169
    const/4 p1, 0x0

    .line 170
    invoke-virtual {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->setEnableRange(Lcn/qqtheme/framework/wheelview/ItemsRange;)V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public final o(Landroid/view/View;)V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/ob0;->m:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/adc0;->Sf:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcn/qqtheme/framework/wheelview/WheelView;

    .line 12
    .line 13
    iput-object v0, p0, Ll/ob0;->m:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 14
    .line 15
    new-instance v1, Ll/nb0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/nb0;-><init>(Ll/ob0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcn/qqtheme/framework/wheelview/WheelView;->addChangingListener(Lcn/qqtheme/framework/wheelview/OnWheelChangedListener;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/ob0;->m:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 24
    .line 25
    new-instance v1, Ll/ob0$b;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1}, Ll/ob0$b;-><init>(Ll/ob0;Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcn/qqtheme/framework/wheelview/WheelView;->addScrollingListener(Lcn/qqtheme/framework/wheelview/OnWheelScrollListener;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    const/4 p1, 0x0

    .line 34
    iput p1, p0, Ll/ob0;->h:I

    .line 35
    .line 36
    iget-object v0, p0, Ll/ob0;->q:Ljava/util/GregorianCalendar;

    .line 37
    .line 38
    const/4 v1, 0x2

    .line 39
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    iget-object v0, p0, Ll/ob0;->r:Ljava/util/GregorianCalendar;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 46
    .line 47
    .line 48
    move-result v11

    .line 49
    iget v0, p0, Ll/ob0;->c:I

    .line 50
    .line 51
    iget v1, p0, Ll/ob0;->g:I

    .line 52
    .line 53
    if-eq v0, v1, :cond_1

    .line 54
    .line 55
    iget v2, p0, Ll/ob0;->f:I

    .line 56
    .line 57
    if-ne v0, v2, :cond_2

    .line 58
    .line 59
    :cond_1
    move-object v2, p0

    .line 60
    goto :goto_0

    .line 61
    :cond_2
    iget-object p1, p0, Ll/ob0;->m:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    invoke-virtual {p1, v0}, Lcn/qqtheme/framework/wheelview/WheelView;->setEnableRange(Lcn/qqtheme/framework/wheelview/ItemsRange;)V

    .line 65
    .line 66
    .line 67
    iget-object v2, p0, Ll/ob0;->m:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 68
    .line 69
    iget p1, p0, Ll/ob0;->d:I

    .line 70
    .line 71
    add-int/lit8 v5, p1, -0x1

    .line 72
    .line 73
    const/4 v6, 0x1

    .line 74
    const/4 v7, 0x1

    .line 75
    const/4 v3, 0x1

    .line 76
    const/16 v4, 0xc

    .line 77
    .line 78
    move-object v1, p0

    .line 79
    invoke-virtual/range {v1 .. v7}, Ll/ob0;->m(Lcn/qqtheme/framework/wheelview/WheelView;IIIZZ)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :goto_0
    iget-object v3, v2, Ll/ob0;->m:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 84
    .line 85
    if-ne v0, v1, :cond_3

    .line 86
    .line 87
    const/4 v7, 0x0

    .line 88
    const/4 v8, 0x1

    .line 89
    const/4 v4, 0x1

    .line 90
    const/16 v5, 0xc

    .line 91
    .line 92
    invoke-virtual/range {v2 .. v8}, Ll/ob0;->m(Lcn/qqtheme/framework/wheelview/WheelView;IIIZZ)V

    .line 93
    .line 94
    .line 95
    iget-object p0, v2, Ll/ob0;->m:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 96
    .line 97
    new-instance v0, Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 98
    .line 99
    add-int/lit8 v6, v6, 0x1

    .line 100
    .line 101
    invoke-direct {v0, p1, v6}, Lcn/qqtheme/framework/wheelview/ItemsRange;-><init>(II)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, v0}, Lcn/qqtheme/framework/wheelview/WheelView;->setEnableRange(Lcn/qqtheme/framework/wheelview/ItemsRange;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_3
    const/4 v12, 0x0

    .line 109
    const/4 v13, 0x1

    .line 110
    const/4 v9, 0x1

    .line 111
    const/16 v10, 0xc

    .line 112
    .line 113
    move-object v7, v2

    .line 114
    move-object v8, v3

    .line 115
    invoke-virtual/range {v7 .. v13}, Ll/ob0;->m(Lcn/qqtheme/framework/wheelview/WheelView;IIIZZ)V

    .line 116
    .line 117
    .line 118
    iget-object p0, v2, Ll/ob0;->m:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 119
    .line 120
    new-instance p1, Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 121
    .line 122
    const/16 v0, 0xc

    .line 123
    .line 124
    invoke-direct {p1, v11, v0}, Lcn/qqtheme/framework/wheelview/ItemsRange;-><init>(II)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, p1}, Lcn/qqtheme/framework/wheelview/WheelView;->setEnableRange(Lcn/qqtheme/framework/wheelview/ItemsRange;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public final p(Landroid/view/View;I)V
    .locals 11

    .line 1
    iget-object p2, p0, Ll/ob0;->k:Ljava/util/Calendar;

    .line 2
    .line 3
    new-instance v0, Ljava/sql/Date;

    .line 4
    .line 5
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    invoke-direct {v0, v1, v2}, Ljava/sql/Date;-><init>(J)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Ll/ob0;->l:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 18
    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    sget p2, Ll/adc0;->Tf:I

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    check-cast p2, Lcn/qqtheme/framework/wheelview/WheelView;

    .line 28
    .line 29
    iput-object p2, p0, Ll/ob0;->l:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 30
    .line 31
    new-instance v0, Ll/mb0;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/mb0;-><init>(Ll/ob0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, v0}, Lcn/qqtheme/framework/wheelview/WheelView;->addChangingListener(Lcn/qqtheme/framework/wheelview/OnWheelChangedListener;)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Ll/ob0;->l:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 40
    .line 41
    new-instance v0, Ll/ob0$a;

    .line 42
    .line 43
    invoke-direct {v0, p0, p1}, Ll/ob0$a;-><init>(Ll/ob0;Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2, v0}, Lcn/qqtheme/framework/wheelview/WheelView;->addScrollingListener(Lcn/qqtheme/framework/wheelview/OnWheelScrollListener;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    iget-object p1, p0, Ll/ob0;->r:Ljava/util/GregorianCalendar;

    .line 50
    .line 51
    const/4 p2, 0x1

    .line 52
    invoke-virtual {p1, p2}, Ljava/util/Calendar;->get(I)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    iput p1, p0, Ll/ob0;->f:I

    .line 57
    .line 58
    iget-object p1, p0, Ll/ob0;->q:Ljava/util/GregorianCalendar;

    .line 59
    .line 60
    invoke-virtual {p1, p2}, Ljava/util/Calendar;->get(I)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iput p1, p0, Ll/ob0;->g:I

    .line 65
    .line 66
    iget-object v0, p0, Ll/ob0;->l:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 67
    .line 68
    new-instance v1, Lcn/qqtheme/framework/wheelview/ItemsRange;

    .line 69
    .line 70
    iget v2, p0, Ll/ob0;->f:I

    .line 71
    .line 72
    add-int/lit16 v3, v2, -0x76c

    .line 73
    .line 74
    sub-int/2addr p1, v2

    .line 75
    add-int/2addr p1, p2

    .line 76
    invoke-direct {v1, v3, p1}, Lcn/qqtheme/framework/wheelview/ItemsRange;-><init>(II)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Lcn/qqtheme/framework/wheelview/WheelView;->setEnableRange(Lcn/qqtheme/framework/wheelview/ItemsRange;)V

    .line 80
    .line 81
    .line 82
    iget-object v5, p0, Ll/ob0;->l:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 83
    .line 84
    iget-object p1, p0, Ll/ob0;->k:Ljava/util/Calendar;

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Ljava/util/Calendar;->get(I)I

    .line 87
    .line 88
    .line 89
    move-result v7

    .line 90
    iget p1, p0, Ll/ob0;->g:I

    .line 91
    .line 92
    add-int/lit16 v8, p1, -0x76c

    .line 93
    .line 94
    const/4 v9, 0x0

    .line 95
    const/4 v10, 0x0

    .line 96
    const/16 v6, 0x76c

    .line 97
    .line 98
    move-object v4, p0

    .line 99
    invoke-virtual/range {v4 .. v10}, Ll/ob0;->m(Lcn/qqtheme/framework/wheelview/WheelView;IIIZZ)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final q(I)Z
    .locals 1

    .line 1
    rem-int/lit8 p0, p1, 0x64

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    rem-int/lit16 p0, p1, 0x190

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    rem-int/lit8 p1, p1, 0x4

    .line 12
    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    return v0
.end method

.method public final synthetic r(Lcn/qqtheme/framework/wheelview/WheelView;II)V
    .locals 0

    .line 1
    add-int/lit8 p3, p3, 0x1

    .line 2
    .line 3
    iput p3, p0, Ll/ob0;->e:I

    .line 4
    .line 5
    return-void
.end method

.method public final synthetic s(Lcn/qqtheme/framework/wheelview/WheelView;II)V
    .locals 0

    .line 1
    add-int/lit8 p3, p3, 0x1

    .line 2
    .line 3
    iput p3, p0, Ll/ob0;->d:I

    .line 4
    .line 5
    return-void
.end method

.method public final synthetic t(Lcn/qqtheme/framework/wheelview/WheelView;II)V
    .locals 0

    .line 1
    add-int/lit16 p3, p3, 0x76c

    .line 2
    .line 3
    iput p3, p0, Ll/ob0;->c:I

    .line 4
    .line 5
    return-void
.end method

.method public final synthetic u(Ll/y20;Landroid/view/View;)V
    .locals 7

    .line 1
    const-string p2, "e_birthday_tips_done_button"

    .line 2
    .line 3
    const-string v0, "p_birthday_tips_view"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/ob0;->l:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 9
    .line 10
    invoke-virtual {p2}, Lcn/qqtheme/framework/wheelview/WheelView;->stopScrolling()V

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Ll/ob0;->m:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 14
    .line 15
    invoke-virtual {p2}, Lcn/qqtheme/framework/wheelview/WheelView;->stopScrolling()V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Ll/ob0;->n:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 19
    .line 20
    invoke-virtual {p2}, Lcn/qqtheme/framework/wheelview/WheelView;->stopScrolling()V

    .line 21
    .line 22
    .line 23
    new-instance v0, Ljava/util/GregorianCalendar;

    .line 24
    .line 25
    const-string p2, "UTC"

    .line 26
    .line 27
    invoke-static {p2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 32
    .line 33
    invoke-direct {v0, p2, v1}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;Ljava/util/Locale;)V

    .line 34
    .line 35
    .line 36
    iget v1, p0, Ll/ob0;->c:I

    .line 37
    .line 38
    iget p2, p0, Ll/ob0;->d:I

    .line 39
    .line 40
    add-int/lit8 v2, p2, -0x1

    .line 41
    .line 42
    iget v3, p0, Ll/ob0;->e:I

    .line 43
    .line 44
    const/4 v5, 0x0

    .line 45
    const/4 v6, 0x0

    .line 46
    const/4 v4, 0x0

    .line 47
    invoke-virtual/range {v0 .. v6}, Ljava/util/Calendar;->set(IIIIII)V

    .line 48
    .line 49
    .line 50
    const/16 p2, 0xe

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {v0, p2, v1}, Ljava/util/Calendar;->set(II)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-static {}, Ll/bsj0;->V()Ljava/util/Date;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p2, v0}, Ljava/util/Date;->compareTo(Ljava/util/Date;)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-lez v0, :cond_0

    .line 69
    .line 70
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Yo:I

    .line 71
    .line 72
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_0
    new-instance v0, Ljava/util/Date;

    .line 77
    .line 78
    iget-object p0, p0, Ll/ob0;->r:Ljava/util/GregorianCalendar;

    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 81
    .line 82
    .line 83
    move-result-wide v1

    .line 84
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2, v0}, Ljava/util/Date;->compareTo(Ljava/util/Date;)I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-gez p0, :cond_1

    .line 92
    .line 93
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Xo:I

    .line 94
    .line 95
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 112
    .line 113
    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    .line 114
    .line 115
    .line 116
    move-result-wide v1

    .line 117
    long-to-double v1, v1

    .line 118
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    iput-object p2, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 123
    .line 124
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public final v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 9
    .line 10
    .line 11
    const-string p0, "#d34530"

    .line 12
    .line 13
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public w(Landroid/view/View;Landroid/view/View;Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    double-to-long v0, v0

    .line 18
    new-instance v2, Ljava/util/Date;

    .line 19
    .line 20
    invoke-direct {v2, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/ob0;->k:Ljava/util/Calendar;

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/ob0;->p:Ljava/util/GregorianCalendar;

    .line 33
    .line 34
    invoke-static {}, Ll/bsj0;->V()Ljava/util/Date;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    .line 39
    .line 40
    .line 41
    move-result-wide v1

    .line 42
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/ob0;->q:Ljava/util/GregorianCalendar;

    .line 46
    .line 47
    invoke-static {}, Ll/bsj0;->A()Ljava/util/Date;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    .line 52
    .line 53
    .line 54
    move-result-wide v1

    .line 55
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/ob0;->r:Ljava/util/GregorianCalendar;

    .line 59
    .line 60
    invoke-static {}, Ll/bsj0;->N()Ljava/util/Date;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    .line 65
    .line 66
    .line 67
    move-result-wide v1

    .line 68
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 69
    .line 70
    .line 71
    sget v0, Ll/adc0;->w7:I

    .line 72
    .line 73
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const/4 v1, 0x1

    .line 78
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    new-instance v0, Ll/kb0;

    .line 82
    .line 83
    invoke-direct {v0, p0, p3}, Ll/kb0;-><init>(Ll/ob0;Ll/y20;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ll/ob0;->l()V

    .line 90
    .line 91
    .line 92
    iget p2, p0, Ll/ob0;->c:I

    .line 93
    .line 94
    invoke-virtual {p0, p1, p2}, Ll/ob0;->p(Landroid/view/View;I)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, p1}, Ll/ob0;->o(Landroid/view/View;)V

    .line 98
    .line 99
    .line 100
    iget p2, p0, Ll/ob0;->c:I

    .line 101
    .line 102
    iget-object p3, p0, Ll/ob0;->k:Ljava/util/Calendar;

    .line 103
    .line 104
    const/4 v0, 0x2

    .line 105
    invoke-virtual {p3, v0}, Ljava/util/Calendar;->get(I)I

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    add-int/2addr p3, v1

    .line 110
    invoke-virtual {p0, p1, p2, p3}, Ll/ob0;->n(Landroid/view/View;II)V

    .line 111
    .line 112
    .line 113
    return-void
.end method
