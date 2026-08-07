.class public Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;
.super Landroid/app/Fragment;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;
    }
.end annotation


# static fields
.field public static final l:Ll/xyd0;

.field public static final m:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

.field public c:Ll/j6e;

.field public d:Ll/k6e;

.field public e:Ll/l6e;

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:Z

.field public j:I

.field public k:Ll/as60;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    new-instance v0, Ll/xyd0;

    .line 2
    .line 3
    new-instance v1, Ljava/util/HashSet;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "permission_denied_track"

    .line 9
    .line 10
    invoke-direct {v0, v2, v1}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->l:Ll/xyd0;

    .line 14
    .line 15
    new-instance v0, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->m:Ljava/util/Map;

    .line 21
    .line 22
    const-string v1, "android.permission.ACTIVITY_RECOGNITION"

    .line 23
    .line 24
    filled-new-array {v1}, [Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "android.permission-group.ACTIVITY_RECOGNITION"

    .line 33
    .line 34
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    const-string v1, "android.permission.WRITE_CALENDAR"

    .line 38
    .line 39
    const-string v2, "android.permission.READ_CALENDAR"

    .line 40
    .line 41
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const-string v2, "android.permission-group.CALENDAR"

    .line 50
    .line 51
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    const-string v1, "android.permission.READ_CALL_LOG"

    .line 55
    .line 56
    const-string v2, "android.permission.WRITE_CALL_LOG"

    .line 57
    .line 58
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const-string v2, "android.permission-group.CALL_LOG"

    .line 67
    .line 68
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    const-string v1, "android.permission.CAMERA"

    .line 72
    .line 73
    filled-new-array {v1}, [Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    const-string v2, "android.permission-group.CAMERA"

    .line 82
    .line 83
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    const-string v1, "android.permission.WRITE_CONTACTS"

    .line 87
    .line 88
    const-string v2, "android.permission.GET_ACCOUNTS"

    .line 89
    .line 90
    const-string v3, "android.permission.READ_CONTACTS"

    .line 91
    .line 92
    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    const-string v2, "android.permission-group.CONTACTS"

    .line 101
    .line 102
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    .line 106
    .line 107
    const-string v2, "android.permission.ACCESS_MEDIA_LOCATION"

    .line 108
    .line 109
    const-string v3, "android.permission.ACCESS_COARSE_LOCATION"

    .line 110
    .line 111
    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    const-string v2, "android.permission-group.LOCATION"

    .line 120
    .line 121
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    const-string v1, "android.permission.RECORD_AUDIO"

    .line 125
    .line 126
    filled-new-array {v1}, [Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    const-string v2, "android.permission-group.MICROPHONE"

    .line 135
    .line 136
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    const-string v1, "android.permission.BODY_SENSORS"

    .line 140
    .line 141
    filled-new-array {v1}, [Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    const-string v2, "android.permission-group.SENSORS"

    .line 150
    .line 151
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    const-string v9, "android.permission.ACCEPT_HANDOVER"

    .line 155
    .line 156
    const-string v10, "android.permission.ANSWER_PHONE_CALLS"

    .line 157
    .line 158
    const-string v3, "android.permission.READ_PHONE_STATE"

    .line 159
    .line 160
    const-string v4, "android.permission.CALL_PHONE"

    .line 161
    .line 162
    const-string v5, "com.android.voicemail.permission.ADD_VOICEMAIL"

    .line 163
    .line 164
    const-string v6, "android.permission.USE_SIP"

    .line 165
    .line 166
    const-string v7, "android.permission.PROCESS_OUTGOING_CALLS"

    .line 167
    .line 168
    const-string v8, "android.permission.READ_PHONE_NUMBERS"

    .line 169
    .line 170
    filled-new-array/range {v3 .. v10}, [Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    const-string v2, "android.permission-group.PHONE"

    .line 179
    .line 180
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    const-string v1, "android.permission.SEND_SMS"

    .line 184
    .line 185
    const-string v2, "android.permission.RECEIVE_WAP_PUSH"

    .line 186
    .line 187
    const-string v3, "android.permission.READ_SMS"

    .line 188
    .line 189
    const-string v4, "android.permission.RECEIVE_MMS"

    .line 190
    .line 191
    const-string v5, "android.permission.RECEIVE_SMS"

    .line 192
    .line 193
    filled-new-array {v3, v4, v5, v1, v2}, [Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    const-string v2, "android.permission-group.SMS"

    .line 202
    .line 203
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    .line 207
    .line 208
    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 209
    .line 210
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    const-string v2, "android.permission-group.STORAGE"

    .line 219
    .line 220
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->f:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->o(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->s()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->p()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;Ljava/util/Set;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->n(Ljava/util/Set;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;Ljava/lang/String;Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->m(Ljava/lang/String;Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->r(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;Ljava/util/Set;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->q(Ljava/util/Set;)V

    return-void
.end method

.method public static bridge synthetic h(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->l(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static l(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    :try_start_0
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getPermissionInfo(Ljava/lang/String;I)Landroid/content/pm/PermissionInfo;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p0, p0, Landroid/content/pm/PermissionInfo;->group:Ljava/lang/String;

    .line 11
    .line 12
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 13
    .line 14
    const/16 v1, 0x1c

    .line 15
    .line 16
    if-le v0, v1, :cond_1

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->m:Ljava/util/Map;

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ljava/util/Map$Entry;

    .line 39
    .line 40
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_0

    .line 51
    .line 52
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ljava/lang/String;

    .line 57
    .line 58
    :cond_1
    const-string v0, "android.permission-group.UNDEFINED"

    .line 59
    .line 60
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    return-object p1

    .line 67
    :cond_2
    return-object p0

    .line 68
    :catch_0
    move-exception p0

    .line 69
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x0

    .line 73
    return-object p0
.end method

.method public static t([Ljava/lang/String;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;Ll/j6e;Ll/k6e;Ll/l6e;ZZZZILcom/p1/mobile/putong/ui/permission/PermissionHelper$c;)Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;
    .locals 0

    .line 1
    new-instance p10, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;

    .line 2
    .line 3
    invoke-direct {p10}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iput-object p0, p10, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->a:Ljava/util/List;

    .line 11
    .line 12
    iput-boolean p5, p10, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->f:Z

    .line 13
    .line 14
    iput-boolean p6, p10, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->g:Z

    .line 15
    .line 16
    iput-boolean p7, p10, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->h:Z

    .line 17
    .line 18
    iput-object p1, p10, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

    .line 19
    .line 20
    iput-object p2, p10, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->c:Ll/j6e;

    .line 21
    .line 22
    iput-object p3, p10, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->d:Ll/k6e;

    .line 23
    .line 24
    iput-object p4, p10, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->e:Ll/l6e;

    .line 25
    .line 26
    iput-boolean p8, p10, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->i:Z

    .line 27
    .line 28
    iput p9, p10, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->j:I

    .line 29
    .line 30
    return-object p10
.end method


# virtual methods
.method public final i(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v0, 0x21

    .line 4
    .line 5
    if-lt p0, v0, :cond_0

    .line 6
    .line 7
    const-string p0, "android.permission.READ_MEDIA_IMAGES"

    .line 8
    .line 9
    invoke-interface {p1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-string p0, "android.permission.READ_MEDIA_VIDEO"

    .line 16
    .line 17
    invoke-interface {p1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-interface {p1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final j(Z)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/ui/permission/a;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/ui/permission/a;-><init>(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;)V

    .line 12
    .line 13
    .line 14
    :goto_0
    new-instance v1, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->a:Ljava/util/List;

    .line 21
    .line 22
    iget-boolean v4, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->f:Z

    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    const/4 v6, 0x1

    .line 26
    if-eqz v4, :cond_1

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    move v4, v6

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    move v4, v5

    .line 33
    :goto_1
    invoke-direct {v1, v2, v3, v4, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;-><init>(Landroid/app/Activity;Ljava/util/List;ZLl/z20;)V

    .line 34
    .line 35
    .line 36
    sget-object v0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$a;->a:[I

    .line 37
    .line 38
    iget-object v2, v1, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    aget v0, v0, v2

    .line 45
    .line 46
    if-eq v0, v6, :cond_6

    .line 47
    .line 48
    const/4 v2, 0x2

    .line 49
    if-eq v0, v2, :cond_3

    .line 50
    .line 51
    const/4 p1, 0x3

    .line 52
    if-eq v0, p1, :cond_2

    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->w(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_3
    if-eqz p1, :cond_4

    .line 60
    .line 61
    iget-boolean p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->g:Z

    .line 62
    .line 63
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->v(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;Z)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->h:Z

    .line 68
    .line 69
    if-eqz p1, :cond_5

    .line 70
    .line 71
    invoke-virtual {p0, v1, v6}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->v(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;Z)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_5
    sget-object p1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;->Unknown:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 76
    .line 77
    invoke-virtual {p0, v5, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->k(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_6
    sget-object p1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;->Null:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 82
    .line 83
    invoke-virtual {p0, v6, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->k(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final k(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "request peremissions = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->a:Ljava/util/List;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", granted = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, ", reason = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "[putong-common][permission]"

    .line 34
    .line 35
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    invoke-static {}, Ll/i4g0;->J()V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->k:Ll/as60;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/as60;->d()V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

    .line 57
    .line 58
    invoke-interface {v0, p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;->a(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    invoke-virtual {p0}, Landroid/app/Fragment;->getFragmentManager()Landroid/app/FragmentManager;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_2

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/app/Fragment;->getFragmentManager()Landroid/app/FragmentManager;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 84
    .line 85
    .line 86
    :cond_2
    return-void
.end method

.method public final synthetic m(Ljava/lang/String;Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;->GRANTED:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 2
    .line 3
    if-ne p2, p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->c:Ll/j6e;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->c:Ll/j6e;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/j6e;->a()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->h:Z

    .line 20
    .line 21
    if-nez p1, :cond_2

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->c:Ll/j6e;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->c:Ll/j6e;

    .line 32
    .line 33
    sget-object p1, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;->DENIED_FOREVER:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 34
    .line 35
    if-ne p2, p1, :cond_1

    .line 36
    .line 37
    const/4 p1, 0x1

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 p1, 0x0

    .line 40
    :goto_0
    invoke-interface {p0, p1}, Ll/j6e;->b(Z)V

    .line 41
    .line 42
    .line 43
    :cond_2
    return-void
.end method

.method public final synthetic n(Ljava/util/Set;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->d:Ll/k6e;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->d:Ll/k6e;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/k6e;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    new-array v1, v0, [Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {p1, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, [Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0, p1, v0}, Ll/n5j;->a(Landroid/app/Fragment;[Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic o(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    sget-object v0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;->PermissionCancelForRequest:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 3
    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->k(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->d:Ll/k6e;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->d:Ll/k6e;

    .line 16
    .line 17
    invoke-interface {p0}, Ll/k6e;->b()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/as60;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ll/as60;-><init>(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->k:Ll/as60;

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->a:Ljava/util/List;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    sget-object v0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;->Unknown:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->k(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/4 p1, 0x1

    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->j(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->j(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic p()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sget-object v1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;->PermissionCancelForRequest:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 3
    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->k(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->d:Ll/k6e;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->d:Ll/k6e;

    .line 16
    .line 17
    invoke-interface {p0}, Ll/k6e;->b()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic q(Ljava/util/Set;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->e:Ll/l6e;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->e:Ll/l6e;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/l6e;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 26
    .line 27
    const/16 v2, 0x1e

    .line 28
    .line 29
    if-le v0, v2, :cond_1

    .line 30
    .line 31
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    const-string v0, "android.permission.BLUETOOTH_CONNECT"

    .line 38
    .line 39
    invoke-interface {p1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    new-instance p1, Landroid/content/Intent;

    .line 46
    .line 47
    const-string v0, "android.settings.APPLICATION_DETAILS_SETTINGS"

    .line 48
    .line 49
    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v2, "package:"

    .line 55
    .line 56
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    sget v2, Ll/ive0;->a:I

    .line 86
    .line 87
    invoke-virtual {v0, p1, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 88
    .line 89
    .line 90
    sget-object p1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;->GoToSettingPage:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 91
    .line 92
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->k(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_1
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-static {p1}, Ll/hve0;->x(Landroid/app/Activity;)V

    .line 101
    .line 102
    .line 103
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;->GoToSettingPage:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 104
    .line 105
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->k(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final synthetic r(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    sget-object v0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;->PermissionCancelForSetting:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 3
    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->k(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->e:Ll/l6e;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->e:Ll/l6e;

    .line 16
    .line 17
    invoke-interface {p0}, Ll/l6e;->b()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic s()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sget-object v1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;->PermissionCancelForSetting:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 3
    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->k(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->e:Ll/l6e;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->e:Ll/l6e;

    .line 16
    .line 17
    invoke-interface {p0}, Ll/l6e;->b()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public u(Landroid/app/FragmentManager;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, p0, v0}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final v(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_1

    .line 3
    .line 4
    iget-object p2, p1, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->i:Ljava/util/Set;

    .line 5
    .line 6
    invoke-static {p2}, Ll/cs60;->t(Ljava/util/Set;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->c:Ll/j6e;

    .line 13
    .line 14
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->c:Ll/j6e;

    .line 21
    .line 22
    invoke-interface {p2, v0}, Ll/j6e;->b(Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->i:Ljava/util/Set;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->d:Ljava/util/Set;

    .line 28
    .line 29
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->x(Ljava/util/Set;Ljava/util/Set;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->c:Ll/j6e;

    .line 34
    .line 35
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_2

    .line 40
    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->c:Ll/j6e;

    .line 42
    .line 43
    invoke-interface {p2}, Ll/j6e;->c()V

    .line 44
    .line 45
    .line 46
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->k:Ll/as60;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p2, v1}, Ll/as60;->f(Landroid/app/Activity;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->d:Ljava/util/Set;

    .line 56
    .line 57
    new-array p2, v0, [Ljava/lang/String;

    .line 58
    .line 59
    invoke-interface {p1, p2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, [Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {p0, p1, v0}, Ll/n5j;->a(Landroid/app/Fragment;[Ljava/lang/String;I)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->c:Ll/j6e;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->l:Ll/xyd0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/util/HashSet;

    .line 16
    .line 17
    iget-object v2, p1, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->d:Ljava/util/Set;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/util/AbstractCollection;->containsAll(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->c:Ll/j6e;

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    invoke-interface {v1, v2}, Ll/j6e;->b(Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljava/util/HashSet;

    .line 36
    .line 37
    iget-object v2, p1, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->d:Ljava/util/Set;

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->j:Ljava/util/Set;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->y(Ljava/util/Set;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final x(Ljava/util/Set;Ljava/util/Set;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_3

    .line 8
    .line 9
    :cond_0
    new-instance v0, Ll/jl80$a;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-direct {v0, v1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/Set;->size()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, 0x1

    .line 23
    if-ne v1, v2, :cond_3

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Ljava/lang/String;

    .line 34
    .line 35
    sget-object v1, Ll/cs60;->e:Ljava/util/Map;

    .line 36
    .line 37
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Ljava/lang/Integer;

    .line 42
    .line 43
    if-nez v1, :cond_1

    .line 44
    .line 45
    sget v1, Ll/cbc0;->n0:I

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    :goto_0
    sget-object v3, Ll/cs60;->f:Ljava/util/Map;

    .line 53
    .line 54
    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    check-cast v3, Ljava/lang/Integer;

    .line 59
    .line 60
    if-nez v3, :cond_2

    .line 61
    .line 62
    sget v3, Lcom/p1/mobile/putong/common/R$string;->e1:I

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    :goto_1
    invoke-virtual {v0, v1}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    const/4 v4, 0x0

    .line 74
    new-array v4, v4, [Ljava/lang/Object;

    .line 75
    .line 76
    invoke-virtual {v1, v3, v4}, Ll/jl80$a;->s0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->a(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {v1, p1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 85
    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_3
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    sget v3, Ll/jec0;->I:I

    .line 97
    .line 98
    const/4 v4, 0x0

    .line 99
    invoke-virtual {v1, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    check-cast v1, Landroid/widget/LinearLayout;

    .line 104
    .line 105
    sget v3, Ll/ycc0;->s0:I

    .line 106
    .line 107
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    check-cast v3, Landroid/widget/TextView;

    .line 112
    .line 113
    sget v5, Lcom/p1/mobile/putong/common/R$string;->X0:I

    .line 114
    .line 115
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(I)V

    .line 116
    .line 117
    .line 118
    const/4 v5, 0x3

    .line 119
    invoke-static {v5}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    invoke-virtual {v3, v5, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 124
    .line 125
    .line 126
    new-instance v3, Landroid/widget/ListView;

    .line 127
    .line 128
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    invoke-direct {v3, v5}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->i(Ljava/util/Set;)V

    .line 139
    .line 140
    .line 141
    new-instance v4, Ll/cs60;

    .line 142
    .line 143
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    invoke-direct {v4, v5, p1}, Ll/cs60;-><init>(Landroid/content/Context;Ljava/util/Set;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0, v1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 157
    .line 158
    .line 159
    :goto_2
    sget p1, Lcom/p1/mobile/putong/common/R$string;->g:I

    .line 160
    .line 161
    new-instance v1, Ll/gs60;

    .line 162
    .line 163
    invoke-direct {v1, p0, p2}, Ll/gs60;-><init>(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;Ljava/util/Set;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, p1, v1}, Ll/jl80$a;->a0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    iget-boolean p2, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->i:Z

    .line 171
    .line 172
    invoke-virtual {p1, p2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    new-instance p2, Ll/hs60;

    .line 177
    .line 178
    invoke-direct {p2, p0}, Ll/hs60;-><init>(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p1, p2}, Ll/jl80$a;->l0(Landroid/content/DialogInterface$OnCancelListener;)Ll/jl80$a;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0, v2}, Ll/jl80$a;->e0(Z)Ll/jl80$a;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    iget-boolean p2, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->i:Z

    .line 189
    .line 190
    if-eqz p2, :cond_4

    .line 191
    .line 192
    sget p2, Lcom/p1/mobile/putong/common/R$string;->a:I

    .line 193
    .line 194
    new-instance v0, Ll/is60;

    .line 195
    .line 196
    invoke-direct {v0, p0}, Ll/is60;-><init>(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1, p2, v0}, Ll/jl80$a;->U(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    :cond_4
    invoke-virtual {p1}, Ll/jl80$a;->r0()Ll/jl80;

    .line 204
    .line 205
    .line 206
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->d:Ll/k6e;

    .line 207
    .line 208
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result p1

    .line 212
    if-eqz p1, :cond_5

    .line 213
    .line 214
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->d:Ll/k6e;

    .line 215
    .line 216
    invoke-interface {p0}, Ll/k6e;->c()V

    .line 217
    .line 218
    .line 219
    :cond_5
    :goto_3
    return-void
.end method

.method public final y(Ljava/util/Set;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-nez v1, :cond_3

    .line 7
    .line 8
    new-instance v1, Landroid/widget/ListView;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-direct {v1, v2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    const/high16 v2, 0x41a00000    # 20.0f

    .line 18
    .line 19
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    mul-int/lit8 v3, v2, 0x2

    .line 24
    .line 25
    invoke-virtual {v1, v2, v2, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->i(Ljava/util/Set;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/ls60;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-direct {v0, v2, p1}, Ll/ls60;-><init>(Landroid/content/Context;Ljava/util/Set;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$e;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-direct {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;-><init>(Landroid/content/Context;)V

    .line 53
    .line 54
    .line 55
    iget v2, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->j:I

    .line 56
    .line 57
    if-eqz v2, :cond_0

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    sget v2, Lcom/p1/mobile/putong/common/R$string;->X0:I

    .line 61
    .line 62
    :goto_0
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const/4 v2, 0x0

    .line 67
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    sget v1, Lcom/p1/mobile/putong/common/R$string;->g:I

    .line 72
    .line 73
    new-instance v2, Ll/ds60;

    .line 74
    .line 75
    invoke-direct {v2, p0, p1}, Ll/ds60;-><init>(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;Ljava/util/Set;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-boolean v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->i:Z

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    new-instance v0, Ll/es60;

    .line 89
    .line 90
    invoke-direct {v0, p0}, Ll/es60;-><init>(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->A(Landroid/content/DialogInterface$OnCancelListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iget-boolean v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->i:Z

    .line 98
    .line 99
    if-eqz v0, :cond_1

    .line 100
    .line 101
    sget v0, Lcom/p1/mobile/putong/common/R$string;->a:I

    .line 102
    .line 103
    new-instance v1, Ll/fs60;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/fs60;-><init>(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->e:Ll/l6e;

    .line 116
    .line 117
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_2

    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->e:Ll/l6e;

    .line 124
    .line 125
    invoke-interface {p0}, Ll/l6e;->c()V

    .line 126
    .line 127
    .line 128
    :cond_2
    return-void

    .line 129
    :cond_3
    throw v0
.end method
