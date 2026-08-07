.class public Ll/wzx;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/app/Activity;

.field public c:Z

.field public d:Z

.field public e:Ll/x20;

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/l6e;

.field public h:Ll/k6e;

.field public i:Ll/j6e;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/wzx;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wzx;->g()V

    return-void
.end method

.method public static synthetic b(Ll/wzx;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wzx;->h(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method

.method public static synthetic c(Ll/wzx;ZZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/wzx;->f(ZZLandroid/view/View;)V

    return-void
.end method

.method public static k()Z
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x22

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    return v0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    return v0
.end method


# virtual methods
.method public d(Landroid/app/Activity;Landroid/view/View;Ll/x20;Ll/y20;Ll/l6e;Ll/k6e;Ll/j6e;)V
    .locals 10
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/x20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ll/l6e;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ll/k6e;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ll/j6e;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Landroid/view/View;",
            "Ll/x20;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;",
            ">;",
            "Ll/l6e;",
            "Ll/k6e;",
            "Ll/j6e;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v3, 0x1

    .line 2
    const/4 v4, 0x1

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v5, p3

    .line 7
    move-object v6, p4

    .line 8
    move-object v7, p5

    .line 9
    move-object/from16 v8, p6

    .line 10
    .line 11
    move-object/from16 v9, p7

    .line 12
    .line 13
    invoke-virtual/range {v0 .. v9}, Ll/wzx;->e(Landroid/app/Activity;Landroid/view/View;ZZLl/x20;Ll/y20;Ll/l6e;Ll/k6e;Ll/j6e;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public e(Landroid/app/Activity;Landroid/view/View;ZZLl/x20;Ll/y20;Ll/l6e;Ll/k6e;Ll/j6e;)V
    .locals 1
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ll/x20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ll/l6e;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Ll/k6e;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Ll/j6e;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Landroid/view/View;",
            "ZZ",
            "Ll/x20;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;",
            ">;",
            "Ll/l6e;",
            "Ll/k6e;",
            "Ll/j6e;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/wzx;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iput-object p1, p0, Ll/wzx;->b:Landroid/app/Activity;

    .line 8
    .line 9
    iput-object p2, p0, Ll/wzx;->a:Landroid/view/View;

    .line 10
    .line 11
    iput-object p5, p0, Ll/wzx;->e:Ll/x20;

    .line 12
    .line 13
    iput-boolean p3, p0, Ll/wzx;->c:Z

    .line 14
    .line 15
    iput-boolean p4, p0, Ll/wzx;->d:Z

    .line 16
    .line 17
    iput-object p6, p0, Ll/wzx;->f:Ll/y20;

    .line 18
    .line 19
    iput-object p7, p0, Ll/wzx;->g:Ll/l6e;

    .line 20
    .line 21
    iput-object p8, p0, Ll/wzx;->h:Ll/k6e;

    .line 22
    .line 23
    iput-object p9, p0, Ll/wzx;->i:Ll/j6e;

    .line 24
    .line 25
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    new-instance p1, Ll/tzx;

    .line 32
    .line 33
    invoke-direct {p1, p0, p4, p3}, Ll/tzx;-><init>(Ll/wzx;ZZ)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    const/4 p1, 0x1

    .line 40
    invoke-virtual {p0, p1}, Ll/wzx;->i(Z)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    const-string p0, "You should not use this here, please check!"

    .line 45
    .line 46
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic f(ZZLandroid/view/View;)V
    .locals 3

    .line 1
    const-string p3, "android.permission.READ_MEDIA_IMAGES"

    .line 2
    .line 3
    const-string v0, "android.permission.READ_MEDIA_VIDEO"

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x2

    .line 12
    new-array p1, p1, [Ljava/lang/String;

    .line 13
    .line 14
    aput-object v0, p1, v2

    .line 15
    .line 16
    aput-object p3, p1, v1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    if-eqz p1, :cond_1

    .line 20
    .line 21
    new-array p1, v1, [Ljava/lang/String;

    .line 22
    .line 23
    aput-object v0, p1, v2

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    if-eqz p2, :cond_2

    .line 27
    .line 28
    new-array p1, v1, [Ljava/lang/String;

    .line 29
    .line 30
    aput-object p3, p1, v2

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    const/4 p1, 0x0

    .line 34
    :goto_0
    invoke-virtual {p0, p1}, Ll/wzx;->j([Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic g()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/wzx;->i(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/wzx;->i(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final i(Z)V
    .locals 8

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x21

    .line 4
    .line 5
    const/16 v2, 0x8

    .line 6
    .line 7
    const-string v3, "android.permission.READ_MEDIA_VIDEO"

    .line 8
    .line 9
    const-string v4, "android.permission.READ_MEDIA_IMAGES"

    .line 10
    .line 11
    if-lt v0, v1, :cond_3

    .line 12
    .line 13
    iget-boolean v1, p0, Ll/wzx;->c:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Ll/wzx;->b:Landroid/app/Activity;

    .line 18
    .line 19
    invoke-static {v1, v4}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_3

    .line 24
    .line 25
    :cond_0
    iget-boolean v1, p0, Ll/wzx;->d:Z

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    iget-object v1, p0, Ll/wzx;->b:Landroid/app/Activity;

    .line 30
    .line 31
    invoke-static {v1, v3}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_3

    .line 36
    .line 37
    :cond_1
    iget-object p1, p0, Ll/wzx;->a:Landroid/view/View;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    iget-object p1, p0, Ll/wzx;->a:Landroid/view/View;

    .line 46
    .line 47
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p0, p0, Ll/wzx;->e:Ll/x20;

    .line 51
    .line 52
    invoke-interface {p0}, Ll/x20;->call()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_3
    const/16 v1, 0x22

    .line 57
    .line 58
    const/4 v5, 0x0

    .line 59
    if-lt v0, v1, :cond_5

    .line 60
    .line 61
    iget-object v6, p0, Ll/wzx;->b:Landroid/app/Activity;

    .line 62
    .line 63
    const-string v7, "android.permission.READ_MEDIA_VISUAL_USER_SELECTED"

    .line 64
    .line 65
    invoke-static {v6, v7}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    if-nez v6, :cond_5

    .line 70
    .line 71
    iget-object p1, p0, Ll/wzx;->a:Landroid/view/View;

    .line 72
    .line 73
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_4

    .line 78
    .line 79
    iget-object p1, p0, Ll/wzx;->a:Landroid/view/View;

    .line 80
    .line 81
    invoke-virtual {p1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    :cond_4
    iget-object p0, p0, Ll/wzx;->e:Ll/x20;

    .line 85
    .line 86
    invoke-interface {p0}, Ll/x20;->call()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_5
    iget-object v6, p0, Ll/wzx;->b:Landroid/app/Activity;

    .line 91
    .line 92
    const-string v7, "android.permission.READ_EXTERNAL_STORAGE"

    .line 93
    .line 94
    invoke-static {v6, v7}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    if-nez v6, :cond_7

    .line 99
    .line 100
    iget-object p1, p0, Ll/wzx;->a:Landroid/view/View;

    .line 101
    .line 102
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-eqz p1, :cond_6

    .line 107
    .line 108
    iget-object p1, p0, Ll/wzx;->a:Landroid/view/View;

    .line 109
    .line 110
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 111
    .line 112
    .line 113
    :cond_6
    iget-object p0, p0, Ll/wzx;->e:Ll/x20;

    .line 114
    .line 115
    invoke-interface {p0}, Ll/x20;->call()V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_7
    iget-object v6, p0, Ll/wzx;->a:Landroid/view/View;

    .line 120
    .line 121
    if-eqz p1, :cond_d

    .line 122
    .line 123
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_8

    .line 128
    .line 129
    iget-object p1, p0, Ll/wzx;->a:Landroid/view/View;

    .line 130
    .line 131
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 132
    .line 133
    .line 134
    :cond_8
    const/4 p1, 0x1

    .line 135
    if-lt v0, v1, :cond_c

    .line 136
    .line 137
    iget-boolean v0, p0, Ll/wzx;->d:Z

    .line 138
    .line 139
    if-eqz v0, :cond_9

    .line 140
    .line 141
    iget-boolean v1, p0, Ll/wzx;->c:Z

    .line 142
    .line 143
    if-eqz v1, :cond_9

    .line 144
    .line 145
    const/4 v0, 0x2

    .line 146
    new-array v0, v0, [Ljava/lang/String;

    .line 147
    .line 148
    aput-object v3, v0, v5

    .line 149
    .line 150
    aput-object v4, v0, p1

    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_9
    if-eqz v0, :cond_a

    .line 154
    .line 155
    new-array v0, p1, [Ljava/lang/String;

    .line 156
    .line 157
    aput-object v3, v0, v5

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_a
    iget-boolean v0, p0, Ll/wzx;->c:Z

    .line 161
    .line 162
    if-eqz v0, :cond_b

    .line 163
    .line 164
    new-array v0, p1, [Ljava/lang/String;

    .line 165
    .line 166
    aput-object v4, v0, v5

    .line 167
    .line 168
    goto :goto_0

    .line 169
    :cond_b
    const/4 v0, 0x0

    .line 170
    goto :goto_0

    .line 171
    :cond_c
    new-array v0, p1, [Ljava/lang/String;

    .line 172
    .line 173
    aput-object v7, v0, v5

    .line 174
    .line 175
    :goto_0
    invoke-virtual {p0, v0}, Ll/wzx;->j([Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :cond_d
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    if-eqz p1, :cond_e

    .line 184
    .line 185
    iget-object p1, p0, Ll/wzx;->a:Landroid/view/View;

    .line 186
    .line 187
    invoke-virtual {p1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 188
    .line 189
    .line 190
    :cond_e
    iget-object p0, p0, Ll/wzx;->f:Ll/y20;

    .line 191
    .line 192
    if-eqz p0, :cond_f

    .line 193
    .line 194
    sget-object p1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;->PermissionCancelForRequest:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 195
    .line 196
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 197
    .line 198
    .line 199
    :cond_f
    return-void
.end method

.method public final varargs j([Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/uzx;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/uzx;-><init>(Ll/wzx;)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/vzx;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/vzx;-><init>(Ll/wzx;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object v0, p0, Ll/wzx;->i:Ll/j6e;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->p(Ll/j6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object v0, p0, Ll/wzx;->h:Ll/k6e;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->t(Ll/k6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object v0, p0, Ll/wzx;->g:Ll/l6e;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->v(Ll/l6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object p0, p0, Ll/wzx;->b:Landroid/app/Activity;

    .line 51
    .line 52
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
