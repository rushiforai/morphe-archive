.class public Ll/mp;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/wp;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/mp;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e0(Ll/mp;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mp;->j0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic j0(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "page_type"

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_3

    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/jf00;->g()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/jf00;->g()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->inactivateReason:Ljava/util/List;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    new-instance p1, Ljava/util/ArrayList;

    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->inactivateReason:Ljava/util/List;

    .line 57
    .line 58
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .line 66
    .line 67
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InactivateReason;->new_()Lcom/p1/mobile/putong/core/data/InactivateReason;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const-string v1, "category_reregister_or_change_phone"

    .line 72
    .line 73
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/InactivateReason;->key:Ljava/lang/String;

    .line 74
    .line 75
    const-string v1, "\u91cd\u65b0\u6ce8\u518c/\u6362\u7ed1\u624b\u673a"

    .line 76
    .line 77
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/InactivateReason;->name:Ljava/lang/String;

    .line 78
    .line 79
    new-instance v1, Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .line 83
    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/InactivateReason;->reasons:Ljava/util/List;

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;->new_()Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    const-string v2, "reason_reregister_or_change_phone"

    .line 91
    .line 92
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;->key:Ljava/lang/String;

    .line 93
    .line 94
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/InactivateReason;->reasons:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    invoke-static {p1}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 103
    .line 104
    .line 105
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_2

    .line 114
    .line 115
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    check-cast v1, Lcom/p1/mobile/putong/core/data/InactivateReason;

    .line 120
    .line 121
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/InactivateReason;->reasons:Ljava/util/List;

    .line 122
    .line 123
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-nez v2, :cond_1

    .line 128
    .line 129
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/InactivateReason;->reasons:Ljava/util/List;

    .line 130
    .line 131
    invoke-static {v1}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_2
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 136
    .line 137
    check-cast p0, Ll/wp;

    .line 138
    .line 139
    invoke-virtual {p0, p1}, Ll/wp;->u(Ljava/util/List;)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    const-string v0, "InactivateReason"

    .line 152
    .line 153
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    check-cast p1, Lcom/p1/mobile/putong/core/data/InactivateReason;

    .line 158
    .line 159
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;->new_()Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    const-string v1, "reason_custom"

    .line 164
    .line 165
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;->key:Ljava/lang/String;

    .line 166
    .line 167
    const-string v1, "\u5176\u4ed6"

    .line 168
    .line 169
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;->name:Ljava/lang/String;

    .line 170
    .line 171
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/InactivateReason;->reasons:Ljava/util/List;

    .line 172
    .line 173
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/InactivateReason;->key:Ljava/lang/String;

    .line 177
    .line 178
    iput-object v0, p0, Ll/mp;->b:Ljava/lang/String;

    .line 179
    .line 180
    const-string v1, "category_custom"

    .line 181
    .line 182
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 187
    .line 188
    if-eqz v0, :cond_4

    .line 189
    .line 190
    check-cast p0, Ll/wp;

    .line 191
    .line 192
    invoke-virtual {p0}, Ll/wp;->v()V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :cond_4
    check-cast p0, Ll/wp;

    .line 197
    .line 198
    invoke-virtual {p0, p1}, Ll/wp;->s(Lcom/p1/mobile/putong/core/data/InactivateReason;)V

    .line 199
    .line 200
    .line 201
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/lp;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lp;-><init>(Ll/mp;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f0(Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/mp;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;->key:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public g0()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/mp;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Ll/mp;->a:Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Ljava/lang/String;

    .line 35
    .line 36
    iget-object v3, p0, Ll/mp;->a:Ljava/util/HashMap;

    .line 37
    .line 38
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v2, "\uff1b"

    .line 48
    .line 49
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    add-int/lit8 p0, p0, -0x1

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-virtual {v0, v1, p0}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_1
    const-string p0, ""

    .line 66
    .line 67
    return-object p0
.end method

.method public h0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/mp;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    const-string v0, "reason_custom"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public i0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mp;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashMap;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public k0(Lcom/p1/mobile/putong/core/data/InactivateReason;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/InactivateReason;->key:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "category_reregister_or_change_phone"

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v2, "\u91cd\u65b0\u6ce8\u518c/\u6362\u7ed1\u624b\u673a"

    .line 20
    .line 21
    const-string v3, ""

    .line 22
    .line 23
    const-string v4, "reason_reregister_or_change_phone"

    .line 24
    .line 25
    invoke-static {v0, v1, v4, v2, v3}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->Z1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/mp;->n0()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const/4 v1, 0x1

    .line 41
    invoke-static {v0, v1, p1}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;->a2(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/data/InactivateReason;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0, p1, v1}, Ll/mp;->m0(Landroid/content/Intent;I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mp;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;->key:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m0(Landroid/content/Intent;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/wp;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public n0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, -0x1

    .line 6
    invoke-virtual {v0, v1}, Landroid/app/Activity;->setResult(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 14
    .line 15
    .line 16
    return-void
.end method
