.class public Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Ll/ft5;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x3

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->c:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x3

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->c:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x3

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->c:I

    return-void
.end method

.method public static synthetic a(Lv/VText;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Ll/h0r;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/h0r;->d:Ll/btx;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/h0r;->a()Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p1, p0}, Ll/btx;->a(Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final d()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-object p0
.end method

.method public e(Ljava/util/List;I)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/h0r;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->c:I

    .line 2
    .line 3
    mul-int/2addr p2, v0

    .line 4
    const/4 v0, 0x2

    .line 5
    mul-int/2addr p2, v0

    .line 6
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->c:I

    .line 11
    .line 12
    mul-int/2addr v2, v0

    .line 13
    add-int/2addr v2, p2

    .line 14
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->e:Ll/ft5;

    .line 19
    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {v2}, Ll/ft5;->c()V

    .line 23
    .line 24
    .line 25
    :cond_0
    :goto_0
    if-ge p2, v1, :cond_6

    .line 26
    .line 27
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ll/h0r;

    .line 32
    .line 33
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->c:I

    .line 34
    .line 35
    div-int v3, p2, v3

    .line 36
    .line 37
    rem-int/2addr v3, v0

    .line 38
    const/4 v4, 0x0

    .line 39
    if-nez v3, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-static {v3}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    sget v5, Ll/qec0;->l3:I

    .line 50
    .line 51
    invoke-virtual {v3, v5, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-static {v3}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    sget v5, Ll/qec0;->k3:I

    .line 65
    .line 66
    invoke-virtual {v3, v5, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    :goto_1
    sget v4, Ll/edc0;->f2:I

    .line 71
    .line 72
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    check-cast v4, Lcom/p1/mobile/putong/core/ui/messages/view/MessageMediaItemImage;

    .line 77
    .line 78
    sget v5, Ll/edc0;->O4:I

    .line 79
    .line 80
    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    check-cast v5, Lv/VText;

    .line 85
    .line 86
    iget-object v6, v2, Ll/h0r;->f:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    const/4 v7, 0x1

    .line 93
    xor-int/2addr v6, v7

    .line 94
    invoke-static {v5, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    iget-object v6, v2, Ll/h0r;->f:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    iget-object v6, v2, Ll/h0r;->g:Lrx/c;

    .line 103
    .line 104
    if-eqz v6, :cond_3

    .line 105
    .line 106
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->e:Ll/ft5;

    .line 107
    .line 108
    if-nez v6, :cond_2

    .line 109
    .line 110
    new-instance v6, Ll/ft5;

    .line 111
    .line 112
    invoke-direct {v6}, Ll/ft5;-><init>()V

    .line 113
    .line 114
    .line 115
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->e:Ll/ft5;

    .line 116
    .line 117
    :cond_2
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->e:Ll/ft5;

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->d()Lcom/p1/mobile/android/app/Act;

    .line 120
    .line 121
    .line 122
    move-result-object v8

    .line 123
    iget-object v9, v2, Ll/h0r;->g:Lrx/c;

    .line 124
    .line 125
    invoke-virtual {v8, v9}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object v8

    .line 129
    new-instance v9, Ll/i0r;

    .line 130
    .line 131
    invoke-direct {v9, v5}, Ll/i0r;-><init>(Lv/VText;)V

    .line 132
    .line 133
    .line 134
    new-instance v5, Ll/j0r;

    .line 135
    .line 136
    invoke-direct {v5}, Ll/j0r;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-static {v9, v5}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    invoke-virtual {v8, v5}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    invoke-virtual {v6, v5}, Ll/ft5;->a(Ll/kcg0;)V

    .line 148
    .line 149
    .line 150
    :cond_3
    sget v5, Ll/edc0;->g2:I

    .line 151
    .line 152
    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object v5

    .line 156
    check-cast v5, Lv/VText;

    .line 157
    .line 158
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 159
    .line 160
    .line 161
    move-result-object v6

    .line 162
    invoke-virtual {v6}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v6

    .line 166
    const-string v8, "in"

    .line 167
    .line 168
    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result v8

    .line 172
    if-nez v8, :cond_4

    .line 173
    .line 174
    const-string v8, "id"

    .line 175
    .line 176
    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result v6

    .line 180
    if-eqz v6, :cond_5

    .line 181
    .line 182
    :cond_4
    const/high16 v6, 0x41200000    # 10.0f

    .line 183
    .line 184
    invoke-virtual {v5, v0, v6}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 185
    .line 186
    .line 187
    :cond_5
    invoke-virtual {v5}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 188
    .line 189
    .line 190
    move-result-object v6

    .line 191
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 192
    .line 193
    .line 194
    iget v6, v2, Ll/h0r;->c:I

    .line 195
    .line 196
    invoke-virtual {v4, v6}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 197
    .line 198
    .line 199
    iget-boolean v6, v2, Ll/h0r;->a:Z

    .line 200
    .line 201
    iget-object v7, v2, Ll/h0r;->e:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 202
    .line 203
    invoke-virtual {v4, v6, v7}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageMediaItemImage;->l(ZLcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 204
    .line 205
    .line 206
    iget-object v4, v2, Ll/h0r;->b:Ljava/lang/String;

    .line 207
    .line 208
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 212
    .line 213
    .line 214
    new-instance v4, Ll/k0r;

    .line 215
    .line 216
    invoke-direct {v4, v2}, Ll/k0r;-><init>(Ll/h0r;)V

    .line 217
    .line 218
    .line 219
    invoke-static {v3, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 220
    .line 221
    .line 222
    add-int/lit8 p2, p2, 0x1

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :cond_6
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->e:Ll/ft5;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 4

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/4 p2, 0x0

    .line 9
    :goto_0
    if-ge p2, p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    iget p4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->c:I

    .line 16
    .line 17
    rem-int p5, p2, p4

    .line 18
    .line 19
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->a:I

    .line 20
    .line 21
    mul-int/2addr p5, v0

    .line 22
    div-int v1, p2, p4

    .line 23
    .line 24
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->d:I

    .line 25
    .line 26
    mul-int/2addr v1, v2

    .line 27
    rem-int v3, p2, p4

    .line 28
    .line 29
    mul-int/2addr v3, v0

    .line 30
    add-int/2addr v3, v0

    .line 31
    div-int p4, p2, p4

    .line 32
    .line 33
    mul-int/2addr p4, v2

    .line 34
    add-int/2addr p4, v2

    .line 35
    invoke-virtual {p3, p5, v1, v3, p4}, Landroid/view/View;->layout(IIII)V

    .line 36
    .line 37
    .line 38
    add-int/lit8 p2, p2, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->c:I

    .line 13
    .line 14
    div-int/2addr p1, v0

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->a:I

    .line 16
    .line 17
    div-int/lit8 p2, p2, 0x2

    .line 18
    .line 19
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->b:I

    .line 20
    .line 21
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->d:I

    .line 26
    .line 27
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->a:I

    .line 28
    .line 29
    const/high16 p2, 0x40000000    # 2.0f

    .line 30
    .line 31
    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->d:I

    .line 36
    .line 37
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->measureChildren(II)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public setRowSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaItemPageLayout;->c:I

    .line 2
    .line 3
    return-void
.end method
