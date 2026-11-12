.class public final Lvzk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv97;
.implements Lzun;
.implements Llii;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 4

    sparse-switch p1, :sswitch_data_68

    new-instance p1, Lhg;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lhg;-><init>(B)V

    invoke-static {p1}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lvzk;->b:Ljava/lang/Object;

    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lvzk;->c:Ljava/lang/Object;

    iput-object p1, p0, Lvzk;->a:Ljava/lang/Object;

    new-instance v0, Lig;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lig;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :sswitch_2a
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lvzk;->a:Ljava/lang/Object;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lvzk;->b:Ljava/lang/Object;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lvzk;->c:Ljava/lang/Object;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lvzk;->d:Ljava/lang/Object;

    return-void

    :sswitch_4a
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lvzk;->a:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lvzk;->b:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lvzk;->c:Ljava/lang/Object;

    sget-object p1, Lfd7;->p:Ljava/util/LinkedHashSet;

    iput-object p1, p0, Lvzk;->d:Ljava/lang/Object;

    return-void

    nop

    :sswitch_data_68
    .sparse-switch
        0x17 -> :sswitch_4a
        0x1d -> :sswitch_2a
    .end sparse-switch
.end method

.method public constructor <init>(Landroid/widget/ImageView;Ld06;)V
    .registers 3

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iput-object p1, p0, Lvzk;->a:Ljava/lang/Object;

    .line 113
    iput-object p2, p0, Lvzk;->b:Ljava/lang/Object;

    .line 114
    invoke-virtual {p2, p1}, Ld06;->m(Landroid/widget/ImageView;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    .line 110
    iput-object p1, p0, Lvzk;->a:Ljava/lang/Object;

    iput-object p2, p0, Lvzk;->b:Ljava/lang/Object;

    iput-object p3, p0, Lvzk;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 104
    iput-object p1, p0, Lvzk;->a:Ljava/lang/Object;

    iput-object p2, p0, Lvzk;->b:Ljava/lang/Object;

    iput-object p3, p0, Lvzk;->c:Ljava/lang/Object;

    iput-object p4, p0, Lvzk;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Ltm2;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 149
    iput-object p1, p0, Lvzk;->a:Ljava/lang/Object;

    .line 150
    iput-object p2, p0, Lvzk;->b:Ljava/lang/Object;

    .line 151
    iput-object p3, p0, Lvzk;->d:Ljava/lang/Object;

    .line 152
    iput-object p4, p0, Lvzk;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lnpd;)V
    .registers 4

    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 129
    new-instance v0, Landroidx/collection/ArrayMap;

    const/4 v1, 0x0

    .line 130
    invoke-direct {v0, v1}, Lhkj;-><init>(I)V

    .line 131
    iput-object v0, p0, Lvzk;->b:Ljava/lang/Object;

    .line 132
    new-instance v0, Landroidx/collection/ArrayMap;

    .line 133
    invoke-direct {v0, v1}, Lhkj;-><init>(I)V

    .line 134
    iput-object v0, p0, Lvzk;->c:Ljava/lang/Object;

    .line 135
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    .line 136
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lvzk;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lr2j;)V
    .registers 4

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    new-instance v0, Ljava/util/HashMap;

    .line 117
    iget-object v1, p1, Lr2j;->a:Ljava/util/HashMap;

    .line 118
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    .line 119
    new-instance v0, Ljava/util/HashMap;

    .line 120
    iget-object v1, p1, Lr2j;->b:Ljava/util/HashMap;

    .line 121
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lvzk;->b:Ljava/lang/Object;

    .line 122
    new-instance v0, Ljava/util/HashMap;

    .line 123
    iget-object v1, p1, Lr2j;->c:Ljava/util/HashMap;

    .line 124
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lvzk;->c:Ljava/lang/Object;

    .line 125
    new-instance v0, Ljava/util/HashMap;

    .line 126
    iget-object p1, p1, Lr2j;->d:Ljava/util/HashMap;

    .line 127
    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lvzk;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lr9g;)V
    .registers 3

    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    .line 139
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lvzk;->b:Ljava/lang/Object;

    .line 140
    new-instance v0, Ly9g;

    invoke-direct {v0}, Ly9g;-><init>()V

    iput-object v0, p0, Lvzk;->c:Ljava/lang/Object;

    .line 141
    iput-object p1, p0, Lvzk;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltif;)V
    .registers 4

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    new-instance v0, Lisd;

    const/16 v1, 0x8

    invoke-direct {v0, p0, v1}, Lisd;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lvzk;->d:Ljava/lang/Object;

    .line 144
    iput-object p1, p0, Lvzk;->a:Ljava/lang/Object;

    .line 145
    new-instance p1, Lii;

    const/16 v0, 0x14

    .line 146
    invoke-direct {p1, v0}, Lii;-><init>(B)V

    .line 147
    iput-object p1, p0, Lvzk;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lwv1;Lesk;Lesk;)V
    .registers 4

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput-object p1, p0, Lvzk;->a:Ljava/lang/Object;

    .line 107
    iput-object p2, p0, Lvzk;->b:Ljava/lang/Object;

    .line 108
    iput-object p3, p0, Lvzk;->c:Ljava/lang/Object;

    .line 109
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lvzk;->d:Ljava/lang/Object;

    return-void
.end method

.method public static X(Le9a;)Lwjh;
    .registers 10

    const-string v0, "X-Opera-Auth-UserEmail"

    iget-object v1, p0, Le9a;->a:[Ljava/lang/String;

    invoke-static {v1, v0}, Lokhttp3/internal/_HeadersCommonKt;->commonHeadersGet([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object p0, p0, Le9a;->a:[Ljava/lang/String;

    const-string v0, "X-Opera-Auth-UserName"

    invoke-static {p0, v0}, Lokhttp3/internal/_HeadersCommonKt;->commonHeadersGet([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "X-Opera-Auth-AuthToken"

    invoke-static {p0, v0}, Lokhttp3/internal/_HeadersCommonKt;->commonHeadersGet([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_34

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_34

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_34

    new-instance v2, Lwjh;

    const-string v7, ""

    const/16 v8, 0x8

    const-string v5, ""

    invoke-direct/range {v2 .. v8}, Lwjh;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v2

    :cond_34
    const/4 p0, 0x0

    return-object p0
.end method

.method public static Y(Lorb;)Lwjh;
    .registers 8

    new-instance v0, Lwjh;

    const-string v1, "token"

    const-string v2, ""

    invoke-virtual {p0, v1, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "username"

    invoke-virtual {p0, v3, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "fullname"

    invoke-virtual {p0, v4, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "email"

    invoke-virtual {p0, v5, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "action"

    invoke-virtual {p0, v6, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 v6, 0x8

    move-object v2, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, p0

    invoke-direct/range {v0 .. v6}, Lwjh;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0
.end method


# virtual methods
.method public final A()Lx79;
    .registers 1

    iget-object p0, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast p0, Lx79;

    return-object p0
.end method

.method public final B(Lnod;)V
    .registers 7

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast v1, Landroidx/collection/ArrayMap;

    invoke-virtual {v1, p1}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwl5;

    if-nez v1, :cond_11

    monitor-exit v0

    return-void

    :cond_11
    iget-object v2, v1, Lwl5;->g:Lcig;

    sget-object v3, Lcig;->b:Lcig;

    iput-object v3, v1, Lwl5;->g:Lcig;

    iget-object v3, v1, Lwl5;->c:Ljava/util/ArrayDeque;

    new-instance v4, Lul5;

    invoke-direct {v4, p0, p1, v2}, Lul5;-><init>(Lvzk;Lnod;Lcig;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    iget-boolean p1, v1, Lwl5;->f:Z

    if-eqz p1, :cond_27

    monitor-exit v0

    return-void

    :cond_27
    const/4 p1, 0x1

    iput-boolean p1, v1, Lwl5;->f:Z

    invoke-virtual {p0, v1}, Lvzk;->z(Lwl5;)V

    monitor-exit v0

    return-void

    :goto_2f
    monitor-exit v0
    :try_end_30
    .catchall {:try_start_3 .. :try_end_30} :catchall_31

    throw p0

    :catchall_31
    move-exception p0

    goto :goto_2f
.end method

.method public final C(Ljava/lang/String;)Ljag;
    .registers 3

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljag;

    monitor-exit v0

    return-object p0

    :goto_f
    monitor-exit v0
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_11

    throw p0

    :catchall_11
    move-exception p0

    goto :goto_f
.end method

.method public final D()Ljava/util/HashMap;
    .registers 11

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_14
    :goto_14
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    new-instance v3, Ljag;

    invoke-direct {v3}, Ljag;-><init>()V

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljag;

    iget-object v4, v4, Ljag;->a:Ljava/util/EnumMap;

    invoke-virtual {v4}, Ljava/util/EnumMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_35
    :goto_35
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Llag;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljag;

    invoke-virtual {v6, v5}, Ljag;->b(Llag;)Ljava/lang/Boolean;

    move-result-object v6

    if-eqz v6, :cond_35

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_35

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljag;

    const/4 v7, 0x0

    invoke-virtual {v6, v5, v7}, Ljag;->a(Llag;Lkag;)Lkag;

    move-result-object v6

    iget-object v7, v3, Ljag;->a:Ljava/util/EnumMap;

    new-instance v8, Liag;

    const/4 v9, 0x1

    invoke-direct {v8, v6, v9}, Liag;-><init>(Lkag;Z)V

    invoke-virtual {v7, v5, v8}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_35

    :cond_6a
    iget-object v4, v3, Ljag;->a:Ljava/util/EnumMap;

    invoke-virtual {v4}, Ljava/util/AbstractMap;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_14

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_14

    :cond_7c
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    monitor-exit v0

    return-object p0

    :goto_83
    monitor-exit v0
    :try_end_84
    .catchall {:try_start_3 .. :try_end_84} :catchall_85

    throw p0

    :catchall_85
    move-exception p0

    goto :goto_83
.end method

.method public final E(Lkag;)Ljava/util/HashSet;
    .registers 8

    sget-object v0, Llag;->g:Llag;

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iget-object v2, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v2

    :try_start_a
    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_16
    :goto_16
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljag;

    sget-object v5, Lkag;->d:Lkag;

    invoke-virtual {v4, v0, v5}, Ljag;->a(Llag;Lkag;)Lkag;

    move-result-object v4

    if-ne v4, p1, :cond_16

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_16

    :cond_3a
    monitor-exit v2

    return-object v1

    :goto_3c
    monitor-exit v2
    :try_end_3d
    .catchall {:try_start_a .. :try_end_3d} :catchall_3e

    throw p0

    :catchall_3e
    move-exception p0

    goto :goto_3c
.end method

.method public final F(Ltun;)V
    .registers 10

    invoke-virtual {p1}, Ltun;->e()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lvzk;->a:Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Lbf9;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_13

    iget-object v0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    :cond_13
    move-object v3, v0

    invoke-virtual {p1}, Ltun;->a()Ljava/lang/String;

    move-result-object v4

    iget-object v0, p0, Lvzk;->c:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    invoke-virtual {p1}, Ltun;->c()Ljava/lang/String;

    move-result-object v6

    iget-object p0, p0, Lvzk;->d:Ljava/lang/Object;

    move-object v7, p0

    check-cast v7, Lcom/opera/api/Callback;

    invoke-static/range {v2 .. v7}, Laib;->I(Lbf9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final G(Lnod;)Lcig;
    .registers 3

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/collection/ArrayMap;

    invoke-virtual {p0, p1}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwl5;

    if-eqz p0, :cond_13

    iget-object p0, p0, Lwl5;->e:Lcig;

    monitor-exit v0

    return-object p0

    :cond_13
    monitor-exit v0

    const/4 p0, 0x0

    return-object p0

    :goto_16
    monitor-exit v0
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_18

    throw p0

    :catchall_18
    move-exception p0

    goto :goto_16
.end method

.method public final H()Lh1b;
    .registers 2

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/collection/ArrayMap;

    invoke-virtual {p0}, Landroidx/collection/ArrayMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-static {p0}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object p0

    monitor-exit v0

    return-object p0

    :goto_11
    monitor-exit v0
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_13

    throw p0

    :catchall_13
    move-exception p0

    goto :goto_11
.end method

.method public final I(Ljava/lang/Object;)Lnod;
    .registers 3

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/collection/ArrayMap;

    invoke-virtual {p0, p1}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnod;

    monitor-exit v0

    return-object p0

    :goto_f
    monitor-exit v0
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_11

    throw p0

    :catchall_11
    move-exception p0

    goto :goto_f
.end method

.method public final declared-synchronized J()Lea7;
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Lea7;

    if-nez v0, :cond_11

    iget-object v0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    invoke-static {v0}, Lea7;->q(Ljava/io/File;)Lea7;

    move-result-object v0

    iput-object v0, p0, Lvzk;->d:Ljava/lang/Object;
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_15

    :cond_11
    monitor-exit p0

    return-object v0

    :goto_13
    :try_start_13
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_15

    throw v0

    :catchall_15
    move-exception v0

    goto :goto_13
.end method

.method public final K()Landroid/view/inputmethod/InputMethodManager;
    .registers 2

    iget-object v0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/ui/base/WindowAndroid;

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Lorg/chromium/ui/base/WindowAndroid;->m()Lb2b;

    move-result-object v0

    if-nez v0, :cond_e

    :cond_c
    const/4 v0, 0x0

    goto :goto_14

    :cond_e
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    :goto_14
    if-nez v0, :cond_1b

    iget-object p0, p0, Lvzk;->a:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    :cond_1b
    const-string p0, "input_method"

    invoke-virtual {v0, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    return-object p0
.end method

.method public final L(Z)I
    .registers 6

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Lb59;

    sget-object v1, Lcom/opera/android/browser/SessionStore;->j:Lcom/opera/android/browser/SessionStore;

    iget-wide v1, v1, Lcom/opera/android/browser/SessionStore;->a:J

    const/4 v3, 0x1

    invoke-static {v1, v2, v3, v0}, LJ/N;->MRAgGFuI(JZLjava/lang/Object;)I

    move-result v0

    if-nez p1, :cond_1e

    iget-object p0, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/SessionStore;

    if-eqz p0, :cond_1e

    iget-wide v1, p0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v1, v2, v0}, LJ/N;->MxPNalBp(JI)V

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1, p1}, Lcom/opera/android/browser/SessionStore;->injectNavigationHistory(III)V

    :cond_1e
    return v0
.end method

.method public final M(Lnod;)Lrhg;
    .registers 3

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/collection/ArrayMap;

    invoke-virtual {p0, p1}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwl5;

    const/4 p1, 0x0

    if-eqz p0, :cond_12

    monitor-exit v0

    return-object p1

    :cond_12
    monitor-exit v0

    return-object p1

    :goto_14
    monitor-exit v0
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_16

    throw p0

    :catchall_16
    move-exception p0

    goto :goto_14
.end method

.method public final N(Lnod;)Lijg;
    .registers 3

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/collection/ArrayMap;

    invoke-virtual {p0, p1}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwl5;

    const/4 p1, 0x0

    if-eqz p0, :cond_12

    monitor-exit v0

    return-object p1

    :cond_12
    monitor-exit v0

    return-object p1

    :goto_14
    monitor-exit v0
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_16

    throw p0

    :catchall_16
    move-exception p0

    goto :goto_14
.end method

.method public final O(Lnod;)Lm59;
    .registers 3

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/collection/ArrayMap;

    invoke-virtual {p0, p1}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwl5;

    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_17

    if-eqz p0, :cond_13

    iget-object p0, p0, Lwl5;->b:Lm59;

    return-object p0

    :cond_13
    const/4 p0, 0x0

    return-object p0

    :goto_15
    :try_start_15
    monitor-exit v0
    :try_end_16
    .catchall {:try_start_15 .. :try_end_16} :catchall_17

    throw p0

    :catchall_17
    move-exception p0

    goto :goto_15
.end method

.method public final P(Lw4o;)Ltzk;
    .registers 7

    iget-object v0, p1, Lw4o;->a:Ljava/lang/String;

    iget p1, p1, Lw4o;->b:I

    sget-object v1, Le6i;->i:Ljava/util/TreeMap;

    const/4 v1, 0x2

    const-string v2, "SELECT * FROM SystemIdInfo WHERE work_spec_id=? AND generation=?"

    invoke-static {v1, v2}, Laoh;->e(ILjava/lang/String;)Le6i;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3, v0}, Le6i;->w(ILjava/lang/String;)V

    int-to-long v3, p1

    invoke-virtual {v2, v1, v3, v4}, Le6i;->T0(IJ)V

    iget-object p0, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/work/impl/WorkDatabase_Impl;

    invoke-virtual {p0}, Ly5i;->b()V

    invoke-virtual {p0, v2}, Ly5i;->s(Lssk;)Landroid/database/Cursor;

    move-result-object p0

    :try_start_20
    const-string p1, "work_spec_id"

    invoke-static {p0, p1}, Lmkh;->s(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result p1

    const-string v0, "generation"

    invoke-static {p0, v0}, Lmkh;->s(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    const-string v1, "system_id"

    invoke-static {p0, v1}, Lmkh;->s(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v1

    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_4a

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    new-instance v3, Ltzk;

    invoke-direct {v3, p1, v0, v1}, Ltzk;-><init>(Ljava/lang/String;II)V
    :try_end_49
    .catchall {:try_start_20 .. :try_end_49} :catchall_52

    goto :goto_4b

    :cond_4a
    const/4 v3, 0x0

    :goto_4b
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    invoke-virtual {v2}, Le6i;->release()V

    return-object v3

    :catchall_52
    move-exception p1

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    invoke-virtual {v2}, Le6i;->release()V

    throw p1
.end method

.method public final Q(Ltzk;)V
    .registers 3

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Landroidx/work/impl/WorkDatabase_Impl;

    invoke-virtual {v0}, Ly5i;->b()V

    invoke-virtual {v0}, Ly5i;->c()V

    :try_start_a
    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Lb37;

    invoke-virtual {p0, p1}, Lb37;->p(Ljava/lang/Object;)V

    invoke-virtual {v0}, Ly5i;->v()V
    :try_end_14
    .catchall {:try_start_a .. :try_end_14} :catchall_18

    invoke-virtual {v0}, Ly5i;->p()V

    return-void

    :catchall_18
    move-exception p0

    invoke-virtual {v0}, Ly5i;->p()V

    throw p0
.end method

.method public final R(Landroid/view/View;)Z
    .registers 2

    invoke-virtual {p0}, Lvzk;->K()Landroid/view/inputmethod/InputMethodManager;

    move-result-object p0

    if-eqz p0, :cond_e

    invoke-virtual {p0, p1}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final S(Lnod;)Z
    .registers 3

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/collection/ArrayMap;

    invoke-virtual {p0, p1}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_f

    const/4 p0, 0x1

    goto :goto_10

    :cond_f
    const/4 p0, 0x0

    :goto_10
    monitor-exit v0

    return p0

    :goto_12
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_14

    throw p0

    :catchall_14
    move-exception p0

    goto :goto_12
.end method

.method public final T(Lnod;I)Z
    .registers 5

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast v1, Landroidx/collection/ArrayMap;

    invoke-virtual {v1, p1}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwl5;

    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_36

    iget-object p0, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnpd;

    if-eqz p1, :cond_32

    iget-object p1, p1, Lwl5;->e:Lcig;

    invoke-virtual {p1, p2}, Lcig;->a(I)Z

    move-result p1

    if-eqz p1, :cond_32

    if-eqz p0, :cond_32

    iget-object p0, p0, Lnpd;->t:Lxkg;

    invoke-virtual {p0}, Lxkg;->P()Lcig;

    move-result-object p0

    invoke-virtual {p0, p2}, Lcig;->a(I)Z

    move-result p0

    if-eqz p0, :cond_32

    const/4 p0, 0x1

    return p0

    :cond_32
    const/4 p0, 0x0

    return p0

    :goto_34
    :try_start_34
    monitor-exit v0
    :try_end_35
    .catchall {:try_start_34 .. :try_end_35} :catchall_36

    throw p0

    :catchall_36
    move-exception p0

    goto :goto_34
.end method

.method public final U(Lnod;I)Z
    .registers 6

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/collection/ArrayMap;

    invoke-virtual {p0, p1}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwl5;

    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_3b

    const/4 p1, 0x0

    if-eqz p0, :cond_38

    iget-object p0, p0, Lwl5;->d:Lo3j;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x1

    if-eqz p2, :cond_1b

    move v1, v0

    goto :goto_1c

    :cond_1b
    move v1, p1

    :goto_1c
    const-string v2, "Use contains(Command) for custom command"

    invoke-static {v2, v1}, Lz4o;->v(Ljava/lang/String;Z)V

    iget-object p0, p0, Lo3j;->a:Lu1b;

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_27
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_38

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ln3j;

    iget v1, v1, Ln3j;->a:I

    if-ne v1, p2, :cond_27

    return v0

    :cond_38
    return p1

    :goto_39
    :try_start_39
    monitor-exit v0
    :try_end_3a
    .catchall {:try_start_39 .. :try_end_3a} :catchall_3b

    throw p0

    :catchall_3b
    move-exception p0

    goto :goto_39
.end method

.method public final V(Lnod;Ln3j;)Z
    .registers 4

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/collection/ArrayMap;

    invoke-virtual {p0, p1}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwl5;

    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_2b

    if-eqz p0, :cond_27

    iget-object p0, p0, Lwl5;->d:Lo3j;

    iget-object p0, p0, Lo3j;->a:Lu1b;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p2}, Lx0b;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    iget-object p0, p2, Ln3j;->b:Ljava/lang/String;

    invoke-static {p0}, Lvb5;->k(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_27

    :cond_25
    const/4 p0, 0x1

    return p0

    :cond_27
    const/4 p0, 0x0

    return p0

    :goto_29
    :try_start_29
    monitor-exit v0
    :try_end_2a
    .catchall {:try_start_29 .. :try_end_2a} :catchall_2b

    throw p0

    :catchall_2b
    move-exception p0

    goto :goto_29
.end method

.method public final W(Lvi2;Llv5;Ltvh;)V
    .registers 6

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Ltif;

    const/4 v1, 0x0

    iput-object v1, p0, Lvzk;->c:Ljava/lang/Object;

    if-eqz p1, :cond_17

    if-eqz p2, :cond_13

    iget p0, p1, Lvi2;->c:I

    const/4 p3, -0x1

    if-ne p0, p3, :cond_13

    invoke-virtual {p2, v1}, Llv5;->a(Lqlk;)V

    :cond_13
    invoke-interface {v0, p1}, Ltif;->y(Lvi2;)V

    return-void

    :cond_17
    if-eqz p3, :cond_1d

    invoke-interface {v0, p3}, Ltif;->v(Ltvh;)V

    return-void

    :cond_1d
    invoke-interface {v0}, Ltif;->b()V

    return-void
.end method

.method public final Z(Lnod;)V
    .registers 6

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast v1, Landroidx/collection/ArrayMap;

    invoke-virtual {v1, p1}, Lhkj;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwl5;

    if-nez v1, :cond_11

    monitor-exit v0

    return-void

    :cond_11
    iget-object v2, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Landroidx/collection/ArrayMap;

    iget-object v3, v1, Lwl5;->a:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Lhkj;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_40

    iget-object v0, v1, Lwl5;->b:Lm59;

    invoke-virtual {v0}, Lm59;->k()V

    iget-object p0, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnpd;

    if-eqz p0, :cond_3d

    invoke-virtual {p0}, Lnpd;->i()Z

    move-result v0

    if-nez v0, :cond_3d

    iget-object v0, p0, Lnpd;->l:Landroid/os/Handler;

    new-instance v1, Ltl5;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Ltl5;-><init>(Lnpd;Lnod;B)V

    invoke-static {v0, v1}, Ltym;->S(Landroid/os/Handler;Ljava/lang/Runnable;)V

    :cond_3d
    return-void

    :goto_3e
    :try_start_3e
    monitor-exit v0
    :try_end_3f
    .catchall {:try_start_3e .. :try_end_3f} :catchall_40

    throw p0

    :catchall_40
    move-exception p0

    goto :goto_3e
.end method

.method public final a()Z
    .registers 1

    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ljii;

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final a0(Ltvh;Ljava/lang/String;)V
    .registers 11

    iget-object v0, p1, Ltvh;->b:Ljava/util/ArrayList;

    new-instance v1, Llyf;

    const-string v2, "X-Mobile-Client"

    const-string v3, "ofa"

    invoke-direct {v1, v2, v3}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Llyf;

    const-string v2, "Accept"

    const-string v3, "application/json"

    invoke-direct {v1, v2, v3}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v1, Lcom/opera/android/browser/chromium/OperaBrowserContext;->b:Lj4c;

    invoke-static {}, LJ/N;->MDAibNnc()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    new-instance v2, Llyf;

    const-string v3, "Accept-Language"

    invoke-direct {v2, v3, v1}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Li16;

    iget-object v2, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Lii;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lt9f;

    new-instance v3, Lfvh;

    invoke-direct {v3}, Lfvh;-><init>()V

    iget-object v4, p1, Ltvh;->a:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lfvh;->h(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :goto_47
    if-ge v5, v4, :cond_5d

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Llyf;

    iget-object v7, v6, Llyf;->a:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    iget-object v6, v6, Llyf;->b:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v3, v7, v6}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_47

    :cond_5d
    iget-object v0, p1, Ltvh;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6c

    invoke-virtual {p1}, Ltvh;->a()Llj9;

    move-result-object v0

    invoke-virtual {v3, v0}, Lfvh;->f(Lrvh;)V

    :cond_6c
    invoke-static {v3, v2}, Lj7c;->q(Lfvh;Lt9f;)Lokhttp3/internal/connection/RealCall;

    move-result-object v0

    const/16 v2, 0x1c

    invoke-direct {v1, v0, p1, p2, v2}, Li16;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, p0, Lvzk;->c:Ljava/lang/Object;

    iget-object p0, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast p0, Lisd;

    invoke-interface {v0, p0}, Lv84;->enqueue(Lf94;)V

    return-void
.end method

.method public final b()Z
    .registers 2

    iget-object v0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Ljii;

    iget-object v0, v0, Ljii;->o:Landroid/widget/ViewSwitcher;

    invoke-virtual {v0}, Landroid/widget/ViewAnimator;->getCurrentView()Landroid/view/View;

    move-result-object v0

    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ljii;

    iget-object p0, p0, Ljii;->m:Landroid/widget/LinearLayout;

    if-ne v0, p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final b0(Ljava/util/Map;)V
    .registers 4

    iget-object v0, p0, Lvzk;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    new-instance v1, Lpw1;

    invoke-direct {v1, p1}, Lpw1;-><init>(Ljava/util/Map;)V

    iput-object v1, p0, Lvzk;->d:Ljava/lang/Object;

    monitor-exit v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_21

    iget-object p1, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast p1, Lumi;

    new-instance v0, Lc4;

    const/16 v1, 0x1b

    invoke-direct {v0, p0, v1}, Lc4;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :goto_1f
    :try_start_1f
    monitor-exit v0
    :try_end_20
    .catchall {:try_start_1f .. :try_end_20} :catchall_21

    throw p0

    :catchall_21
    move-exception p0

    goto :goto_1f
.end method

.method public final c(Lhub;)Ljava/io/File;
    .registers 5

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Livg;

    invoke-virtual {v0, p1}, Livg;->A(Lhub;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "DiskLruCacheWrapper"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    :cond_14
    :try_start_14
    invoke-virtual {p0}, Lvzk;->J()Lea7;

    move-result-object p0

    invoke-virtual {p0, v0}, Lea7;->o(Ljava/lang/String;)Lqq6;

    move-result-object p0

    if-eqz p0, :cond_26

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, [Ljava/io/File;

    const/4 p1, 0x0

    aget-object p0, p0, p1
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_25} :catch_26

    return-object p0

    :catch_26
    :cond_26
    const/4 p0, 0x0

    return-object p0
.end method

.method public final c0(I)V
    .registers 3

    const/16 v0, 0xc

    if-eq p1, v0, :cond_1c

    const/16 v0, 0x10

    if-eq p1, v0, :cond_1c

    new-instance p0, Ljava/security/GeneralSecurityException;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "Invalid IV size in bytes %d; acceptable values have 12 or 16 bytes"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1c
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lvzk;->b:Ljava/lang/Object;

    return-void
.end method

.method public final declared-synchronized d(Ls38;Lt38;)V
    .registers 5

    monitor-enter p0

    :try_start_1
    new-instance v0, Ljg;

    iget-object v1, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0, p1, p2, v1}, Ljg;-><init>(Ls38;Lt38;Ljava/lang/ref/ReferenceQueue;)V

    iget-object p2, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p2, Ljava/util/HashMap;

    invoke-virtual {p2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljg;

    if-eqz p1, :cond_1c

    const/4 p2, 0x0

    iput-object p2, p1, Ljg;->c:Lkyh;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->clear()V
    :try_end_1c
    .catchall {:try_start_1 .. :try_end_1c} :catchall_20

    :cond_1c
    monitor-exit p0

    return-void

    :goto_1e
    :try_start_1e
    monitor-exit p0
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_20

    throw p1

    :catchall_20
    move-exception p1

    goto :goto_1e
.end method

.method public final d0(I)V
    .registers 3

    const/16 v0, 0x10

    if-eq p1, v0, :cond_20

    const/16 v0, 0x18

    if-eq p1, v0, :cond_20

    const/16 v0, 0x20

    if-eq p1, v0, :cond_20

    new-instance p0, Ljava/security/InvalidAlgorithmParameterException;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "Invalid key size %d; only 16-byte, 24-byte and 32-byte AES keys are supported"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_20
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lvzk;->a:Ljava/lang/Object;

    return-void
.end method

.method public final destroy()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lvzk;->c:Ljava/lang/Object;

    iput-object v0, p0, Lvzk;->b:Ljava/lang/Object;

    return-void
.end method

.method public final e(Ljava/lang/Object;Lnod;Lo3j;Lcig;)V
    .registers 8

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-virtual {p0, p1}, Lvzk;->I(Ljava/lang/Object;)Lnod;

    move-result-object v1

    if-nez v1, :cond_22

    iget-object v1, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast v1, Landroidx/collection/ArrayMap;

    invoke-virtual {v1, p1, p2}, Lhkj;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/collection/ArrayMap;

    new-instance v1, Lwl5;

    new-instance v2, Lm59;

    invoke-direct {v2}, Lm59;-><init>()V

    invoke-direct {v1, p1, v2, p3, p4}, Lwl5;-><init>(Ljava/lang/Object;Lm59;Lo3j;Lcig;)V

    invoke-virtual {p0, p2, v1}, Lhkj;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_33

    :cond_22
    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/collection/ArrayMap;

    invoke-virtual {p0, v1}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwl5;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p3, p0, Lwl5;->d:Lo3j;

    iput-object p4, p0, Lwl5;->e:Lcig;

    :goto_33
    monitor-exit v0

    return-void

    :goto_35
    monitor-exit v0
    :try_end_36
    .catchall {:try_start_3 .. :try_end_36} :catchall_37

    throw p0

    :catchall_37
    move-exception p0

    goto :goto_35
.end method

.method public final e0()V
    .registers 2

    const/16 v0, 0x10

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lvzk;->c:Ljava/lang/Object;

    return-void
.end method

.method public final f(Z)V
    .registers 8

    iget-object p1, p0, Lvzk;->a:Ljava/lang/Object;

    move-object v0, p1

    check-cast v0, Lbf9;

    iget-object p1, p0, Lvzk;->b:Ljava/lang/Object;

    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    iget-object p1, p0, Lvzk;->c:Ljava/lang/Object;

    move-object v3, p1

    check-cast v3, Ljava/lang/String;

    iget-object p0, p0, Lvzk;->d:Ljava/lang/Object;

    move-object v5, p0

    check-cast v5, Lcom/opera/api/Callback;

    const/4 v2, 0x0

    const/4 v4, 0x0

    invoke-static/range {v0 .. v5}, Laib;->I(Lbf9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final f0(Ljava/lang/String;Llag;Lkag;Z)Z
    .registers 7

    iget-object v0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljag;

    if-nez v1, :cond_14

    new-instance v1, Ljag;

    invoke-direct {v1}, Ljag;-><init>()V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_14
    const/4 v0, 0x0

    invoke-virtual {v1, p2, v0}, Ljag;->a(Llag;Lkag;)Lkag;

    move-result-object v0

    if-ne v0, p3, :cond_29

    invoke-virtual {v1, p2}, Ljag;->b(Llag;)Ljava/lang/Boolean;

    move-result-object p0

    if-eqz p0, :cond_2c

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-ne p4, p0, :cond_2c

    const/4 p0, 0x0

    return p0

    :cond_29
    invoke-virtual {p0, p1, p2, p3}, Lvzk;->g0(Ljava/lang/String;Llag;Lkag;)V

    :cond_2c
    iget-object p0, v1, Ljag;->a:Ljava/util/EnumMap;

    new-instance p1, Liag;

    invoke-direct {p1, p3, p4}, Liag;-><init>(Lkag;Z)V

    invoke-virtual {p0, p2, p1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x1

    return p0
.end method

.method public final g(Z)V
    .registers 3

    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ljii;

    const/4 v0, 0x1

    if-eqz p1, :cond_d

    iget-object p0, p0, Ljii;->p:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p0, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->h(Z)V

    return-void

    :cond_d
    iget-object p0, p0, Ljii;->p:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p0, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->f(Z)V

    return-void
.end method

.method public final g0(Ljava/lang/String;Llag;Lkag;)V
    .registers 7

    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Ly9g;

    new-instance v0, Lw9g;

    invoke-direct {v0, p1, p2}, Lw9g;-><init>(Ljava/lang/String;Llag;)V

    iget-object p0, p0, Ly9g;->b:Lnce;

    iget-object p1, p0, Lnce;->e:Ljava/util/Map;

    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_44

    invoke-virtual {p0, v0}, Lnce;->t(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_44

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 v0, 0x0

    :cond_27
    :goto_27
    if-ge v0, p2, :cond_44

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    check-cast v1, Lx9g;

    move-object v2, p0

    check-cast v2, Lr5;

    invoke-virtual {v2, v1}, Lr5;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27

    iget-object v1, v1, Lx9g;->b:Lb94;

    filled-new-array {p3}, [Lkag;

    move-result-object v2

    invoke-virtual {v1, v2}, Lb94;->run(Ljava/lang/Object;)V

    goto :goto_27

    :cond_44
    return-void
.end method

.method public final h(Ldy;)V
    .registers 2

    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final h0()V
    .registers 9

    iget-object v0, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Lode;

    new-instance v1, Lbwi;

    iget-object v2, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast v2, Lydn;

    iget-object v3, v2, Lydn;->d:Lvdn;

    iget-boolean v3, v3, Lvdn;->a:Z

    iget-object v2, v2, Lydn;->c:Lgfn;

    invoke-interface {v2}, Lgfn;->isEnabled()Z

    move-result v2

    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Lwc7;

    iget-object v4, p0, Lwc7;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v5, "dns_over_https_enabled"

    invoke-virtual {v4, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    iget-object p0, p0, Lwc7;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->l()Ll7j;

    move-result-object v5

    const-string v6, "dns_over_https_custom_server_template"

    invoke-virtual {p0, v6}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move v7, v3

    move v3, v2

    move v2, v7

    invoke-direct/range {v1 .. v6}, Lbwi;-><init>(ZZZLl7j;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final i()V
    .registers 3

    iget-object v0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Ljii;

    iget-object v0, v0, Ljii;->o:Landroid/widget/ViewSwitcher;

    invoke-virtual {v0}, Landroid/widget/ViewAnimator;->getCurrentView()Landroid/view/View;

    move-result-object v0

    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ljii;

    iget-object v1, p0, Ljii;->m:Landroid/widget/LinearLayout;

    if-eq v0, v1, :cond_17

    iget-object p0, p0, Ljii;->o:Landroid/widget/ViewSwitcher;

    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->showNext()V

    :cond_17
    return-void
.end method

.method public final i0()V
    .registers 10

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Lru9;

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, p0, Lvzk;->d:Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Ljava/util/ArrayList;

    const/4 v7, 0x0

    const/16 v8, 0x3e

    const-string v3, ","

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v8}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v1

    iget-object v3, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v3, Landroid/content/SharedPreferences$Editor;

    const-string v4, "wallpaper.favorites.list"

    invoke-interface {v3, v4, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    iget-object v0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Lonn;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    iget-object v0, v0, Lonn;->d:Lx5f;

    check-cast v1, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {v1, v4}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_40
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_65

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "FILE_storefront_wallpaper_"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_57

    const-string v4, "store-wallpaper"

    goto :goto_61

    :cond_57
    const-string v5, "FILE_user_wallpaper_"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_61

    const-string v4, "user-wallpaper"

    :cond_61
    :goto_61
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_40

    :cond_65
    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_7f

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v5, 0x45

    const/4 v6, 0x1

    invoke-virtual {v1, v5, v6, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v4}, Lx5f;->U0(Lx56;)V

    :cond_7f
    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0, v2}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final j(Lhub;Ll45;)V
    .registers 9

    const-string v0, "Had two simultaneous puts for: "

    iget-object v1, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast v1, Livg;

    invoke-virtual {v1, p1}, Livg;->A(Lhub;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast v2, Lesg;

    monitor-enter v2

    :try_start_f
    iget-object v3, v2, Lesg;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lx97;

    if-nez v3, :cond_42

    iget-object v3, v2, Lesg;->c:Ljava/lang/Object;

    check-cast v3, Leq6;

    iget-object v4, v3, Leq6;->a:Ljava/lang/Object;

    check-cast v4, Ljava/util/ArrayDeque;

    monitor-enter v4
    :try_end_24
    .catchall {:try_start_f .. :try_end_24} :catchall_b5

    :try_start_24
    iget-object v3, v3, Leq6;->a:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lx97;

    monitor-exit v4
    :try_end_2f
    .catchall {:try_start_24 .. :try_end_2f} :catchall_40

    if-nez v3, :cond_36

    :try_start_31
    new-instance v3, Lx97;

    invoke-direct {v3}, Lx97;-><init>()V

    :cond_36
    iget-object v4, v2, Lesg;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashMap;

    invoke-virtual {v4, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3d
    .catchall {:try_start_31 .. :try_end_3d} :catchall_b5

    goto :goto_42

    :goto_3e
    :try_start_3e
    monitor-exit v4
    :try_end_3f
    .catchall {:try_start_3e .. :try_end_3f} :catchall_40

    :try_start_3f
    throw p0

    :catchall_40
    move-exception p0

    goto :goto_3e

    :cond_42
    :goto_42
    iget v4, v3, Lx97;->b:I

    const/4 v5, 0x1

    add-int/2addr v4, v5

    iput v4, v3, Lx97;->b:I

    monitor-exit v2
    :try_end_49
    .catchall {:try_start_3f .. :try_end_49} :catchall_b5

    iget-object v2, v3, Lx97;->a:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_4e
    const-string v2, "DiskLruCacheWrapper"

    const/4 v3, 0x2

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_5a

    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_5a
    .catchall {:try_start_4e .. :try_end_5a} :catchall_aa

    :cond_5a
    :try_start_5a
    invoke-virtual {p0}, Lvzk;->J()Lea7;

    move-result-object p1

    invoke-virtual {p1, v1}, Lea7;->o(Ljava/lang/String;)Lqq6;

    move-result-object v2

    if-nez v2, :cond_a2

    invoke-virtual {p1, v1}, Lea7;->m(Ljava/lang/String;)Ltn;

    move-result-object p1
    :try_end_68
    .catch Ljava/io/IOException; {:try_start_5a .. :try_end_68} :catch_a2
    .catchall {:try_start_5a .. :try_end_68} :catchall_aa

    if-eqz p1, :cond_98

    :try_start_6a
    invoke-virtual {p1}, Ltn;->z()Ljava/io/File;

    move-result-object v0

    iget-object v2, p2, Ll45;->a:Ljava/lang/Object;

    check-cast v2, Lu18;

    iget-object v3, p2, Ll45;->b:Ljava/lang/Object;

    iget-object p2, p2, Ll45;->c:Ljava/lang/Object;

    check-cast p2, Ltrf;

    invoke-interface {v2, v3, v0, p2}, Lu18;->l(Ljava/lang/Object;Ljava/io/File;Ltrf;)Z

    move-result p2

    if-eqz p2, :cond_87

    iget-object p2, p1, Ltn;->d:Ljava/lang/Object;

    check-cast p2, Lea7;

    invoke-virtual {p2, p1, v5}, Lea7;->k(Ltn;Z)V

    iput-boolean v5, p1, Ltn;->a:Z
    :try_end_87
    .catchall {:try_start_6a .. :try_end_87} :catchall_8f

    :cond_87
    :try_start_87
    iget-boolean p2, p1, Ltn;->a:Z

    if-nez p2, :cond_a2

    invoke-virtual {p1}, Ltn;->g()V

    goto :goto_a2

    :catchall_8f
    move-exception p2

    iget-boolean v0, p1, Ltn;->a:Z
    :try_end_92
    .catch Ljava/io/IOException; {:try_start_87 .. :try_end_92} :catch_a2
    .catchall {:try_start_87 .. :try_end_92} :catchall_aa

    if-nez v0, :cond_97

    :try_start_94
    invoke-virtual {p1}, Ltn;->g()V
    :try_end_97
    .catch Ljava/io/IOException; {:try_start_94 .. :try_end_97} :catch_97
    .catchall {:try_start_94 .. :try_end_97} :catchall_aa

    :catch_97
    :cond_97
    :try_start_97
    throw p2

    :cond_98
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_a2
    .catch Ljava/io/IOException; {:try_start_97 .. :try_end_a2} :catch_a2
    .catchall {:try_start_97 .. :try_end_a2} :catchall_aa

    :catch_a2
    :cond_a2
    :goto_a2
    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Lesg;

    invoke-virtual {p0, v1}, Lesg;->C(Ljava/lang/String;)V

    return-void

    :catchall_aa
    move-exception p1

    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Lesg;

    invoke-virtual {p0, v1}, Lesg;->C(Ljava/lang/String;)V

    throw p1

    :goto_b3
    :try_start_b3
    monitor-exit v2
    :try_end_b4
    .catchall {:try_start_b3 .. :try_end_b4} :catchall_b5

    throw p0

    :catchall_b5
    move-exception p0

    goto :goto_b3
.end method

.method public final k(Lnod;ILvl5;)V
    .registers 11

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/collection/ArrayMap;

    invoke-virtual {p0, p1}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwl5;

    if-eqz p0, :cond_52

    iget-object p1, p0, Lwl5;->g:Lcig;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Landroid/util/SparseBooleanArray;

    invoke-direct {v1}, Landroid/util/SparseBooleanArray;-><init>()V

    iget-object p1, p1, Lcig;->a:Lw69;

    const/4 v2, 0x0

    move v3, v2

    :goto_1d
    iget-object v4, p1, Lw69;->a:Landroid/util/SparseBooleanArray;

    invoke-virtual {v4}, Landroid/util/SparseBooleanArray;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ge v3, v4, :cond_35

    invoke-virtual {p1, v3}, Lw69;->b(I)I

    move-result v4

    const/4 v6, 0x0

    xor-int/2addr v6, v5

    invoke-static {v6}, Lz4o;->H(Z)V

    invoke-virtual {v1, v4, v5}, Landroid/util/SparseBooleanArray;->append(IZ)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    :cond_35
    const/4 p1, 0x0

    xor-int/2addr p1, v5

    invoke-static {p1}, Lz4o;->H(Z)V

    invoke-virtual {v1, p2, v5}, Landroid/util/SparseBooleanArray;->append(IZ)V

    new-instance p1, Lcig;

    xor-int/2addr v2, v5

    invoke-static {v2}, Lz4o;->H(Z)V

    new-instance p2, Lw69;

    invoke-direct {p2, v1}, Lw69;-><init>(Landroid/util/SparseBooleanArray;)V

    invoke-direct {p1, p2}, Lcig;-><init>(Lw69;)V

    iput-object p1, p0, Lwl5;->g:Lcig;

    iget-object p0, p0, Lwl5;->c:Ljava/util/ArrayDeque;

    invoke-virtual {p0, p3}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    :cond_52
    monitor-exit v0

    return-void

    :goto_54
    monitor-exit v0
    :try_end_55
    .catchall {:try_start_3 .. :try_end_55} :catchall_56

    throw p0

    :catchall_56
    move-exception p0

    goto :goto_54
.end method

.method public final l(I)V
    .registers 2

    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ljii;

    iget-object p0, p0, Ljii;->l:Lcom/google/android/material/progressindicator/LinearProgressIndicator;

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final m()I
    .registers 1

    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ljii;

    iget-object p0, p0, Ljii;->o:Landroid/widget/ViewSwitcher;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    return p0
.end method

.method public final n(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ljii;

    iget-object p0, p0, Ljii;->n:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final o(I)V
    .registers 2

    return-void
.end method

.method public final p()Lv30;
    .registers 5

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    const/4 v1, 0x0

    if-eqz v0, :cond_49

    iget-object v2, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    if-eqz v2, :cond_43

    iget-object v2, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast v2, Lu30;

    if-eqz v2, :cond_3d

    iget-object v2, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    if-eqz v2, :cond_37

    new-instance v1, Lv30;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v2, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-object v3, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object p0, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast p0, Lu30;

    invoke-direct {v1, v0, v2, v3, p0}, Lv30;-><init>(IIILu30;)V

    return-object v1

    :cond_37
    const-string p0, "Tag size is not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_3d
    const-string p0, "Variant is not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_43
    const-string p0, "IV size is not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_49
    const-string p0, "Key size is not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1
.end method

.method public final q()V
    .registers 3

    iget-object v0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Ljii;

    iget-object v0, v0, Ljii;->o:Landroid/widget/ViewSwitcher;

    invoke-virtual {v0}, Landroid/widget/ViewAnimator;->getCurrentView()Landroid/view/View;

    move-result-object v0

    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ljii;

    iget-object v1, p0, Ljii;->k:Lcom/opera/android/custom_views/RecyclerViewForScreenshot;

    if-eq v0, v1, :cond_17

    iget-object p0, p0, Ljii;->o:Landroid/widget/ViewSwitcher;

    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->showNext()V

    :cond_17
    return-void
.end method

.method public final r()V
    .registers 5

    iget-object v0, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Lvzk;

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v1, v0, Lvzk;->a:Ljava/lang/Object;

    check-cast v1, Landroid/widget/ImageView;

    iget-object v2, v0, Lvzk;->d:Ljava/lang/Object;

    check-cast v2, Lvd2;

    const/4 v3, 0x0

    if-eqz v2, :cond_27

    iget-object v2, v2, Lvd2;->e:Ljava/lang/Object;

    check-cast v2, Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->cancel()V

    iput-object v3, v0, Lvzk;->d:Ljava/lang/Object;

    iget-object v0, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Ld06;

    invoke-virtual {v0, v1}, Ld06;->m(Landroid/widget/ImageView;)V

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleX(F)V

    :cond_27
    iput-object v3, p0, Lvzk;->d:Ljava/lang/Object;

    return-void
.end method

.method public final s(Ljg;)V
    .registers 9

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    iget-object v1, p1, Ljg;->a:Ls38;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v0, p1, Ljg;->b:Z

    if-eqz v0, :cond_2b

    iget-object v2, p1, Ljg;->c:Lkyh;

    if-eqz v2, :cond_2b

    monitor-exit p0
    :try_end_13
    .catchall {:try_start_1 .. :try_end_13} :catchall_2f

    new-instance v1, Lt38;

    iget-object v5, p1, Ljg;->a:Ls38;

    iget-object v0, p0, Lvzk;->d:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lf38;

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-direct/range {v1 .. v6}, Lt38;-><init>(Lkyh;ZZLs38;Lf38;)V

    iget-object p0, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast p0, Lf38;

    iget-object p1, p1, Ljg;->a:Ls38;

    invoke-virtual {p0, p1, v1}, Lf38;->d(Ls38;Lt38;)V

    return-void

    :cond_2b
    :try_start_2b
    monitor-exit p0

    return-void

    :goto_2d
    monitor-exit p0
    :try_end_2e
    .catchall {:try_start_2b .. :try_end_2e} :catchall_2f

    throw p1

    :catchall_2f
    move-exception v0

    move-object p1, v0

    goto :goto_2d
.end method

.method public final t(Lcom/opera/android/browser/TabInfo;Lcom/opera/android/browser/chromium/ChromiumContent;)Luy3;
    .registers 8

    iget-boolean v0, p2, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    invoke-virtual {p0, v0}, Lvzk;->L(Z)I

    move-result v1

    if-nez v0, :cond_18

    iget-object v0, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/SessionStore;

    if-eqz v0, :cond_18

    iget-wide v2, v0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-virtual {p2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    const/4 v4, 0x0

    invoke-static {v2, v3, v0, v1, v4}, LJ/N;->MbDDD5E8(JLjava/lang/Object;ILjava/lang/Object;)V

    :cond_18
    new-instance v0, Luy3;

    invoke-direct {v0, p0, p2, v1, p1}, Luy3;-><init>(Lvzk;Lcom/opera/android/browser/chromium/ChromiumContent;ILcom/opera/android/browser/TabInfo;)V

    return-object v0
.end method

.method public final u(Ljava/lang/Iterable;)V
    .registers 4

    if-eqz p1, :cond_39

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_6
    :goto_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_38

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsk8;

    instance-of v1, v0, Lwgk;

    if-eqz v1, :cond_6

    check-cast v0, Lwgk;

    iget-byte v0, v0, Lwgk;->a:B

    packed-switch v0, :pswitch_data_40

    new-instance v0, Loj3;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Loj3;-><init>(B)V

    iget-object v1, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    :pswitch_2b
    new-instance v0, Lvgk;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object v1, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    :cond_38
    return-void

    :cond_39
    const-string p0, "extensions must not be null"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_2b
    .end packed-switch
.end method

.method public final v(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroidx/coordinatorlayout/widget/CoordinatorLayout;
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    const v2, 0x7f0d036f

    const/4 v3, 0x0

    move-object/from16 v4, p1

    invoke-virtual {v4, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a0190

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Landroid/widget/LinearLayout;

    if-eqz v7, :cond_184

    const v1, 0x7f0a0402

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Landroid/widget/FrameLayout;

    if-eqz v8, :cond_184

    const v1, 0x7f0a0403

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v9, :cond_184

    const v1, 0x7f0a0641

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_184

    invoke-static {v4}, Lhi4;->b(Landroid/view/View;)Lhi4;

    move-result-object v10

    const v1, 0x7f0a07c7

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_184

    invoke-static {v4}, Lhi4;->b(Landroid/view/View;)Lhi4;

    move-result-object v11

    const v1, 0x7f0a0803

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_184

    invoke-static {v4}, Lhi4;->b(Landroid/view/View;)Lhi4;

    move-result-object v12

    const v1, 0x7f0a0804

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v13, :cond_184

    const v1, 0x7f0a0805

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_184

    invoke-static {v4}, Lhi4;->b(Landroid/view/View;)Lhi4;

    move-result-object v14

    const v1, 0x7f0a0860

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Lcom/opera/android/custom_views/InterceptableFrameLayout;

    if-eqz v15, :cond_184

    const v1, 0x7f0a0861

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v16, v4

    check-cast v16, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;

    if-eqz v16, :cond_184

    const v1, 0x7f0a0862

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v17, v4

    check-cast v17, Lcom/google/android/material/progressindicator/LinearProgressIndicator;

    if-eqz v17, :cond_184

    const v1, 0x7f0a0863

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v18, v4

    check-cast v18, Landroid/widget/LinearLayout;

    if-eqz v18, :cond_184

    const v1, 0x7f0a0864

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v19, v4

    check-cast v19, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v19, :cond_184

    const v1, 0x7f0a0865

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v20, v4

    check-cast v20, Landroid/widget/ViewSwitcher;

    if-eqz v20, :cond_184

    const v1, 0x7f0a0915

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v21, v4

    check-cast v21, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    if-eqz v21, :cond_184

    const v1, 0x7f0a0a47

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v22, v4

    check-cast v22, Landroid/widget/LinearLayout;

    if-eqz v22, :cond_184

    new-instance v5, Ljii;

    move-object v6, v2

    check-cast v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-direct/range {v5 .. v22}, Ljii;-><init>(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/widget/LinearLayout;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingImageView;Lhi4;Lhi4;Lhi4;Lcom/google/android/material/textfield/TextInputLayout;Lhi4;Lcom/opera/android/custom_views/InterceptableFrameLayout;Lcom/opera/android/custom_views/RecyclerViewForScreenshot;Lcom/google/android/material/progressindicator/LinearProgressIndicator;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/ViewSwitcher;Lcom/google/android/material/floatingactionbutton/FloatingActionButton;Landroid/widget/LinearLayout;)V

    iput-object v5, v0, Lvzk;->b:Ljava/lang/Object;

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Ljii;

    iget-object v2, v2, Ljii;->k:Lcom/opera/android/custom_views/RecyclerViewForScreenshot;

    new-instance v4, Landroidx/recyclerview/widget/LinearLayoutManager;

    const/4 v5, 0x1

    invoke-direct {v4, v5, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {v2, v4}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object v2, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Ljii;

    iget-object v4, v2, Ljii;->k:Lcom/opera/android/custom_views/RecyclerViewForScreenshot;

    iput-boolean v5, v4, Landroidx/recyclerview/widget/RecyclerView;->t:Z

    iget-object v4, v2, Ljii;->j:Lcom/opera/android/custom_views/InterceptableFrameLayout;

    new-instance v6, Lr9g;

    const/16 v7, 0x1a

    invoke-direct {v6, v0, v7}, Lr9g;-><init>(Ljava/lang/Object;B)V

    iput-object v6, v4, Lcom/opera/android/custom_views/InterceptableFrameLayout;->a:Lceb;

    iget-object v2, v2, Ljii;->p:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    new-instance v4, Lmii;

    invoke-direct {v4, v0, v3}, Lmii;-><init>(Lvzk;B)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Lvzk;

    iget-object v4, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v4, Ljii;

    iget-object v4, v4, Ljii;->d:Lcom/opera/android/custom_views/StylingImageView;

    const v6, 0x7f080520

    invoke-static {v6, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    new-instance v7, Ld06;

    invoke-direct {v7, v6}, Ld06;-><init>(Ljava/lang/Object;)V

    invoke-direct {v2, v4, v7}, Lvzk;-><init>(Landroid/widget/ImageView;Ld06;)V

    const v4, 0x7f08051a

    invoke-static {v4, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    new-instance v4, Ld06;

    invoke-direct {v4, v1}, Ld06;-><init>(Ljava/lang/Object;)V

    iput-object v4, v2, Lvzk;->c:Ljava/lang/Object;

    invoke-virtual {v2, v3, v3}, Lvzk;->x(ZZ)V

    new-instance v1, Lnii;

    iget-object v4, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v4, Ljii;

    iget-object v6, v4, Ljii;->b:Landroid/widget/LinearLayout;

    iget-object v4, v4, Ljii;->q:Landroid/widget/LinearLayout;

    invoke-direct {v1, v6, v4, v2}, Lnii;-><init>(Landroid/view/View;Landroid/view/View;Lvzk;)V

    iput-object v1, v0, Lvzk;->c:Ljava/lang/Object;

    iget-object v1, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v1, Ljii;

    iget-object v1, v1, Ljii;->c:Landroid/widget/FrameLayout;

    new-instance v2, Lmii;

    invoke-direct {v2, v0, v5}, Lmii;-><init>(Lvzk;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v1, Ljii;

    iget-object v1, v1, Ljii;->q:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    new-instance v4, Lx79;

    iget-object v1, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v1, Ljii;

    iget-object v2, v1, Ljii;->f:Lhi4;

    iget-object v5, v2, Lhi4;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, v1, Ljii;->i:Lhi4;

    iget-object v6, v2, Lhi4;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, v1, Ljii;->e:Lhi4;

    iget-object v7, v2, Lhi4;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, v1, Ljii;->g:Lhi4;

    iget-object v8, v2, Lhi4;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v9, v1, Ljii;->h:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-direct/range {v4 .. v9}, Lx79;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v4, v0, Lvzk;->d:Ljava/lang/Object;

    iget-object v0, v1, Ljii;->a:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    return-object v0

    :cond_184
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public final w(Lhq8;Z)V
    .registers 10

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Le84;

    iget-object v0, p0, Lvzk;->d:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lqfb;

    if-nez v5, :cond_d

    return-void

    :cond_d
    invoke-virtual {p1}, Lhq8;->c()Ljava/lang/String;

    move-result-object v0

    iget-object v1, v2, Le84;->a:Lb59;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_3c

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    const-string v4, "guids"

    invoke-static {v3, v4}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_3c
    new-instance v1, Lnp6;

    iget-object v0, p0, Lvzk;->b:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ltd2;

    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    move-object v4, p0

    check-cast v4, Lpp6;

    move-object v6, p1

    invoke-direct/range {v1 .. v6}, Lnp6;-><init>(Le84;Ltd2;Lpp6;Lqfb;Lhq8;)V

    invoke-virtual {v1, p2}, Lnp6;->b(Z)V

    return-void
.end method

.method public final x(ZZ)V
    .registers 9

    iget-object v0, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast v1, Ld06;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, -0x1

    if-nez p1, :cond_75

    if-nez v1, :cond_16

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_16
    if-nez p2, :cond_1c

    invoke-virtual {v1, v0}, Ld06;->m(Landroid/widget/ImageView;)V

    return-void

    :cond_1c
    iget-object p1, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast p1, Lvzk;

    if-nez p1, :cond_2d

    new-instance p1, Lvzk;

    iget-object p2, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p2, Ld06;

    invoke-direct {p1, v0, v1, p2}, Lvzk;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p1, p0, Lvzk;->d:Ljava/lang/Object;

    :cond_2d
    iget-object p0, p1, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ld06;

    iget-object p2, p1, Lvzk;->c:Ljava/lang/Object;

    check-cast p2, Ld06;

    iget-object v0, p1, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Lvd2;

    if-nez v0, :cond_51

    iget-object v0, p1, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p2, Ld06;->a:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/drawable/Drawable;

    if-ne v0, v1, :cond_bc

    new-instance v0, Lvd2;

    invoke-direct {v0, p1, p2, p0, v4}, Lvd2;-><init>(Lvzk;Ld06;Ld06;I)V

    iput-object v0, p1, Lvzk;->d:Ljava/lang/Object;

    return-void

    :cond_51
    iget-object v1, v0, Lvd2;->d:Ljava/lang/Object;

    check-cast v1, Ld06;

    iget-object v5, v0, Lvd2;->f:Ljava/lang/Object;

    check-cast v5, Lvzk;

    iget-object v5, v5, Lvzk;->c:Ljava/lang/Object;

    check-cast v5, Ld06;

    if-ne v1, v5, :cond_bc

    iget-object v1, v0, Lvd2;->e:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    iget v0, v0, Lvd2;->b:I

    iput-object v3, p1, Lvzk;->d:Ljava/lang/Object;

    if-eq v0, v4, :cond_6d

    move v2, v4

    :cond_6d
    new-instance v0, Lvd2;

    invoke-direct {v0, p1, p2, p0, v2}, Lvd2;-><init>(Lvzk;Ld06;Ld06;I)V

    iput-object v0, p1, Lvzk;->d:Ljava/lang/Object;

    return-void

    :cond_75
    if-eqz v1, :cond_d3

    if-eqz p2, :cond_d3

    iget-object p1, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast p1, Lvzk;

    if-nez p1, :cond_8a

    new-instance p1, Lvzk;

    iget-object p2, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p2, Ld06;

    invoke-direct {p1, v0, v1, p2}, Lvzk;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p1, p0, Lvzk;->d:Ljava/lang/Object;

    :cond_8a
    iget-object p0, p1, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ld06;

    iget-object p2, p1, Lvzk;->c:Ljava/lang/Object;

    check-cast p2, Ld06;

    iget-object v0, p1, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Lvd2;

    if-nez v0, :cond_ae

    iget-object v0, p1, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p2, Ld06;->a:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/drawable/Drawable;

    if-eq v0, v1, :cond_bc

    new-instance v0, Lvd2;

    invoke-direct {v0, p1, p0, p2, v4}, Lvd2;-><init>(Lvzk;Ld06;Ld06;I)V

    iput-object v0, p1, Lvzk;->d:Ljava/lang/Object;

    return-void

    :cond_ae
    iget-object v1, v0, Lvd2;->d:Ljava/lang/Object;

    check-cast v1, Ld06;

    iget-object v5, v0, Lvd2;->f:Ljava/lang/Object;

    check-cast v5, Lvzk;

    iget-object v5, v5, Lvzk;->c:Ljava/lang/Object;

    check-cast v5, Ld06;

    if-ne v1, v5, :cond_bd

    :cond_bc
    return-void

    :cond_bd
    iget-object v1, v0, Lvd2;->e:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    iget v0, v0, Lvd2;->b:I

    iput-object v3, p1, Lvzk;->d:Ljava/lang/Object;

    if-eq v0, v4, :cond_cb

    move v2, v4

    :cond_cb
    new-instance v0, Lvd2;

    invoke-direct {v0, p1, p0, p2, v2}, Lvd2;-><init>(Lvzk;Ld06;Ld06;I)V

    iput-object v0, p1, Lvzk;->d:Ljava/lang/Object;

    return-void

    :cond_d3
    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ld06;

    invoke-virtual {p0, v0}, Ld06;->m(Landroid/widget/ImageView;)V

    return-void
.end method

.method public final y(Lk8g;)V
    .registers 2

    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Ljii;

    iget-object p0, p0, Ljii;->k:Lcom/opera/android/custom_views/RecyclerViewForScreenshot;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-void
.end method

.method public final z(Lwl5;)V
    .registers 14

    iget-object v0, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnpd;

    if-eqz v0, :cond_4c

    new-instance v6, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v8, 0x1

    invoke-direct {v6, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    :goto_12
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_4c

    const/4 v9, 0x0

    invoke-virtual {v6, v9}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v1, p1, Lwl5;->c:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lvl5;

    if-nez v3, :cond_2a

    iput-boolean v9, p1, Lwl5;->f:Z

    return-void

    :cond_2a
    new-instance v4, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v4, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iget-object v10, v0, Lnpd;->l:Landroid/os/Handler;

    iget-object v1, p1, Lwl5;->a:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lvzk;->I(Ljava/lang/Object;)Lnod;

    move-result-object v11

    new-instance v1, Li61;

    const/4 v7, 0x2

    move-object v2, p0

    move-object v5, p1

    invoke-direct/range {v1 .. v7}, Li61;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lzr9;

    invoke-direct {p0, v0, v11, v1}, Lzr9;-><init>(Lnpd;Lnod;Ljava/lang/Runnable;)V

    invoke-static {v10, p0}, Ltym;->S(Landroid/os/Handler;Ljava/lang/Runnable;)V

    invoke-virtual {v4, v9}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    move-object p0, v2

    goto :goto_12

    :cond_4c
    return-void
.end method
