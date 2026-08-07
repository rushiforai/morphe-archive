.class public Ll/p5x;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/t5x;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Purpose;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/p5x;Ll/pf60;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p5x;->l0(Ll/pf60;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f0(Ll/p5x;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p5x;->n0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Ll/p5x;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p5x;->m0(Ljava/lang/Throwable;)V

    return-void
.end method

.method private k0()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/p5x;->a:Ljava/util/List;

    .line 7
    .line 8
    const-string v1, "thinking"

    .line 9
    .line 10
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, ""

    .line 15
    .line 16
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/p5x;->a:Ljava/util/List;

    .line 24
    .line 25
    const-string v1, "friend"

    .line 26
    .line 27
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/p5x;->a:Ljava/util/List;

    .line 39
    .line 40
    const-string v1, "date"

    .line 41
    .line 42
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/p5x;->a:Ljava/util/List;

    .line 54
    .line 55
    const-string v1, "relationship"

    .line 56
    .line 57
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/p5x;->a:Ljava/util/List;

    .line 69
    .line 70
    const-string v1, "marriage"

    .line 71
    .line 72
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    const-string v3, "in_one_year"

    .line 77
    .line 78
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/p5x;->a:Ljava/util/List;

    .line 86
    .line 87
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    const-string v3, "in_two_years"

    .line 92
    .line 93
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Ll/p5x;->a:Ljava/util/List;

    .line 101
    .line 102
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const-string v1, "at_right_time"

    .line 107
    .line 108
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method private synthetic n0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/t5x;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/t5x;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/p5x;->k0()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/m5x;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/m5x;-><init>(Ll/p5x;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public h0()Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public i0(I)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    new-instance v1, Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Profile;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 27
    .line 28
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 39
    .line 40
    new-instance v2, Lcom/p1/mobile/putong/data/Extensions;

    .line 41
    .line 42
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/Extensions;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 46
    .line 47
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 50
    .line 51
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 52
    .line 53
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_2

    .line 58
    .line 59
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 60
    .line 61
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 62
    .line 63
    new-instance v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 64
    .line 65
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 69
    .line 70
    :cond_2
    iget-object v1, p0, Ll/p5x;->a:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Ll/pf60;

    .line 77
    .line 78
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 79
    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 81
    .line 82
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 83
    .line 84
    iget-object v2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast v2, Lcom/p1/mobile/putong/data/Purpose;

    .line 87
    .line 88
    invoke-static {v2}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iput-object v2, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 93
    .line 94
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast v1, Lcom/p1/mobile/putong/data/Purpose;

    .line 97
    .line 98
    const-string v2, "marriage"

    .line 99
    .line 100
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-eqz v1, :cond_4

    .line 105
    .line 106
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 107
    .line 108
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 109
    .line 110
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 111
    .line 112
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-nez v1, :cond_3

    .line 117
    .line 118
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 119
    .line 120
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 121
    .line 122
    new-instance v2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 123
    .line 124
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;-><init>()V

    .line 125
    .line 126
    .line 127
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 128
    .line 129
    :cond_3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 130
    .line 131
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 132
    .line 133
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 134
    .line 135
    iget-object v2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 136
    .line 137
    check-cast v2, Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v2}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    iput-object v2, v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->expectedTime:Ljava/util/List;

    .line 144
    .line 145
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 146
    .line 147
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 148
    .line 149
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-eqz v1, :cond_5

    .line 162
    .line 163
    invoke-virtual {p0}, Ll/p5x;->h0()Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 168
    .line 169
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 170
    .line 171
    .line 172
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 173
    .line 174
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 175
    .line 176
    invoke-virtual {v1, v0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    new-instance v1, Ll/n5x;

    .line 185
    .line 186
    invoke-direct {v1, p0, p1}, Ll/n5x;-><init>(Ll/p5x;Ll/pf60;)V

    .line 187
    .line 188
    .line 189
    new-instance p1, Ll/o5x;

    .line 190
    .line 191
    invoke-direct {p1, p0}, Ll/o5x;-><init>(Ll/p5x;)V

    .line 192
    .line 193
    .line 194
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 199
    .line 200
    .line 201
    return-void

    .line 202
    :cond_5
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 203
    .line 204
    check-cast p1, Lcom/p1/mobile/putong/data/Purpose;

    .line 205
    .line 206
    invoke-virtual {p0, p1}, Ll/p5x;->j0(Lcom/p1/mobile/putong/data/Purpose;)V

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public final j0(Lcom/p1/mobile/putong/data/Purpose;)V
    .locals 1

    .line 1
    const-string v0, "marriage"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/p5x;->h0()Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "purpose_switching"

    .line 14
    .line 15
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/marry/audit/MarryInfoAuditStatusAct;->a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Ll/p5x;->h0()Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/p5x;->h0()Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;->finish()V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Ll/p5x;->h0()Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;->finish()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic l0(Ll/pf60;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p5x;->h0()Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p1, Lcom/p1/mobile/putong/data/Purpose;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/p5x;->j0(Lcom/p1/mobile/putong/data/Purpose;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic m0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p5x;->h0()Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
