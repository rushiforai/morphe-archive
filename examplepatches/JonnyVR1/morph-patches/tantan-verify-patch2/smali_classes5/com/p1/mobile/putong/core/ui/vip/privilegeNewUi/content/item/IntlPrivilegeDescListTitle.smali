.class public Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;
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

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;->d(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;)Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a$a;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;->e(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;)Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a$a;

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/c0p;->a(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    const/4 v3, 0x1

    .line 9
    invoke-virtual {v0, v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;->a:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;->c(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;->b(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;->a:Landroid/widget/TextView;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    const-string v0, "#cce8ca8a"

    .line 30
    .line 31
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;->c:Landroid/widget/TextView;

    .line 39
    .line 40
    const-string v2, "#66e8ca8a"

    .line 41
    .line 42
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const-string v0, "#99000000"

    .line 51
    .line 52
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;->c:Landroid/widget/TextView;

    .line 60
    .line 61
    const-string v2, "#66000000"

    .line 62
    .line 63
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    :goto_0
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;->f(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {v0}, Ll/r8g0;->b(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;->c:Landroid/widget/TextView;

    .line 79
    .line 80
    const/4 v4, 0x0

    .line 81
    if-eqz v0, :cond_1

    .line 82
    .line 83
    const/16 v0, 0x8

    .line 84
    .line 85
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_1
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v2, v0, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;->c:Landroid/widget/TextView;

    .line 97
    .line 98
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;->c:Landroid/widget/TextView;

    .line 102
    .line 103
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;->f(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;->c:Landroid/widget/TextView;

    .line 111
    .line 112
    new-instance v1, Ll/zzo;

    .line 113
    .line 114
    invoke-direct {v1, p1}, Ll/zzo;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 118
    .line 119
    .line 120
    :goto_1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;)I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;->b:Lv/VImage;

    .line 125
    .line 126
    if-lez v0, :cond_2

    .line 127
    .line 128
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;->b:Lv/VImage;

    .line 132
    .line 133
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;)I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;->b:Lv/VImage;

    .line 141
    .line 142
    new-instance v0, Ll/a0p;

    .line 143
    .line 144
    invoke-direct {v0, p1}, Ll/a0p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_2
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
