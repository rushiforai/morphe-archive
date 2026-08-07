.class public Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/ui/permission/PermissionHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:[Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

.field public c:Ll/j6e;

.field public d:Ll/k6e;

.field public e:Ll/l6e;

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:Z

.field public j:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    new-array v1, v0, [Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->a:[Ljava/lang/String;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->c:Ll/j6e;

    .line 13
    .line 14
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->d:Ll/k6e;

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->e:Ll/l6e;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    iput-boolean v1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->f:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->g:Z

    .line 22
    .line 23
    iput-boolean v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->h:Z

    .line 24
    .line 25
    iput-boolean v1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i:Z

    .line 26
    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j:I

    .line 28
    .line 29
    return-void
.end method

.method public synthetic constructor <init>(Ll/wr60;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;-><init>()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;Landroid/app/Activity;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->f(Landroid/app/Activity;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->e()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/x20;Ll/y20;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-interface {p1, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_1
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;Landroid/app/Activity;Ljava/util/List;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->h(Landroid/app/Activity;Ljava/util/List;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method


# virtual methods
.method public final synthetic e()Ljava/lang/Boolean;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->a:[Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

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

.method public final synthetic f(Landroid/app/Activity;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x1

    .line 6
    if-nez p2, :cond_2

    .line 7
    .line 8
    invoke-static {}, Ll/uc60;->g()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    const/16 v1, 0x17

    .line 13
    .line 14
    if-ge p2, v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->a:[Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->g([Ljava/lang/String;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;->Null:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 31
    .line 32
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->h(Landroid/app/Activity;Ljava/util/List;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_3

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

    .line 45
    .line 46
    sget-object p1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;->Null:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 47
    .line 48
    invoke-interface {p0, v0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;->a(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    :goto_1
    return-void
.end method

.method public final g([Ljava/lang/String;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/as60;->c:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    array-length v1, p1

    .line 13
    const/4 v2, 0x0

    .line 14
    :goto_0
    if-ge v2, v1, :cond_3

    .line 15
    .line 16
    aget-object v3, p1, v2

    .line 17
    .line 18
    new-instance v4, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    if-eqz v6, :cond_1

    .line 32
    .line 33
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    check-cast v6, Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v6, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v7

    .line 43
    if-eqz v7, :cond_0

    .line 44
    .line 45
    move-object v4, v6

    .line 46
    :cond_1
    invoke-interface {p0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    check-cast v5, Ljava/util/List;

    .line 51
    .line 52
    if-nez v5, :cond_2

    .line 53
    .line 54
    new-instance v5, Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .line 58
    .line 59
    :cond_2
    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    invoke-interface {p0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    add-int/lit8 v2, v2, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    new-instance p1, Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-direct {p1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 75
    .line 76
    .line 77
    return-object p1
.end method

.method public final h(Landroid/app/Activity;Ljava/util/List;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 11
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;Z",
            "Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p3, :cond_5

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    const/4 p3, 0x0

    .line 12
    invoke-interface {p2, p3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p4

    .line 16
    check-cast p4, Ljava/util/List;

    .line 17
    .line 18
    new-array v0, p3, [Ljava/lang/String;

    .line 19
    .line 20
    invoke-interface {p4, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    check-cast p4, [Ljava/lang/String;

    .line 25
    .line 26
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 27
    .line 28
    const/16 v1, 0x21

    .line 29
    .line 30
    if-ne v0, v1, :cond_4

    .line 31
    .line 32
    new-instance v0, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-static {p4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object p4

    .line 38
    invoke-direct {v0, p4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 39
    .line 40
    .line 41
    const-string p4, "android.permission.READ_EXTERNAL_STORAGE"

    .line 42
    .line 43
    invoke-interface {v0, p4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    const-string v2, "android.permission.READ_MEDIA_VIDEO"

    .line 48
    .line 49
    const-string v3, "android.permission.READ_MEDIA_IMAGES"

    .line 50
    .line 51
    const-string v4, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 52
    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    invoke-interface {v0, p4}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    invoke-interface {v0, v4}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    invoke-interface {v0, p4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_2

    .line 79
    .line 80
    invoke-interface {v0, p4}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p4

    .line 94
    if-eqz p4, :cond_3

    .line 95
    .line 96
    invoke-interface {v0, v4}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    :cond_3
    :goto_0
    new-array p3, p3, [Ljava/lang/String;

    .line 106
    .line 107
    invoke-interface {v0, p3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    move-object p4, p3

    .line 112
    check-cast p4, [Ljava/lang/String;

    .line 113
    .line 114
    :cond_4
    move-object v0, p4

    .line 115
    new-instance v1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a$a;

    .line 116
    .line 117
    invoke-direct {v1, p0, p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a$a;-><init>(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;Landroid/app/Activity;Ljava/util/List;)V

    .line 118
    .line 119
    .line 120
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->c:Ll/j6e;

    .line 121
    .line 122
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->d:Ll/k6e;

    .line 123
    .line 124
    iget-object v4, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->e:Ll/l6e;

    .line 125
    .line 126
    iget-boolean v5, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->f:Z

    .line 127
    .line 128
    iget-boolean v6, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->g:Z

    .line 129
    .line 130
    iget-boolean v7, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->h:Z

    .line 131
    .line 132
    iget-boolean v8, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i:Z

    .line 133
    .line 134
    iget v9, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j:I

    .line 135
    .line 136
    const/4 v10, 0x0

    .line 137
    invoke-static/range {v0 .. v10}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->t([Ljava/lang/String;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;Ll/j6e;Ll/k6e;Ll/l6e;ZZZZILcom/p1/mobile/putong/ui/permission/PermissionHelper$c;)Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->u(Landroid/app/FragmentManager;)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_5
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

    .line 150
    .line 151
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-eqz p1, :cond_6

    .line 156
    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

    .line 158
    .line 159
    invoke-interface {p0, p3, p4}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;->a(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 160
    .line 161
    .line 162
    :cond_6
    return-void
.end method

.method public i(Landroid/app/Activity;)V
    .locals 2
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/ur60;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ur60;-><init>(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/vr60;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1}, Ll/vr60;-><init>(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;Landroid/app/Activity;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->f:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x20;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;",
            ">;)",
            "Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance v0, Ll/tr60;

    .line 10
    .line 11
    invoke-direct {v0, p1, p2}, Ll/tr60;-><init>(Ll/x20;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

    .line 15
    .line 16
    return-object p0
.end method

.method public n(Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;",
            ">;)",
            "Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public p(Ll/j6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->c:Ll/j6e;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Ljava/util/List;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    new-array p1, v0, [Ljava/lang/String;

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    new-array v0, v0, [Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, [Ljava/lang/String;

    .line 14
    .line 15
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->a:[Ljava/lang/String;

    .line 16
    .line 17
    return-object p0
.end method

.method public varargs r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    new-array p1, p1, [Ljava/lang/String;

    .line 5
    .line 6
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->a:[Ljava/lang/String;

    .line 7
    .line 8
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$c;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;
    .locals 0

    .line 1
    return-object p0
.end method

.method public t(Ll/k6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->d:Ll/k6e;

    .line 2
    .line 3
    return-object p0
.end method

.method public u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->h:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public v(Ll/l6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->e:Ll/l6e;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->g:Z

    .line 2
    .line 3
    return-object p0
.end method
