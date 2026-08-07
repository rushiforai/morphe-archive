.class public Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->b(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->m3:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "anchorId"

    .line 12
    .line 13
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "index"

    .line 18
    .line 19
    const-string v1, "NA"

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, "e_live_video_quickchat_room_enter"

    .line 30
    .line 31
    const-string v1, "p_suggest_user_profile_info_view"

    .line 32
    .line 33
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->o8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;Z)V

    .line 40
    .line 41
    .line 42
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 43
    .line 44
    iget-object p1, p1, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->m3:Ljava/lang/String;

    .line 55
    .line 56
    const-string v1, "profile"

    .line 57
    .line 58
    invoke-interface {p1, v0, p0, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->uq(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method

.method public onGlobalLayout()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->k1:Lv/VLinear;

    .line 4
    .line 5
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->d1:Lv/VFrame_Shadow;

    .line 15
    .line 16
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->U0:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 25
    .line 26
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->Q0:Landroid/widget/RelativeLayout;

    .line 35
    .line 36
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_5

    .line 41
    .line 42
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->g1:Landroid/widget/TextView;

    .line 45
    .line 46
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_5

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->U0:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 55
    .line 56
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 61
    .line 62
    const/4 v3, 0x0

    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->i8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 70
    .line 71
    if-nez v0, :cond_1

    .line 72
    .line 73
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sget v2, Ll/kec0;->gb:I

    .line 82
    .line 83
    const/4 v4, 0x0

    .line 84
    invoke-virtual {v0, v2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->p8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;Landroid/view/View;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 92
    .line 93
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->i8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    new-instance v1, Ll/pda0;

    .line 98
    .line 99
    invoke-direct {v1, p0}, Ll/pda0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_1
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->i8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    if-eqz v0, :cond_2

    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 117
    .line 118
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->i8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 127
    .line 128
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->k8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    if-ne v0, v1, :cond_2

    .line 133
    .line 134
    return-void

    .line 135
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 136
    .line 137
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->i8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-static {v0}, Ll/bnl0;->p0(Landroid/view/View;)V

    .line 142
    .line 143
    .line 144
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 145
    .line 146
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->A1:Lv/VLinear;

    .line 147
    .line 148
    if-nez v1, :cond_3

    .line 149
    .line 150
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->u8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)V

    .line 151
    .line 152
    .line 153
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 154
    .line 155
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->A1:Lv/VLinear;

    .line 156
    .line 157
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 162
    .line 163
    const/4 v1, -0x2

    .line 164
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 165
    .line 166
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 167
    .line 168
    sget v1, Ll/qa00;->d:I

    .line 169
    .line 170
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 171
    .line 172
    sget v1, Ll/qa00;->i:I

    .line 173
    .line 174
    neg-int v2, v1

    .line 175
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 176
    .line 177
    neg-int v1, v1

    .line 178
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 179
    .line 180
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 181
    .line 182
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->A1:Lv/VLinear;

    .line 183
    .line 184
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 185
    .line 186
    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 188
    .line 189
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->Y:Landroid/widget/RelativeLayout;

    .line 190
    .line 191
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 192
    .line 193
    .line 194
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 195
    .line 196
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->h1:Lv/VFrame_Shadow;

    .line 197
    .line 198
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 199
    .line 200
    .line 201
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 202
    .line 203
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->A1:Lv/VLinear;

    .line 204
    .line 205
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    check-cast v1, Landroid/view/ViewGroup;

    .line 210
    .line 211
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 212
    .line 213
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->i8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)Landroid/view/View;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    invoke-virtual {v1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 218
    .line 219
    .line 220
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 221
    .line 222
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->m3:Ljava/lang/String;

    .line 223
    .line 224
    const-string v1, "anchorId"

    .line 225
    .line 226
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    const-string v1, "index"

    .line 231
    .line 232
    const-string v2, "NA"

    .line 233
    .line 234
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    const-string v1, "e_live_video_quickchat_room_enter"

    .line 243
    .line 244
    const-string v2, "p_suggest_user_profile_info_view"

    .line 245
    .line 246
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 247
    .line 248
    .line 249
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 250
    .line 251
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->i8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)Landroid/view/View;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    check-cast v0, Landroid/view/View;

    .line 260
    .line 261
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->q8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;Landroid/view/View;)V

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :cond_4
    iget-object v0, v2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->k1:Lv/VLinear;

    .line 266
    .line 267
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 268
    .line 269
    .line 270
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 271
    .line 272
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->d1:Lv/VFrame_Shadow;

    .line 273
    .line 274
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 275
    .line 276
    .line 277
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 278
    .line 279
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->Q0:Landroid/widget/RelativeLayout;

    .line 280
    .line 281
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 282
    .line 283
    .line 284
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 285
    .line 286
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->k1:Lv/VLinear;

    .line 287
    .line 288
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 289
    .line 290
    .line 291
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 292
    .line 293
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->U0:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 294
    .line 295
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 296
    .line 297
    .line 298
    return-void

    .line 299
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$k;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 300
    .line 301
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->U0:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 302
    .line 303
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 304
    .line 305
    .line 306
    return-void
.end method
