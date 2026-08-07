.class public Lorg/eclipse/jetty/security/PropertyUserStore;
.super Lorg/eclipse/jetty/util/component/AbstractLifeCycle;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/security/PropertyUserStore$UserListener;
    }
.end annotation


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field private _config:Ljava/lang/String;

.field private _configResource:Lorg/eclipse/jetty/util/resource/Resource;

.field private _firstLoad:Z

.field private _identityService:Lorg/eclipse/jetty/security/IdentityService;

.field private final _knownUserIdentities:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jetty/server/UserIdentity;",
            ">;"
        }
    .end annotation
.end field

.field private final _knownUsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/eclipse/jetty/security/PropertyUserStore$UserListener;",
            ">;"
        }
    .end annotation
.end field

.field private _refreshInterval:I

.field private _scanner:Lorg/eclipse/jetty/util/Scanner;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/security/PropertyUserStore;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/security/PropertyUserStore;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_refreshInterval:I

    .line 6
    .line 7
    new-instance v0, Lorg/eclipse/jetty/security/DefaultIdentityService;

    .line 8
    .line 9
    invoke-direct {v0}, Lorg/eclipse/jetty/security/DefaultIdentityService;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_identityService:Lorg/eclipse/jetty/security/IdentityService;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_firstLoad:Z

    .line 16
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_knownUsers:Ljava/util/List;

    .line 23
    .line 24
    new-instance v0, Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_knownUserIdentities:Ljava/util/Map;

    .line 30
    .line 31
    return-void
.end method

.method public static synthetic access$000(Lorg/eclipse/jetty/security/PropertyUserStore;)Lorg/eclipse/jetty/util/resource/Resource;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_configResource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lorg/eclipse/jetty/security/PropertyUserStore;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/security/PropertyUserStore;->loadUsers()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private loadUsers()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_config:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Lorg/eclipse/jetty/security/PropertyUserStore;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 7
    .line 8
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v3, "Load "

    .line 18
    .line 19
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v3, " from "

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v3, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_config:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-array v3, v2, [Ljava/lang/Object;

    .line 40
    .line 41
    invoke-interface {v0, v1, v3}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    new-instance v0, Ljava/util/Properties;

    .line 45
    .line 46
    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lorg/eclipse/jetty/security/PropertyUserStore;->getConfigResource()Lorg/eclipse/jetty/util/resource/Resource;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Lorg/eclipse/jetty/util/resource/Resource;->exists()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0}, Lorg/eclipse/jetty/security/PropertyUserStore;->getConfigResource()Lorg/eclipse/jetty/util/resource/Resource;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Lorg/eclipse/jetty/util/resource/Resource;->getInputStream()Ljava/io/InputStream;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v0, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 68
    .line 69
    .line 70
    :cond_2
    new-instance v1, Ljava/util/HashSet;

    .line 71
    .line 72
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/util/Properties;->entrySet()Ljava/util/Set;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    :cond_3
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-eqz v3, :cond_7

    .line 88
    .line 89
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    check-cast v3, Ljava/util/Map$Entry;

    .line 94
    .line 95
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    check-cast v4, Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    check-cast v3, Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    const/16 v5, 0x2c

    .line 116
    .line 117
    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(I)I

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    if-lez v5, :cond_4

    .line 122
    .line 123
    add-int/lit8 v6, v5, 0x1

    .line 124
    .line 125
    invoke-virtual {v3, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v6

    .line 133
    invoke-virtual {v3, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    goto :goto_1

    .line 142
    :cond_4
    const/4 v6, 0x0

    .line 143
    :goto_1
    if-eqz v4, :cond_3

    .line 144
    .line 145
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 146
    .line 147
    .line 148
    move-result v5

    .line 149
    if-lez v5, :cond_3

    .line 150
    .line 151
    if-eqz v3, :cond_3

    .line 152
    .line 153
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 154
    .line 155
    .line 156
    move-result v5

    .line 157
    if-lez v5, :cond_3

    .line 158
    .line 159
    sget-object v5, Lorg/eclipse/jetty/security/IdentityService;->NO_ROLES:[Ljava/lang/String;

    .line 160
    .line 161
    if-eqz v6, :cond_5

    .line 162
    .line 163
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 164
    .line 165
    .line 166
    move-result v7

    .line 167
    if-lez v7, :cond_5

    .line 168
    .line 169
    const-string v5, ","

    .line 170
    .line 171
    invoke-virtual {v6, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v5

    .line 175
    :cond_5
    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    invoke-static {v3}, Lorg/eclipse/jetty/util/security/Credential;->getCredential(Ljava/lang/String;)Lorg/eclipse/jetty/util/security/Credential;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    new-instance v7, Lorg/eclipse/jetty/security/MappedLoginService$KnownUser;

    .line 183
    .line 184
    invoke-direct {v7, v4, v3}, Lorg/eclipse/jetty/security/MappedLoginService$KnownUser;-><init>(Ljava/lang/String;Lorg/eclipse/jetty/util/security/Credential;)V

    .line 185
    .line 186
    .line 187
    new-instance v8, Ljavax/security/auth/Subject;

    .line 188
    .line 189
    invoke-direct {v8}, Ljavax/security/auth/Subject;-><init>()V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v8}, Ljavax/security/auth/Subject;->getPrincipals()Ljava/util/Set;

    .line 193
    .line 194
    .line 195
    move-result-object v9

    .line 196
    invoke-interface {v9, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    invoke-virtual {v8}, Ljavax/security/auth/Subject;->getPrivateCredentials()Ljava/util/Set;

    .line 200
    .line 201
    .line 202
    move-result-object v9

    .line 203
    invoke-interface {v9, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    if-eqz v6, :cond_6

    .line 207
    .line 208
    array-length v6, v5

    .line 209
    move v9, v2

    .line 210
    :goto_2
    if-ge v9, v6, :cond_6

    .line 211
    .line 212
    aget-object v10, v5, v9

    .line 213
    .line 214
    invoke-virtual {v8}, Ljavax/security/auth/Subject;->getPrincipals()Ljava/util/Set;

    .line 215
    .line 216
    .line 217
    move-result-object v11

    .line 218
    new-instance v12, Lorg/eclipse/jetty/security/MappedLoginService$RolePrincipal;

    .line 219
    .line 220
    invoke-direct {v12, v10}, Lorg/eclipse/jetty/security/MappedLoginService$RolePrincipal;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    invoke-interface {v11, v12}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    add-int/lit8 v9, v9, 0x1

    .line 227
    .line 228
    goto :goto_2

    .line 229
    :cond_6
    invoke-virtual {v8}, Ljavax/security/auth/Subject;->setReadOnly()V

    .line 230
    .line 231
    .line 232
    iget-object v6, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_knownUserIdentities:Ljava/util/Map;

    .line 233
    .line 234
    iget-object v9, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_identityService:Lorg/eclipse/jetty/security/IdentityService;

    .line 235
    .line 236
    invoke-interface {v9, v8, v7, v5}, Lorg/eclipse/jetty/security/IdentityService;->newUserIdentity(Ljavax/security/auth/Subject;Ljava/security/Principal;[Ljava/lang/String;)Lorg/eclipse/jetty/server/UserIdentity;

    .line 237
    .line 238
    .line 239
    move-result-object v7

    .line 240
    invoke-interface {v6, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    invoke-direct {p0, v4, v3, v5}, Lorg/eclipse/jetty/security/PropertyUserStore;->notifyUpdate(Ljava/lang/String;Lorg/eclipse/jetty/util/security/Credential;[Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    goto/16 :goto_0

    .line 247
    .line 248
    :cond_7
    iget-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_knownUsers:Ljava/util/List;

    .line 249
    .line 250
    monitor-enter v0

    .line 251
    :try_start_0
    iget-boolean v3, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_firstLoad:Z

    .line 252
    .line 253
    if-nez v3, :cond_9

    .line 254
    .line 255
    iget-object v3, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_knownUsers:Ljava/util/List;

    .line 256
    .line 257
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 258
    .line 259
    .line 260
    move-result-object v3

    .line 261
    :cond_8
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 262
    .line 263
    .line 264
    move-result v4

    .line 265
    if-eqz v4, :cond_9

    .line 266
    .line 267
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v4

    .line 271
    check-cast v4, Ljava/lang/String;

    .line 272
    .line 273
    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    move-result v5

    .line 277
    if-nez v5, :cond_8

    .line 278
    .line 279
    iget-object v5, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_knownUserIdentities:Ljava/util/Map;

    .line 280
    .line 281
    invoke-interface {v5, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    invoke-direct {p0, v4}, Lorg/eclipse/jetty/security/PropertyUserStore;->notifyRemove(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    goto :goto_3

    .line 288
    :catchall_0
    move-exception p0

    .line 289
    goto :goto_4

    .line 290
    :cond_9
    iget-object v3, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_knownUsers:Ljava/util/List;

    .line 291
    .line 292
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 293
    .line 294
    .line 295
    iget-object v3, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_knownUsers:Ljava/util/List;

    .line 296
    .line 297
    invoke-interface {v3, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 298
    .line 299
    .line 300
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 301
    iput-boolean v2, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_firstLoad:Z

    .line 302
    .line 303
    return-void

    .line 304
    :goto_4
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 305
    throw p0
.end method

.method private notifyRemove(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_listeners:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lorg/eclipse/jetty/security/PropertyUserStore$UserListener;

    .line 20
    .line 21
    invoke-interface {v0, p1}, Lorg/eclipse/jetty/security/PropertyUserStore$UserListener;->remove(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method private notifyUpdate(Ljava/lang/String;Lorg/eclipse/jetty/util/security/Credential;[Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_listeners:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lorg/eclipse/jetty/security/PropertyUserStore$UserListener;

    .line 20
    .line 21
    invoke-interface {v0, p1, p2, p3}, Lorg/eclipse/jetty/security/PropertyUserStore$UserListener;->update(Ljava/lang/String;Lorg/eclipse/jetty/util/security/Credential;[Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method


# virtual methods
.method public doStart()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->doStart()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lorg/eclipse/jetty/security/PropertyUserStore;->getRefreshInterval()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Lorg/eclipse/jetty/util/Scanner;

    .line 11
    .line 12
    invoke-direct {v0}, Lorg/eclipse/jetty/util/Scanner;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_scanner:Lorg/eclipse/jetty/util/Scanner;

    .line 16
    .line 17
    invoke-virtual {p0}, Lorg/eclipse/jetty/security/PropertyUserStore;->getRefreshInterval()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/util/Scanner;->setScanInterval(I)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ljava/util/ArrayList;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lorg/eclipse/jetty/security/PropertyUserStore;->getConfigResource()Lorg/eclipse/jetty/util/resource/Resource;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Lorg/eclipse/jetty/util/resource/Resource;->getFile()Ljava/io/File;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_scanner:Lorg/eclipse/jetty/util/Scanner;

    .line 46
    .line 47
    invoke-virtual {v2, v0}, Lorg/eclipse/jetty/util/Scanner;->setScanDirs(Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_scanner:Lorg/eclipse/jetty/util/Scanner;

    .line 51
    .line 52
    new-instance v2, Lorg/eclipse/jetty/security/PropertyUserStore$1;

    .line 53
    .line 54
    invoke-direct {v2, p0}, Lorg/eclipse/jetty/security/PropertyUserStore$1;-><init>(Lorg/eclipse/jetty/security/PropertyUserStore;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v2}, Lorg/eclipse/jetty/util/Scanner;->setFilenameFilter(Ljava/io/FilenameFilter;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_scanner:Lorg/eclipse/jetty/util/Scanner;

    .line 61
    .line 62
    new-instance v2, Lorg/eclipse/jetty/security/PropertyUserStore$2;

    .line 63
    .line 64
    invoke-direct {v2, p0}, Lorg/eclipse/jetty/security/PropertyUserStore$2;-><init>(Lorg/eclipse/jetty/security/PropertyUserStore;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v2}, Lorg/eclipse/jetty/util/Scanner;->addListener(Lorg/eclipse/jetty/util/Scanner$Listener;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_scanner:Lorg/eclipse/jetty/util/Scanner;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/util/Scanner;->setReportExistingFilesOnStartup(Z)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_scanner:Lorg/eclipse/jetty/util/Scanner;

    .line 76
    .line 77
    const/4 v1, 0x0

    .line 78
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/util/Scanner;->setRecursive(Z)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_scanner:Lorg/eclipse/jetty/util/Scanner;

    .line 82
    .line 83
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->start()V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jetty/security/PropertyUserStore;->loadUsers()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public doStop()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->doStop()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_scanner:Lorg/eclipse/jetty/util/Scanner;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->stop()V

    .line 9
    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_scanner:Lorg/eclipse/jetty/util/Scanner;

    .line 13
    .line 14
    return-void
.end method

.method public getConfig()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_config:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getConfigResource()Lorg/eclipse/jetty/util/resource/Resource;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_configResource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_config:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Lorg/eclipse/jetty/util/resource/Resource;->newResource(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_configResource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_configResource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 14
    .line 15
    return-object p0
.end method

.method public getRefreshInterval()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_refreshInterval:I

    .line 2
    .line 3
    return p0
.end method

.method public getUserIdentity(Ljava/lang/String;)Lorg/eclipse/jetty/server/UserIdentity;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_knownUserIdentities:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/eclipse/jetty/server/UserIdentity;

    .line 8
    .line 9
    return-object p0
.end method

.method public registerUserListener(Lorg/eclipse/jetty/security/PropertyUserStore$UserListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_listeners:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_listeners:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_listeners:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setConfig(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_config:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setRefreshInterval(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/security/PropertyUserStore;->_refreshInterval:I

    .line 2
    .line 3
    return-void
.end method
