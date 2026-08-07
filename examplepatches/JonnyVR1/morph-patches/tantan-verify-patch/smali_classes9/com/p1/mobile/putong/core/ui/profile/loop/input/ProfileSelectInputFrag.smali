.class public Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$a;,
        Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;,
        Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$c;
    }
.end annotation


# instance fields
.field public A:Lv/VList;

.field public B:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

.field public C:Z

.field public D:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;

.field public E:Landroid/widget/AdapterView$OnItemClickListener;

.field public F:Ljava/lang/String;

.field public z:Lv/navigationbar/VNavigationBar;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->X4(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->Y4(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic O4(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->B:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    return-void
.end method

.method public static bridge synthetic P4(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Lv/navigationbar/VNavigationBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->z:Lv/navigationbar/VNavigationBar;

    return-void
.end method

.method public static bridge synthetic Q4(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Lv/VList;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->A:Lv/VList;

    return-void
.end method

.method private W4()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "loop_create_tag_info"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "loop_is_oversea"

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->C:Z

    .line 31
    .line 32
    new-instance v1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;)V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->D:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->A:Lv/VList;

    .line 40
    .line 41
    invoke-virtual {v2, v1}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->S4()Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->e2()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_0

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->Z4(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->A:Lv/VList;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->E:Landroid/widget/AdapterView$OnItemClickListener;

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private synthetic X4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->W4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public R4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$a;->a(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public S4()Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final T4(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/xra;->g()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz v1, :cond_b

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_b

    .line 22
    .line 23
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->C:Z

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->S4()Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->e2()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_0

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HometownSuggest;->overseas:Ljava/util/Map;

    .line 43
    .line 44
    invoke-static {p1}, Ll/jyb;->D(Ljava/util/Map;)Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->Q(Ljava/util/List;)Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/HometownSuggest;->overseas:Ljava/util/Map;

    .line 58
    .line 59
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Ljava/util/List;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/HometownSuggest;->china:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    if-eqz v4, :cond_3

    .line 81
    .line 82
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    check-cast v4, Lcom/p1/mobile/putong/core/data/HometownChinaItem;

    .line 87
    .line 88
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->region:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    if-eqz v5, :cond_2

    .line 95
    .line 96
    iget-object p1, v4, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->subRegion:Ljava/util/List;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_3
    move-object p1, v3

    .line 100
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-eqz v1, :cond_e

    .line 105
    .line 106
    new-instance v1, Ljava/util/ArrayList;

    .line 107
    .line 108
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 124
    .line 125
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 128
    .line 129
    .line 130
    move-result v4

    .line 131
    if-eqz v4, :cond_4

    .line 132
    .line 133
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 146
    .line 147
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 148
    .line 149
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    :cond_4
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 165
    .line 166
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 167
    .line 168
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 169
    .line 170
    iget-object v4, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 171
    .line 172
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 173
    .line 174
    .line 175
    move-result v4

    .line 176
    const/4 v5, 0x0

    .line 177
    if-nez v4, :cond_5

    .line 178
    .line 179
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 180
    .line 181
    .line 182
    move-result-object v4

    .line 183
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 184
    .line 185
    .line 186
    move-result-object v4

    .line 187
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 188
    .line 189
    .line 190
    move-result-object v4

    .line 191
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 192
    .line 193
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 194
    .line 195
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 196
    .line 197
    iget-object v4, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 198
    .line 199
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v4

    .line 203
    check-cast v4, Ljava/lang/String;

    .line 204
    .line 205
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    :cond_5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 209
    .line 210
    .line 211
    move-result-object v4

    .line 212
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 213
    .line 214
    .line 215
    move-result-object v4

    .line 216
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 217
    .line 218
    .line 219
    move-result-object v4

    .line 220
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 221
    .line 222
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 223
    .line 224
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 225
    .line 226
    iget-object v4, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 227
    .line 228
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 229
    .line 230
    .line 231
    move-result v4

    .line 232
    if-nez v4, :cond_6

    .line 233
    .line 234
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 235
    .line 236
    .line 237
    move-result-object v4

    .line 238
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 239
    .line 240
    .line 241
    move-result-object v4

    .line 242
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 243
    .line 244
    .line 245
    move-result-object v4

    .line 246
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 247
    .line 248
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 249
    .line 250
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 251
    .line 252
    iget-object v4, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 253
    .line 254
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v4

    .line 258
    check-cast v4, Ljava/lang/String;

    .line 259
    .line 260
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    :cond_6
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 264
    .line 265
    .line 266
    move-result-object v4

    .line 267
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 268
    .line 269
    .line 270
    move-result-object v4

    .line 271
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 272
    .line 273
    .line 274
    move-result-object v4

    .line 275
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 276
    .line 277
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 278
    .line 279
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 280
    .line 281
    iget-object v4, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 282
    .line 283
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 284
    .line 285
    .line 286
    move-result v4

    .line 287
    if-nez v4, :cond_7

    .line 288
    .line 289
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 290
    .line 291
    .line 292
    move-result-object v4

    .line 293
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 294
    .line 295
    .line 296
    move-result-object v4

    .line 297
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 298
    .line 299
    .line 300
    move-result-object v4

    .line 301
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 302
    .line 303
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 304
    .line 305
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 306
    .line 307
    iget-object v4, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 308
    .line 309
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    move-result-object v4

    .line 313
    check-cast v4, Ljava/lang/String;

    .line 314
    .line 315
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 316
    .line 317
    .line 318
    :cond_7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 323
    .line 324
    .line 325
    move-result v4

    .line 326
    if-eqz v4, :cond_a

    .line 327
    .line 328
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object v4

    .line 332
    check-cast v4, Ljava/lang/String;

    .line 333
    .line 334
    iget-boolean v6, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->C:Z

    .line 335
    .line 336
    if-eqz v6, :cond_8

    .line 337
    .line 338
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 339
    .line 340
    .line 341
    move-result-object v6

    .line 342
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/HometownSuggest;->overseas:Ljava/util/Map;

    .line 343
    .line 344
    invoke-interface {v6, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    move-result-object v6

    .line 348
    check-cast v6, Ljava/util/Collection;

    .line 349
    .line 350
    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 351
    .line 352
    .line 353
    move-result v6

    .line 354
    if-nez v6, :cond_8

    .line 355
    .line 356
    new-instance v6, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 357
    .line 358
    sget-object v7, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;->INPUT_ENTRY:Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;

    .line 359
    .line 360
    invoke-direct {v6, v4, v7}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;)V

    .line 361
    .line 362
    .line 363
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->j()Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 364
    .line 365
    .line 366
    goto :goto_2

    .line 367
    :cond_8
    new-instance v6, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 368
    .line 369
    invoke-direct {v6, v4}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;-><init>(Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    :goto_2
    invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 373
    .line 374
    .line 375
    move-result v4

    .line 376
    if-eqz v4, :cond_9

    .line 377
    .line 378
    move-object v3, v6

    .line 379
    goto :goto_1

    .line 380
    :cond_9
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 381
    .line 382
    .line 383
    goto :goto_1

    .line 384
    :cond_a
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 385
    .line 386
    .line 387
    move-result p0

    .line 388
    if-eqz p0, :cond_e

    .line 389
    .line 390
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 391
    .line 392
    .line 393
    invoke-virtual {v0, v5, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 394
    .line 395
    .line 396
    return-object v0

    .line 397
    :cond_b
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->D()Lcom/p1/mobile/putong/core/data/CategorySuggestions;

    .line 398
    .line 399
    .line 400
    move-result-object p0

    .line 401
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 402
    .line 403
    .line 404
    move-result p0

    .line 405
    if-eqz p0, :cond_e

    .line 406
    .line 407
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->D()Lcom/p1/mobile/putong/core/data/CategorySuggestions;

    .line 408
    .line 409
    .line 410
    move-result-object p0

    .line 411
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CategorySuggestions;->hometown:Ljava/util/Map;

    .line 412
    .line 413
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 414
    .line 415
    .line 416
    move-result-object p0

    .line 417
    check-cast p0, Ljava/util/List;

    .line 418
    .line 419
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 420
    .line 421
    .line 422
    move-result v1

    .line 423
    if-nez v1, :cond_c

    .line 424
    .line 425
    new-instance v1, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 426
    .line 427
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;-><init>(Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 431
    .line 432
    .line 433
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 434
    .line 435
    .line 436
    :cond_c
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 437
    .line 438
    .line 439
    move-result v1

    .line 440
    if-eqz v1, :cond_e

    .line 441
    .line 442
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 443
    .line 444
    .line 445
    move-result-object p0

    .line 446
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 447
    .line 448
    .line 449
    move-result v1

    .line 450
    if-eqz v1, :cond_e

    .line 451
    .line 452
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 453
    .line 454
    .line 455
    move-result-object v1

    .line 456
    check-cast v1, Ljava/lang/String;

    .line 457
    .line 458
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 459
    .line 460
    .line 461
    move-result v2

    .line 462
    if-eqz v2, :cond_d

    .line 463
    .line 464
    goto :goto_3

    .line 465
    :cond_d
    new-instance v2, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 466
    .line 467
    invoke-direct {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;-><init>(Ljava/lang/String;)V

    .line 468
    .line 469
    .line 470
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 471
    .line 472
    .line 473
    goto :goto_3

    .line 474
    :cond_e
    return-object v0
.end method

.method public U4(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->D:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->a(I)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public V4()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->F:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic Y4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Z4(Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->F:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->z:Lv/navigationbar/VNavigationBar;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->z:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/vza0;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/vza0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->T4(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->D:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$b;->b(Ljava/util/ArrayList;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public a5(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->E:Landroid/widget/AdapterView$OnItemClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public d4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/uza0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/uza0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->R4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
