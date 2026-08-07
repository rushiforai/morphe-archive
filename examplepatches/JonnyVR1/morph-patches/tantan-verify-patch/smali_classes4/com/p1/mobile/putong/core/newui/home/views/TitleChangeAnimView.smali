.class public Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;,
        Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:Landroid/view/View;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/ImageView;

.field public i:Landroid/view/View;

.field public j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

.field public k:Landroid/text/TextPaint;

.field public l:Ll/v0j0;

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const p1, -0x9c9c9d

    .line 5
    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->a:I

    .line 8
    .line 9
    const/4 p1, -0x1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->b:I

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->e()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p1, -0x9c9c9d

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->a:I

    const/4 p1, -0x1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->b:I

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->e()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const p1, -0x9c9c9d

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->a:I

    const/4 p1, -0x1

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->b:I

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->e()V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;III)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->d(III)I

    move-result p0

    return p0
.end method


# virtual methods
.method public final b(Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->k:Landroid/text/TextPaint;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    invoke-virtual {p0, p1, v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    float-to-int p0, p0

    .line 13
    return p0
.end method

.method public final c(I)I
    .locals 0

    .line 1
    int-to-float p0, p1

    .line 2
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public final d(III)I
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-static {p2}, Landroid/graphics/Color;->red(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-static {p2}, Landroid/graphics/Color;->green(I)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-static {p2}, Landroid/graphics/Color;->blue(I)I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    invoke-static {p2}, Landroid/graphics/Color;->alpha(I)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    sub-int/2addr v2, p0

    .line 34
    sub-int/2addr v3, v0

    .line 35
    sub-int/2addr v4, v1

    .line 36
    sub-int/2addr p2, p1

    .line 37
    mul-int/2addr v2, p3

    .line 38
    div-int/lit8 v2, v2, 0x64

    .line 39
    .line 40
    add-int/2addr p0, v2

    .line 41
    mul-int/2addr v3, p3

    .line 42
    div-int/lit8 v3, v3, 0x64

    .line 43
    .line 44
    add-int/2addr v0, v3

    .line 45
    mul-int/2addr v4, p3

    .line 46
    div-int/lit8 v4, v4, 0x64

    .line 47
    .line 48
    add-int/2addr v1, v4

    .line 49
    mul-int/2addr p3, p2

    .line 50
    div-int/lit8 p3, p3, 0x64

    .line 51
    .line 52
    add-int/2addr p1, p3

    .line 53
    invoke-static {p1, p0, v0, v1}, Landroid/graphics/Color;->argb(IIII)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0
.end method

.method public final e()V
    .locals 2

    .line 1
    new-instance v0, Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->k:Landroid/text/TextPaint;

    .line 7
    .line 8
    const/16 v1, 0xd

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c(I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    int-to-float v1, v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 24
    .line 25
    return-void
.end method

.method public f()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c(I)I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x2

    .line 9
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c(I)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->l:Ll/v0j0;

    .line 14
    .line 15
    iget-boolean v4, v3, Ll/v0j0;->d:Z

    .line 16
    .line 17
    const/high16 v5, 0x3f800000    # 1.0f

    .line 18
    .line 19
    const/4 v6, 0x0

    .line 20
    const/16 v7, 0xf

    .line 21
    .line 22
    const/16 v8, 0xc

    .line 23
    .line 24
    if-nez v4, :cond_0

    .line 25
    .line 26
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->e:Landroid/widget/TextView;

    .line 27
    .line 28
    iget-object v3, v3, Ll/v0j0;->a:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->f:Landroid/widget/TextView;

    .line 34
    .line 35
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->l:Ll/v0j0;

    .line 36
    .line 37
    iget-object v3, v3, Ll/v0j0;->b:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->l:Ll/v0j0;

    .line 43
    .line 44
    iget-object v2, v2, Ll/v0j0;->a:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->b(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-virtual {v0, v8}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c(I)I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    add-int/2addr v2, v3

    .line 55
    invoke-virtual {v0, v7}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c(I)I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    add-int v10, v2, v3

    .line 60
    .line 61
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->l:Ll/v0j0;

    .line 62
    .line 63
    iget-object v2, v2, Ll/v0j0;->b:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->b(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-virtual {v0, v8}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c(I)I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    add-int/2addr v2, v3

    .line 74
    invoke-virtual {v0, v7}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c(I)I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    add-int/2addr v2, v3

    .line 79
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 80
    .line 81
    iget-object v3, v3, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->c:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 82
    .line 83
    sub-int v4, v10, v1

    .line 84
    .line 85
    add-int/2addr v1, v10

    .line 86
    sub-int v7, v2, v10

    .line 87
    .line 88
    invoke-virtual {v3, v6, v4, v1, v7}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->c(IIII)Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 93
    .line 94
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->a:I

    .line 95
    .line 96
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->a(I)V

    .line 97
    .line 98
    .line 99
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 100
    .line 101
    iget-object v9, v1, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->d:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 102
    .line 103
    iget v14, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->b:I

    .line 104
    .line 105
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->a:I

    .line 106
    .line 107
    sub-int v15, v1, v14

    .line 108
    .line 109
    move v12, v10

    .line 110
    const/4 v10, 0x0

    .line 111
    const/4 v11, 0x0

    .line 112
    const/4 v13, 0x0

    .line 113
    invoke-virtual/range {v9 .. v15}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->d(IIIIII)Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    const/4 v3, 0x0

    .line 118
    invoke-virtual {v1, v5, v3}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->b(FF)Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 123
    .line 124
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->a:I

    .line 125
    .line 126
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->a(I)V

    .line 127
    .line 128
    .line 129
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 130
    .line 131
    iget-object v9, v1, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->f:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 132
    .line 133
    iget v14, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->a:I

    .line 134
    .line 135
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->b:I

    .line 136
    .line 137
    sub-int v15, v1, v14

    .line 138
    .line 139
    move v10, v12

    .line 140
    move v12, v2

    .line 141
    invoke-virtual/range {v9 .. v15}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->d(IIIIII)Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 146
    .line 147
    iget v2, v2, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->a:I

    .line 148
    .line 149
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->a(I)V

    .line 150
    .line 151
    .line 152
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c:Landroid/view/View;

    .line 153
    .line 154
    const/16 v2, 0x8

    .line 155
    .line 156
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 157
    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :cond_0
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->d:Landroid/widget/TextView;

    .line 162
    .line 163
    iget-object v3, v3, Ll/v0j0;->c:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    .line 167
    .line 168
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->e:Landroid/widget/TextView;

    .line 169
    .line 170
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->l:Ll/v0j0;

    .line 171
    .line 172
    iget-object v4, v4, Ll/v0j0;->a:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 175
    .line 176
    .line 177
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->f:Landroid/widget/TextView;

    .line 178
    .line 179
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->l:Ll/v0j0;

    .line 180
    .line 181
    iget-object v4, v4, Ll/v0j0;->b:Ljava/lang/String;

    .line 182
    .line 183
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    .line 185
    .line 186
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c:Landroid/view/View;

    .line 187
    .line 188
    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 189
    .line 190
    .line 191
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->l:Ll/v0j0;

    .line 192
    .line 193
    iget-object v3, v3, Ll/v0j0;->a:Ljava/lang/String;

    .line 194
    .line 195
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->b(Ljava/lang/String;)I

    .line 196
    .line 197
    .line 198
    move-result v3

    .line 199
    invoke-virtual {v0, v8}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c(I)I

    .line 200
    .line 201
    .line 202
    move-result v4

    .line 203
    add-int/2addr v3, v4

    .line 204
    invoke-virtual {v0, v7}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c(I)I

    .line 205
    .line 206
    .line 207
    move-result v4

    .line 208
    add-int v12, v3, v4

    .line 209
    .line 210
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->l:Ll/v0j0;

    .line 211
    .line 212
    iget-object v3, v3, Ll/v0j0;->c:Ljava/lang/String;

    .line 213
    .line 214
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->b(Ljava/lang/String;)I

    .line 215
    .line 216
    .line 217
    move-result v3

    .line 218
    invoke-virtual {v0, v8}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c(I)I

    .line 219
    .line 220
    .line 221
    move-result v4

    .line 222
    add-int/2addr v3, v4

    .line 223
    const/16 v4, 0xa

    .line 224
    .line 225
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c(I)I

    .line 226
    .line 227
    .line 228
    move-result v4

    .line 229
    add-int/2addr v3, v4

    .line 230
    const/16 v4, 0x12

    .line 231
    .line 232
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c(I)I

    .line 233
    .line 234
    .line 235
    move-result v4

    .line 236
    add-int v16, v3, v4

    .line 237
    .line 238
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->l:Ll/v0j0;

    .line 239
    .line 240
    iget-object v3, v3, Ll/v0j0;->b:Ljava/lang/String;

    .line 241
    .line 242
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->b(Ljava/lang/String;)I

    .line 243
    .line 244
    .line 245
    move-result v3

    .line 246
    invoke-virtual {v0, v8}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c(I)I

    .line 247
    .line 248
    .line 249
    move-result v4

    .line 250
    add-int/2addr v3, v4

    .line 251
    invoke-virtual {v0, v7}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c(I)I

    .line 252
    .line 253
    .line 254
    move-result v4

    .line 255
    add-int/2addr v3, v4

    .line 256
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 257
    .line 258
    iget-object v4, v4, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->c:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 259
    .line 260
    sub-int v7, v12, v1

    .line 261
    .line 262
    add-int v8, v16, v2

    .line 263
    .line 264
    add-int/2addr v1, v3

    .line 265
    sub-int v1, v1, v16

    .line 266
    .line 267
    sub-int/2addr v1, v2

    .line 268
    invoke-virtual {v4, v6, v7, v8, v1}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->c(IIII)Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 273
    .line 274
    iget v2, v2, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->a:I

    .line 275
    .line 276
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->a(I)V

    .line 277
    .line 278
    .line 279
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 280
    .line 281
    iget-object v13, v1, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->f:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 282
    .line 283
    sub-int v15, v12, v16

    .line 284
    .line 285
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->a:I

    .line 286
    .line 287
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->b:I

    .line 288
    .line 289
    sub-int v19, v2, v1

    .line 290
    .line 291
    const/16 v17, 0x0

    .line 292
    .line 293
    move/from16 v18, v1

    .line 294
    .line 295
    move/from16 v14, v16

    .line 296
    .line 297
    move/from16 v16, v3

    .line 298
    .line 299
    invoke-virtual/range {v13 .. v19}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->d(IIIIII)Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 300
    .line 301
    .line 302
    move-result-object v1

    .line 303
    move/from16 v16, v14

    .line 304
    .line 305
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 306
    .line 307
    iget v2, v2, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->a:I

    .line 308
    .line 309
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->a(I)V

    .line 310
    .line 311
    .line 312
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 313
    .line 314
    iget-object v9, v1, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->d:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 315
    .line 316
    iget v14, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->b:I

    .line 317
    .line 318
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->a:I

    .line 319
    .line 320
    sub-int v15, v1, v14

    .line 321
    .line 322
    const/4 v10, 0x0

    .line 323
    const/4 v11, 0x0

    .line 324
    const/4 v13, 0x0

    .line 325
    invoke-virtual/range {v9 .. v15}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->d(IIIIII)Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    const/high16 v2, -0x40800000    # -1.0f

    .line 330
    .line 331
    const/high16 v3, 0x40000000    # 2.0f

    .line 332
    .line 333
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->b(FF)Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 334
    .line 335
    .line 336
    move-result-object v1

    .line 337
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 338
    .line 339
    iget v2, v2, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->a:I

    .line 340
    .line 341
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->a(I)V

    .line 342
    .line 343
    .line 344
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 345
    .line 346
    iget-object v13, v1, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->e:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 347
    .line 348
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->b:I

    .line 349
    .line 350
    const/16 v19, 0x0

    .line 351
    .line 352
    const/4 v14, 0x0

    .line 353
    const/4 v15, 0x0

    .line 354
    move/from16 v18, v1

    .line 355
    .line 356
    invoke-virtual/range {v13 .. v19}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->d(IIIIII)Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    const/high16 v2, -0x40000000    # -2.0f

    .line 361
    .line 362
    invoke-virtual {v1, v5, v2}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->b(FF)Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 363
    .line 364
    .line 365
    move-result-object v1

    .line 366
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 367
    .line 368
    iget v2, v2, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->a:I

    .line 369
    .line 370
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->a(I)V

    .line 371
    .line 372
    .line 373
    :goto_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->g()V

    .line 374
    .line 375
    .line 376
    return-void
.end method

.method public final g()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->i:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->c:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->h(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->f:Landroid/widget/TextView;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->f:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 15
    .line 16
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->h(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->e:Landroid/widget/TextView;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->d:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->h(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c:Landroid/view/View;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->e:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->h(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public getRightView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 6
    .line 7
    iget v0, p2, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->f:I

    .line 8
    .line 9
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 10
    .line 11
    iget v0, p2, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->c:I

    .line 12
    .line 13
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 14
    .line 15
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->m:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    instance-of v0, p1, Landroid/widget/TextView;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    move-object v0, p1

    .line 24
    check-cast v0, Landroid/widget/TextView;

    .line 25
    .line 26
    iget v1, p2, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->l:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    move-object v0, p1

    .line 37
    check-cast v0, Landroid/view/ViewGroup;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-lez v1, :cond_2

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    :goto_0
    if-ge v2, v1, :cond_2

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    instance-of v4, v3, Landroid/widget/TextView;

    .line 53
    .line 54
    if-eqz v4, :cond_1

    .line 55
    .line 56
    check-cast v3, Landroid/widget/TextView;

    .line 57
    .line 58
    iget v4, p2, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->l:I

    .line 59
    .line 60
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 61
    .line 62
    .line 63
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    :goto_1
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    .line 68
    .line 69
    const/4 p0, 0x0

    .line 70
    iget p2, p2, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$b;->i:F

    .line 71
    .line 72
    invoke-static {p0, p2}, Ljava/lang/Math;->max(FF)F

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    const/high16 p2, 0x3f800000    # 1.0f

    .line 77
    .line 78
    invoke-static {p2, p0}, Ljava/lang/Math;->min(FF)F

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->Q6:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/TextView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->d:Landroid/widget/TextView;

    .line 13
    .line 14
    sget v0, Ll/adc0;->R6:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/TextView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->e:Landroid/widget/TextView;

    .line 23
    .line 24
    sget v0, Ll/adc0;->P6:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->c:Landroid/view/View;

    .line 31
    .line 32
    sget v0, Ll/adc0;->Gb:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Landroid/widget/TextView;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->f:Landroid/widget/TextView;

    .line 41
    .line 42
    sget v0, Ll/adc0;->q0:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->i:Landroid/view/View;

    .line 49
    .line 50
    sget v0, Ll/adc0;->Hb:I

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Landroid/widget/TextView;

    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->g:Landroid/widget/TextView;

    .line 59
    .line 60
    sget v0, Ll/adc0;->sb:I

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Landroid/widget/ImageView;

    .line 67
    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->h:Landroid/widget/ImageView;

    .line 69
    .line 70
    new-instance v0, Ll/v0j0;

    .line 71
    .line 72
    invoke-direct {v0}, Ll/v0j0;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->l:Ll/v0j0;

    .line 76
    .line 77
    const-string v1, "\u6ed1\u5361"

    .line 78
    .line 79
    iput-object v1, v0, Ll/v0j0;->a:Ljava/lang/String;

    .line 80
    .line 81
    const-string v1, "\u5feb\u804a"

    .line 82
    .line 83
    iput-object v1, v0, Ll/v0j0;->b:Ljava/lang/String;

    .line 84
    .line 85
    const/4 v1, 0x0

    .line 86
    iput-boolean v1, v0, Ll/v0j0;->d:Z

    .line 87
    .line 88
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 89
    .line 90
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;)V

    .line 91
    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->l:Ll/v0j0;

    .line 96
    .line 97
    iget-boolean v1, v1, Ll/v0j0;->d:Z

    .line 98
    .line 99
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->b:Z

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->f()V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public setAnimProgress(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->j:Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;

    .line 2
    .line 3
    iput p1, v0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView$a;->a(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->g()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setRedDot(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public setTitleFillInfo(Ll/v0j0;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->l:Ll/v0j0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/v0j0;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->l:Ll/v0j0;

    .line 12
    .line 13
    iget-object p1, p1, Ll/v0j0;->c:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 v0, 0x4

    .line 20
    if-le p1, v0, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->l:Ll/v0j0;

    .line 23
    .line 24
    iget-object v1, p1, Ll/v0j0;->c:Ljava/lang/String;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "\u2026"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p1, Ll/v0j0;->c:Ljava/lang/String;

    .line 38
    .line 39
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/TitleChangeAnimView;->f()V

    .line 40
    .line 41
    .line 42
    return-void
.end method
