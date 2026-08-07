.class public final Ll/ncp;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/xcp;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0015\u0010\u000c\u001a\u00020\u00072\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0015\u0010\u000e\u001a\u00020\u00072\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000e\u0010\rR\u0016\u0010\u0012\u001a\u00020\u000f8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0013"
    }
    d2 = {
        "Ll/ncp;",
        "Ll/ar2;",
        "Ll/xcp;",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "",
        "destroy",
        "()V",
        "Lcom/p1/mobile/putong/data/SettingGroups;",
        "data",
        "g0",
        "(Lcom/p1/mobile/putong/data/SettingGroups;)V",
        "h0",
        "Lcom/p1/mobile/putong/data/IntlMoreGender;",
        "a",
        "Lcom/p1/mobile/putong/data/IntlMoreGender;",
        "_data",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/IntlMoreGender;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/android/app/Act;Ll/ncp;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ncp;->i0(Lcom/p1/mobile/android/app/Act;Ll/ncp;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ncp;->j0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static final i0(Lcom/p1/mobile/android/app/Act;Ll/ncp;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public static final j0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    sget p0, Lcom/p1/mobile/putong/core/R$string;->u4:I

    .line 5
    .line 6
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final g0(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/data/SettingGroups;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/IntlMoreGender;->clone()Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/ncp;->a:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 14
    .line 15
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/xcp;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/xcp;->r()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p0, Ll/xcp;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/xcp;->B(Lcom/p1/mobile/putong/data/SettingGroups;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final h0(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 7
    .param p1    # Lcom/p1/mobile/putong/data/SettingGroups;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_b

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_b

    .line 19
    .line 20
    new-instance v1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 21
    .line 22
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Ll/ncp;->a:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    const-string v4, "_data"

    .line 29
    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    move-object v2, v3

    .line 36
    :cond_0
    iget-object v2, v2, Lcom/p1/mobile/putong/data/IntlMoreGender;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 37
    .line 38
    iget-object v5, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 39
    .line 40
    iget-object v5, v5, Lcom/p1/mobile/putong/data/IntlMoreGender;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 41
    .line 42
    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    const/4 v5, 0x1

    .line 47
    if-eqz v2, :cond_7

    .line 48
    .line 49
    iget-object v2, p0, Ll/ncp;->a:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 50
    .line 51
    if-nez v2, :cond_1

    .line 52
    .line 53
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    move-object v2, v3

    .line 57
    :cond_1
    iget-object v2, v2, Lcom/p1/mobile/putong/data/IntlMoreGender;->subGender:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v6, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 60
    .line 61
    iget-object v6, v6, Lcom/p1/mobile/putong/data/IntlMoreGender;->subGender:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v2, v6}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_7

    .line 68
    .line 69
    iget-object v2, p0, Ll/ncp;->a:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 70
    .line 71
    if-nez v2, :cond_2

    .line 72
    .line 73
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    move-object v2, v3

    .line 77
    :cond_2
    iget-object v2, v2, Lcom/p1/mobile/putong/data/IntlMoreGender;->showOnProfile:Ljava/lang/Boolean;

    .line 78
    .line 79
    iget-object v6, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 80
    .line 81
    iget-object v6, v6, Lcom/p1/mobile/putong/data/IntlMoreGender;->showOnProfile:Ljava/lang/Boolean;

    .line 82
    .line 83
    invoke-static {v2, v6}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_7

    .line 88
    .line 89
    iget-object v2, p0, Ll/ncp;->a:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 90
    .line 91
    if-nez v2, :cond_3

    .line 92
    .line 93
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    move-object v2, v3

    .line 97
    :cond_3
    iget-object v2, v2, Lcom/p1/mobile/putong/data/IntlMoreGender;->canUpdate:Ljava/lang/Boolean;

    .line 98
    .line 99
    iget-object v6, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 100
    .line 101
    iget-object v6, v6, Lcom/p1/mobile/putong/data/IntlMoreGender;->canUpdate:Ljava/lang/Boolean;

    .line 102
    .line 103
    invoke-static {v2, v6}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-eqz v2, :cond_7

    .line 108
    .line 109
    iget-object v2, p0, Ll/ncp;->a:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 110
    .line 111
    if-nez v2, :cond_4

    .line 112
    .line 113
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    move-object v2, v3

    .line 117
    :cond_4
    iget-object v2, v2, Lcom/p1/mobile/putong/data/IntlMoreGender;->notShowCis:Ljava/lang/Boolean;

    .line 118
    .line 119
    iget-object v6, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 120
    .line 121
    iget-object v6, v6, Lcom/p1/mobile/putong/data/IntlMoreGender;->notShowCis:Ljava/lang/Boolean;

    .line 122
    .line 123
    invoke-static {v2, v6}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-eqz v2, :cond_7

    .line 128
    .line 129
    iget-object v2, p0, Ll/ncp;->a:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 130
    .line 131
    if-nez v2, :cond_5

    .line 132
    .line 133
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    move-object v2, v3

    .line 137
    :cond_5
    iget-object v2, v2, Lcom/p1/mobile/putong/data/IntlMoreGender;->lookingForGenders:Ljava/util/List;

    .line 138
    .line 139
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    iget-object v6, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 144
    .line 145
    iget-object v6, v6, Lcom/p1/mobile/putong/data/IntlMoreGender;->lookingForGenders:Ljava/util/List;

    .line 146
    .line 147
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    if-eq v2, v6, :cond_6

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_6
    const/4 v2, 0x0

    .line 155
    goto :goto_1

    .line 156
    :cond_7
    :goto_0
    move v2, v5

    .line 157
    :goto_1
    if-nez v2, :cond_9

    .line 158
    .line 159
    iget-object v2, p0, Ll/ncp;->a:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 160
    .line 161
    if-nez v2, :cond_8

    .line 162
    .line 163
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_8
    move-object v3, v2

    .line 168
    :goto_2
    iget-object v2, v3, Lcom/p1/mobile/putong/data/IntlMoreGender;->lookingForGenders:Ljava/util/List;

    .line 169
    .line 170
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 171
    .line 172
    iget-object v3, v3, Lcom/p1/mobile/putong/data/IntlMoreGender;->lookingForGenders:Ljava/util/List;

    .line 173
    .line 174
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 175
    .line 176
    .line 177
    check-cast v3, Ljava/util/Collection;

    .line 178
    .line 179
    invoke-interface {v2, v3}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    xor-int/2addr v2, v5

    .line 184
    :cond_9
    if-eqz v2, :cond_a

    .line 185
    .line 186
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 187
    .line 188
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 189
    .line 190
    .line 191
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 192
    .line 193
    iput-object p1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 194
    .line 195
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 196
    .line 197
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 198
    .line 199
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->k8(Lcom/p1/mobile/putong/data/SettingGroups;)Lrx/c;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    new-instance v1, Ll/lcp;

    .line 208
    .line 209
    invoke-direct {v1, v0, p0}, Ll/lcp;-><init>(Lcom/p1/mobile/android/app/Act;Ll/ncp;)V

    .line 210
    .line 211
    .line 212
    new-instance p0, Ll/mcp;

    .line 213
    .line 214
    invoke-direct {p0, v0}, Ll/mcp;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 215
    .line 216
    .line 217
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 222
    .line 223
    .line 224
    return-void

    .line 225
    :cond_a
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    if-eqz p0, :cond_b

    .line 230
    .line 231
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 232
    .line 233
    .line 234
    :cond_b
    return-void
.end method
