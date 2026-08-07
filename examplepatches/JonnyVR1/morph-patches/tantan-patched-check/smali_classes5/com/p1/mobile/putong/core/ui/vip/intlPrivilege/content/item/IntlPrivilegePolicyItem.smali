.class public Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;
.super Lv/VLinear;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem$a;
    }
.end annotation


# instance fields
.field public c:Landroid/view/View;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/g0p;->a(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem$a;Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem$a;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    const/high16 v2, 0x41b00000    # 22.0f

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->c:Landroid/view/View;

    .line 13
    .line 14
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem$a;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->d:Landroid/widget/TextView;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->e:Landroid/widget/TextView;

    .line 31
    .line 32
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 v0, 0x1

    .line 41
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->d:Landroid/widget/TextView;

    .line 45
    .line 46
    const/high16 v1, 0x420c0000    # 35.0f

    .line 47
    .line 48
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 53
    .line 54
    .line 55
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->d:Landroid/widget/TextView;

    .line 56
    .line 57
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    sget v2, Ll/c9c0;->e0:I

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->e:Landroid/widget/TextView;

    .line 75
    .line 76
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    sget v1, Ll/c9c0;->e0:I

    .line 85
    .line 86
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_1
    invoke-static {v0}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_2

    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->c:Landroid/view/View;

    .line 101
    .line 102
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->d:Landroid/widget/TextView;

    .line 106
    .line 107
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->e:Landroid/widget/TextView;

    .line 111
    .line 112
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->e:Landroid/widget/TextView;

    .line 120
    .line 121
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    sget v1, Ll/c9c0;->h0:I

    .line 130
    .line 131
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 132
    .line 133
    .line 134
    move-result p2

    .line 135
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 136
    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->d:Landroid/widget/TextView;

    .line 140
    .line 141
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    sget v2, Ll/c9c0;->e0:I

    .line 150
    .line 151
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->e:Landroid/widget/TextView;

    .line 159
    .line 160
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 161
    .line 162
    .line 163
    move-result-object p2

    .line 164
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    sget v1, Ll/c9c0;->e0:I

    .line 169
    .line 170
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 171
    .line 172
    .line 173
    move-result p2

    .line 174
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 175
    .line 176
    .line 177
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->d:Landroid/widget/TextView;

    .line 178
    .line 179
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem$a;->a:Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 182
    .line 183
    .line 184
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->e:Landroid/widget/TextView;

    .line 185
    .line 186
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem$a;->b:Ljava/lang/CharSequence;

    .line 187
    .line 188
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 189
    .line 190
    .line 191
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->e:Landroid/widget/TextView;

    .line 192
    .line 193
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 194
    .line 195
    .line 196
    move-result-object p2

    .line 197
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 198
    .line 199
    .line 200
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->e:Landroid/widget/TextView;

    .line 201
    .line 202
    const/4 p1, 0x0

    .line 203
    const p2, 0x3f99999a    # 1.2f

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0, p1, p2}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 207
    .line 208
    .line 209
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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
