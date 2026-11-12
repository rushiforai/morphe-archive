.class public final Ljvg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhpf;
.implements Lfji;
.implements Licj;
.implements Lu9j;
.implements Lo7l;
.implements Lylo;
.implements Lfm;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 32
    iput-byte p1, p0, Ljvg;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5

    .line 23
    iput-byte p1, p0, Ljvg;->a:B

    iput-object p2, p0, Ljvg;->b:Ljava/lang/Object;

    iput-object p3, p0, Ljvg;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Intent;Ljava/util/ArrayList;Lb2l;Lqn;Ldcj;)V
    .registers 7

    const/4 v0, 0x4

    iput-byte v0, p0, Ljvg;->a:B

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p3, p0, Ljvg;->b:Ljava/lang/Object;

    .line 35
    new-instance p3, Lcq;

    invoke-direct {p3, p1, p2, p4, p5}, Lcq;-><init>(Landroid/content/Intent;Ljava/util/ArrayList;Lqn;Ldcj;)V

    .line 36
    iput-object p3, p0, Ljvg;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lhjf;Lumi;)V
    .registers 4

    const/4 v0, 0x7

    iput-byte v0, p0, Ljvg;->a:B

    new-instance v0, Lni6;

    invoke-direct {v0, p1, p2}, Lni6;-><init>(Lhjf;Lumi;)V

    new-instance p1, Lr4k;

    const/16 p2, 0x8

    invoke-direct {p1, p2}, Lr4k;-><init>(B)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ljvg;->b:Ljava/lang/Object;

    iput-object p1, p0, Ljvg;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/ClassLoader;Lujp;)V
    .registers 4

    const/4 p2, 0x3

    iput-byte p2, p0, Ljvg;->a:B

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Ljvg;->b:Ljava/lang/Object;

    .line 39
    new-instance p2, Lyhe;

    const/16 v0, 0x11

    invoke-direct {p2, p1, v0}, Lyhe;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Ljvg;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 24
    iput-byte p2, p0, Ljvg;->a:B

    iput-object p1, p0, Ljvg;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 25
    iput-byte p3, p0, Ljvg;->a:B

    iput-object p2, p0, Ljvg;->b:Ljava/lang/Object;

    iput-object p1, p0, Ljvg;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ll7n;Lgjm;)V
    .registers 4

    const/16 v0, 0xc

    iput-byte v0, p0, Ljvg;->a:B

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p2, p0, Ljvg;->b:Ljava/lang/Object;

    .line 31
    new-instance p2, Latl;

    invoke-direct {p2, p1}, Latl;-><init>(Ll7n;)V

    iput-object p2, p0, Ljvg;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lumi;)V
    .registers 3

    const/16 v0, 0x9

    iput-byte v0, p0, Ljvg;->a:B

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Ljvg;->b:Ljava/lang/Object;

    .line 42
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Ljvg;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lv3m;)V
    .registers 3

    const/4 v0, 0x5

    iput-byte v0, p0, Ljvg;->a:B

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Ljvg;->b:Ljava/lang/Object;

    .line 28
    new-instance p1, Lv9j;

    invoke-direct {p1, p0}, Lv9j;-><init>(Lu9j;)V

    iput-object p1, p0, Ljvg;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lx5i;)V
    .registers 3

    const/16 v0, 0x8

    iput-byte v0, p0, Ljvg;->a:B

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljvg;->b:Ljava/lang/Object;

    .line 44
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljvg;->c:Ljava/lang/Object;

    return-void
.end method

.method public static o(Landroid/view/ViewGroup;Ljava/util/ArrayList;Lroj;)V
    .registers 11

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_6
    if-ge v2, v0, :cond_30

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lrmo;

    new-instance v4, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f150013

    const/4 v7, 0x0

    invoke-direct {v4, v5, v7, v1, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iget-object v5, v3, Lrmo;->a:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v5, Lobn;

    const/16 v6, 0xd

    invoke-direct {v5, p2, v3, v6}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_6

    :cond_30
    return-void
.end method


# virtual methods
.method public final A(II)V
    .registers 8

    iget-object v0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast v0, [I

    if-eqz v0, :cond_4f

    array-length v0, v0

    if-ge p1, v0, :cond_4f

    add-int v0, p1, p2

    invoke-virtual {p0, v0}, Ljvg;->t(I)V

    iget-object v1, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast v1, [I

    array-length v2, v1

    sub-int/2addr v2, p1

    sub-int/2addr v2, p2

    invoke-static {v1, v0, v1, p1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v1, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast v1, [I

    array-length v2, v1

    sub-int/2addr v2, p2

    array-length v3, v1

    const/4 v4, -0x1

    invoke-static {v1, v2, v3, v4}, Ljava/util/Arrays;->fill([IIII)V

    iget-object v1, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    if-eqz v1, :cond_4f

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_2f
    if-ltz v1, :cond_4f

    iget-object v2, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lz2k;

    iget v3, v2, Lz2k;->a:I

    if-lt v3, p1, :cond_4c

    if-ge v3, v0, :cond_49

    iget-object v2, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-interface {v2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_4c

    :cond_49
    sub-int/2addr v3, p2

    iput v3, v2, Lz2k;->a:I

    :cond_4c
    :goto_4c
    add-int/lit8 v1, v1, -0x1

    goto :goto_2f

    :cond_4f
    return-void
.end method

.method public final B(Lw4o;)Lw8k;
    .registers 3

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lx5i;

    invoke-virtual {p0, p1}, Lx5i;->b(Lw4o;)Lw8k;

    move-result-object p0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_d

    monitor-exit v0

    return-object p0

    :catchall_d
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final C(Ljava/lang/String;)Ljava/util/List;
    .registers 3

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lx5i;

    invoke-virtual {p0, p1}, Lx5i;->c(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_d

    monitor-exit v0

    return-object p0

    :catchall_d
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final D(Lw4o;)Lw8k;
    .registers 3

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lx5i;

    invoke-virtual {p0, p1}, Lx5i;->d(Lw4o;)Lw8k;

    move-result-object p0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_d

    monitor-exit v0

    return-object p0

    :catchall_d
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final E(ZZ)V
    .registers 7

    iget-object v0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const/4 v1, 0x0

    if-eqz p1, :cond_3b

    iget-object v2, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v2, Landroid/net/wifi/WifiManager$WifiLock;

    if-nez v2, :cond_3b

    const-string v2, "android.permission.WAKE_LOCK"

    invoke-virtual {v0, v2}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_1b

    const-string p0, "WAKE_LOCK permission not granted, can\'t acquire wake lock for playback"

    invoke-static {p0}, Lw7d;->K(Ljava/lang/String;)V

    return-void

    :cond_1b
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "wifi"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    if-nez v0, :cond_2f

    const-string p0, "WifiManager is null, therefore not creating the WifiLock."

    invoke-static {p0}, Lw7d;->K(Ljava/lang/String;)V

    return-void

    :cond_2f
    const/4 v2, 0x3

    const-string v3, "ExoPlayer:WifiLockManager"

    invoke-virtual {v0, v2, v3}, Landroid/net/wifi/WifiManager;->createWifiLock(ILjava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v0

    iput-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Landroid/net/wifi/WifiManager$WifiLock;->setReferenceCounted(Z)V

    :cond_3b
    iget-object p0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast p0, Landroid/net/wifi/WifiManager$WifiLock;

    if-nez p0, :cond_42

    return-void

    :cond_42
    if-eqz p1, :cond_47

    if-eqz p2, :cond_47

    const/4 v1, 0x1

    :cond_47
    if-eqz v1, :cond_4d

    invoke-virtual {p0}, Landroid/net/wifi/WifiManager$WifiLock;->acquire()V

    return-void

    :cond_4d
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager$WifiLock;->release()V

    return-void
.end method

.method public final I(Lfpf;)V
    .registers 4

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Ltah;

    invoke-virtual {v0}, Ltah;->N()Z

    move-result v1

    if-eqz v1, :cond_19

    sget-object v1, Lf8a;->h:Lf8a;

    iget-object p1, p1, Lfpf;->b:Ljava/lang/String;

    invoke-virtual {v1, p1}, Lf8a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lamk;

    invoke-virtual {v0, p1, p0}, Ltah;->z(Ljava/lang/String;Lamk;)V

    :cond_19
    return-void
.end method

.method public final bridge synthetic a()Ljava/lang/Object;
    .registers 3

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Lvlo;

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lvlo;

    invoke-virtual {p0}, Lvlo;->a()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0}, Lvlo;->a()Ljava/lang/Object;

    move-result-object v0

    new-instance v1, Lkpo;

    check-cast p0, Lypo;

    check-cast v0, Leqo;

    invoke-direct {v1, p0, v0}, Lkpo;-><init>(Lypo;Leqo;)V

    return-object v1
.end method

.method public final b()J
    .registers 3

    iget-object p0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast p0, Lueh;

    iget-wide v0, p0, Lueh;->F:J

    return-wide v0
.end method

.method public final c()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast p0, Lueh;

    iget-object p0, p0, Lueh;->D:Ljava/lang/String;

    return-object p0
.end method

.method public final d()Ljava/lang/String;
    .registers 1

    invoke-virtual {p0}, Ljvg;->getFileName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final e(Ljava/util/Set;Ltmi;)V
    .registers 9

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashMap;

    monitor-enter v1

    :try_start_a
    iget-object v2, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1d
    :goto_1d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lm7l;

    iget v5, v5, Lm7l;->a:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {p1, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1d

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    :cond_3a
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v2, 0x0

    :goto_3f
    if-ge v2, p1, :cond_57

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    check-cast v4, Lm7l;

    iget-object v5, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v5, Ljava/util/LinkedHashMap;

    iget v4, v4, Lm7l;->a:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v5, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3f

    :cond_57
    iget-object p1, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
    :try_end_62
    .catchall {:try_start_a .. :try_end_62} :catchall_7d

    monitor-exit v1

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance p1, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {p1, v1, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Ld7k;

    const/16 v1, 0x14

    invoke-direct {p0, p2, v0, v1}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, p0}, Lrml;->c(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void

    :catchall_7d
    move-exception p0

    monitor-exit v1

    throw p0
.end method

.method public final f(Landroid/content/Context;)Ljjm;
    .registers 3

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Lcq;

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lb2l;

    if-eqz p0, :cond_19

    invoke-static {p1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object p1

    iget-object p1, p1, Ldx3;->o:Lqim;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p1, Lqim;->f:Laal;

    invoke-virtual {p1, v0, p0}, Laal;->R(Lcej;Lb2l;)V

    return-object v0

    :cond_19
    invoke-static {p1}, La4h;->f(Landroid/content/Context;)Lnej;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-object v0
.end method

.method public final g(Lm7l;Lq7l;)V
    .registers 6

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    monitor-enter v0

    :try_start_5
    iget-object v1, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashMap;

    iget v2, p1, Lm7l;->a:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_12
    .catchall {:try_start_5 .. :try_end_12} :catchall_2c

    monitor-exit v0

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v1, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Li7l;

    const/4 v1, 0x1

    invoke-direct {p0, p2, p1, v1}, Li7l;-><init>(Lq7l;Lm7l;B)V

    invoke-virtual {v0, p0}, Lrml;->c(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void

    :catchall_2c
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final getFileName()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Llg7;->f(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    iget-object p0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast p0, Lueh;

    iget-object p0, p0, Lueh;->C:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "."

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final h(Lcpf;)V
    .registers 2

    return-void
.end method

.method public final i()Z
    .registers 5

    iget-object p0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast p0, Lueh;

    iget-wide v0, p0, Lueh;->F:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-lez p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final j()V
    .registers 3

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Lv9j;

    new-instance v1, Lyoj;

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lv3m;

    iget-object p0, p0, Lv3m;->a:Landroid/content/Context;

    invoke-static {p0}, Lv3m;->f(Landroid/content/Context;)Z

    move-result p0

    invoke-direct {v1, p0}, Lyoj;-><init>(Z)V

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final k(ILd7k;)V
    .registers 5

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    monitor-enter v0

    :try_start_5
    iget-object v1, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lm7l;
    :try_end_13
    .catchall {:try_start_5 .. :try_end_13} :catchall_2e

    monitor-exit v0

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v1, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Ld7k;

    const/16 v1, 0x13

    invoke-direct {p0, p2, p1, v1}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p0}, Lrml;->c(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void

    :catchall_2e
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final l(ILd7k;)Loml;
    .registers 5

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    monitor-enter v0

    :try_start_5
    iget-object v1, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lm7l;
    :try_end_13
    .catchall {:try_start_5 .. :try_end_13} :catchall_2f

    monitor-exit v0

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v1, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Ld7k;

    const/16 v1, 0x12

    invoke-direct {p0, p2, p1, v1}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p0}, Lrml;->c(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    move-result-object p0

    return-object p0

    :catchall_2f
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final n(Lepf;)V
    .registers 2

    return-void
.end method

.method public final onStopped()V
    .registers 1

    return-void
.end method

.method public final p(Lz2k;)V
    .registers 7

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_d

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    :cond_d
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_12
    iget-object v2, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    if-ge v1, v0, :cond_3c

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lz2k;

    iget v3, v2, Lz2k;->a:I

    iget v4, p1, Lz2k;->a:I

    if-ne v3, v4, :cond_2b

    iget-object v3, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-interface {v3, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_2b
    iget v2, v2, Lz2k;->a:I

    iget v3, p1, Lz2k;->a:I

    if-lt v2, v3, :cond_39

    iget-object p0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-interface {p0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void

    :cond_39
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    :cond_3c
    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final q()V
    .registers 3

    iget-object v0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast v0, [I

    if-eqz v0, :cond_a

    const/4 v1, -0x1

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    :cond_a
    const/4 v0, 0x0

    iput-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    return-void
.end method

.method public final r(Lgpf;)V
    .registers 3

    iget-object p1, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast p1, Ltah;

    invoke-virtual {p1}, Ltah;->N()Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lamk;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Ltah;->z(Ljava/lang/String;Lamk;)V

    :cond_12
    return-void
.end method

.method public final s(Lw4o;)Z
    .registers 3

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lx5i;

    iget-object p0, p0, Lx5i;->a:Ljava/util/LinkedHashMap;

    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_f

    monitor-exit v0

    return p0

    :catchall_f
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final t(I)V
    .registers 6

    iget-object v0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast v0, [I

    const/4 v1, -0x1

    if-nez v0, :cond_17

    const/16 v0, 0xa

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    new-array p1, p1, [I

    iput-object p1, p0, Ljvg;->b:Ljava/lang/Object;

    invoke-static {p1, v1}, Ljava/util/Arrays;->fill([II)V

    return-void

    :cond_17
    array-length v2, v0

    if-lt p1, v2, :cond_32

    array-length v2, v0

    :goto_1b
    if-gt v2, p1, :cond_20

    shl-int/lit8 v2, v2, 0x1

    goto :goto_1b

    :cond_20
    new-array p1, v2, [I

    iput-object p1, p0, Ljvg;->b:Ljava/lang/Object;

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, p1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, [I

    array-length p1, v0

    array-length v0, p0

    invoke-static {p0, p1, v0, v1}, Ljava/util/Arrays;->fill([IIII)V

    :cond_32
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Ljvg;->a:B

    packed-switch v0, :pswitch_data_22

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Ldm;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AdErrorEvent: [error="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_22
    .packed-switch 0x11
        :pswitch_a
    .end packed-switch
.end method

.method public final u(I)V
    .registers 4

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_26

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_c
    if-ltz v0, :cond_26

    iget-object v1, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lz2k;

    iget v1, v1, Lz2k;->a:I

    if-lt v1, p1, :cond_23

    iget-object v1, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_23
    add-int/lit8 v0, v0, -0x1

    goto :goto_c

    :cond_26
    invoke-virtual {p0, p1}, Ljvg;->y(I)I

    return-void
.end method

.method public final v(III)Lz2k;
    .registers 8

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_2b

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_b
    if-ge v1, v0, :cond_2b

    iget-object v2, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lz2k;

    iget v3, v2, Lz2k;->a:I

    if-ge v3, p2, :cond_2b

    if-lt v3, p1, :cond_28

    if-eqz p3, :cond_27

    iget v3, v2, Lz2k;->b:I

    if-eq v3, p3, :cond_27

    iget-boolean v3, v2, Lz2k;->d:Z

    if-eqz v3, :cond_28

    :cond_27
    return-object v2

    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    :cond_2b
    const/4 p0, 0x0

    return-object p0
.end method

.method public final w(I)Lz2k;
    .registers 5

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_20

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_c
    if-ltz v0, :cond_20

    iget-object v1, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lz2k;

    iget v2, v1, Lz2k;->a:I

    if-ne v2, p1, :cond_1d

    return-object v1

    :cond_1d
    add-int/lit8 v0, v0, -0x1

    goto :goto_c

    :cond_20
    const/4 p0, 0x0

    return-object p0
.end method

.method public final x()V
    .registers 7

    const-string v0, "androidx.window.extensions.WindowExtensions"

    const-string v1, "androidx.window.extensions.WindowExtensionsProvider"

    iget-object v2, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v2, Lyhe;

    iget-object v2, v2, Lyhe;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/ClassLoader;

    :try_start_c
    invoke-virtual {v2, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_f
    .catch Ljava/lang/ClassNotFoundException; {:try_start_c .. :try_end_f} :catch_71
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_c .. :try_end_f} :catch_71

    :try_start_f
    invoke-virtual {v2, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v3, "getWindowExtensions"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v2, v0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_71

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v1

    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v1

    if-eqz v1, :cond_71

    invoke-virtual {v2, v0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "getWindowLayoutComponent"

    invoke-virtual {v0, v1, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object v1, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/ClassLoader;

    const-string v2, "androidx.window.extensions.layout.WindowLayoutComponent"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v2

    if-eqz v2, :cond_71

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_58
    .catch Ljava/lang/ClassNotFoundException; {:try_start_f .. :try_end_58} :catch_71
    .catch Ljava/lang/NoSuchMethodException; {:try_start_f .. :try_end_58} :catch_71
    .catch Ljava/lang/NoSuchFieldException; {:try_start_f .. :try_end_58} :catch_71

    if-eqz v0, :cond_71

    new-instance v0, Lj3i;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lj3i;-><init>(Ljava/lang/Object;B)V

    :try_start_60
    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_6a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_60 .. :try_end_6a} :catch_6b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_60 .. :try_end_6a} :catch_6b
    .catch Ljava/lang/NoSuchFieldException; {:try_start_60 .. :try_end_6a} :catch_6b

    goto :goto_6c

    :catch_6b
    const/4 p0, 0x0

    :goto_6c
    if-eqz p0, :cond_71

    invoke-static {}, Lql8;->a()V

    :catch_71
    :cond_71
    return-void
.end method

.method public final y(I)I
    .registers 6

    iget-object v0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast v0, [I

    const/4 v1, -0x1

    if-eqz v0, :cond_a

    array-length v0, v0

    if-lt p1, v0, :cond_b

    :cond_a
    return v1

    :cond_b
    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_51

    invoke-virtual {p0, p1}, Ljvg;->w(I)Lz2k;

    move-result-object v0

    if-eqz v0, :cond_1e

    iget-object v2, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_1e
    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_27
    if-ge v2, v0, :cond_3a

    iget-object v3, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lz2k;

    iget v3, v3, Lz2k;->a:I

    if-ge v3, p1, :cond_3b

    add-int/lit8 v2, v2, 0x1

    goto :goto_27

    :cond_3a
    move v2, v1

    :cond_3b
    if-eq v2, v1, :cond_51

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lz2k;

    iget-object v3, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-interface {v3, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    iget v0, v0, Lz2k;->a:I

    goto :goto_52

    :cond_51
    move v0, v1

    :goto_52
    iget-object v2, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast v2, [I

    if-ne v0, v1, :cond_62

    array-length v0, v2

    invoke-static {v2, p1, v0, v1}, Ljava/util/Arrays;->fill([IIII)V

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, [I

    array-length p0, p0

    return p0

    :cond_62
    add-int/lit8 v0, v0, 0x1

    array-length v2, v2

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, [I

    invoke-static {p0, p1, v0, v1}, Ljava/util/Arrays;->fill([IIII)V

    return v0
.end method

.method public final z(II)V
    .registers 6

    iget-object v0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast v0, [I

    if-eqz v0, :cond_42

    array-length v0, v0

    if-ge p1, v0, :cond_42

    add-int v0, p1, p2

    invoke-virtual {p0, v0}, Ljvg;->t(I)V

    iget-object v1, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast v1, [I

    array-length v2, v1

    sub-int/2addr v2, p1

    sub-int/2addr v2, p2

    invoke-static {v1, p1, v1, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v1, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast v1, [I

    const/4 v2, -0x1

    invoke-static {v1, p1, v0, v2}, Ljava/util/Arrays;->fill([IIII)V

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_42

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_2c
    if-ltz v0, :cond_42

    iget-object v1, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lz2k;

    iget v2, v1, Lz2k;->a:I

    if-lt v2, p1, :cond_3f

    add-int/2addr v2, p2

    iput v2, v1, Lz2k;->a:I

    :cond_3f
    add-int/lit8 v0, v0, -0x1

    goto :goto_2c

    :cond_42
    return-void
.end method
