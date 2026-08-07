.class public Ll/nqa0$b;
.super Landroid/widget/BaseAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/nqa0;
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

.field public final synthetic b:Ll/nqa0;


# direct methods
.method public constructor <init>(Ll/nqa0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nqa0$b;->b:Ll/nqa0;

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
    iput-object p1, p0, Ll/nqa0$b;->a:Ljava/util/ArrayList;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nqa0$b;->a:Ljava/util/ArrayList;

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
    iget-object v0, p0, Ll/nqa0$b;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/nqa0$b;->a:Ljava/util/ArrayList;

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
    iget-object p0, p0, Ll/nqa0$b;->a:Ljava/util/ArrayList;

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
    invoke-virtual {p0, p1}, Ll/nqa0$b;->a(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    iget-object p2, p0, Ll/nqa0$b;->b:Ll/nqa0;

    .line 5
    .line 6
    invoke-interface {p2}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    sget v1, Ll/sec0;->A:I

    .line 15
    .line 16
    invoke-virtual {p2, v1, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    new-instance p3, Ll/nqa0$c;

    .line 21
    .line 22
    iget-object v1, p0, Ll/nqa0$b;->b:Ll/nqa0;

    .line 23
    .line 24
    invoke-direct {p3, v1}, Ll/nqa0$c;-><init>(Ll/nqa0;)V

    .line 25
    .line 26
    .line 27
    sget v1, Ll/gdc0;->Y:I

    .line 28
    .line 29
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Landroid/widget/TextView;

    .line 34
    .line 35
    iput-object v1, p3, Ll/nqa0$c;->a:Landroid/widget/TextView;

    .line 36
    .line 37
    sget v1, Ll/gdc0;->a:I

    .line 38
    .line 39
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Landroid/widget/ImageView;

    .line 44
    .line 45
    iput-object v1, p3, Ll/nqa0$c;->b:Landroid/widget/ImageView;

    .line 46
    .line 47
    sget v1, Ll/gdc0;->c:I

    .line 48
    .line 49
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lv/VImage;

    .line 54
    .line 55
    iput-object v1, p3, Ll/nqa0$c;->c:Lv/VImage;

    .line 56
    .line 57
    sget v1, Ll/gdc0;->y:I

    .line 58
    .line 59
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iput-object v1, p3, Ll/nqa0$c;->d:Landroid/view/View;

    .line 64
    .line 65
    sget v1, Ll/gdc0;->z:I

    .line 66
    .line 67
    invoke-virtual {p2, v1, p3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    sget p3, Ll/gdc0;->z:I

    .line 72
    .line 73
    invoke-virtual {p2, p3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    check-cast p3, Ll/nqa0$c;

    .line 78
    .line 79
    :goto_0
    invoke-virtual {p0, p1}, Ll/nqa0$b;->a(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object v1, p3, Ll/nqa0$c;->a:Landroid/widget/TextView;

    .line 84
    .line 85
    iget-object v2, p0, Ll/nqa0$b;->b:Ll/nqa0;

    .line 86
    .line 87
    invoke-interface {v2}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    sget v3, Ll/j9c0;->i:I

    .line 96
    .line 97
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->e()Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    iget-object v2, p3, Ll/nqa0$c;->a:Landroid/widget/TextView;

    .line 109
    .line 110
    const/4 v3, 0x1

    .line 111
    if-eqz v1, :cond_1

    .line 112
    .line 113
    invoke-static {v3}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 118
    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_1
    invoke-static {v0}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 126
    .line 127
    .line 128
    :goto_1
    iget-object v0, p3, Ll/nqa0$c;->b:Landroid/widget/ImageView;

    .line 129
    .line 130
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->e()Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p3, Ll/nqa0$c;->a:Landroid/widget/TextView;

    .line 138
    .line 139
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->c()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p3, Ll/nqa0$c;->c:Lv/VImage;

    .line 147
    .line 148
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->e()Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    xor-int/2addr v1, v3

    .line 153
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p3, Ll/nqa0$c;->c:Lv/VImage;

    .line 157
    .line 158
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    if-eqz v1, :cond_2

    .line 163
    .line 164
    sget v1, Ll/kbc0;->h:I

    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_2
    sget v1, Ll/kbc0;->g:I

    .line 168
    .line 169
    :goto_2
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-eqz p1, :cond_3

    .line 177
    .line 178
    iget-object p1, p3, Ll/nqa0$c;->a:Landroid/widget/TextView;

    .line 179
    .line 180
    iget-object p0, p0, Ll/nqa0$b;->b:Ll/nqa0;

    .line 181
    .line 182
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    sget p3, Ll/j9c0;->f:I

    .line 191
    .line 192
    invoke-virtual {p0, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 193
    .line 194
    .line 195
    move-result p0

    .line 196
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 197
    .line 198
    .line 199
    :cond_3
    return-object p2
.end method
