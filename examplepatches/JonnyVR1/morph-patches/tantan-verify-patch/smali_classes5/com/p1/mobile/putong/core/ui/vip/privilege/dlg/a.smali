.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$f;,
        Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$e;
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Lv/VPager;

.field public c:Lv/VPagerCircleIndicator;

.field public d:Lv/VButton;

.field public e:Ll/pej0;

.field public f:Lcom/p1/mobile/putong/app/PutongFrag;

.field public g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation
.end field

.field public h:Lcom/p1/mobile/putong/core/data/Privilege;

.field public i:Ll/l4g0;

.field public j:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public k:Landroid/view/View;

.field public l:Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$f;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->f:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 5
    .line 6
    const-class p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const-string v0, "p_privilege_intro"

    .line 13
    .line 14
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->i:Ll/l4g0;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->n(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;)Ll/pej0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->e:Ll/pej0;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->g:Ljava/util/ArrayList;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;)Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->k:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->h:Lcom/p1/mobile/putong/core/data/Privilege;

    return-void
.end method


# virtual methods
.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/n290;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->e:Ll/pej0;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const v1, 0x1020002

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/ddc0;->h:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/widget/FrameLayout;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x3

    .line 33
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 34
    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->k:Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$b;

    .line 47
    .line 48
    invoke-direct {v2, p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$b;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 52
    .line 53
    .line 54
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$c;

    .line 55
    .line 56
    invoke-direct {v1, p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$c;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public final j()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$d;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const-string v1, "#ffffff"

    .line 12
    .line 13
    packed-switch v0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->f:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 33
    .line 34
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->J1:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getText(I)Ljava/lang/CharSequence;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/member/R$string;->I1:I

    .line 45
    .line 46
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :pswitch_0
    invoke-static {}, Ll/joa;->P3()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 55
    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    const-string v0, "\u7eed\u8d39\u9752\u6625\u4e13\u4eab\u4f1a\u5458"

    .line 59
    .line 60
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    const-string v0, "\u6210\u4e3a\u9752\u6625\u4e13\u4eab\u4f1a\u5458"

    .line 65
    .line 66
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 70
    .line 71
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 79
    .line 80
    sget v0, Ll/gbc0;->S5:I

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :pswitch_1
    invoke-static {}, Ll/joa;->C3()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 91
    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    const-string v0, "\u7eed\u8d39\u5979\u4e13\u4eab\u4f1a\u5458"

    .line 95
    .line 96
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_2
    const-string v0, "\u6210\u4e3a\u5979\u4e13\u4eab\u4f1a\u5458"

    .line 101
    .line 102
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 106
    .line 107
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 115
    .line 116
    sget v0, Ll/gbc0;->l:I

    .line 117
    .line 118
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :pswitch_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 123
    .line 124
    const-string v1, "\u81f3\u5c0a\u5408\u4f19\u4eba\u7533\u8bf7"

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 130
    .line 131
    const-string v1, "#011703"

    .line 132
    .line 133
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 141
    .line 142
    sget v0, Ll/gbc0;->h:I

    .line 143
    .line 144
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :pswitch_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 149
    .line 150
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 151
    .line 152
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 161
    .line 162
    if-eqz v0, :cond_3

    .line 163
    .line 164
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->f:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 165
    .line 166
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->D:I

    .line 167
    .line 168
    invoke-virtual {v0, v2}, Landroidx/fragment/app/Fragment;->getText(I)Ljava/lang/CharSequence;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    .line 174
    .line 175
    goto :goto_2

    .line 176
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->f:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 177
    .line 178
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->B:I

    .line 179
    .line 180
    invoke-virtual {v0, v2}, Landroidx/fragment/app/Fragment;->getText(I)Ljava/lang/CharSequence;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 185
    .line 186
    .line 187
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 188
    .line 189
    sget v0, Ll/gbc0;->A5:I

    .line 190
    .line 191
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :pswitch_4
    invoke-static {}, Ll/joa;->G3()Z

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 200
    .line 201
    if-eqz v0, :cond_4

    .line 202
    .line 203
    const-string v0, "\u7eed\u8d39\u9ed1\u91d1\u4f1a\u5458"

    .line 204
    .line 205
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 206
    .line 207
    .line 208
    goto :goto_3

    .line 209
    :cond_4
    const-string v0, "\u6210\u4e3a\u9ed1\u91d1\u4f1a\u5458"

    .line 210
    .line 211
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    .line 213
    .line 214
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 215
    .line 216
    const-string v1, "#ffdea2"

    .line 217
    .line 218
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 223
    .line 224
    .line 225
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 226
    .line 227
    sget v0, Ll/gbc0;->z5:I

    .line 228
    .line 229
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 230
    .line 231
    .line 232
    return-void

    .line 233
    :pswitch_5
    invoke-static {}, Ll/joa;->I3()Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 238
    .line 239
    if-eqz v0, :cond_5

    .line 240
    .line 241
    const-string v0, "\u7eed\u8d39\u767d\u91d1\u4f1a\u5458"

    .line 242
    .line 243
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 244
    .line 245
    .line 246
    goto :goto_4

    .line 247
    :cond_5
    const-string v0, "\u6210\u4e3a\u767d\u91d1\u4f1a\u5458"

    .line 248
    .line 249
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 250
    .line 251
    .line 252
    :goto_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 253
    .line 254
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 259
    .line 260
    .line 261
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 262
    .line 263
    sget v0, Ll/gbc0;->g:I

    .line 264
    .line 265
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 266
    .line 267
    .line 268
    return-void

    .line 269
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final k()V
    .locals 5

    .line 1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x500

    .line 6
    .line 7
    if-gt v0, v1, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 10
    .line 11
    invoke-static {}, Ll/bnl0;->w0()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/16 v2, 0x3c0

    .line 16
    .line 17
    if-ge v1, v2, :cond_0

    .line 18
    .line 19
    const/high16 v1, 0x41700000    # 15.0f

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/high16 v1, 0x41900000    # 18.0f

    .line 23
    .line 24
    :goto_0
    const/4 v2, 0x2

    .line 25
    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->b:Lv/VPager;

    .line 29
    .line 30
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$e;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->f:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 33
    .line 34
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->g:Ljava/util/ArrayList;

    .line 35
    .line 36
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 37
    .line 38
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$e;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->b:Lv/VPager;

    .line 45
    .line 46
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$a;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$a;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->c:Lv/VPagerCircleIndicator;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->b:Lv/VPager;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 62
    .line 63
    invoke-static {v0}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    const-string v1, "#0A000000"

    .line 68
    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->c:Lv/VPagerCircleIndicator;

    .line 72
    .line 73
    const-string v2, "#BCE46A"

    .line 74
    .line 75
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    invoke-virtual {v0, v2}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->c:Lv/VPagerCircleIndicator;

    .line 83
    .line 84
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 89
    .line 90
    .line 91
    goto/16 :goto_1

    .line 92
    .line 93
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 94
    .line 95
    invoke-static {v0}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_3

    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->c:Lv/VPagerCircleIndicator;

    .line 102
    .line 103
    const-string v2, "#F482CE"

    .line 104
    .line 105
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    invoke-virtual {v0, v2}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->c:Lv/VPagerCircleIndicator;

    .line 113
    .line 114
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 119
    .line 120
    .line 121
    goto/16 :goto_1

    .line 122
    .line 123
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 124
    .line 125
    invoke-static {v0}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_4

    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->c:Lv/VPagerCircleIndicator;

    .line 132
    .line 133
    const-string v1, "#656f78"

    .line 134
    .line 135
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 140
    .line 141
    .line 142
    goto/16 :goto_1

    .line 143
    .line 144
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 145
    .line 146
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eqz v0, :cond_5

    .line 151
    .line 152
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->c:Lv/VPagerCircleIndicator;

    .line 153
    .line 154
    const-string v1, "#a76f11"

    .line 155
    .line 156
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 161
    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 165
    .line 166
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-eqz v0, :cond_6

    .line 171
    .line 172
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->c:Lv/VPagerCircleIndicator;

    .line 173
    .line 174
    const-string v2, "#FFB775"

    .line 175
    .line 176
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    invoke-virtual {v0, v2}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->c:Lv/VPagerCircleIndicator;

    .line 184
    .line 185
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 190
    .line 191
    .line 192
    goto :goto_1

    .line 193
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 194
    .line 195
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    if-eqz v0, :cond_7

    .line 200
    .line 201
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->c:Lv/VPagerCircleIndicator;

    .line 202
    .line 203
    const-string v2, "#E9B48E"

    .line 204
    .line 205
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    invoke-virtual {v0, v2}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 210
    .line 211
    .line 212
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->c:Lv/VPagerCircleIndicator;

    .line 213
    .line 214
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 219
    .line 220
    .line 221
    goto :goto_1

    .line 222
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 223
    .line 224
    invoke-static {v0}, Ll/wib0;->u(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    if-eqz v0, :cond_8

    .line 229
    .line 230
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->c:Lv/VPagerCircleIndicator;

    .line 231
    .line 232
    const-string v1, "#FFD589"

    .line 233
    .line 234
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->c:Lv/VPagerCircleIndicator;

    .line 242
    .line 243
    const-string v1, "#33FFD589"

    .line 244
    .line 245
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 250
    .line 251
    .line 252
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->a:Landroid/view/View;

    .line 253
    .line 254
    sget v1, Ll/gbc0;->a2:I

    .line 255
    .line 256
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 257
    .line 258
    .line 259
    invoke-static {}, Ll/joa;->O3()Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    if-eqz v0, :cond_8

    .line 264
    .line 265
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 266
    .line 267
    const/4 v1, 0x0

    .line 268
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 269
    .line 270
    .line 271
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->c:Lv/VPagerCircleIndicator;

    .line 272
    .line 273
    sget v1, Ll/qa00;->y:I

    .line 274
    .line 275
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 276
    .line 277
    .line 278
    :cond_8
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 279
    .line 280
    const/4 v1, 0x3

    .line 281
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 286
    .line 287
    .line 288
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d:Lv/VButton;

    .line 289
    .line 290
    new-instance v1, Ll/y190;

    .line 291
    .line 292
    invoke-direct {v1, p0}, Ll/y190;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;)V

    .line 293
    .line 294
    .line 295
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j()V

    .line 299
    .line 300
    .line 301
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->e:Ll/pej0;

    .line 302
    .line 303
    new-instance v1, Ll/z190;

    .line 304
    .line 305
    invoke-direct {v1, p0}, Ll/z190;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;)V

    .line 306
    .line 307
    .line 308
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 309
    .line 310
    .line 311
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$d;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    packed-switch v0, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Dq()Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->g:Ljava/util/ArrayList;

    .line 28
    .line 29
    return-void

    .line 30
    :pswitch_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_YOUTH_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->g:Ljava/util/ArrayList;

    .line 37
    .line 38
    return-void

    .line 39
    :pswitch_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_FEMALE_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->g:Ljava/util/ArrayList;

    .line 46
    .line 47
    return-void

    .line 48
    :pswitch_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPREME_PARTNER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->g:Ljava/util/ArrayList;

    .line 55
    .line 56
    return-void

    .line 57
    :pswitch_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->g:Ljava/util/ArrayList;

    .line 64
    .line 65
    return-void

    .line 66
    :pswitch_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->g:Ljava/util/ArrayList;

    .line 73
    .line 74
    return-void

    .line 75
    :pswitch_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_PLATINUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->g:Ljava/util/ArrayList;

    .line 82
    .line 83
    return-void

    .line 84
    nop

    .line 85
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->wn(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->l:Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$f;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->h:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 19
    .line 20
    invoke-interface {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$f;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->e:Ll/pej0;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->cancel()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic n(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->i:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->g:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->b:Lv/VPager;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 30
    .line 31
    invoke-interface {v0, v1, p1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Bl(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->g:Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->g:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-ltz v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->b:Lv/VPager;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->g:Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$f;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->l:Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$f;

    .line 7
    .line 8
    new-instance p2, Ll/pej0;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->f:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p1}, Ll/wib0;->u(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    sget v1, Ll/bgc0;->b:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    sget v1, Ll/bgc0;->a:I

    .line 26
    .line 27
    :goto_0
    invoke-direct {p2, v0, v1}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 28
    .line 29
    .line 30
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->e:Ll/pej0;

    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->f:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    sget v0, Ll/pec0;->k1:I

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {p2, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->k:Landroid/view/View;

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->e:Ll/pej0;

    .line 52
    .line 53
    invoke-virtual {v0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->k:Landroid/view/View;

    .line 57
    .line 58
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->h(Landroid/view/View;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->l()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->k()V

    .line 65
    .line 66
    .line 67
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->e:Ll/pej0;

    .line 68
    .line 69
    invoke-virtual {p2}, Landroid/app/Dialog;->show()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->i()V

    .line 73
    .line 74
    .line 75
    new-instance p2, Lorg/json/JSONObject;

    .line 76
    .line 77
    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 78
    .line 79
    .line 80
    :try_start_0
    const-string v0, "productType"

    .line 81
    .line 82
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->d6(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 95
    .line 96
    .line 97
    const-string v0, "tooltips_trigger_mode"

    .line 98
    .line 99
    const-string v1, "active"

    .line 100
    .line 101
    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :catch_0
    move-exception v0

    .line 106
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 107
    .line 108
    .line 109
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->i:Ll/l4g0;

    .line 110
    .line 111
    invoke-virtual {v0, p2}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->i:Ll/l4g0;

    .line 115
    .line 116
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 117
    .line 118
    .line 119
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 120
    .line 121
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Pr(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method
