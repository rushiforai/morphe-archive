.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Lv/VImage;

.field public c:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;->d(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;->d(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a$a;->a(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;->c(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;->c(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a$a;->a(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/i590;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->a:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;->b(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;->f(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Ll/r8g0;->b(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->c:Landroid/widget/TextView;

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    const/16 v0, 0x8

    .line 34
    .line 35
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->c:Landroid/widget/TextView;

    .line 47
    .line 48
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->c:Landroid/widget/TextView;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;->f(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->c:Landroid/widget/TextView;

    .line 61
    .line 62
    new-instance v1, Ll/g590;

    .line 63
    .line 64
    invoke-direct {v1, p1}, Ll/g590;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    :goto_0
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->b:Lv/VImage;

    .line 75
    .line 76
    if-lez v0, :cond_1

    .line 77
    .line 78
    const/4 v0, 0x1

    .line 79
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->b:Lv/VImage;

    .line 83
    .line 84
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->b:Lv/VImage;

    .line 92
    .line 93
    new-instance v1, Ll/h590;

    .line 94
    .line 95
    invoke-direct {v1, p1}, Ll/h590;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_1
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    :goto_1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;->e(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_2

    .line 114
    .line 115
    invoke-static {}, Ll/s7a;->o()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_2

    .line 120
    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->a:Landroid/widget/TextView;

    .line 122
    .line 123
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    sget v1, Ll/c9c0;->c1:I

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->c:Landroid/widget/TextView;

    .line 137
    .line 138
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    sget v0, Ll/c9c0;->c1:I

    .line 143
    .line 144
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_2
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;->e(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 157
    .line 158
    if-ne p1, v0, :cond_3

    .line 159
    .line 160
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->a:Landroid/widget/TextView;

    .line 161
    .line 162
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    sget v1, Ll/c9c0;->b0:I

    .line 167
    .line 168
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 173
    .line 174
    .line 175
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->c:Landroid/widget/TextView;

    .line 176
    .line 177
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    sget v0, Ll/c9c0;->b0:I

    .line 182
    .line 183
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 188
    .line 189
    .line 190
    :cond_3
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
