.class public Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;
    }
.end annotation


# instance fields
.field public a:Lv/VIcon;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Landroid/view/View;

.field public e:Lcom/p1/mobile/putong/core/data/RoamedLocationData;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->new_()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->e:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->new_()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->e:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->new_()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->e:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;Lcom/p1/mobile/putong/app/PutongFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->g(Lcom/p1/mobile/putong/app/PutongFrag;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;->d:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 6
    .line 7
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a$a;->a(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->f(Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vzo;->a(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    const-string v0, "p_select_location_view,e_manyou,click"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, p1, v1}, Ll/psl0;->n(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Ll/xxv;->f()Z

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->e:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->data:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/4 v0, 0x5

    .line 23
    if-lt p0, v0, :cond_1

    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/VipBaseFrag;->B:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationHistoryAct;->X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/4 v0, 0x3

    .line 32
    invoke-virtual {p1, p0, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    const/4 p0, 0x1

    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/VipBaseFrag;->B:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/map/IntlMapAct;->g2(Landroid/content/Context;ILjava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const/4 v0, 0x2

    .line 44
    invoke-virtual {p1, p0, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->e:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/app/PutongFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;",
            "Ll/jic0<",
            "Ll/szo;",
            ">;",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ne v0, v1, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->b:Lv/VText;

    .line 9
    .line 10
    const/high16 v1, 0x41900000    # 18.0f

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 16
    .line 17
    const/high16 v1, 0x41400000    # 12.0f

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->b:Lv/VText;

    .line 23
    .line 24
    const-string v1, "#cce8ca8a"

    .line 25
    .line 26
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 34
    .line 35
    const-string v1, "#66e8ca8a"

    .line 36
    .line 37
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->a:Lv/VIcon;

    .line 45
    .line 46
    const/high16 v1, 0x41a00000    # 20.0f

    .line 47
    .line 48
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-static {v0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->a:Lv/VIcon;

    .line 56
    .line 57
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->d:Landroid/view/View;

    .line 65
    .line 66
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 67
    .line 68
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 69
    .line 70
    if-eq v1, v3, :cond_0

    .line 71
    .line 72
    move v1, v2

    .line 73
    goto :goto_0

    .line 74
    :cond_0
    const/4 v1, 0x0

    .line 75
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->d:Landroid/view/View;

    .line 79
    .line 80
    sget v1, Ll/dbc0;->Pa:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->d:Landroid/view/View;

    .line 86
    .line 87
    const/4 v1, 0x0

    .line 88
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    invoke-static {v0, v3}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->d:Landroid/view/View;

    .line 96
    .line 97
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 102
    .line 103
    .line 104
    goto/16 :goto_1

    .line 105
    .line 106
    :cond_1
    invoke-static {v0}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->b:Lv/VText;

    .line 111
    .line 112
    if-eqz v0, :cond_2

    .line 113
    .line 114
    const/high16 v0, 0x41880000    # 17.0f

    .line 115
    .line 116
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 120
    .line 121
    const/high16 v1, 0x41300000    # 11.0f

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->b:Lv/VText;

    .line 127
    .line 128
    const-string v1, "#3D2747"

    .line 129
    .line 130
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 138
    .line 139
    const-string v1, "#663D2747"

    .line 140
    .line 141
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->a:Lv/VIcon;

    .line 149
    .line 150
    const/high16 v1, 0x41b00000    # 22.0f

    .line 151
    .line 152
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 153
    .line 154
    .line 155
    move-result v3

    .line 156
    invoke-static {v0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->a:Lv/VIcon;

    .line 160
    .line 161
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 169
    .line 170
    const/high16 v1, 0x40800000    # 4.0f

    .line 171
    .line 172
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->d:Landroid/view/View;

    .line 180
    .line 181
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->d:Landroid/view/View;

    .line 185
    .line 186
    sget v1, Ll/dbc0;->mb:I

    .line 187
    .line 188
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->d:Landroid/view/View;

    .line 192
    .line 193
    const/high16 v1, 0x41500000    # 13.0f

    .line 194
    .line 195
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->d:Landroid/view/View;

    .line 203
    .line 204
    const/high16 v1, 0x41980000    # 19.0f

    .line 205
    .line 206
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 211
    .line 212
    .line 213
    goto :goto_1

    .line 214
    :cond_2
    const-string v0, "#cc000000"

    .line 215
    .line 216
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 221
    .line 222
    .line 223
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 224
    .line 225
    const-string v1, "#66000000"

    .line 226
    .line 227
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 232
    .line 233
    .line 234
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->a:Lv/VIcon;

    .line 235
    .line 236
    iget v1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;->a:I

    .line 237
    .line 238
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->b:Lv/VText;

    .line 242
    .line 243
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;->b:Ljava/lang/String;

    .line 244
    .line 245
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 246
    .line 247
    .line 248
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->b:Lv/VText;

    .line 249
    .line 250
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 255
    .line 256
    .line 257
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;->g:Landroid/text/SpannableStringBuilder;

    .line 258
    .line 259
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 264
    .line 265
    if-eqz v0, :cond_3

    .line 266
    .line 267
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;->g:Landroid/text/SpannableStringBuilder;

    .line 268
    .line 269
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 270
    .line 271
    .line 272
    goto :goto_2

    .line 273
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;->c:Ljava/lang/String;

    .line 274
    .line 275
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 276
    .line 277
    .line 278
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 279
    .line 280
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;->c:Ljava/lang/String;

    .line 281
    .line 282
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 283
    .line 284
    .line 285
    move-result v1

    .line 286
    xor-int/2addr v1, v2

    .line 287
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 288
    .line 289
    .line 290
    new-instance v0, Ll/lzo;

    .line 291
    .line 292
    invoke-direct {v0, p1}, Ll/lzo;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;)V

    .line 293
    .line 294
    .line 295
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 296
    .line 297
    .line 298
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 299
    .line 300
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 301
    .line 302
    if-ne v0, v1, :cond_4

    .line 303
    .line 304
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->i(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 305
    .line 306
    .line 307
    :cond_4
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;",
            "Ll/jic0<",
            "Ll/szo;",
            ">;",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x0

    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    invoke-static {}, Ll/joa;->f4()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {p0, v0, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget v2, Ll/c9c0;->I:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 50
    .line 51
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ls:I

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    sget v1, Ll/dbc0;->Ll:I

    .line 61
    .line 62
    invoke-static {p1, v1}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 67
    .line 68
    invoke-virtual {v1, v0, v0, p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 69
    .line 70
    .line 71
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->k0:Lcom/p1/mobile/putong/core/api/q;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/q;->R:Lcom/p1/mobile/putong/core/api/q$b;

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/mof0;->k()Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p2, p3, p1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    const/4 p2, 0x1

    .line 86
    invoke-virtual {p1, p2}, Lrx/c;->take(I)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    new-instance p2, Ll/nzo;

    .line 91
    .line 92
    invoke-direct {p2, p0}, Ll/nzo;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;)V

    .line 93
    .line 94
    .line 95
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->c:Lv/VText;

    .line 103
    .line 104
    new-instance p2, Ll/pzo;

    .line 105
    .line 106
    invoke-direct {p2, p0, p3}, Ll/pzo;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
