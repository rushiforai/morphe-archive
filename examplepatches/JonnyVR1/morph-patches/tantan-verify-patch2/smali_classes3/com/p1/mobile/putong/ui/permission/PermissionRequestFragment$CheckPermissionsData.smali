.class public Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CheckPermissionsData"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

.field public final b:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final i:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/util/List;ZLl/z20;)V
    .locals 7
    .param p4    # Ll/z20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->b:Ljava/util/Set;

    .line 10
    .line 11
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->c:Ljava/util/Set;

    .line 17
    .line 18
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->d:Ljava/util/Set;

    .line 24
    .line 25
    new-instance v1, Ljava/util/LinkedHashSet;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->e:Ljava/util/Set;

    .line 31
    .line 32
    new-instance v2, Ljava/util/LinkedHashSet;

    .line 33
    .line 34
    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v2, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->f:Ljava/util/Set;

    .line 38
    .line 39
    new-instance v3, Ljava/util/LinkedHashSet;

    .line 40
    .line 41
    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v3, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->g:Ljava/util/Set;

    .line 45
    .line 46
    new-instance v3, Ljava/util/LinkedHashSet;

    .line 47
    .line 48
    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v3, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->h:Ljava/util/Set;

    .line 52
    .line 53
    new-instance v4, Ljava/util/LinkedHashSet;

    .line 54
    .line 55
    invoke-direct {v4}, Ljava/util/LinkedHashSet;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v4, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->i:Ljava/util/Set;

    .line 59
    .line 60
    new-instance v5, Ljava/util/LinkedHashSet;

    .line 61
    .line 62
    invoke-direct {v5}, Ljava/util/LinkedHashSet;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v5, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->j:Ljava/util/Set;

    .line 66
    .line 67
    if-nez p2, :cond_0

    .line 68
    .line 69
    sget-object p1, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;->GRANTED:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 70
    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 72
    .line 73
    return-void

    .line 74
    :cond_0
    new-instance v6, Ll/js60;

    .line 75
    .line 76
    invoke-direct {v6, p0, p1, p4, p3}, Ll/js60;-><init>(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;Landroid/app/Activity;Ll/z20;Z)V

    .line 77
    .line 78
    .line 79
    invoke-static {p2, v6}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 80
    .line 81
    .line 82
    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 83
    .line 84
    .line 85
    invoke-interface {v0, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 86
    .line 87
    .line 88
    invoke-interface {v3, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 89
    .line 90
    .line 91
    invoke-interface {v3, v5}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 92
    .line 93
    .line 94
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_2

    .line 99
    .line 100
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_1

    .line 105
    .line 106
    sget-object p1, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;->GRANTED:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 107
    .line 108
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 109
    .line 110
    return-void

    .line 111
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;->DENIED_FOREVER:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 112
    .line 113
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 114
    .line 115
    return-void

    .line 116
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;->DENIED:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 117
    .line 118
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 119
    .line 120
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;Landroid/app/Activity;Ll/z20;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->b(Landroid/app/Activity;Ll/z20;ZLjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Landroid/app/Activity;Ll/z20;ZLjava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1, p4}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->h(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->b:Ljava/util/Set;

    .line 6
    .line 7
    invoke-interface {v1, p4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    invoke-static {p1, p4}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->c:Ljava/util/Set;

    .line 17
    .line 18
    invoke-interface {p1, p4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->g:Ljava/util/Set;

    .line 22
    .line 23
    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_6

    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;->GRANTED:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 33
    .line 34
    invoke-interface {p2, p4, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    if-eqz p3, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->e:Ljava/util/Set;

    .line 41
    .line 42
    invoke-interface {p1, p4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->i:Ljava/util/Set;

    .line 46
    .line 47
    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_6

    .line 55
    .line 56
    sget-object p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;->DENIED:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 57
    .line 58
    invoke-interface {p2, p4, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    invoke-static {}, Ll/wzx;->k()Z

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    if-eqz p3, :cond_4

    .line 67
    .line 68
    const-string p3, "android.permission.READ_MEDIA_IMAGES"

    .line 69
    .line 70
    invoke-static {p3, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result p3

    .line 74
    if-nez p3, :cond_2

    .line 75
    .line 76
    const-string p3, "android.permission.READ_MEDIA_VIDEO"

    .line 77
    .line 78
    invoke-static {p3, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result p3

    .line 82
    if-eqz p3, :cond_4

    .line 83
    .line 84
    :cond_2
    const-string p3, "android.permission.READ_MEDIA_VISUAL_USER_SELECTED"

    .line 85
    .line 86
    invoke-static {p1, p3}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_3

    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->e:Ljava/util/Set;

    .line 93
    .line 94
    invoke-interface {p1, p4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->i:Ljava/util/Set;

    .line 98
    .line 99
    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-eqz p0, :cond_6

    .line 107
    .line 108
    sget-object p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;->DENIED:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 109
    .line 110
    invoke-interface {p2, p4, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->f:Ljava/util/Set;

    .line 115
    .line 116
    invoke-interface {p1, p4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->j:Ljava/util/Set;

    .line 120
    .line 121
    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    if-eqz p0, :cond_6

    .line 129
    .line 130
    sget-object p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;->DENIED_FOREVER:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 131
    .line 132
    invoke-interface {p2, p4, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_4
    invoke-static {p1, p4}, Ll/v40;->x(Landroid/app/Activity;Ljava/lang/String;)Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    if-eqz p1, :cond_5

    .line 141
    .line 142
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->e:Ljava/util/Set;

    .line 143
    .line 144
    invoke-interface {p1, p4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->i:Ljava/util/Set;

    .line 148
    .line 149
    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    if-eqz p0, :cond_6

    .line 157
    .line 158
    sget-object p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;->DENIED:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 159
    .line 160
    invoke-interface {p2, p4, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->f:Ljava/util/Set;

    .line 165
    .line 166
    invoke-interface {p1, p4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->j:Ljava/util/Set;

    .line 170
    .line 171
    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    if-eqz p0, :cond_6

    .line 179
    .line 180
    sget-object p0, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;->DENIED_FOREVER:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    .line 181
    .line 182
    invoke-interface {p2, p4, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    :cond_6
    return-void
.end method
