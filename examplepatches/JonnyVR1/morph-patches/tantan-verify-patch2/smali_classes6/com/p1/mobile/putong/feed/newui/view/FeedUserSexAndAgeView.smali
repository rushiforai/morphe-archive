.class public Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lcom/p1/mobile/android/ui/label/CommonLabelView;

.field public e:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/aai;->a(Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(ILcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->c:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    if-nez p1, :cond_2

    .line 18
    .line 19
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    sget p1, Ll/lbc0;->y5:I

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    sget p1, Ll/lbc0;->B5:I

    .line 35
    .line 36
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->e:I

    .line 37
    .line 38
    new-instance p1, Ll/v9i;

    .line 39
    .line 40
    invoke-direct {p1}, Ll/v9i;-><init>()V

    .line 41
    .line 42
    .line 43
    goto/16 :goto_7

    .line 44
    .line 45
    :cond_2
    const/4 v0, 0x5

    .line 46
    if-ne p1, v0, :cond_4

    .line 47
    .line 48
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_3

    .line 53
    .line 54
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    sget p1, Ll/lbc0;->y5:I

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    sget p1, Ll/lbc0;->B5:I

    .line 64
    .line 65
    :goto_1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->e:I

    .line 66
    .line 67
    new-instance p1, Ll/q9i;

    .line 68
    .line 69
    invoke-direct {p1}, Ll/q9i;-><init>()V

    .line 70
    .line 71
    .line 72
    goto/16 :goto_7

    .line 73
    .line 74
    :cond_4
    if-ne p1, v2, :cond_6

    .line 75
    .line 76
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_5

    .line 81
    .line 82
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_5

    .line 87
    .line 88
    sget p1, Ll/lbc0;->z5:I

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_5
    sget p1, Ll/lbc0;->C5:I

    .line 92
    .line 93
    :goto_2
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->e:I

    .line 94
    .line 95
    new-instance p1, Ll/p9i;

    .line 96
    .line 97
    invoke-direct {p1}, Ll/p9i;-><init>()V

    .line 98
    .line 99
    .line 100
    goto/16 :goto_7

    .line 101
    .line 102
    :cond_6
    const/4 v0, 0x2

    .line 103
    if-ne p1, v0, :cond_8

    .line 104
    .line 105
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_7

    .line 110
    .line 111
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-eqz p1, :cond_7

    .line 116
    .line 117
    sget p1, Ll/lbc0;->y5:I

    .line 118
    .line 119
    goto :goto_3

    .line 120
    :cond_7
    sget p1, Ll/lbc0;->B5:I

    .line 121
    .line 122
    :goto_3
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->e:I

    .line 123
    .line 124
    new-instance p1, Ll/u9i;

    .line 125
    .line 126
    invoke-direct {p1}, Ll/u9i;-><init>()V

    .line 127
    .line 128
    .line 129
    goto :goto_7

    .line 130
    :cond_8
    const/4 v0, 0x3

    .line 131
    if-ne p1, v0, :cond_a

    .line 132
    .line 133
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-eqz p1, :cond_9

    .line 138
    .line 139
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-eqz p1, :cond_9

    .line 144
    .line 145
    sget p1, Ll/lbc0;->x5:I

    .line 146
    .line 147
    goto :goto_4

    .line 148
    :cond_9
    sget p1, Ll/lbc0;->A5:I

    .line 149
    .line 150
    :goto_4
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->e:I

    .line 151
    .line 152
    new-instance p1, Ll/r9i;

    .line 153
    .line 154
    invoke-direct {p1}, Ll/r9i;-><init>()V

    .line 155
    .line 156
    .line 157
    goto :goto_7

    .line 158
    :cond_a
    const/4 v0, 0x6

    .line 159
    if-ne p1, v0, :cond_c

    .line 160
    .line 161
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-eqz p1, :cond_b

    .line 166
    .line 167
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-eqz p1, :cond_b

    .line 172
    .line 173
    sget p1, Ll/lbc0;->x5:I

    .line 174
    .line 175
    goto :goto_5

    .line 176
    :cond_b
    sget p1, Ll/lbc0;->A5:I

    .line 177
    .line 178
    :goto_5
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->e:I

    .line 179
    .line 180
    new-instance p1, Ll/t9i;

    .line 181
    .line 182
    invoke-direct {p1}, Ll/t9i;-><init>()V

    .line 183
    .line 184
    .line 185
    goto :goto_7

    .line 186
    :cond_c
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    if-eqz p1, :cond_d

    .line 191
    .line 192
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    if-eqz p1, :cond_d

    .line 197
    .line 198
    sget p1, Ll/lbc0;->x5:I

    .line 199
    .line 200
    goto :goto_6

    .line 201
    :cond_d
    sget p1, Ll/lbc0;->A5:I

    .line 202
    .line 203
    :goto_6
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->e:I

    .line 204
    .line 205
    new-instance p1, Ll/s9i;

    .line 206
    .line 207
    invoke-direct {p1}, Ll/s9i;-><init>()V

    .line 208
    .line 209
    .line 210
    :goto_7
    invoke-interface {p1, p0, p2}, Ll/z9i;->a(Ljava/lang/Object;Lcom/p1/mobile/putong/data/User;)V

    .line 211
    .line 212
    .line 213
    return-void
.end method

.method public final c(Lcom/p1/mobile/putong/data/User;I)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/ui/label/LabelStyle;->SMALL:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    sget-object p2, Lcom/p1/mobile/android/ui/label/LabelStyle;->MIDDLE:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x5

    .line 9
    if-ne p2, v0, :cond_1

    .line 10
    .line 11
    sget-object p2, Lcom/p1/mobile/android/ui/label/LabelStyle;->MIDDLE:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const/4 v0, 0x1

    .line 15
    if-ne p2, v0, :cond_2

    .line 16
    .line 17
    sget-object p2, Lcom/p1/mobile/android/ui/label/LabelStyle;->MAX:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_2
    const/4 v0, 0x2

    .line 21
    if-ne p2, v0, :cond_3

    .line 22
    .line 23
    sget-object p2, Lcom/p1/mobile/android/ui/label/LabelStyle;->MIDDLE:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_3
    const/4 v0, 0x3

    .line 27
    if-ne p2, v0, :cond_4

    .line 28
    .line 29
    sget-object p2, Lcom/p1/mobile/android/ui/label/LabelStyle;->SMALL:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_4
    const/4 v0, 0x6

    .line 33
    if-ne p2, v0, :cond_5

    .line 34
    .line 35
    sget-object p2, Lcom/p1/mobile/android/ui/label/LabelStyle;->SMALL:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_5
    sget-object p2, Lcom/p1/mobile/android/ui/label/LabelStyle;->SMALL:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 39
    .line 40
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->d:Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 41
    .line 42
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->setSizeStyle(Lcom/p1/mobile/android/ui/label/LabelStyle;)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ll/t8r;->a()Ll/t8r;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    sget-object v0, Lcom/p1/mobile/android/ui/label/LabelModule;->COMMON:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_6

    .line 56
    .line 57
    sget-object v1, Lcom/p1/mobile/putong/newui/label/CommonLabelTag;->SEX_AGE_FEMALE:Lcom/p1/mobile/putong/newui/label/CommonLabelTag;

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_6
    sget-object v1, Lcom/p1/mobile/putong/newui/label/CommonLabelTag;->SEX_AGE_MALE:Lcom/p1/mobile/putong/newui/label/CommonLabelTag;

    .line 61
    .line 62
    :goto_1
    invoke-virtual {p2, v0, v1}, Ll/t8r;->c(Lcom/p1/mobile/android/ui/label/LabelModule;Ll/zvl;)Ll/r8r;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-static {p1}, Ll/mrb0;->v(Lcom/p1/mobile/putong/data/User;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_7

    .line 71
    .line 72
    const-string p1, ""

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 76
    .line 77
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    :goto_2
    invoke-virtual {p2, p1}, Ll/r8r;->g(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->d:Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 85
    .line 86
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->g(Ll/r8r;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/data/User;II)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->c(Lcom/p1/mobile/putong/data/User;I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0, p3, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->b(ILcom/p1/mobile/putong/data/User;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ic()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v2, 0x1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x5

    .line 35
    if-eq p3, v1, :cond_1

    .line 36
    .line 37
    if-ne p3, v2, :cond_2

    .line 38
    .line 39
    :cond_1
    const-string p3, "#33FFFFFF"

    .line 40
    .line 41
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    invoke-virtual {v0, p3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p3

    .line 53
    if-eqz p3, :cond_3

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    if-eqz p3, :cond_3

    .line 60
    .line 61
    const-string p3, "#FF89E5"

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    const-string p3, "#FF2BCCFF"

    .line 65
    .line 66
    :goto_0
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result p3

    .line 70
    invoke-virtual {v0, p3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 71
    .line 72
    .line 73
    :goto_1
    int-to-float p2, p2

    .line 74
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    int-to-float p2, p2

    .line 79
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 80
    .line 81
    .line 82
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 83
    .line 84
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 85
    .line 86
    .line 87
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->b:Lv/VImage;

    .line 88
    .line 89
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->e:I

    .line 90
    .line 91
    invoke-virtual {p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 92
    .line 93
    .line 94
    invoke-static {p1}, Ll/mrb0;->v(Lcom/p1/mobile/putong/data/User;)Z

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->c:Lv/VText;

    .line 99
    .line 100
    if-eqz p2, :cond_4

    .line 101
    .line 102
    const/4 p0, 0x0

    .line 103
    invoke-static {p3, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_4
    invoke-static {p3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->c:Lv/VText;

    .line 111
    .line 112
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 113
    .line 114
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->a:Lv/VLinear;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->d:Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
