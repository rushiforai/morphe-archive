.class public Lcom/p1/mobile/putong/core/api/g$d;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/core/data/OfficialAccount;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    new-instance v0, Ll/dji;

    .line 2
    .line 3
    new-instance v1, Ll/vod;

    .line 4
    .line 5
    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    .line 6
    .line 7
    iget-object v2, v2, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "officialAccounts"

    .line 14
    .line 15
    const-string v4, "2"

    .line 16
    .line 17
    invoke-direct {v1, v3, v4, v2}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object v2, Lcom/p1/mobile/putong/core/data/OfficialAccount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 21
    .line 22
    invoke-static {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER(Lcom/tantanapp/common/data/ProtobufAdapter;)Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const/4 v3, 0x7

    .line 27
    invoke-direct {v0, v1, v3, v2}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ll/bd8;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/bd8;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v2, "OfficialAccountsApi"

    .line 36
    .line 37
    invoke-direct {p0, v2, v0, v1}, Ll/mof0;-><init>(Ljava/lang/String;Ll/dji;Ll/pcj;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic B(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic C()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/cd8;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/cd8;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/dd8;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/dd8;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    return-object v0
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;
    .locals 9

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->officialAccounts:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_5

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->menus:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_5

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->officialAccounts:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_5

    .line 48
    .line 49
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Lcom/p1/mobile/putong/core/data/OfficialAccount;

    .line 54
    .line 55
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/OfficialAccount;->menuIds:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-eqz v4, :cond_0

    .line 66
    .line 67
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    check-cast v4, Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    check-cast v5, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 78
    .line 79
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/CoreData;->menus:Ljava/util/List;

    .line 80
    .line 81
    new-instance v6, Ll/ed8;

    .line 82
    .line 83
    invoke-direct {v6, v4}, Ll/ed8;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v5, v6}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    check-cast v4, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;

    .line 91
    .line 92
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    if-eqz v5, :cond_1

    .line 97
    .line 98
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/OfficialAccount;->localMenus:Ljava/util/List;

    .line 99
    .line 100
    if-nez v5, :cond_2

    .line 101
    .line 102
    new-instance v5, Ljava/util/ArrayList;

    .line 103
    .line 104
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 105
    .line 106
    .line 107
    iput-object v5, v2, Lcom/p1/mobile/putong/core/data/OfficialAccount;->localMenus:Ljava/util/List;

    .line 108
    .line 109
    :cond_2
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/OfficialAccount;->localMenus:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->children:Ljava/util/List;

    .line 115
    .line 116
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    if-eqz v5, :cond_1

    .line 121
    .line 122
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->children:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    :cond_3
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 129
    .line 130
    .line 131
    move-result v6

    .line 132
    if-eqz v6, :cond_1

    .line 133
    .line 134
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v6

    .line 138
    check-cast v6, Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 141
    .line 142
    .line 143
    move-result-object v7

    .line 144
    check-cast v7, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 145
    .line 146
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/CoreData;->menus:Ljava/util/List;

    .line 147
    .line 148
    new-instance v8, Ll/fd8;

    .line 149
    .line 150
    invoke-direct {v8, v6}, Ll/fd8;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-static {v7, v8}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v6

    .line 157
    check-cast v6, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;

    .line 158
    .line 159
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v7

    .line 163
    if-eqz v7, :cond_3

    .line 164
    .line 165
    new-instance v7, Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;

    .line 166
    .line 167
    invoke-direct {v7}, Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;-><init>()V

    .line 168
    .line 169
    .line 170
    iget-object v8, v6, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->id:Ljava/lang/String;

    .line 171
    .line 172
    iput-object v8, v7, Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;->id:Ljava/lang/String;

    .line 173
    .line 174
    iget-object v8, v6, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->text:Ljava/lang/String;

    .line 175
    .line 176
    iput-object v8, v7, Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;->text:Ljava/lang/String;

    .line 177
    .line 178
    iget-object v8, v6, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->action:Lcom/p1/mobile/putong/data/OfficialAccountAction;

    .line 179
    .line 180
    iput-object v8, v7, Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;->action:Lcom/p1/mobile/putong/data/OfficialAccountAction;

    .line 181
    .line 182
    iget-boolean v6, v6, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->needTracking:Z

    .line 183
    .line 184
    iput-boolean v6, v7, Lcom/p1/mobile/putong/core/data/OfficialAccountsSubMenu;->needTracking:Z

    .line 185
    .line 186
    iget-object v6, v4, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->localMenus:Ljava/util/List;

    .line 187
    .line 188
    if-nez v6, :cond_4

    .line 189
    .line 190
    new-instance v6, Ljava/util/ArrayList;

    .line 191
    .line 192
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 193
    .line 194
    .line 195
    iput-object v6, v4, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->localMenus:Ljava/util/List;

    .line 196
    .line 197
    :cond_4
    iget-object v6, v4, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->localMenus:Ljava/util/List;

    .line 198
    .line 199
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    goto :goto_0

    .line 203
    :cond_5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 208
    .line 209
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->officialAccounts:Ljava/util/List;

    .line 210
    .line 211
    return-object p0
.end method

.method public static synthetic E()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/official-accounts?with=menus"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static synthetic F(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
