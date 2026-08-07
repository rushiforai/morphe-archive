.class public Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;
.super Landroid/widget/BaseAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->a:Ljava/util/ArrayList;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 8
    .line 9
    return-object p0
.end method

.method public b(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->a(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    sget v0, Ll/sec0;->w:I

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    new-instance p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;

    .line 21
    .line 22
    invoke-direct {p3}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;-><init>()V

    .line 23
    .line 24
    .line 25
    sget v0, Ll/gdc0;->Y:I

    .line 26
    .line 27
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/widget/TextView;

    .line 32
    .line 33
    iput-object v0, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->a:Landroid/widget/TextView;

    .line 34
    .line 35
    sget v0, Ll/gdc0;->a:I

    .line 36
    .line 37
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Landroid/widget/ImageView;

    .line 42
    .line 43
    iput-object v0, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->b:Landroid/widget/ImageView;

    .line 44
    .line 45
    sget v0, Ll/gdc0;->y:I

    .line 46
    .line 47
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->c:Landroid/view/View;

    .line 52
    .line 53
    sget v0, Ll/gdc0;->z:I

    .line 54
    .line 55
    invoke-virtual {p2, v0, p3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    sget p3, Ll/gdc0;->z:I

    .line 60
    .line 61
    invoke-virtual {p2, p3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p3

    .line 65
    check-cast p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;

    .line 66
    .line 67
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->a(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const/4 v1, 0x1

    .line 72
    if-nez p1, :cond_1

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->c()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;

    .line 79
    .line 80
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->V2:I

    .line 81
    .line 82
    invoke-virtual {v2, v3}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-eqz p1, :cond_1

    .line 91
    .line 92
    iget-object p1, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->a:Landroid/widget/TextView;

    .line 93
    .line 94
    const-string v2, "#e6000000"

    .line 95
    .line 96
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->a:Landroid/widget/TextView;

    .line 104
    .line 105
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 106
    .line 107
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->b:Landroid/widget/ImageView;

    .line 111
    .line 112
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->b:Landroid/widget/ImageView;

    .line 116
    .line 117
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;

    .line 118
    .line 119
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    sget v3, Ll/kbc0;->s:I

    .line 124
    .line 125
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 130
    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_1
    iget-object p1, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->a:Landroid/widget/TextView;

    .line 134
    .line 135
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 136
    .line 137
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->b:Landroid/widget/ImageView;

    .line 141
    .line 142
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->e()Z

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->b:Landroid/widget/ImageView;

    .line 150
    .line 151
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;

    .line 152
    .line 153
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    sget v3, Ll/kbc0;->r0:I

    .line 158
    .line 159
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 164
    .line 165
    .line 166
    :goto_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    if-eqz p1, :cond_2

    .line 171
    .line 172
    iget-object p1, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->c:Landroid/view/View;

    .line 173
    .line 174
    sget v2, Ll/kbc0;->t0:I

    .line 175
    .line 176
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->a:Landroid/widget/TextView;

    .line 180
    .line 181
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;

    .line 182
    .line 183
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    sget v3, Ll/j9c0;->f:I

    .line 192
    .line 193
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 198
    .line 199
    .line 200
    iget-object p1, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->b:Landroid/widget/ImageView;

    .line 201
    .line 202
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 203
    .line 204
    .line 205
    iget-object p1, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->b:Landroid/widget/ImageView;

    .line 206
    .line 207
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;

    .line 208
    .line 209
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    sget v1, Ll/kbc0;->h:I

    .line 214
    .line 215
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 220
    .line 221
    .line 222
    goto :goto_2

    .line 223
    :cond_2
    iget-object p0, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->c:Landroid/view/View;

    .line 224
    .line 225
    sget p1, Ll/kbc0;->s0:I

    .line 226
    .line 227
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 228
    .line 229
    .line 230
    iget-object p0, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->a:Landroid/widget/TextView;

    .line 231
    .line 232
    const-string p1, "#cf000000"

    .line 233
    .line 234
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 235
    .line 236
    .line 237
    move-result p1

    .line 238
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 239
    .line 240
    .line 241
    :goto_2
    iget-object p0, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;->a:Landroid/widget/TextView;

    .line 242
    .line 243
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->c()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 248
    .line 249
    .line 250
    return-object p2
.end method
