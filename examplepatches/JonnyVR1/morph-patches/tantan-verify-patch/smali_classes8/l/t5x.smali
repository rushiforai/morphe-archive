.class public Ll/t5x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/p5x;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;

.field public B:[Lv/VImage;

.field public C:[Landroid/view/View;

.field public D:Z

.field public E:I

.field public final F:I

.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

.field public c:Lv/VLinear;

.field public d:Lv/VText;

.field public e:Lv/VImage;

.field public f:Lv/VLinear;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public i:Lv/VLinear;

.field public j:Lv/VText;

.field public k:Lv/VImage;

.field public l:Lv/VLinear;

.field public m:Lv/VText;

.field public n:Lv/VImage;

.field public o:Lv/VLinear;

.field public p:Lv/VText;

.field public q:Lv/VImage;

.field public r:Lv/VLinear;

.field public s:Lv/VImage;

.field public t:Lv/VLinear;

.field public u:Lv/VImage;

.field public v:Lv/VLinear;

.field public w:Lv/VImage;

.field public x:Lv/VButton;

.field public y:Lv/VImage;

.field public z:Ll/p5x;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/t5x;->D:Z

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Ll/t5x;->E:I

    .line 9
    .line 10
    const/4 v0, 0x7

    .line 11
    iput v0, p0, Ll/t5x;->F:I

    .line 12
    .line 13
    iput-object p1, p0, Ll/t5x;->A:Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Ll/t5x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t5x;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/t5x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t5x;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/t5x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t5x;->l(Landroid/view/View;)V

    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/t5x;->D:Z

    .line 2
    .line 3
    xor-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    iput-boolean p1, p0, Ll/t5x;->D:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/t5x;->m()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t5x;->A:Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget p1, p0, Ll/t5x;->E:I

    .line 2
    .line 3
    if-ltz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/t5x;->z:Ll/p5x;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/p5x;->i0(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/t5x;->A:Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/u5x;->b(Ll/t5x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/p5x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t5x;->z:Ll/p5x;

    .line 2
    .line 3
    return-void
.end method

.method public final f()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/t5x;->B:[Lv/VImage;

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_1

    .line 6
    .line 7
    aget-object v1, v1, v0

    .line 8
    .line 9
    iget v2, p0, Ll/t5x;->E:I

    .line 10
    .line 11
    if-ne v0, v2, :cond_0

    .line 12
    .line 13
    sget v2, Ll/dbc0;->Vd:I

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    sget v2, Ll/dbc0;->Ud:I

    .line 17
    .line 18
    :goto_1
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    invoke-virtual {p0}, Ll/t5x;->i()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t5x;->x:Lv/VButton;

    .line 2
    .line 3
    iget v1, p0, Ll/t5x;->E:I

    .line 4
    .line 5
    if-ltz v1, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v1, 0x0

    .line 10
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/t5x;->x:Lv/VButton;

    .line 14
    .line 15
    iget p0, p0, Ll/t5x;->E:I

    .line 16
    .line 17
    if-ltz p0, :cond_1

    .line 18
    .line 19
    sget p0, Ll/dbc0;->T:I

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    sget p0, Ll/dbc0;->s:I

    .line 23
    .line 24
    :goto_1
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/p5x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t5x;->e(Ll/p5x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t5x;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final m()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t5x;->q:Lv/VImage;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/t5x;->D:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const/high16 v1, 0x43340000    # 180.0f

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setRotation(F)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x4

    .line 15
    :goto_1
    iget-object v1, p0, Ll/t5x;->C:[Landroid/view/View;

    .line 16
    .line 17
    array-length v2, v1

    .line 18
    if-ge v0, v2, :cond_1

    .line 19
    .line 20
    aget-object v1, v1, v0

    .line 21
    .line 22
    iget-boolean v2, p0, Ll/t5x;->D:Z

    .line 23
    .line 24
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Ll/t5x;->E:I

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/t5x;->f()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public r()V
    .locals 10

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/t5x;->a:Lv/VDraweeView;

    .line 4
    .line 5
    const-string v2, "https://auto.tancdn.com/v1/raw/904432ed-ba77-4288-8865-1411b792009c10.webp"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/t5x;->b:Lv/VText;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x7

    .line 21
    new-array v2, v0, [Lv/VImage;

    .line 22
    .line 23
    iput-object v2, p0, Ll/t5x;->B:[Lv/VImage;

    .line 24
    .line 25
    iget-object v3, p0, Ll/t5x;->e:Lv/VImage;

    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    aput-object v3, v2, v4

    .line 29
    .line 30
    iget-object v3, p0, Ll/t5x;->h:Lv/VImage;

    .line 31
    .line 32
    aput-object v3, v2, v1

    .line 33
    .line 34
    iget-object v3, p0, Ll/t5x;->k:Lv/VImage;

    .line 35
    .line 36
    const/4 v5, 0x2

    .line 37
    aput-object v3, v2, v5

    .line 38
    .line 39
    iget-object v3, p0, Ll/t5x;->n:Lv/VImage;

    .line 40
    .line 41
    const/4 v6, 0x3

    .line 42
    aput-object v3, v2, v6

    .line 43
    .line 44
    iget-object v3, p0, Ll/t5x;->s:Lv/VImage;

    .line 45
    .line 46
    const/4 v7, 0x4

    .line 47
    aput-object v3, v2, v7

    .line 48
    .line 49
    iget-object v3, p0, Ll/t5x;->u:Lv/VImage;

    .line 50
    .line 51
    const/4 v8, 0x5

    .line 52
    aput-object v3, v2, v8

    .line 53
    .line 54
    iget-object v3, p0, Ll/t5x;->w:Lv/VImage;

    .line 55
    .line 56
    const/4 v9, 0x6

    .line 57
    aput-object v3, v2, v9

    .line 58
    .line 59
    new-array v2, v0, [Landroid/view/View;

    .line 60
    .line 61
    iput-object v2, p0, Ll/t5x;->C:[Landroid/view/View;

    .line 62
    .line 63
    iget-object v3, p0, Ll/t5x;->c:Lv/VLinear;

    .line 64
    .line 65
    aput-object v3, v2, v4

    .line 66
    .line 67
    iget-object v3, p0, Ll/t5x;->f:Lv/VLinear;

    .line 68
    .line 69
    aput-object v3, v2, v1

    .line 70
    .line 71
    iget-object v3, p0, Ll/t5x;->i:Lv/VLinear;

    .line 72
    .line 73
    aput-object v3, v2, v5

    .line 74
    .line 75
    iget-object v3, p0, Ll/t5x;->l:Lv/VLinear;

    .line 76
    .line 77
    aput-object v3, v2, v6

    .line 78
    .line 79
    iget-object v3, p0, Ll/t5x;->r:Lv/VLinear;

    .line 80
    .line 81
    aput-object v3, v2, v7

    .line 82
    .line 83
    iget-object v3, p0, Ll/t5x;->t:Lv/VLinear;

    .line 84
    .line 85
    aput-object v3, v2, v8

    .line 86
    .line 87
    iget-object v3, p0, Ll/t5x;->v:Lv/VLinear;

    .line 88
    .line 89
    aput-object v3, v2, v9

    .line 90
    .line 91
    move v2, v4

    .line 92
    :goto_0
    if-ge v2, v0, :cond_0

    .line 93
    .line 94
    iget-object v3, p0, Ll/t5x;->C:[Landroid/view/View;

    .line 95
    .line 96
    aget-object v3, v3, v2

    .line 97
    .line 98
    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    iget-object v3, p0, Ll/t5x;->C:[Landroid/view/View;

    .line 102
    .line 103
    aget-object v3, v3, v2

    .line 104
    .line 105
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    invoke-virtual {v3, v5}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    add-int/lit8 v2, v2, 0x1

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_0
    iget-object v0, p0, Ll/t5x;->o:Lv/VLinear;

    .line 116
    .line 117
    new-instance v2, Ll/q5x;

    .line 118
    .line 119
    invoke-direct {v2, p0}, Ll/q5x;-><init>(Ll/t5x;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/t5x;->y:Lv/VImage;

    .line 126
    .line 127
    new-instance v2, Ll/r5x;

    .line 128
    .line 129
    invoke-direct {v2, p0}, Ll/r5x;-><init>(Ll/t5x;)V

    .line 130
    .line 131
    .line 132
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ll/t5x;->x:Lv/VButton;

    .line 136
    .line 137
    new-instance v2, Ll/s5x;

    .line 138
    .line 139
    invoke-direct {v2, p0}, Ll/s5x;-><init>(Ll/t5x;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0}, Ll/t5x;->i()V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0}, Ll/t5x;->f()V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Ll/t5x;->y:Lv/VImage;

    .line 152
    .line 153
    new-array v2, v1, [Landroid/view/View;

    .line 154
    .line 155
    aput-object v0, v2, v4

    .line 156
    .line 157
    invoke-static {v2}, Ll/bnl0;->Z([Landroid/view/View;)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Ll/t5x;->d:Lv/VText;

    .line 161
    .line 162
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Ll/t5x;->g:Lv/VText;

    .line 170
    .line 171
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Ll/t5x;->j:Lv/VText;

    .line 179
    .line 180
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 185
    .line 186
    .line 187
    iget-object v0, p0, Ll/t5x;->m:Lv/VText;

    .line 188
    .line 189
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 194
    .line 195
    .line 196
    iget-object p0, p0, Ll/t5x;->p:Lv/VText;

    .line 197
    .line 198
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {p0, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 203
    .line 204
    .line 205
    return-void
.end method
