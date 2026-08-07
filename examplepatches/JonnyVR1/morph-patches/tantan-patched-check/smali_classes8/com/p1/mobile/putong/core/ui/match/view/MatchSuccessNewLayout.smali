.class public Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public A:Lv/VText;

.field public B:Lv/VImage;

.field public C:Landroid/graphics/Paint;

.field public D:F

.field public E:F

.field public F:Z

.field public final G:Landroid/graphics/PorterDuffXfermode;

.field public H:Lcom/p1/mobile/putong/data/User;

.field public I:F

.field public J:I

.field public K:I

.field public final L:[Ljava/lang/String;

.field public final M:[Ljava/lang/String;

.field public N:Landroid/graphics/PointF;

.field public O:Z

.field public P:I

.field public Q:Lcom/p1/mobile/putong/core/data/IceBreakQuestion;

.field public final R:Landroid/view/animation/Interpolator;

.field public final S:Landroid/view/animation/Interpolator;

.field public final T:Landroid/view/animation/Interpolator;

.field public U:Z

.field public a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

.field public b:Landroid/view/View;

.field public c:Lcom/tantan/library/svga/SVGAnimationView;

.field public d:Landroidx/appcompat/widget/AppCompatImageView;

.field public e:Lv/VText;

.field public f:Landroid/widget/FrameLayout;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lv/VDraweeView;

.field public i:Lv/VImage;

.field public j:Landroid/widget/FrameLayout;

.field public k:Lv/VDraweeView;

.field public l:Lv/VImage;

.field public m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public n:Lcom/tantan/library/svga/SVGAnimationView;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lv/VLinear;

.field public r:Lv/VImage;

.field public s:Lv/VText;

.field public t:Lv/VLinear;

.field public u:Lv/VText;

.field public v:Lv/VText;

.field public w:Lv/VText;

.field public x:Lv/VText;

.field public y:Lv/VLinear;

.field public z:Lv/VEditText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 8

    .line 217
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 218
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->D:F

    .line 219
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->E:F

    const/4 p1, 0x0

    .line 220
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->F:Z

    .line 221
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->G:Landroid/graphics/PorterDuffXfermode;

    const/4 v0, 0x0

    .line 222
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->I:F

    .line 223
    sget v1, Ll/qa00;->F:I

    div-int/lit8 v1, v1, 0x3

    iput v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->J:I

    .line 224
    sget v1, Ll/qa00;->O:I

    div-int/lit8 v1, v1, 0x3

    iput v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K:I

    .line 225
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "["

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    sget v4, Lcom/p1/mobile/putong/core/R$string;->Hj:I

    .line 226
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "]"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    sget v6, Lcom/p1/mobile/putong/core/R$string;->Gj:I

    .line 227
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v6, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    sget v7, Lcom/p1/mobile/putong/core/R$string;->j4:I

    .line 228
    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    sget v7, Lcom/p1/mobile/putong/core/R$string;->i4:I

    .line 229
    invoke-virtual {v2, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v1, v4, v5, v2}, [Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->L:[Ljava/lang/String;

    .line 230
    const-string v1, "EMOJI_70"

    const-string v2, "EMOJI_63"

    const-string v3, "NEW_EMOJI_HAHE"

    const-string v4, "NEW_EMOJI_BEER"

    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->M:[Ljava/lang/String;

    .line 231
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->O:Z

    .line 232
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->P:I

    .line 233
    new-instance v1, Landroid/view/animation/PathInterpolator;

    const v2, 0x3e2e147b    # 0.17f

    const v3, 0x3e0f5c29    # 0.14f

    const v4, 0x3e99999a    # 0.3f

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->R:Landroid/view/animation/Interpolator;

    .line 234
    new-instance v1, Landroid/view/animation/PathInterpolator;

    invoke-direct {v1, v4, v4, v0, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->S:Landroid/view/animation/Interpolator;

    .line 235
    new-instance v0, Landroid/view/animation/PathInterpolator;

    invoke-direct {v0, v2, v2, v4, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->T:Landroid/view/animation/Interpolator;

    .line 236
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->U:Z

    .line 237
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->U()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 7

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 5
    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->D:F

    .line 8
    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->E:F

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->F:Z

    .line 13
    .line 14
    new-instance p2, Landroid/graphics/PorterDuffXfermode;

    .line 15
    .line 16
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 17
    .line 18
    invoke-direct {p2, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 19
    .line 20
    .line 21
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->G:Landroid/graphics/PorterDuffXfermode;

    .line 22
    .line 23
    const/4 p2, 0x0

    .line 24
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->I:F

    .line 25
    .line 26
    sget v0, Ll/qa00;->F:I

    .line 27
    .line 28
    div-int/lit8 v0, v0, 0x3

    .line 29
    .line 30
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->J:I

    .line 31
    .line 32
    sget v0, Ll/qa00;->O:I

    .line 33
    .line 34
    div-int/lit8 v0, v0, 0x3

    .line 35
    .line 36
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K:I

    .line 37
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v1, "["

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 46
    .line 47
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Hj:I

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v2, "]"

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v3, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    sget-object v4, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 71
    .line 72
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Gj:I

    .line 73
    .line 74
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    new-instance v4, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    sget-object v5, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 94
    .line 95
    sget v6, Lcom/p1/mobile/putong/core/R$string;->j4:I

    .line 96
    .line 97
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    new-instance v5, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 117
    .line 118
    sget v6, Lcom/p1/mobile/putong/core/R$string;->i4:I

    .line 119
    .line 120
    invoke-virtual {v1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    filled-new-array {v0, v3, v4, v1}, [Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->L:[Ljava/lang/String;

    .line 139
    .line 140
    const-string v0, "EMOJI_70"

    .line 141
    .line 142
    const-string v1, "EMOJI_63"

    .line 143
    .line 144
    const-string v2, "NEW_EMOJI_HAHE"

    .line 145
    .line 146
    const-string v3, "NEW_EMOJI_BEER"

    .line 147
    .line 148
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->M:[Ljava/lang/String;

    .line 153
    .line 154
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->O:Z

    .line 155
    .line 156
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->P:I

    .line 157
    .line 158
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 159
    .line 160
    const v1, 0x3e2e147b    # 0.17f

    .line 161
    .line 162
    .line 163
    const v2, 0x3e0f5c29    # 0.14f

    .line 164
    .line 165
    .line 166
    const v3, 0x3e99999a    # 0.3f

    .line 167
    .line 168
    .line 169
    const/high16 v4, 0x3f800000    # 1.0f

    .line 170
    .line 171
    invoke-direct {v0, v1, v2, v3, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 172
    .line 173
    .line 174
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->R:Landroid/view/animation/Interpolator;

    .line 175
    .line 176
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 177
    .line 178
    invoke-direct {v0, v3, v3, p2, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 179
    .line 180
    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->S:Landroid/view/animation/Interpolator;

    .line 182
    .line 183
    new-instance p2, Landroid/view/animation/PathInterpolator;

    .line 184
    .line 185
    invoke-direct {p2, v1, v1, v3, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 186
    .line 187
    .line 188
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->T:Landroid/view/animation/Interpolator;

    .line 189
    .line 190
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->U:Z

    .line 191
    .line 192
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->U()V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6

    .line 196
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 197
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->D:F

    .line 198
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->E:F

    const/4 p1, 0x0

    .line 199
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->F:Z

    .line 200
    new-instance p2, Landroid/graphics/PorterDuffXfermode;

    sget-object p3, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p2, p3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->G:Landroid/graphics/PorterDuffXfermode;

    const/4 p2, 0x0

    .line 201
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->I:F

    .line 202
    sget p3, Ll/qa00;->F:I

    div-int/lit8 p3, p3, 0x3

    iput p3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->J:I

    .line 203
    sget p3, Ll/qa00;->O:I

    div-int/lit8 p3, p3, 0x3

    iput p3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K:I

    .line 204
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "["

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    sget v2, Lcom/p1/mobile/putong/core/R$string;->Hj:I

    .line 205
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    sget v4, Lcom/p1/mobile/putong/core/R$string;->Gj:I

    .line 206
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v4, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    sget v5, Lcom/p1/mobile/putong/core/R$string;->j4:I

    .line 207
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    sget v5, Lcom/p1/mobile/putong/core/R$string;->i4:I

    .line 208
    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    filled-new-array {p3, v2, v3, v0}, [Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->L:[Ljava/lang/String;

    .line 209
    const-string p3, "EMOJI_70"

    const-string v0, "EMOJI_63"

    const-string v1, "NEW_EMOJI_HAHE"

    const-string v2, "NEW_EMOJI_BEER"

    filled-new-array {v1, v2, p3, v0}, [Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->M:[Ljava/lang/String;

    .line 210
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->O:Z

    .line 211
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->P:I

    .line 212
    new-instance p3, Landroid/view/animation/PathInterpolator;

    const v0, 0x3e2e147b    # 0.17f

    const v1, 0x3e0f5c29    # 0.14f

    const v2, 0x3e99999a    # 0.3f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {p3, v0, v1, v2, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->R:Landroid/view/animation/Interpolator;

    .line 213
    new-instance p3, Landroid/view/animation/PathInterpolator;

    invoke-direct {p3, v2, v2, p2, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->S:Landroid/view/animation/Interpolator;

    .line 214
    new-instance p2, Landroid/view/animation/PathInterpolator;

    invoke-direct {p2, v0, v0, v2, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->T:Landroid/view/animation/Interpolator;

    .line 215
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->U:Z

    .line 216
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->U()V

    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->clone()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->g0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Ll/pcj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->e0(Ll/pcj;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->w0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->i0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->n0()V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j0()V

    return-void
.end method

.method public static synthetic H(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->r0(Ljava/lang/Float;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;ZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->z0(ZLl/uxj0;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Landroid/view/animation/Interpolator;[Landroid/view/View;ILandroid/view/animation/Interpolator;ILjava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->l0(Landroid/view/animation/Interpolator;[Landroid/view/View;ILandroid/view/animation/Interpolator;ILjava/lang/Float;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->v0(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->u0(Ljava/lang/Float;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->k0()V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;ZLjava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->o0(ZLjava/lang/Float;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->d0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->q0(Ljava/lang/Float;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->f0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/agx;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/agx;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;ZLjava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->x0(ZLjava/lang/Float;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->t0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H0(F)V

    return-void
.end method

.method public static synthetic p()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->m0()V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Lcom/p1/mobile/putong/core/data/Message;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->A0(Lcom/p1/mobile/putong/core/data/Message;ZLjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->h0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->B0(Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->s0(Ljava/lang/Float;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;ZLjava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->p0(ZLjava/lang/Float;)V

    return-void
.end method

.method public static synthetic w(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->y0(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic y()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->C0(ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic A0(Lcom/p1/mobile/putong/core/data/Message;ZLjava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-static {p3}, Ll/rv4;->f(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget-object p2, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 13
    .line 14
    invoke-static {p1, p3, p2}, Ll/rv4;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;)V

    .line 15
    .line 16
    .line 17
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->U:Z

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {p3}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isIllegalContent(Ljava/lang/Throwable;)Z

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    if-eqz p3, :cond_1

    .line 25
    .line 26
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/api/g;->Of(Ljava/lang/String;)Lrx/c;

    .line 33
    .line 34
    .line 35
    sget p1, Lcom/p1/mobile/putong/core/R$string;->L7:I

    .line 36
    .line 37
    invoke-static {p1}, Ll/r1j0;->f(I)V

    .line 38
    .line 39
    .line 40
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->U:Z

    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Th:I

    .line 44
    .line 45
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    invoke-static {p1, p3}, Ll/bfx;->f(ILcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v1, p2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->O(ZZ)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final synthetic B0(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->D0(Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic C0(ILandroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->L:[Ljava/lang/String;

    .line 2
    .line 3
    aget-object p2, p2, p1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->M:[Ljava/lang/String;

    .line 6
    .line 7
    aget-object v0, v0, p1

    .line 8
    .line 9
    add-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    invoke-virtual {p0, p2, v0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->M(Ljava/lang/String;Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final D0(Ljava/lang/String;Z)V
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->U:Z

    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    new-instance v1, Ll/vfx;

    .line 23
    .line 24
    invoke-direct {v1, v0}, Ll/vfx;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    new-instance v4, Lcom/p1/mobile/putong/core/data/Message;

    .line 31
    .line 32
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/Message;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p1, v4, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 36
    .line 37
    const-string p1, "text"

    .line 38
    .line 39
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, v4, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v2, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    const/4 v6, 0x0

    .line 58
    const/4 v7, 0x0

    .line 59
    const/4 v5, 0x0

    .line 60
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/api/g;->Fn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;ZZ)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/wfx;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/wfx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance v0, Ll/xfx;

    .line 78
    .line 79
    invoke-direct {v0, p0, p2}, Ll/xfx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Z)V

    .line 80
    .line 81
    .line 82
    new-instance v1, Ll/yfx;

    .line 83
    .line 84
    invoke-direct {v1, p0, v4, p2}, Ll/yfx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Lcom/p1/mobile/putong/core/data/Message;Z)V

    .line 85
    .line 86
    .line 87
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public E0(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Vi:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ti:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Si:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ui:I

    .line 43
    .line 44
    new-instance v2, Ll/rfx;

    .line 45
    .line 46
    invoke-direct {v2, p0, p1, p2}, Ll/rfx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Ljava/lang/String;Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 54
    .line 55
    .line 56
    new-instance p1, Ljava/util/HashSet;

    .line 57
    .line 58
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r:Ll/xyd0;

    .line 59
    .line 60
    invoke-virtual {p2}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    check-cast p2, Ljava/util/Collection;

    .line 65
    .line 66
    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 67
    .line 68
    .line 69
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p2, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r:Ll/xyd0;

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->D0(Ljava/lang/String;Z)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final F0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->u:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->v:Lv/VText;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->w:Lv/VText;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->x:Lv/VText;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lv/VText;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "emoji_quantity"

    .line 22
    .line 23
    const/4 v3, 0x4

    .line 24
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-static {v2, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    filled-new-array {v2}, [Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const-string v4, "e_match_emoji"

    .line 37
    .line 38
    invoke-static {v4, v1, v2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    :goto_0
    if-ge v1, v3, :cond_0

    .line 43
    .line 44
    aget-object v2, v0, v1

    .line 45
    .line 46
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->L:[Ljava/lang/String;

    .line 47
    .line 48
    aget-object v4, v4, v1

    .line 49
    .line 50
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    aget-object v2, v0, v1

    .line 54
    .line 55
    new-instance v4, Ll/kgx;

    .line 56
    .line 57
    invoke-direct {v4, p0, v1}, Ll/kgx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;I)V

    .line 58
    .line 59
    .line 60
    invoke-static {v2, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    add-int/lit8 v1, v1, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    return-void
.end method

.method public G0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->z:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final H0(F)V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 8
    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->y:Lv/VLinear;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ogx;->a(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final L(Ll/pcj;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->B:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/lgx;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/lgx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Ll/pcj;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->A:Lv/VText;

    .line 12
    .line 13
    new-instance v0, Ll/mgx;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/mgx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 22
    .line 23
    new-instance v0, Ll/ngx;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/ngx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->g:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    new-instance v0, Ll/efx;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/efx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    new-instance v0, Ll/ffx;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/ffx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->z:Lv/VEditText;

    .line 52
    .line 53
    new-instance v0, Ll/gfx;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ll/gfx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final M(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 9

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->U:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->U:Z

    .line 8
    .line 9
    invoke-static {}, Ll/tye;->c()Ll/tye;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1, p2}, Ll/tye;->l(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    new-instance v6, Ll/pfx;

    .line 23
    .line 24
    invoke-direct {v6}, Ll/pfx;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v7, Ll/qfx;

    .line 28
    .line 29
    invoke-direct {v7}, Ll/qfx;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v8, ""

    .line 33
    .line 34
    const/4 v5, 0x0

    .line 35
    move-object v4, p1

    .line 36
    invoke-static/range {v2 .. v8}, Ll/d810;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLjava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string p2, "select_emoji"

    .line 48
    .line 49
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    invoke-static {p2, p3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    filled-new-array {p2}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    const-string p3, "e_match_emoji"

    .line 62
    .line 63
    invoke-static {p3, p1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    const/4 p1, 0x0

    .line 67
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->O(ZZ)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final N()V
    .locals 11

    .line 1
    invoke-static {}, Ll/dj30;->l()Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_enter_time:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, Ll/zfx;

    .line 12
    .line 13
    invoke-direct {v2, p0}, Ll/zfx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 14
    .line 15
    .line 16
    div-int/lit8 v3, v0, 0x4

    .line 17
    .line 18
    int-to-long v3, v3

    .line 19
    invoke-static {v1, v2, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    new-instance v2, Ll/hgx;

    .line 27
    .line 28
    invoke-direct {v2, p0}, Ll/hgx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 29
    .line 30
    .line 31
    div-int/lit8 v3, v0, 0x2

    .line 32
    .line 33
    int-to-long v3, v3

    .line 34
    invoke-static {v1, v2, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->b:Landroid/view/View;

    .line 38
    .line 39
    const/high16 v2, 0x3f000000    # 0.5f

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 42
    .line 43
    .line 44
    sget v7, Ll/qa00;->o:I

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->o:Lv/VText;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->p:Lv/VText;

    .line 49
    .line 50
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->q:Lv/VLinear;

    .line 51
    .line 52
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->t:Lv/VLinear;

    .line 53
    .line 54
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->y:Lv/VLinear;

    .line 55
    .line 56
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->B:Lv/VImage;

    .line 57
    .line 58
    const/4 v8, 0x6

    .line 59
    move-object v9, v6

    .line 60
    new-array v6, v8, [Landroid/view/View;

    .line 61
    .line 62
    const/4 v10, 0x0

    .line 63
    aput-object v1, v6, v10

    .line 64
    .line 65
    const/4 v1, 0x1

    .line 66
    aput-object v2, v6, v1

    .line 67
    .line 68
    const/4 v1, 0x2

    .line 69
    aput-object v3, v6, v1

    .line 70
    .line 71
    const/4 v2, 0x3

    .line 72
    aput-object v4, v6, v2

    .line 73
    .line 74
    const/4 v2, 0x4

    .line 75
    aput-object v5, v6, v2

    .line 76
    .line 77
    const/4 v2, 0x5

    .line 78
    aput-object v9, v6, v2

    .line 79
    .line 80
    :goto_0
    if-ge v10, v8, :cond_0

    .line 81
    .line 82
    aget-object v2, v6, v10

    .line 83
    .line 84
    int-to-float v3, v7

    .line 85
    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationY(F)V

    .line 86
    .line 87
    .line 88
    const/4 v3, 0x0

    .line 89
    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    .line 90
    .line 91
    .line 92
    add-int/lit8 v10, v10, 0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_0
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 100
    .line 101
    div-int/2addr v2, v1

    .line 102
    const/high16 v1, 0x423e0000    # 47.5f

    .line 103
    .line 104
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    add-int v9, v2, v1

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->g:Landroid/widget/FrameLayout;

    .line 111
    .line 112
    neg-int v2, v9

    .line 113
    int-to-float v2, v2

    .line 114
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j:Landroid/widget/FrameLayout;

    .line 118
    .line 119
    int-to-float v2, v9

    .line 120
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 121
    .line 122
    .line 123
    new-instance v8, Landroid/view/animation/PathInterpolator;

    .line 124
    .line 125
    const v1, 0x3f47ae14    # 0.78f

    .line 126
    .line 127
    .line 128
    const v2, 0x3f8147ae    # 1.01f

    .line 129
    .line 130
    .line 131
    const v3, 0x3ecccccd    # 0.4f

    .line 132
    .line 133
    .line 134
    const v4, 0x3faa3d71    # 1.33f

    .line 135
    .line 136
    .line 137
    invoke-direct {v8, v3, v4, v1, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 138
    .line 139
    .line 140
    new-instance v5, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 141
    .line 142
    invoke-direct {v5}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 143
    .line 144
    .line 145
    new-instance v3, Ll/igx;

    .line 146
    .line 147
    move-object v4, p0

    .line 148
    invoke-direct/range {v3 .. v9}, Ll/igx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Landroid/view/animation/Interpolator;[Landroid/view/View;ILandroid/view/animation/Interpolator;I)V

    .line 149
    .line 150
    .line 151
    new-instance p0, Ll/jgx;

    .line 152
    .line 153
    invoke-direct {p0}, Ll/jgx;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-static {v0, v3, p0}, Ll/dj30;->k(ILl/y20;Ljava/lang/Runnable;)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public final O(ZZ)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "tmp_from_home_swipe"

    .line 11
    .line 12
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-instance p1, Ll/jfx;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Ll/jfx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 22
    .line 23
    .line 24
    if-nez p2, :cond_1

    .line 25
    .line 26
    invoke-static {}, Ll/dj30;->l()Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iget p2, p2, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_keyboard_show_time:I

    .line 31
    .line 32
    new-instance v1, Ll/kfx;

    .line 33
    .line 34
    invoke-direct {v1, p0, v0}, Ll/kfx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Z)V

    .line 35
    .line 36
    .line 37
    invoke-static {p2, v1, p1}, Ll/dj30;->k(ILl/y20;Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ll/dj30;->l()Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    iget p2, p2, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_keyboard_show_head_time:I

    .line 53
    .line 54
    new-instance v0, Ll/lfx;

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    invoke-direct {v0, p0, v1}, Ll/lfx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Z)V

    .line 58
    .line 59
    .line 60
    invoke-static {p2, v0, p1}, Ll/dj30;->k(ILl/y20;Ljava/lang/Runnable;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    :goto_0
    if-eqz p2, :cond_3

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 71
    .line 72
    .line 73
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->i:Z

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public P(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->l:Lv/VImage;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/dj30;->l()Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget v0, v0, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_exit_time:I

    .line 22
    .line 23
    new-instance v1, Ll/bgx;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/bgx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/cgx;

    .line 29
    .line 30
    invoke-direct {p0, p1}, Ll/cgx;-><init>(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1, p0}, Ll/dj30;->k(ILl/y20;Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final Q(F)V
    .locals 3

    .line 1
    sget v0, Ll/qa00;->F:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x3

    .line 4
    .line 5
    int-to-float v0, v0

    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->J:I

    .line 7
    .line 8
    int-to-float v1, v1

    .line 9
    new-instance v2, Ll/fgx;

    .line 10
    .line 11
    invoke-direct {v2, p0}, Ll/fgx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1, p1, v2}, Ll/dj30;->c(FFFLl/y20;)V

    .line 15
    .line 16
    .line 17
    sget v0, Ll/qa00;->O:I

    .line 18
    .line 19
    mul-int/lit8 v0, v0, 0x3

    .line 20
    .line 21
    int-to-float v0, v0

    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K:I

    .line 23
    .line 24
    int-to-float v1, v1

    .line 25
    new-instance v2, Ll/ggx;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/ggx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1, p1, v2}, Ll/dj30;->c(FFFLl/y20;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final R(F)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    const/high16 v1, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v0, v1

    .line 11
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->J:I

    .line 12
    .line 13
    int-to-float v2, v2

    .line 14
    add-float/2addr v0, v2

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    int-to-float v2, v2

    .line 22
    div-float/2addr v2, v1

    .line 23
    const v3, 0x3dcccccd    # 0.1f

    .line 24
    .line 25
    .line 26
    mul-float/2addr v2, v3

    .line 27
    sget v4, Ll/qa00;->c:I

    .line 28
    .line 29
    int-to-float v5, v4

    .line 30
    add-float/2addr v2, v5

    .line 31
    new-instance v5, Ll/dgx;

    .line 32
    .line 33
    invoke-direct {v5, p0}, Ll/dgx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v2, p1, v5}, Ll/dj30;->c(FFFLl/y20;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    int-to-float v0, v0

    .line 46
    div-float/2addr v0, v1

    .line 47
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K:I

    .line 48
    .line 49
    int-to-float v2, v2

    .line 50
    add-float/2addr v0, v2

    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j:Landroid/widget/FrameLayout;

    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    int-to-float v2, v2

    .line 58
    div-float/2addr v2, v1

    .line 59
    mul-float/2addr v2, v3

    .line 60
    int-to-float v1, v4

    .line 61
    add-float/2addr v2, v1

    .line 62
    new-instance v1, Ll/egx;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/egx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v2, p1, v1}, Ll/dj30;->c(FFFLl/y20;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    int-to-float v0, v0

    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->N:Landroid/graphics/PointF;

    .line 78
    .line 79
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 80
    .line 81
    sub-float/2addr v0, v1

    .line 82
    const/high16 v1, 0x42700000    # 60.0f

    .line 83
    .line 84
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    int-to-float v1, v1

    .line 89
    sub-float/2addr v0, v1

    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 91
    .line 92
    const/4 v2, 0x0

    .line 93
    invoke-static {v1, v2, v0, p1}, Ll/dj30;->j(Landroid/view/View;FFF)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j:Landroid/widget/FrameLayout;

    .line 97
    .line 98
    const/high16 v1, 0x3f800000    # 1.0f

    .line 99
    .line 100
    invoke-static {v0, v1, v3, p1}, Ll/dj30;->g(Landroid/view/View;FFF)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j:Landroid/widget/FrameLayout;

    .line 104
    .line 105
    invoke-static {v0, v1, v3, p1}, Ll/dj30;->h(Landroid/view/View;FFF)V

    .line 106
    .line 107
    .line 108
    float-to-double v3, p1

    .line 109
    const-wide v5, 0x3feccccccccccccdL    # 0.9

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    cmpl-double v0, v3, v5

    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 117
    .line 118
    if-ltz v0, :cond_0

    .line 119
    .line 120
    const/high16 v0, 0x41200000    # 10.0f

    .line 121
    .line 122
    mul-float/2addr p1, v0

    .line 123
    const/high16 v0, 0x41100000    # 9.0f

    .line 124
    .line 125
    sub-float/2addr p1, v0

    .line 126
    invoke-static {p0, v1, v2, p1}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_0
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public final S(FF)Landroid/graphics/PointF;
    .locals 3

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    div-float/2addr p1, v0

    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->o:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->f:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 19
    .line 20
    div-float/2addr p2, v0

    .line 21
    iget v1, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 22
    .line 23
    int-to-float v1, v1

    .line 24
    div-float/2addr v1, v0

    .line 25
    sub-float/2addr p2, v1

    .line 26
    iget v1, v2, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 27
    .line 28
    int-to-float v1, v1

    .line 29
    sub-float/2addr p2, v1

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j:Landroid/widget/FrameLayout;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    int-to-float p0, p0

    .line 37
    div-float/2addr p0, v0

    .line 38
    sub-float/2addr p2, p0

    .line 39
    new-instance p0, Landroid/graphics/PointF;

    .line 40
    .line 41
    invoke-direct {p0, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 42
    .line 43
    .line 44
    return-object p0
.end method

.method public final T(ZF)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->T:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    move v3, v2

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget v3, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 21
    .line 22
    int-to-float v3, v3

    .line 23
    :goto_0
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 26
    .line 27
    int-to-float v1, v1

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move v1, v2

    .line 30
    :goto_1
    const/high16 v4, 0x42200000    # 40.0f

    .line 31
    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    move v5, v2

    .line 35
    goto :goto_2

    .line 36
    :cond_2
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    int-to-float v5, v5

    .line 41
    :goto_2
    if-eqz p1, :cond_3

    .line 42
    .line 43
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    int-to-float v4, v4

    .line 48
    goto :goto_3

    .line 49
    :cond_3
    move v4, v2

    .line 50
    :goto_3
    const/high16 v6, 0x41200000    # 10.0f

    .line 51
    .line 52
    const/high16 v7, -0x3ee00000    # -10.0f

    .line 53
    .line 54
    if-eqz p1, :cond_4

    .line 55
    .line 56
    move v8, v7

    .line 57
    goto :goto_4

    .line 58
    :cond_4
    move v8, v6

    .line 59
    :goto_4
    if-eqz p1, :cond_5

    .line 60
    .line 61
    goto :goto_5

    .line 62
    :cond_5
    move v6, v7

    .line 63
    :goto_5
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->g:Landroid/widget/FrameLayout;

    .line 64
    .line 65
    invoke-static {v7, v3, v1, v0}, Ll/dj30;->i(Landroid/view/View;FFF)V

    .line 66
    .line 67
    .line 68
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->g:Landroid/widget/FrameLayout;

    .line 69
    .line 70
    invoke-static {v7, v5, v4, v0}, Ll/dj30;->j(Landroid/view/View;FFF)V

    .line 71
    .line 72
    .line 73
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->g:Landroid/widget/FrameLayout;

    .line 74
    .line 75
    invoke-static {v4, v8, v6, v0}, Ll/dj30;->f(Landroid/view/View;FFF)V

    .line 76
    .line 77
    .line 78
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j:Landroid/widget/FrameLayout;

    .line 79
    .line 80
    neg-float v3, v3

    .line 81
    neg-float v1, v1

    .line 82
    invoke-static {v4, v3, v1, v0}, Ll/dj30;->i(Landroid/view/View;FFF)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->o:Lv/VText;

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->p:Lv/VText;

    .line 88
    .line 89
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->q:Lv/VLinear;

    .line 90
    .line 91
    const/4 v4, 0x3

    .line 92
    new-array v5, v4, [Landroid/view/View;

    .line 93
    .line 94
    const/4 v6, 0x0

    .line 95
    aput-object v0, v5, v6

    .line 96
    .line 97
    const/4 v0, 0x1

    .line 98
    aput-object v1, v5, v0

    .line 99
    .line 100
    const/4 v0, 0x2

    .line 101
    aput-object v3, v5, v0

    .line 102
    .line 103
    const/high16 v0, 0x3f800000    # 1.0f

    .line 104
    .line 105
    if-eqz p1, :cond_6

    .line 106
    .line 107
    move v1, v0

    .line 108
    goto :goto_6

    .line 109
    :cond_6
    move v1, v2

    .line 110
    :goto_6
    if-eqz p1, :cond_7

    .line 111
    .line 112
    goto :goto_7

    .line 113
    :cond_7
    move v2, v0

    .line 114
    :goto_7
    if-ge v6, v4, :cond_8

    .line 115
    .line 116
    aget-object p1, v5, v6

    .line 117
    .line 118
    const v3, 0x3ecccccd    # 0.4f

    .line 119
    .line 120
    .line 121
    div-float v3, p2, v3

    .line 122
    .line 123
    invoke-static {v3, v0}, Ljava/lang/Math;->min(FF)F

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    invoke-static {p1, v1, v2, v3}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 128
    .line 129
    .line 130
    add-int/lit8 v6, v6, 0x1

    .line 131
    .line 132
    goto :goto_7

    .line 133
    :cond_8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->g:Landroid/widget/FrameLayout;

    .line 134
    .line 135
    invoke-static {p0, v1, v2, p2}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public final U()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->C:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->C:Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final V(Lcom/p1/mobile/putong/data/User;)V
    .locals 8

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getLastActiveTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    sub-long/2addr v0, v2

    .line 10
    const-wide/32 v2, 0xa4cb800

    .line 11
    .line 12
    .line 13
    cmp-long p1, v0, v2

    .line 14
    .line 15
    if-lez p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const-wide/32 v2, 0x493e0

    .line 25
    .line 26
    .line 27
    cmp-long v2, v0, v2

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    if-gez v2, :cond_1

    .line 31
    .line 32
    const-string p1, "\u5f53\u524d\u5728\u7ebf"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-wide/32 v4, 0x36ee80

    .line 36
    .line 37
    .line 38
    cmp-long v6, v0, v4

    .line 39
    .line 40
    if-gez v6, :cond_2

    .line 41
    .line 42
    const-wide/32 v4, 0xea60

    .line 43
    .line 44
    .line 45
    div-long/2addr v0, v4

    .line 46
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const-string v0, "%s\u5206\u949f\u524d\u6d3b\u8dc3"

    .line 55
    .line 56
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    goto :goto_0

    .line 61
    :cond_2
    const-wide/32 v6, 0x5265c00

    .line 62
    .line 63
    .line 64
    cmp-long v6, v0, v6

    .line 65
    .line 66
    if-gez v6, :cond_3

    .line 67
    .line 68
    div-long/2addr v0, v4

    .line 69
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    const-string v0, "%s\u5c0f\u65f6\u524d\u6d3b\u8dc3"

    .line 78
    .line 79
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    goto :goto_0

    .line 84
    :cond_3
    if-gez p1, :cond_4

    .line 85
    .line 86
    const-string p1, "\u6628\u5929\u6d3b\u8dc3"

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_4
    move-object p1, v3

    .line 90
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 91
    .line 92
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 96
    .line 97
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 98
    .line 99
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    if-gez v2, :cond_5

    .line 104
    .line 105
    sget v1, Ll/dbc0;->Yd:I

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_5
    sget v1, Ll/dbc0;->Zd:I

    .line 109
    .line 110
    :goto_1
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p1, v0, v3, v3, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 118
    .line 119
    const/4 p1, 0x1

    .line 120
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final W(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h:I

    .line 6
    .line 7
    const/16 v1, 0xb

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const/16 v3, 0xc

    .line 11
    .line 12
    if-eq v0, v3, :cond_1

    .line 13
    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    const/16 v4, 0xd

    .line 17
    .line 18
    if-ne v0, v4, :cond_0

    .line 19
    .line 20
    invoke-static {}, Ll/pgj;->c()Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->i:Lv/VImage;

    .line 28
    .line 29
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->l:Lv/VImage;

    .line 33
    .line 34
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    :goto_0
    const/4 v4, 0x1

    .line 39
    if-ne v0, v3, :cond_2

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->i:Lv/VImage;

    .line 42
    .line 43
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->l:Lv/VImage;

    .line 47
    .line 48
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->p:Lv/VText;

    .line 52
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v1, "\u4f60\u8d85\u7ea7\u559c\u6b22\u4e86 "

    .line 56
    .line 57
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    if-ne v0, v1, :cond_3

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->l:Lv/VImage;

    .line 74
    .line 75
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->i:Lv/VImage;

    .line 79
    .line 80
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->p:Lv/VText;

    .line 84
    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string p1, " \u8d85\u7ea7\u559c\u6b22\u4e86\u4f60"

    .line 94
    .line 95
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->i:Lv/VImage;

    .line 107
    .line 108
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->l:Lv/VImage;

    .line 112
    .line 113
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->p:Lv/VText;

    .line 117
    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    const-string v1, "\u4f60\u548c "

    .line 121
    .line 122
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string p1, " \u8d85\u7ea7\u559c\u6b22\u4e86\u5bf9\u65b9"

    .line 129
    .line 130
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final X()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_5

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-static {}, Ll/gra;->z()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->r:Lv/VImage;

    .line 20
    .line 21
    sget v2, Ll/dbc0;->ae:I

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 24
    .line 25
    .line 26
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v2, 0x1

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->q:Lv/VLinear;

    .line 38
    .line 39
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 46
    .line 47
    const-string v3, "verified"

    .line 48
    .line 49
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-nez v3, :cond_3

    .line 54
    .line 55
    const-string v3, "pending"

    .line 56
    .line 57
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_3

    .line 62
    .line 63
    move v1, v2

    .line 64
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->q:Lv/VLinear;

    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    if-eqz v1, :cond_4

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 80
    .line 81
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 82
    .line 83
    const-string v2, "receiver_user_id"

    .line 84
    .line 85
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    filled-new-array {v1}, [Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    const-string v2, "e_successful_match_view_verification"

    .line 94
    .line 95
    invoke-static {v2, v0, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 96
    .line 97
    .line 98
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->q:Lv/VLinear;

    .line 99
    .line 100
    new-instance v1, Ll/ifx;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Ll/ifx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_5
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->q:Lv/VLinear;

    .line 110
    .line 111
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public Y(Ljava/lang/String;Ll/pcj;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
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
    invoke-virtual {v0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->U:Z

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->Q:Lcom/p1/mobile/putong/core/data/IceBreakQuestion;

    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ll/dkb;->r9(Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->F0()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->a0()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->L(Ll/pcj;)V

    .line 34
    .line 35
    .line 36
    sget p2, Ll/qa00;->j:I

    .line 37
    .line 38
    int-to-float p2, p2

    .line 39
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H0(F)V

    .line 40
    .line 41
    .line 42
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->h:Lv/VDraweeView;

    .line 45
    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->k:Lv/VDraweeView;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->d:Landroidx/appcompat/widget/AppCompatImageView;

    .line 91
    .line 92
    invoke-static {}, Ll/bnl0;->F0()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    sget v1, Ll/qa00;->c:I

    .line 97
    .line 98
    add-int/2addr v0, v1

    .line 99
    invoke-static {p2, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 100
    .line 101
    .line 102
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->e:Lv/VText;

    .line 103
    .line 104
    invoke-static {}, Ll/bnl0;->F0()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    sget v1, Ll/qa00;->G:I

    .line 109
    .line 110
    add-int/2addr v0, v1

    .line 111
    invoke-static {p2, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 112
    .line 113
    .line 114
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->d:Landroidx/appcompat/widget/AppCompatImageView;

    .line 115
    .line 116
    const/4 v0, 0x0

    .line 117
    invoke-virtual {p2, v0}, Landroid/view/View;->setAlpha(F)V

    .line 118
    .line 119
    .line 120
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->e:Lv/VText;

    .line 121
    .line 122
    invoke-virtual {p2, v0}, Landroid/view/View;->setAlpha(F)V

    .line 123
    .line 124
    .line 125
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->e:Lv/VText;

    .line 126
    .line 127
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    const/4 v0, 0x1

    .line 132
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 133
    .line 134
    .line 135
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->o:Lv/VText;

    .line 136
    .line 137
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 142
    .line 143
    .line 144
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->p:Lv/VText;

    .line 145
    .line 146
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 151
    .line 152
    .line 153
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->A:Lv/VText;

    .line 154
    .line 155
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 156
    .line 157
    .line 158
    move-result-object p2

    .line 159
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 160
    .line 161
    .line 162
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->z:Lv/VEditText;

    .line 163
    .line 164
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 169
    .line 170
    .line 171
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->s:Lv/VText;

    .line 172
    .line 173
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 174
    .line 175
    .line 176
    move-result-object p2

    .line 177
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 178
    .line 179
    .line 180
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 181
    .line 182
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 183
    .line 184
    invoke-static {}, Ll/gra;->r1()Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-eqz v0, :cond_1

    .line 189
    .line 190
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h:I

    .line 195
    .line 196
    const/16 v1, 0x2c

    .line 197
    .line 198
    if-ne v0, v1, :cond_1

    .line 199
    .line 200
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->o:Lv/VText;

    .line 201
    .line 202
    const-string v0, "\u91cd\u9022\u914d\u5bf9"

    .line 203
    .line 204
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 205
    .line 206
    .line 207
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->p:Lv/VText;

    .line 208
    .line 209
    const-string v0, "\u518d\u6b21\u91cd\u9022\u4f60\u4eec\u4f9d\u7136\u4e92\u76f8\u559c\u6b22\uff0c\u53bb\u804a\u804a\u5427"

    .line 210
    .line 211
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    .line 213
    .line 214
    goto :goto_0

    .line 215
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    const/4 v1, 0x6

    .line 220
    if-le v0, v1, :cond_2

    .line 221
    .line 222
    invoke-virtual {p2, p1, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    const-string p2, "..."

    .line 227
    .line 228
    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    move-object p2, p1

    .line 233
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->p:Lv/VText;

    .line 234
    .line 235
    new-instance v0, Ljava/lang/StringBuilder;

    .line 236
    .line 237
    const-string v1, "\u4f60\u548c "

    .line 238
    .line 239
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    const-string v1, " \u76f8\u4e92\u559c\u6b22\u4e86\u5bf9\u65b9"

    .line 246
    .line 247
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 255
    .line 256
    .line 257
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 258
    .line 259
    const-string v0, "\u548c"

    .line 260
    .line 261
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 265
    .line 266
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    if-eqz v0, :cond_3

    .line 271
    .line 272
    const-string v0, "\u5979"

    .line 273
    .line 274
    goto :goto_1

    .line 275
    :cond_3
    const-string v0, "\u4ed6"

    .line 276
    .line 277
    :goto_1
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    const-string v0, "\u6253\u4e2a\u62db\u547c\u5427"

    .line 281
    .line 282
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->z:Lv/VEditText;

    .line 290
    .line 291
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 292
    .line 293
    .line 294
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->e:Lv/VText;

    .line 295
    .line 296
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->X()V

    .line 300
    .line 301
    .line 302
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->W(Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    invoke-static {}, Ll/gra;->O()Z

    .line 306
    .line 307
    .line 308
    move-result p1

    .line 309
    if-eqz p1, :cond_4

    .line 310
    .line 311
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 312
    .line 313
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->V(Lcom/p1/mobile/putong/data/User;)V

    .line 314
    .line 315
    .line 316
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->N()V

    .line 317
    .line 318
    .line 319
    return-void
.end method

.method public final Z(ZF)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->S:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    sget v1, Ll/qa00;->q:I

    .line 11
    .line 12
    int-to-float v1, v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v1, v0

    .line 15
    :goto_0
    if-eqz p1, :cond_1

    .line 16
    .line 17
    move v2, v0

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    sget v2, Ll/qa00;->q:I

    .line 20
    .line 21
    int-to-float v2, v2

    .line 22
    :goto_1
    new-instance v3, Ll/sfx;

    .line 23
    .line 24
    invoke-direct {v3, p0}, Ll/sfx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2, p2, v3}, Ll/dj30;->c(FFFLl/y20;)V

    .line 28
    .line 29
    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    sget v1, Ll/qa00;->i:I

    .line 33
    .line 34
    int-to-float v1, v1

    .line 35
    goto :goto_2

    .line 36
    :cond_2
    move v1, v0

    .line 37
    :goto_2
    if-eqz p1, :cond_3

    .line 38
    .line 39
    move v2, v0

    .line 40
    goto :goto_3

    .line 41
    :cond_3
    sget v2, Ll/qa00;->i:I

    .line 42
    .line 43
    int-to-float v2, v2

    .line 44
    :goto_3
    new-instance v3, Ll/tfx;

    .line 45
    .line 46
    invoke-direct {v3, p0}, Ll/tfx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, v2, p2, v3}, Ll/dj30;->c(FFFLl/y20;)V

    .line 50
    .line 51
    .line 52
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->P:I

    .line 53
    .line 54
    if-gtz v1, :cond_4

    .line 55
    .line 56
    sget-object v1, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 57
    .line 58
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Ljava/lang/Integer;

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->B:Lv/VImage;

    .line 69
    .line 70
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    sub-int/2addr v1, v2

    .line 75
    const/4 v2, 0x0

    .line 76
    if-eqz p1, :cond_5

    .line 77
    .line 78
    move v3, v2

    .line 79
    goto :goto_4

    .line 80
    :cond_5
    neg-int v3, v1

    .line 81
    :goto_4
    if-eqz p1, :cond_6

    .line 82
    .line 83
    neg-int v1, v1

    .line 84
    goto :goto_5

    .line 85
    :cond_6
    move v1, v2

    .line 86
    :goto_5
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->y:Lv/VLinear;

    .line 87
    .line 88
    int-to-float v3, v3

    .line 89
    int-to-float v1, v1

    .line 90
    invoke-static {v4, v3, v1, p2}, Ll/dj30;->j(Landroid/view/View;FFF)V

    .line 91
    .line 92
    .line 93
    const/high16 v1, 0x3f800000    # 1.0f

    .line 94
    .line 95
    if-eqz p1, :cond_7

    .line 96
    .line 97
    move v3, v1

    .line 98
    goto :goto_6

    .line 99
    :cond_7
    move v3, v0

    .line 100
    :goto_6
    if-eqz p1, :cond_8

    .line 101
    .line 102
    goto :goto_7

    .line 103
    :cond_8
    move v0, v1

    .line 104
    :goto_7
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->t:Lv/VLinear;

    .line 105
    .line 106
    const v5, 0x3e99999a    # 0.3f

    .line 107
    .line 108
    .line 109
    div-float v5, p2, v5

    .line 110
    .line 111
    invoke-static {v5, v1}, Ljava/lang/Math;->min(FF)F

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    invoke-static {v4, v3, v0, v1}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 116
    .line 117
    .line 118
    if-eqz p1, :cond_9

    .line 119
    .line 120
    move v0, v2

    .line 121
    goto :goto_8

    .line 122
    :cond_9
    sget v0, Ll/qa00;->B:I

    .line 123
    .line 124
    neg-int v0, v0

    .line 125
    :goto_8
    if-eqz p1, :cond_a

    .line 126
    .line 127
    sget p1, Ll/qa00;->B:I

    .line 128
    .line 129
    neg-int v2, p1

    .line 130
    :cond_a
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->t:Lv/VLinear;

    .line 131
    .line 132
    int-to-float p1, v0

    .line 133
    int-to-float v0, v2

    .line 134
    invoke-static {p0, p1, v0, p2}, Ll/dj30;->j(Landroid/view/View;FFF)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public final a0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->z:Lv/VEditText;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout$a;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->z:Lv/VEditText;

    .line 12
    .line 13
    new-instance v1, Ll/dfx;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/dfx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->d:Landroidx/appcompat/widget/AppCompatImageView;

    .line 22
    .line 23
    new-instance v1, Ll/ofx;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/ofx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public b0(ZI)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->O:Z

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->P:I

    .line 4
    .line 5
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->U:Z

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    if-nez p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p2, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 29
    .line 30
    .line 31
    :goto_0
    new-instance p2, Ll/hfx;

    .line 32
    .line 33
    invoke-direct {p2}, Ll/hfx;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->c0(ZLjava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public c0(ZLjava/lang/Runnable;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/dj30;->l()Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_keyboard_show_time:I

    .line 6
    .line 7
    new-instance v1, Ll/mfx;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/mfx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;Z)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Ll/nfx;

    .line 13
    .line 14
    invoke-direct {p0, p2}, Ll/nfx;-><init>(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ll/dj30;->k(ILl/y20;Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic d0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "e_matched_text_box"

    .line 10
    .line 11
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v4, v0

    .line 6
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v5, v0

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->N:Landroid/graphics/PointF;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v4, v5}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->S(FF)Landroid/graphics/PointF;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->N:Landroid/graphics/PointF;

    .line 20
    .line 21
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->F:Z

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->N:Landroid/graphics/PointF;

    .line 26
    .line 27
    iget v1, v0, Landroid/graphics/PointF;->x:F

    .line 28
    .line 29
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 30
    .line 31
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 32
    .line 33
    .line 34
    const/high16 v0, 0x41200000    # 10.0f

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->rotate(F)V

    .line 37
    .line 38
    .line 39
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->E:F

    .line 40
    .line 41
    float-to-int v0, v0

    .line 42
    mul-int/lit8 v0, v0, 0x2

    .line 43
    .line 44
    invoke-static {v0}, Ll/rsf0;->i(I)F

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    const v1, 0x3c95e9e2    # 0.0183f

    .line 49
    .line 50
    .line 51
    mul-float/2addr v0, v1

    .line 52
    const v1, 0x405a5e35    # 3.412f

    .line 53
    .line 54
    .line 55
    add-float/2addr v0, v1

    .line 56
    new-instance v1, Landroid/graphics/RectF;

    .line 57
    .line 58
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->D:F

    .line 59
    .line 60
    neg-float v3, v2

    .line 61
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->E:F

    .line 62
    .line 63
    neg-float v7, v6

    .line 64
    invoke-direct {v1, v3, v7, v2, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0}, Ll/rsf0;->c(F)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    int-to-float v2, v2

    .line 72
    invoke-static {v0}, Ll/rsf0;->c(F)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    int-to-float v0, v0

    .line 77
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->C:Landroid/graphics/Paint;

    .line 78
    .line 79
    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->C:Landroid/graphics/Paint;

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->G:Landroid/graphics/PorterDuffXfermode;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 87
    .line 88
    .line 89
    const/high16 v0, -0x3ee00000    # -10.0f

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->rotate(F)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->N:Landroid/graphics/PointF;

    .line 95
    .line 96
    iget v1, v0, Landroid/graphics/PointF;->x:F

    .line 97
    .line 98
    neg-float v1, v1

    .line 99
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 100
    .line 101
    neg-float v0, v0

    .line 102
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 103
    .line 104
    .line 105
    :cond_1
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->C:Landroid/graphics/Paint;

    .line 106
    .line 107
    const/16 v7, 0x1f

    .line 108
    .line 109
    const/4 v2, 0x0

    .line 110
    const/4 v3, 0x0

    .line 111
    move-object v1, p1

    .line 112
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    invoke-super {p0, v1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 120
    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->C:Landroid/graphics/Paint;

    .line 123
    .line 124
    const/4 p1, 0x0

    .line 125
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public final synthetic e0(Ll/pcj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->O(ZZ)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "e_match_continue"

    .line 33
    .line 34
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic f0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->U:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->z:Lv/VEditText;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->O:Z

    .line 21
    .line 22
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->E0(Ljava/lang/String;Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "e_matched_send_message"

    .line 34
    .line 35
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic g0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic h0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_matched_my_profile"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->O:Z

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "from_match"

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-static {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic i0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "moments_user_id"

    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    filled-new-array {v0}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "e_matched_other_profile"

    .line 24
    .line 25
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->O:Z

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 51
    .line 52
    const-string v1, "from_match"

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    invoke-static {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final synthetic j0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/gra;->z()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const-string v1, "https://auto.tancdn.com/v1/raw/9b2b634e-49ac-49fd-b8bf-76bf3bc8514e14.svga"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string v1, "core_male_match_success_heart_bg.svga"

    .line 19
    .line 20
    :goto_0
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->isCacheable(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, -0x1

    .line 34
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic k0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/gra;->z()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const-string v1, "https://auto.tancdn.com/v1/raw/1b58e151-bc14-48d0-bde7-0155cf0b077a14.svga"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string v1, "core_male_match_success_flow_bg.svga"

    .line 19
    .line 20
    :goto_0
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->isCacheable(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic l0(Landroid/view/animation/Interpolator;[Landroid/view/View;ILandroid/view/animation/Interpolator;ILjava/lang/Float;)V
    .locals 7

    .line 1
    invoke-virtual {p6}, Ljava/lang/Float;->floatValue()F

    .line 2
    .line 3
    .line 4
    move-result p6

    .line 5
    invoke-interface {p1, p6}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object p6, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->b:Landroid/view/View;

    .line 10
    .line 11
    const v0, 0x3e4ccccd    # 0.2f

    .line 12
    .line 13
    .line 14
    div-float v1, p1, v0

    .line 15
    .line 16
    const/high16 v2, 0x3f800000    # 1.0f

    .line 17
    .line 18
    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/high16 v3, 0x3f000000    # 0.5f

    .line 23
    .line 24
    invoke-static {p6, v3, v2, v1}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 25
    .line 26
    .line 27
    cmpl-float p6, p1, v0

    .line 28
    .line 29
    if-ltz p6, :cond_1

    .line 30
    .line 31
    const/high16 p6, 0x40a00000    # 5.0f

    .line 32
    .line 33
    mul-float/2addr p1, p6

    .line 34
    sub-float/2addr p1, v2

    .line 35
    const/high16 p6, 0x40800000    # 4.0f

    .line 36
    .line 37
    div-float/2addr p1, p6

    .line 38
    array-length p6, p2

    .line 39
    const/4 v0, 0x0

    .line 40
    :goto_0
    const/4 v1, 0x0

    .line 41
    if-ge v0, p6, :cond_0

    .line 42
    .line 43
    aget-object v3, p2, v0

    .line 44
    .line 45
    int-to-float v4, p3

    .line 46
    const v5, 0x3f19999a    # 0.6f

    .line 47
    .line 48
    .line 49
    div-float v5, p1, v5

    .line 50
    .line 51
    invoke-static {v2, v5}, Ljava/lang/Math;->min(FF)F

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    invoke-static {v3, v4, v1, v6}, Ll/dj30;->j(Landroid/view/View;FFF)V

    .line 56
    .line 57
    .line 58
    invoke-static {v2, v5}, Ljava/lang/Math;->min(FF)F

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    invoke-static {v3, v1, v2, v4}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 63
    .line 64
    .line 65
    add-int/lit8 v0, v0, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    invoke-interface {p4, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j:Landroid/widget/FrameLayout;

    .line 73
    .line 74
    int-to-float p3, p5

    .line 75
    invoke-static {p2, p3, v1, p1}, Ll/dj30;->i(Landroid/view/View;FFF)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->g:Landroid/widget/FrameLayout;

    .line 79
    .line 80
    neg-int p2, p5

    .line 81
    int-to-float p2, p2

    .line 82
    invoke-static {p0, p2, v1, p1}, Ll/dj30;->i(Landroid/view/View;FFF)V

    .line 83
    .line 84
    .line 85
    :cond_1
    return-void
.end method

.method public final synthetic m0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->i:Z

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic n0()V
    .locals 1

    .line 1
    new-instance v0, Ll/ufx;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ufx;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->P(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic o0(ZLjava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->T(ZF)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->J(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->B:Lv/VImage;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget v0, Ll/dbc0;->Wh:I

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->i:Lv/VImage;

    .line 21
    .line 22
    sget v1, Ll/dbc0;->Yh:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->l:Lv/VImage;

    .line 28
    .line 29
    sget v1, Ll/dbc0;->Yh:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->d:Landroidx/appcompat/widget/AppCompatImageView;

    .line 35
    .line 36
    sget v0, Ll/dbc0;->Xh:I

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    sget p0, Ll/dbc0;->Xd:I

    .line 43
    .line 44
    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic p0(ZLjava/lang/Float;)V
    .locals 3

    .line 1
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0x3e99999a    # 0.3f

    .line 6
    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->Z(ZF)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->e:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-static {p1, v1, v2, v0}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->d:Landroidx/appcompat/widget/AppCompatImageView;

    .line 29
    .line 30
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-static {p0, v1, v2, p1}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic q0(Ljava/lang/Float;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->R:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-interface {v0, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/high16 v0, 0x3e800000    # 0.25f

    .line 12
    .line 13
    cmpg-float v1, p1, v0

    .line 14
    .line 15
    if-gtz v1, :cond_0

    .line 16
    .line 17
    div-float v0, p1, v0

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->Q(F)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->I:F

    .line 24
    .line 25
    cmpg-float v1, v1, v0

    .line 26
    .line 27
    if-gtz v1, :cond_1

    .line 28
    .line 29
    const/high16 v1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->Q(F)V

    .line 32
    .line 33
    .line 34
    :cond_1
    sub-float v0, p1, v0

    .line 35
    .line 36
    const/high16 v1, 0x3f400000    # 0.75f

    .line 37
    .line 38
    div-float/2addr v0, v1

    .line 39
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->R(F)V

    .line 40
    .line 41
    .line 42
    :goto_0
    const v0, 0x3f4ccccd    # 0.8f

    .line 43
    .line 44
    .line 45
    cmpl-float v0, p1, v0

    .line 46
    .line 47
    if-lez v0, :cond_2

    .line 48
    .line 49
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/dkb;->z7()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 62
    .line 63
    const/4 v1, 0x1

    .line 64
    invoke-virtual {v0, v1}, Ll/dkb;->r9(Z)V

    .line 65
    .line 66
    .line 67
    :cond_2
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->I:F

    .line 68
    .line 69
    return-void
.end method

.method public final synthetic r0(Ljava/lang/Float;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    const/high16 v1, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v0, v1

    .line 11
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    add-float/2addr v0, p1

    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->setTranslateX(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic s0(Ljava/lang/Float;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->j:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    const/high16 v1, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v0, v1

    .line 11
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    add-float/2addr v0, p1

    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->setTranslateY(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setTranslateX(F)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->F:Z

    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->D:F

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setTranslateY(F)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->F:Z

    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->E:F

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic t0(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 18
    .line 19
    const-string v1, "verified"

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-string p1, "\u5df2\u8ba4\u8bc1"

    .line 28
    .line 29
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 42
    .line 43
    const-string v0, "pending"

    .line 44
    .line 45
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    const-string p1, "\u6b63\u5728\u5ba1\u6838\u4e2d"

    .line 52
    .line 53
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->K()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {p1}, Ll/pq4;->q(Lcom/p1/mobile/android/app/Act;)V

    .line 62
    .line 63
    .line 64
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 67
    .line 68
    const-string p1, "receiver_user_id"

    .line 69
    .line 70
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    filled-new-array {p0}, [Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string p1, "e_successful_match_view_verification"

    .line 79
    .line 80
    const-string v0, "p_successful_match_view"

    .line 81
    .line 82
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final synthetic u0(Ljava/lang/Float;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->y:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Float;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->y:Lv/VLinear;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Float;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-static {p0, p1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic v0(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    sget-object p1, Ll/qt4;->e:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_3

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->z:Lv/VEditText;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    const/4 v0, 0x1

    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    return v0

    .line 37
    :cond_0
    const/4 p1, 0x4

    .line 38
    if-eq p2, p1, :cond_1

    .line 39
    .line 40
    const/4 p1, 0x6

    .line 41
    if-eq p2, p1, :cond_1

    .line 42
    .line 43
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    const/16 p1, 0x42

    .line 50
    .line 51
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-ne p1, p2, :cond_2

    .line 56
    .line 57
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_2

    .line 62
    .line 63
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->A:Lv/VText;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 66
    .line 67
    .line 68
    :cond_2
    return v0

    .line 69
    :cond_3
    const/4 p0, 0x0

    .line 70
    return p0
.end method

.method public final synthetic w0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->O:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->O(ZZ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic x0(ZLjava/lang/Float;)V
    .locals 3

    .line 1
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->T(ZF)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const v1, 0x3e99999a    # 0.3f

    .line 13
    .line 14
    .line 15
    div-float/2addr v0, v1

    .line 16
    const/high16 v1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->Z(ZF)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    move v2, v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v2, v1

    .line 31
    :goto_0
    if-eqz p1, :cond_1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v1, v0

    .line 35
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->e:Lv/VText;

    .line 36
    .line 37
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-static {p1, v2, v1, v0}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->d:Landroidx/appcompat/widget/AppCompatImageView;

    .line 45
    .line 46
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    invoke-static {p0, v2, v1, p1}, Ll/dj30;->e(Landroid/view/View;FFF)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic y0(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->H:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic z0(ZLl/uxj0;)V
    .locals 0

    .line 1
    const-string p2, "\u6d88\u606f\u5df2\u53d1\u9001"

    .line 2
    .line 3
    invoke-static {p2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->O(ZZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
