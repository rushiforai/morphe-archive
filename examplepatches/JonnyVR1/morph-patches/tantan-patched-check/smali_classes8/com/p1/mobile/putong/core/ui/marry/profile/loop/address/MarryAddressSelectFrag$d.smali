.class public Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;
.super Landroid/widget/BaseAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;->a:Ljava/util/ArrayList;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(I)Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 8
    .line 9
    return-object p0
.end method

.method public b(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;->a:Ljava/util/ArrayList;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;->a:Ljava/util/ArrayList;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;->a(I)Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

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
    .locals 3

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;

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
    sget v0, Ll/sec0;->i0:I

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
    new-instance p3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;

    .line 21
    .line 22
    invoke-direct {p3}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;-><init>()V

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
    iput-object v0, p3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;->a:Landroid/widget/TextView;

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
    iput-object v0, p3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;->b:Landroid/widget/ImageView;

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
    iput-object v0, p3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;->c:Landroid/view/View;

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
    check-cast p3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;

    .line 66
    .line 67
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;->a(I)Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iget-object v0, p3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;->a:Landroid/widget/TextView;

    .line 72
    .line 73
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;->b:Landroid/widget/ImageView;

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->showArrow()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;->b:Landroid/widget/ImageView;

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;

    .line 90
    .line 91
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    sget v2, Ll/kbc0;->r0:I

    .line 96
    .line 97
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->isSelected()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    iget-object v1, p3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;->c:Landroid/view/View;

    .line 109
    .line 110
    if-eqz v0, :cond_1

    .line 111
    .line 112
    sget v0, Ll/kbc0;->t0:I

    .line 113
    .line 114
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;->a:Landroid/widget/TextView;

    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;

    .line 120
    .line 121
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    sget v2, Ll/j9c0;->f:I

    .line 130
    .line 131
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;->b:Landroid/widget/ImageView;

    .line 139
    .line 140
    const/4 v1, 0x1

    .line 141
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;->b:Landroid/widget/ImageView;

    .line 145
    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;

    .line 147
    .line 148
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    sget v1, Ll/kbc0;->h:I

    .line 153
    .line 154
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_1
    sget p0, Ll/kbc0;->s0:I

    .line 163
    .line 164
    invoke-virtual {v1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 165
    .line 166
    .line 167
    iget-object p0, p3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;->a:Landroid/widget/TextView;

    .line 168
    .line 169
    const-string v0, "#cf000000"

    .line 170
    .line 171
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 176
    .line 177
    .line 178
    :goto_1
    iget-object p0, p3, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;->a:Landroid/widget/TextView;

    .line 179
    .line 180
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->getShowText()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 185
    .line 186
    .line 187
    return-object p2
.end method
