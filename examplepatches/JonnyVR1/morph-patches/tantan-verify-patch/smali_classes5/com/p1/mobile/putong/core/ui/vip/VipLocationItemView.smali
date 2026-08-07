.class public Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView$a;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

.field public b:Landroid/widget/ImageView;

.field public c:Lv/VText;

.field public d:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/y20;Lcom/p1/mobile/putong/data/MessageLocation;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public static synthetic b(ZLl/y20;Lcom/p1/mobile/putong/data/MessageLocation;Landroid/view/View;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tsl0;->a(Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/data/MessageLocation;Ll/y20;Ll/y20;Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView$a;Z)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/MessageLocation;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/MessageLocation;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/MessageLocation;",
            ">;",
            "Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView$a;",
            "Z)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p5

    .line 6
    .line 7
    sget-object v3, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 8
    .line 9
    invoke-virtual {v3}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    iget-object v3, v1, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    iget-object v3, v1, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 28
    .line 29
    iget-wide v4, v3, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 30
    .line 31
    sget-object v3, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 32
    .line 33
    invoke-virtual {v3}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v3}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 38
    .line 39
    .line 40
    move-result-wide v6

    .line 41
    iget-object v3, v1, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 42
    .line 43
    iget-wide v8, v3, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 44
    .line 45
    sget-object v3, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 46
    .line 47
    invoke-virtual {v3}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v3}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 52
    .line 53
    .line 54
    move-result-wide v10

    .line 55
    const-wide/16 v12, 0x0

    .line 56
    .line 57
    const-wide/16 v14, 0x0

    .line 58
    .line 59
    invoke-static/range {v4 .. v15}, Lcom/p1/mobile/putong/location/a;->f(DDDDDD)D

    .line 60
    .line 61
    .line 62
    move-result-wide v3

    .line 63
    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    .line 64
    .line 65
    .line 66
    move-result-wide v3

    .line 67
    long-to-int v3, v3

    .line 68
    const/4 v4, 0x0

    .line 69
    invoke-static {v3, v4}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->c:Lv/VText;

    .line 74
    .line 75
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_0
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->c:Lv/VText;

    .line 80
    .line 81
    iget-object v4, v1, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-eqz v4, :cond_1

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    sget v5, Lcom/p1/mobile/putong/core/R$string;->lo:I

    .line 94
    .line 95
    invoke-virtual {v4, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    goto :goto_0

    .line 100
    :cond_1
    iget-object v4, v1, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 101
    .line 102
    :goto_0
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    :goto_1
    iget-object v3, v1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-nez v3, :cond_2

    .line 112
    .line 113
    iget-object v3, v1, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    if-eqz v3, :cond_3

    .line 120
    .line 121
    :cond_2
    invoke-static/range {p4 .. p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    if-eqz v3, :cond_3

    .line 126
    .line 127
    move-object/from16 v3, p4

    .line 128
    .line 129
    invoke-interface {v3, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView$a;->a(Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;)V

    .line 130
    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_3
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->c:Lv/VText;

    .line 134
    .line 135
    iget-object v4, v1, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    :goto_2
    new-instance v3, Ll/rsl0;

    .line 141
    .line 142
    move-object/from16 v4, p2

    .line 143
    .line 144
    invoke-direct {v3, v2, v4, v1}, Ll/rsl0;-><init>(ZLl/y20;Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 148
    .line 149
    .line 150
    new-instance v3, Ll/ssl0;

    .line 151
    .line 152
    move-object/from16 v4, p3

    .line 153
    .line 154
    invoke-direct {v3, v4, v1}, Ll/ssl0;-><init>(Ll/y20;Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, v3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 158
    .line 159
    .line 160
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->d:Lv/VImage;

    .line 161
    .line 162
    if-eqz v2, :cond_4

    .line 163
    .line 164
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    sget v2, Ll/dbc0;->B:I

    .line 169
    .line 170
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {v1, v0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_4
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    sget v2, Ll/dbc0;->A:I

    .line 183
    .line 184
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {v1, v0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 189
    .line 190
    .line 191
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->c:Lv/VText;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->a:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

    .line 15
    .line 16
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 17
    .line 18
    const-string v1, "#ffffff"

    .line 19
    .line 20
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
