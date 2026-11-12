.class public final Ll45;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfoa;
.implements Ldn;
.implements Ls37;
.implements Lhf3;
.implements Lmya;
.implements Lwom;
.implements Lorg/chromium/printing/Printable;


# static fields
.field public static volatile d:Ll45;

.field public static final e:Ljava/lang/Object;

.field public static final f:Ljava/lang/Object;

.field public static final g:Ldpj;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ll45;->e:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ll45;->f:Ljava/lang/Object;

    new-instance v0, Ldpj;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Ldpj;-><init>(B)V

    sput-object v0, Ll45;->g:Ldpj;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;B)V
    .registers 5

    packed-switch p2, :pswitch_data_40

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ll45;->c:Ljava/lang/Object;

    .line 85
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Ll45;->b:Ljava/lang/Object;

    .line 86
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Ll45;->a:Ljava/lang/Object;

    return-void

    .line 87
    :pswitch_1b
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    new-instance p2, Lt1;

    const/4 v0, 0x4

    invoke-direct {p2, p1, v0}, Lt1;-><init>(Landroid/content/Context;B)V

    .line 89
    new-instance v0, Lj4c;

    const/4 v1, 0x0

    invoke-direct {v0, p2, v1}, Lj4c;-><init>(Lesk;B)V

    .line 90
    iput-object v0, p0, Ll45;->a:Ljava/lang/Object;

    .line 91
    new-instance p2, Lt1;

    const/4 v0, 0x5

    invoke-direct {p2, p1, v0}, Lt1;-><init>(Landroid/content/Context;B)V

    .line 92
    new-instance v0, Lj4c;

    invoke-direct {v0, p2, v1}, Lj4c;-><init>(Lesk;B)V

    .line 93
    iput-object v0, p0, Ll45;->b:Ljava/lang/Object;

    .line 94
    invoke-static {p1}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object p1

    iput-object p1, p0, Ll45;->c:Ljava/lang/Object;

    return-void

    :pswitch_data_40
    .packed-switch 0x18
        :pswitch_1b
    .end packed-switch
.end method

.method public constructor <init>(Lcom/opera/android/OperaApplication;Ljava/lang/String;)V
    .registers 6

    .line 77
    sget-object v0, Lvml;->d:Lumi;

    const/4 v1, 0x0

    new-array v1, v1, [Lbg1;

    const-string v2, "breakpad"

    invoke-static {p1, v0, v2, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ll45;->a:Ljava/lang/Object;

    .line 80
    iput-object p1, p0, Ll45;->b:Ljava/lang/Object;

    .line 81
    iput-object p2, p0, Ll45;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    .line 82
    iput-object p2, p0, Ll45;->a:Ljava/lang/Object;

    iput-object p3, p0, Ll45;->b:Ljava/lang/Object;

    iput-object p1, p0, Ll45;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ll45;->a:Ljava/lang/Object;

    iput-object p3, p0, Ll45;->b:Ljava/lang/Object;

    const-class p2, Lm45;

    invoke-static {p2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p3

    :try_start_d
    sget-object v0, Lkotlin/reflect/KTypeProjection;->c:Lztb;

    const-class v1, Ll45;

    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    sget-object v2, Lcub;->a:Lcub;

    sget-object v2, Luqh;->a:Lvqh;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Laam;

    invoke-direct {v2, v1}, Laam;-><init>(Ls15;)V

    const-class v1, Ljava/lang/Object;

    invoke-static {v1}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v1

    invoke-static {v2, v1}, Luqh;->c(Laam;Lcam;)V

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    new-instance v3, Lcam;

    const/4 v4, 0x0

    invoke-direct {v3, v2, v1, v4}, Lcam;-><init>(Lktb;Ljava/util/List;I)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3}, Lztb;->a(Lcam;)Lkotlin/reflect/KTypeProjection;

    move-result-object v0

    invoke-static {p2, v0}, Luqh;->e(Ljava/lang/Class;Lkotlin/reflect/KTypeProjection;)Lcam;

    move-result-object p2
    :try_end_3d
    .catchall {:try_start_d .. :try_end_3d} :catchall_3e

    goto :goto_3f

    :catchall_3e
    const/4 p2, 0x0

    :goto_3f
    new-instance v0, Lx9m;

    invoke-direct {v0, p3, p2}, Lx9m;-><init>(Litb;Lcam;)V

    new-instance p2, Ljf2;

    invoke-direct {p2, p1, v0}, Ljf2;-><init>(Ljava/lang/String;Lx9m;)V

    iput-object p2, p0, Ll45;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 76
    iput-object p2, p0, Ll45;->a:Ljava/lang/Object;

    iput-object p3, p0, Ll45;->b:Ljava/lang/Object;

    iput-object p4, p0, Ll45;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static G(Landroid/content/Context;)Ll45;
    .registers 4

    sget-object v0, Ll45;->d:Ll45;

    if-nez v0, :cond_19

    sget-object v0, Ll45;->e:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    sget-object v1, Ll45;->d:Ll45;

    if-nez v1, :cond_13

    new-instance v1, Ll45;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Ll45;-><init>(Landroid/content/Context;B)V

    sput-object v1, Ll45;->d:Ll45;

    :cond_13
    monitor-exit v0

    goto :goto_19

    :goto_15
    monitor-exit v0
    :try_end_16
    .catchall {:try_start_7 .. :try_end_16} :catchall_17

    throw p0

    :catchall_17
    move-exception p0

    goto :goto_15

    :cond_19
    :goto_19
    sget-object p0, Ll45;->d:Ll45;

    return-object p0
.end method

.method public static I(Landroid/content/Context;)Ljava/lang/String;
    .registers 8

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Landroid/content/Intent;

    const-string v2, "http://"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v1, v3, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v1

    if-eqz v1, :cond_30

    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v0, v3

    :cond_30
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.support.customtabs.action.CustomTabsService"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v2

    :cond_3c
    if-ge v4, v3, :cond_50

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v1, v5}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v1, v2}, Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v6

    if-eqz v6, :cond_3c

    return-object v5

    :cond_50
    const/4 p0, 0x0

    return-object p0
.end method

.method public static S(Ljava/lang/String;Lzjh;Ljava/lang/String;)Lp12;
    .registers 12

    new-instance v0, Lp12;

    iget-object v2, p1, Lzjh;->a:Ljava/lang/String;

    iget-object v3, p1, Lzjh;->c:Ljava/lang/String;

    iget-object v4, p1, Lzjh;->e:Ljava/lang/String;

    iget-object v5, p1, Lzjh;->g:Ljava/lang/String;

    iget-object v6, p1, Lzjh;->j:Ljava/lang/String;

    iget-object v7, p1, Lzjh;->s:Ljava/lang/String;

    move-object v1, p0

    move-object v8, p2

    invoke-direct/range {v0 .. v8}, Lp12;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/Serializable;)V

    return-object v0
.end method

.method public static T(Ljava/lang/String;)I
    .registers 2

    const-string v0, "original"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const-string v0, "transcoded"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x2

    return p0

    :cond_14
    const/4 p0, 0x3

    return p0
.end method

.method public static f(Landroid/net/Uri;Ljava/util/Map;)Landroid/net/Uri;
    .registers 5

    invoke-virtual {p0}, Landroid/net/Uri;->isHierarchical()Z

    move-result v0

    if-nez v0, :cond_7

    return-object p0

    :cond_7
    invoke-static {p0}, Lwqm;->n(Landroid/net/Uri;)Ljava/util/Set;

    move-result-object v0

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_17
    :goto_17
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_17

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_17

    :cond_3d
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static g(Landroid/content/Context;Ljava/lang/String;Ly66;)V
    .registers 5

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Ly66;->setApplicationContext(Landroid/content/Context;)V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.support.customtabs.action.CustomTabsService"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_17

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    :cond_17
    const/16 p1, 0x21

    invoke-virtual {p0, v0, p2, p1}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    return-void
.end method

.method public static o(Ljava/net/URL;Ljava/lang/String;)Landroid/net/Uri;
    .registers 4

    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->encodedAuthority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->encodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "news/detail"

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static r(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)Landroid/net/Uri;
    .registers 8

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->isHierarchical()Z

    move-result v0

    if-nez v0, :cond_b

    return-object p0

    :cond_b
    new-instance v0, Landroidx/collection/ArrayMap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lhkj;-><init>(I)V

    const-string v1, "client"

    const-string v2, "opera"

    invoke-virtual {v0, v1, v2}, Lhkj;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p1, :cond_23

    const-string v1, "like_count"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lhkj;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_23
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2e

    const-string p1, "like_status"

    invoke-virtual {v0, p1, p2}, Lhkj;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2e
    if-eqz p3, :cond_3b

    const-string p1, "-"

    invoke-static {p1, p3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "like_list"

    invoke-virtual {v0, p2, p1}, Lhkj;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3b
    if-eqz p4, :cond_42

    const-string p1, "uid"

    invoke-virtual {v0, p1, p4}, Lhkj;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_42
    invoke-static {p0, v0}, Ll45;->f(Landroid/net/Uri;Ljava/util/Map;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static x(Landroid/net/Uri;Landroid/content/Context;JLjava/lang/String;Ll0c;)Landroid/net/Uri;
    .registers 8

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "features"

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object p2

    invoke-virtual {p2}, Lv1;->x()Ljava/lang/String;

    move-result-object p2

    const-string p3, "abgroup"

    invoke-virtual {v0, p3, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "client"

    const-string p3, "opera"

    invoke-virtual {v0, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->d()Le00;

    move-result-object p2

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p1

    const-string p3, "personalized_ads"

    invoke-virtual {p1, p3}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4f

    invoke-virtual {p2}, Le00;->b()Lc00;

    move-result-object p1

    iget-boolean p1, p1, Lc00;->b:Z

    if-nez p1, :cond_4f

    invoke-virtual {p2}, Le00;->b()Lc00;

    move-result-object p1

    iget-object p1, p1, Lc00;->a:Ljava/lang/String;

    if-eqz p1, :cond_4f

    const-string p2, "gaid"

    invoke-virtual {v0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4f
    if-eqz p4, :cond_56

    const-string p1, "config_bundle"

    invoke-virtual {v0, p1, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_56
    if-eqz p5, :cond_66

    const-string p1, "language"

    iget-object p2, p5, Ll0c;->b:Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "country"

    iget-object p2, p5, Ll0c;->a:Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_66
    invoke-static {p0, v0}, Ll45;->f(Landroid/net/Uri;Ljava/util/Map;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final A()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v0, Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_12

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_30

    :cond_12
    iget-object v0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v0, Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_24

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_30

    :cond_24
    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Ldj9;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcj9;

    iget-object v0, p0, Lcj9;->a:Ljava/lang/String;

    :cond_30
    if-eqz v0, :cond_39

    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, p0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_39
    const/4 p0, 0x0

    return-object p0
.end method

.method public final B()Lawc;
    .registers 8

    invoke-static {}, Landroid/os/LocaleList;->getDefault()Landroid/os/LocaleList;

    move-result-object v0

    iget-object v1, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v1, Lauj;

    monitor-enter v1

    :try_start_9
    iget-object v2, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v2, Lawc;

    if-eqz v2, :cond_15

    iget-object v3, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v3, Landroid/os/LocaleList;

    if-eq v0, v3, :cond_39

    :cond_15
    invoke-virtual {v0}, Landroid/os/LocaleList;->size()I

    move-result v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v4, 0x0

    :goto_1f
    if-ge v4, v2, :cond_30

    new-instance v5, Lyvc;

    invoke-virtual {v0, v4}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    move-result-object v6

    invoke-direct {v5, v6}, Lyvc;-><init>(Ljava/util/Locale;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_1f

    :cond_30
    new-instance v2, Lawc;

    invoke-direct {v2, v3}, Lawc;-><init>(Ljava/util/List;)V

    iput-object v0, p0, Ll45;->a:Ljava/lang/Object;

    iput-object v2, p0, Ll45;->b:Ljava/lang/Object;
    :try_end_39
    .catchall {:try_start_9 .. :try_end_39} :catchall_3b

    :cond_39
    monitor-exit v1

    return-object v2

    :catchall_3b
    move-exception p0

    monitor-exit v1

    throw p0
.end method

.method public final C()J
    .registers 3

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Llp6;

    if-eqz p0, :cond_9

    iget-wide v0, p0, Llp6;->d:J

    return-wide v0

    :cond_9
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public final D()V
    .registers 1

    return-void
.end method

.method public final E()V
    .registers 10

    iget-object v0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v0, Lqb7;

    iget-object v0, v0, Lqb7;->b:Ljava/lang/Object;

    check-cast v0, Lskm;

    iget-object v1, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_23

    move-object v2, v0

    check-cast v2, Lx5f;

    iget-object v3, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v3}, Lx56;->D(Lzpa;)Ltf0;

    move-result-object v3

    const/16 v5, 0x9

    invoke-virtual {v3, v5, v1}, Ltf0;->x(ILjava/lang/String;)V

    invoke-virtual {v2, v4}, Lx5f;->U0(Lx56;)V

    :cond_23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-object p0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast p0, Lamk;

    iget-object p0, p0, Lamk;->c:Lxlk;

    iget-object v3, p0, Lxlk;->e:Ljava/lang/String;

    iget-object p0, p0, Lxlk;->a:Lwlk;

    if-nez p0, :cond_36

    sget-object p0, Ljava/time/Duration;->ZERO:Ljava/time/Duration;

    goto :goto_5d

    :cond_36
    iget-object p0, p0, Lwlk;->c:Lo9g;

    iget v4, p0, Lo9g;->a:I

    int-to-long v4, v4

    const-wide/16 v6, 0x16d

    mul-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/time/Duration;->ofDays(J)Ljava/time/Duration;

    move-result-object v4

    iget v5, p0, Lo9g;->b:I

    int-to-long v5, v5

    const-wide/16 v7, 0x1e

    mul-long/2addr v5, v7

    invoke-virtual {v4, v5, v6}, Ljava/time/Duration;->plusDays(J)Ljava/time/Duration;

    move-result-object v4

    iget v5, p0, Lo9g;->c:I

    int-to-long v5, v5

    const-wide/16 v7, 0x7

    mul-long/2addr v5, v7

    invoke-virtual {v4, v5, v6}, Ljava/time/Duration;->plusDays(J)Ljava/time/Duration;

    move-result-object v4

    iget p0, p0, Lo9g;->d:I

    int-to-long v5, p0

    invoke-virtual {v4, v5, v6}, Ljava/time/Duration;->plusDays(J)Ljava/time/Duration;

    move-result-object p0

    :goto_5d
    check-cast v0, Lx5f;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v4, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    new-instance v6, Lck0;

    invoke-direct {v6, v4, v5}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v6}, Lck0;->i()Lbt0;

    move-result-object v4

    iget-object v4, v4, Lbt0;->a:Le66;

    const/16 v6, 0x18

    const/4 v7, 0x1

    invoke-virtual {v4, v6, v7, v1, v2}, Ljf0;->p(IIJ)V

    if-nez v3, :cond_7d

    const-string v3, ""

    :cond_7d
    const/16 v1, 0x19

    invoke-virtual {v4, v1, v3}, Le66;->y(ILjava/lang/String;)V

    invoke-virtual {p0}, Ljava/time/Duration;->toDays()J

    move-result-wide v1

    const/16 p0, 0x1a

    invoke-virtual {v4, p0, v7, v1, v2}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, v5}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final F(S)I
    .registers 2

    iget-object p0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/components/autofill/FormData;

    iget p0, p0, Lorg/chromium/components/autofill/FormData;->a:I

    shl-int/lit8 p0, p0, 0x10

    or-int/2addr p0, p1

    return p0
.end method

.method public final H(Ljava/lang/String;)Lqxd;
    .registers 8

    const-string v0, "Failed to read file "

    iget-object v1, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_73

    monitor-enter p0

    :try_start_d
    iget-object v1, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1
    :try_end_15
    .catchall {:try_start_d .. :try_end_15} :catchall_71

    if-eqz v1, :cond_19

    monitor-exit p0

    goto :goto_73

    :cond_19
    :try_start_19
    iget-object v1, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v1, Lyxd;

    invoke-interface {v1, p1}, Lyxd;->Q(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Lzxd;->a(Ljava/io/InputStream;)Ljava/util/List;

    move-result-object v0
    :try_end_25
    .catch Ljava/lang/IllegalArgumentException; {:try_start_19 .. :try_end_25} :catch_64
    .catch Ljava/lang/IllegalStateException; {:try_start_19 .. :try_end_25} :catch_64
    .catchall {:try_start_19 .. :try_end_25} :catchall_71

    :try_start_25
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_29
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ludg;

    iget-object v2, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v2, Lbpd;

    iget-object v3, v2, Lbpd;->c:Ljava/lang/Object;

    check-cast v3, Lf1p;

    iget-object v4, v3, Lf1p;->b:Ljava/lang/Object;

    check-cast v4, Lo9d;

    invoke-interface {v4, v1}, Lo9d;->l(Ludg;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "001"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_53

    invoke-virtual {v3, v1}, Lf1p;->l(Ludg;)V

    goto :goto_29

    :cond_53
    iget-object v2, v2, Lbpd;->b:Ljava/lang/Object;

    check-cast v2, Lf1p;

    invoke-virtual {v2, v1}, Lf1p;->l(Ludg;)V

    goto :goto_29

    :cond_5b
    iget-object v0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_62
    .catchall {:try_start_25 .. :try_end_62} :catchall_71

    monitor-exit p0

    goto :goto_73

    :catch_64
    move-exception v1

    :try_start_65
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :goto_6f
    monitor-exit p0
    :try_end_70
    .catchall {:try_start_65 .. :try_end_70} :catchall_71

    throw p1

    :catchall_71
    move-exception p1

    goto :goto_6f

    :cond_73
    :goto_73
    iget-object p0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast p0, Lbpd;

    return-object p0
.end method

.method public final J()Ljava/util/HashSet;
    .registers 11

    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v1, Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    const-string v2, "upload.stamps"

    invoke-virtual {p0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v2, ""

    invoke-interface {v1, p0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v1, ","

    invoke-static {p0, v1}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const/4 v4, 0x0

    :goto_2d
    array-length v5, p0

    if-ge v4, v5, :cond_51

    aget-object v5, p0, v4

    invoke-static {v5}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmp-long v6, v2, v6

    if-ltz v6, :cond_4e

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    const-wide/32 v8, 0x240c8400

    sub-long v8, v2, v8

    cmp-long v6, v6, v8

    if-lez v6, :cond_4e

    invoke-virtual {v1, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_4e
    add-int/lit8 v4, v4, 0x1

    goto :goto_2d

    :cond_51
    monitor-exit v0

    return-object v1

    :goto_53
    monitor-exit v0
    :try_end_54
    .catchall {:try_start_3 .. :try_end_54} :catchall_55

    throw p0

    :catchall_55
    move-exception p0

    goto :goto_53
.end method

.method public final K(Loc6;Landroid/net/Uri;Ljava/util/Map;JJLg5h;)V
    .registers 16

    new-instance v1, Llp6;

    move-object v2, p1

    move-wide v3, p4

    move-wide v5, p6

    invoke-direct/range {v1 .. v6}, Llp6;-><init>(Loc6;JJ)V

    iput-object v1, p0, Ll45;->c:Ljava/lang/Object;

    iget-object p1, p0, Ll45;->b:Ljava/lang/Object;

    check-cast p1, Lcn8;

    if-eqz p1, :cond_11

    return-void

    :cond_11
    iget-object p1, p0, Ll45;->a:Ljava/lang/Object;

    check-cast p1, Lfn8;

    invoke-interface {p1, p2, p3}, Lfn8;->f(Landroid/net/Uri;Ljava/util/Map;)[Lcn8;

    move-result-object p1

    array-length p3, p1

    invoke-static {p3}, Lh1b;->q(I)Lz0b;

    move-result-object p3

    array-length p4, p1

    const/4 p5, 0x1

    const/4 p6, 0x0

    if-ne p4, p5, :cond_28

    aget-object p1, p1, p6

    iput-object p1, p0, Ll45;->b:Ljava/lang/Object;

    goto :goto_80

    :cond_28
    array-length p4, p1

    move p7, p6

    :goto_2a
    if-ge p7, p4, :cond_79

    aget-object v0, p1, p7

    :try_start_2e
    invoke-interface {v0, v1}, Lcn8;->a(Ldn8;)Z

    move-result v2

    if-eqz v2, :cond_39

    iput-object v0, p0, Ll45;->b:Ljava/lang/Object;
    :try_end_36
    .catch Ljava/io/EOFException; {:try_start_2e .. :try_end_36} :catch_62
    .catchall {:try_start_2e .. :try_end_36} :catchall_4d

    iput p6, v1, Llp6;->f:I

    goto :goto_79

    :cond_39
    :try_start_39
    invoke-interface {v0}, Lcn8;->c()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p3, v0}, Lv0b;->e(Ljava/lang/Iterable;)V
    :try_end_40
    .catch Ljava/io/EOFException; {:try_start_39 .. :try_end_40} :catch_62
    .catchall {:try_start_39 .. :try_end_40} :catchall_4d

    iget-object v0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v0, Lcn8;

    if-nez v0, :cond_70

    iget-wide v5, v1, Llp6;->d:J

    cmp-long v0, v5, v3

    if-nez v0, :cond_6e

    goto :goto_70

    :catchall_4d
    move-exception v0

    move-object p1, v0

    iget-object p0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast p0, Lcn8;

    if-nez p0, :cond_5c

    iget-wide p2, v1, Llp6;->d:J

    cmp-long p0, p2, v3

    if-eqz p0, :cond_5c

    move p5, p6

    :cond_5c
    invoke-static {p5}, Lz4o;->H(Z)V

    iput p6, v1, Llp6;->f:I

    throw p1

    :catch_62
    iget-object v0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v0, Lcn8;

    if-nez v0, :cond_70

    iget-wide v5, v1, Llp6;->d:J

    cmp-long v0, v5, v3

    if-eqz v0, :cond_70

    :cond_6e
    move v0, p6

    goto :goto_71

    :cond_70
    :goto_70
    move v0, p5

    :goto_71
    invoke-static {v0}, Lz4o;->H(Z)V

    iput p6, v1, Llp6;->f:I

    add-int/lit8 p7, p7, 0x1

    goto :goto_2a

    :cond_79
    :goto_79
    iget-object p0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast p0, Lcn8;

    if-eqz p0, :cond_84

    move-object p1, p0

    :goto_80
    invoke-interface {p1, p8}, Lcn8;->d(Len8;)V

    return-void

    :cond_84
    new-instance p0, Lvmm;

    new-instance p4, Ljava/lang/StringBuilder;

    const-string p6, "None of the available extractors ("

    invoke-direct {p4, p6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance p6, Lr40;

    const/4 p7, 0x3

    const-string p8, ", "

    invoke-direct {p6, p8, p7}, Lr40;-><init>(Ljava/lang/String;B)V

    invoke-static {p1}, Lh1b;->t([Ljava/lang/Object;)Lcsh;

    move-result-object p1

    new-instance p7, Lb10;

    invoke-direct {p7, p5}, Lb10;-><init>(B)V

    invoke-static {p7, p1}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object p1

    invoke-virtual {p6, p1}, Lr40;->b(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ") could read the stream."

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Lz0b;->g()Lcsh;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lvmm;-><init>(Ljava/lang/String;Lcsh;)V

    throw p0
.end method

.method public final L()V
    .registers 6

    iget-object v0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v0, Ls6h;

    iget-object v1, v0, Ls6h;->a:Ljava/lang/Object;

    check-cast v1, Lpad;

    invoke-virtual {v1}, Lpad;->k()Lf99;

    move-result-object v1

    new-instance v2, Lzp6;

    const/4 v3, 0x4

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1, v2}, Lma9;->b(Lf99;Lcr9;)Lbs4;

    move-result-object v0

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v0

    new-instance v1, Lyf;

    const/16 v2, 0x12

    invoke-direct {v1, v2, v4, p0}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    new-instance v2, Lz99;

    const/4 v3, 0x2

    invoke-direct {v2, v0, v1, v3}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    iget-object p0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast p0, Lndc;

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-static {v2, v0}, Lscd;->D(Lf99;Ltcc;)Lj94;

    move-result-object v0

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    invoke-static {p0}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object p0

    invoke-static {v0, p0}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    return-void
.end method

.method public final M(Ltw1;Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    invoke-virtual {p0, p1, p2}, Ll45;->w(Ltw1;Ljava/lang/String;)V

    return-void

    :cond_10
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2a

    if-nez v0, :cond_27

    iget-object p0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    new-instance v0, Lsw1;

    invoke-direct {v0, p1, p2}, Lsw1;-><init>(Ltw1;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_27
    invoke-static {}, Lh9o;->p()V

    :cond_2a
    return-void
.end method

.method public final N(Lh01;)V
    .registers 3

    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lfjg;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Lxs6;

    iget-object p0, p0, Lxs6;->n:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lws6;

    if-eqz p0, :cond_28

    monitor-enter p0

    :try_start_1c
    iget p1, p0, Lws6;->d:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lws6;->d:I
    :try_end_22
    .catchall {:try_start_1c .. :try_end_22} :catchall_26

    monitor-exit p0

    return-void

    :goto_24
    :try_start_24
    monitor-exit p0
    :try_end_25
    .catchall {:try_start_24 .. :try_end_25} :catchall_26

    throw p1

    :catchall_26
    move-exception p1

    goto :goto_24

    :cond_28
    return-void
.end method

.method public final O(Ljava/lang/String;)V
    .registers 2

    if-eqz p1, :cond_5

    iput-object p1, p0, Ll45;->a:Ljava/lang/Object;

    return-void

    :cond_5
    const-string p0, "Null backendName"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final P(I)V
    .registers 3

    const/16 v0, 0x10

    if-eq p1, v0, :cond_1e

    const/16 v0, 0x20

    if-eq p1, v0, :cond_1e

    new-instance p0, Ljava/security/InvalidAlgorithmParameterException;

    shl-int/lit8 p1, p1, 0x3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "Invalid key size %d; only 128-bit and 256-bit AES keys are supported"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1e
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Ll45;->a:Ljava/lang/Object;

    return-void
.end method

.method public final Q(I)V
    .registers 3

    const/16 v0, 0xa

    if-lt p1, v0, :cond_f

    const/16 v0, 0x10

    if-lt v0, p1, :cond_f

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Ll45;->b:Ljava/lang/Object;

    return-void

    :cond_f
    new-instance p0, Ljava/security/GeneralSecurityException;

    const-string v0, "Invalid tag size for AesCmacParameters: "

    invoke-static {p1, v0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final R(Ld5o;Ljava/lang/String;J)Ljava/util/ArrayList;
    .registers 52

    move-object/from16 v0, p1

    new-instance v7, Ljava/util/ArrayList;

    iget-object v1, v0, Ld5o;->c:Ljava/lang/Object;

    check-cast v1, [Lzjh;

    iget-object v2, v0, Ld5o;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    array-length v1, v1

    invoke-direct {v7, v1}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v0, v0, Ld5o;->c:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, [Lzjh;

    array-length v9, v8

    const/4 v11, 0x0

    :goto_17
    if-ge v11, v9, :cond_5dd

    move-object v1, v2

    aget-object v2, v8, v11

    iget-object v12, v2, Lzjh;->r:Ljava/lang/String;

    iget-object v13, v2, Lzjh;->d:[Lzjh;

    iget-object v0, v2, Lzjh;->b:Ljava/lang/String;

    iget-object v15, v2, Lzjh;->r:Ljava/lang/String;

    iget-object v3, v2, Lzjh;->t:Ljava/lang/String;

    iget-object v4, v2, Lzjh;->m:Ljava/lang/String;

    iget-object v5, v2, Lzjh;->k:Lr05;

    iget-object v6, v2, Lzjh;->f:Lesg;

    iget-object v14, v2, Lzjh;->g:Ljava/lang/String;

    const/16 p1, 0x0

    iget-object v10, v2, Lzjh;->o:[Ljava/lang/String;

    move-object/from16 v34, v0

    iget-object v0, v2, Lzjh;->q:Ljava/lang/String;

    move-object/from16 v16, v0

    const-string v0, "normal"

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_5e

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v3, p2

    move-wide/from16 v4, p3

    invoke-virtual/range {v0 .. v6}, Ll45;->U(Ljava/lang/String;Lzjh;Ljava/lang/String;JLnb8;)Lmsh;

    move-result-object v2

    move-object/from16 v46, v1

    move-object/from16 v0, v46

    if-eqz v2, :cond_54

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_54
    move-object v1, v0

    move-object v2, v7

    move-object/from16 v43, v8

    move/from16 v44, v9

    move/from16 v45, v11

    goto/16 :goto_5d3

    :cond_5e
    move-object/from16 v17, v3

    move-object/from16 v18, v4

    move-object/from16 v43, v8

    move-object v3, v1

    move-object v4, v2

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    const-string v8, "hot_topic"

    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    move/from16 v44, v9

    const-string v9, "audios"

    move/from16 v45, v11

    const-string v11, "roundups"

    move-object/from16 v23, v8

    const-string v8, "top_news_group"

    move-object/from16 v20, v14

    const-string v14, "video_slides"

    move-object/from16 v21, v15

    const-string v15, "double_videos"

    move-object/from16 v24, v13

    const-string v13, "publishers"

    move-object/from16 v22, v0

    const-string v0, "roundup"

    move-object/from16 v25, v0

    const-string v0, "podcast"

    move-object/from16 v26, v0

    const/16 v27, 0x2

    const/16 v28, 0x1

    const/16 v29, 0x0

    if-nez v19, :cond_408

    const-string v0, "trending"

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_408

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_408

    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_408

    invoke-virtual {v12, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_408

    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_408

    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_408

    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_408

    const-string v0, "carousel"

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_408

    const-string v0, "multi_image"

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19f

    iget-object v0, v4, Lzjh;->i:Ljava/lang/String;

    if-eqz v16, :cond_194

    if-eqz v20, :cond_194

    if-eqz v0, :cond_194

    if-eqz v10, :cond_194

    array-length v8, v10

    const/4 v9, 0x3

    if-ne v8, v9, :cond_194

    aget-object v8, v10, p1

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_194

    aget-object v8, v10, v28

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_194

    aget-object v8, v10, v27

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_194

    aget-object v8, v10, p1

    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    if-eqz v8, :cond_194

    aget-object v9, v10, v28

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v35

    if-eqz v35, :cond_194

    aget-object v9, v10, v27

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v36

    if-eqz v36, :cond_194

    if-eqz v6, :cond_121

    iget-object v9, v6, Lesg;->b:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    iget-object v6, v6, Lesg;->c:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    move-object/from16 v28, v9

    goto :goto_125

    :cond_121
    move-object/from16 v6, v29

    move-object/from16 v28, v6

    :goto_125
    if-eqz v5, :cond_13a

    iget v9, v5, Lr05;->b:I

    iget v10, v5, Lr05;->c:I

    iget v11, v5, Lr05;->d:I

    iget-object v5, v5, Lr05;->e:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    move-object/from16 v33, v5

    move/from16 v30, v9

    move/from16 v31, v10

    move/from16 v32, v11

    goto :goto_142

    :cond_13a
    move/from16 v30, p1

    move/from16 v31, v30

    move/from16 v32, v31

    move-object/from16 v33, v29

    :goto_142
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_194

    sget-object v5, Lwqm;->a:[Ljava/lang/String;

    invoke-static/range {v18 .. v18}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v22

    invoke-static/range {v17 .. v17}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v23

    new-instance v14, Ljre;

    iget-object v15, v4, Lzjh;->q:Ljava/lang/String;

    iget-object v5, v4, Lzjh;->n:Ljava/lang/String;

    iget-object v9, v4, Lzjh;->h:Ljava/lang/String;

    invoke-static {v9}, Ll45;->T(Ljava/lang/String;)I

    move-result v19

    invoke-virtual {v1, v4}, Ll45;->q(Lzjh;)Landroid/net/Uri;

    move-result-object v20

    iget-wide v9, v4, Lzjh;->p:J

    invoke-static {v3, v4, v2}, Ll45;->S(Ljava/lang/String;Lzjh;Ljava/lang/String;)Lp12;

    move-result-object v37

    iget-object v11, v4, Lzjh;->C:Ljava/util/List;

    iget-object v12, v4, Lzjh;->D:Ljava/util/List;

    iget-object v13, v4, Lzjh;->l:Ljava/lang/String;

    move-object/from16 v16, v0

    iget-object v0, v1, Ll45;->c:Ljava/lang/Object;

    move-object/from16 v41, v0

    check-cast v41, Lqre;

    iget-object v0, v4, Lzjh;->F:Lxlg;

    move-object/from16 v17, v21

    move-object/from16 v21, v16

    move-object/from16 v16, v17

    move-wide/from16 v26, p3

    move-object/from16 v42, v0

    move-object/from16 v17, v5

    move-object/from16 v29, v6

    move-object/from16 v18, v8

    move-wide/from16 v24, v9

    move-object/from16 v38, v11

    move-object/from16 v39, v12

    move-object/from16 v40, v13

    invoke-direct/range {v14 .. v42}, Ljre;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;ILandroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Landroid/net/Uri;Landroid/net/Uri;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lqre;Lxlg;)V

    goto :goto_196

    :cond_194
    move-object/from16 v14, v29

    :goto_196
    if-eqz v14, :cond_19b

    invoke-virtual {v7, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_19b
    move-object v1, v3

    :cond_19c
    :goto_19c
    move-object v2, v7

    goto/16 :goto_5d3

    :cond_19f
    move-object/from16 v15, v21

    const-string v0, "image_gallery"

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v8, "mp4"

    const-string v9, "gif"

    if-nez v0, :cond_2c2

    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c2

    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c2

    const-string v0, "video"

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d1

    move-object v0, v1

    move-object v1, v3

    move-object v3, v2

    move-object v2, v4

    move-wide/from16 v4, p3

    invoke-virtual/range {v0 .. v5}, Ll45;->X(Ljava/lang/String;Lzjh;Ljava/lang/String;J)Lure;

    move-result-object v2

    if-eqz v2, :cond_19c

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_19c

    :cond_1d1
    move-object v1, v3

    move-object v2, v4

    move-object/from16 v10, v25

    move-object/from16 v6, v26

    const-string v0, "top_news"

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v3, p2

    move-wide/from16 v4, p3

    invoke-virtual/range {v0 .. v6}, Ll45;->W(Ljava/lang/String;Lzjh;Ljava/lang/String;JZ)Lrre;

    move-result-object v2

    if-eqz v2, :cond_19c

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_19c

    :cond_1f0
    move-object/from16 v0, p0

    move-object/from16 v3, p2

    const-string v4, "publisher"

    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_223

    iget-object v4, v2, Lzjh;->w:Lw9h;

    if-nez v4, :cond_203

    move-object/from16 v14, v29

    goto :goto_21c

    :cond_203
    new-instance v14, Lmre;

    iget-wide v4, v2, Lzjh;->p:J

    iget-object v6, v2, Lzjh;->w:Lw9h;

    invoke-static {v1, v2, v3}, Ll45;->S(Ljava/lang/String;Lzjh;Ljava/lang/String;)Lp12;

    move-result-object v21

    iget-object v2, v0, Ll45;->c:Ljava/lang/Object;

    move-object/from16 v22, v2

    check-cast v22, Lqre;

    move-wide/from16 v18, p3

    move-wide/from16 v16, v4

    move-object/from16 v20, v6

    invoke-direct/range {v14 .. v22}, Lmre;-><init>(Ljava/lang/String;JJLw9h;Lp12;Lqre;)V

    :goto_21c
    if-eqz v14, :cond_19c

    invoke-virtual {v7, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_19c

    :cond_223
    const-string v4, "insta_clip"

    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_258

    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_24f

    iget-object v4, v2, Lzjh;->x:Llog;

    if-eqz v4, :cond_24f

    new-instance v14, Ldre;

    iget-wide v4, v2, Lzjh;->p:J

    iget-object v6, v2, Lzjh;->x:Llog;

    invoke-static {v1, v2, v3}, Ll45;->S(Ljava/lang/String;Lzjh;Ljava/lang/String;)Lp12;

    move-result-object v21

    iget-object v2, v0, Ll45;->c:Ljava/lang/Object;

    move-object/from16 v22, v2

    check-cast v22, Lqre;

    move-wide/from16 v18, p3

    move-wide/from16 v16, v4

    move-object/from16 v20, v6

    invoke-direct/range {v14 .. v22}, Ldre;-><init>(Ljava/lang/String;JJLlog;Lp12;Lqre;)V

    goto :goto_251

    :cond_24f
    move-object/from16 v14, v29

    :goto_251
    if-eqz v14, :cond_19c

    invoke-virtual {v7, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_19c

    :cond_258
    invoke-virtual {v12, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_274

    iget-object v4, v2, Lzjh;->F:Lxlg;

    if-nez v4, :cond_265

    :goto_262
    move-object/from16 v0, v29

    goto :goto_26d

    :cond_265
    const/4 v6, 0x0

    move-wide/from16 v4, p3

    invoke-virtual/range {v0 .. v6}, Ll45;->U(Ljava/lang/String;Lzjh;Ljava/lang/String;JLnb8;)Lmsh;

    move-result-object v29

    goto :goto_262

    :goto_26d
    if-eqz v0, :cond_19c

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_19c

    :cond_274
    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28b

    move-object/from16 v0, p0

    move-object/from16 v3, p2

    move-wide/from16 v4, p3

    invoke-virtual/range {v0 .. v5}, Ll45;->V(Ljava/lang/String;Lzjh;Ljava/lang/String;J)Ld9i;

    move-result-object v2

    if-eqz v2, :cond_19c

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_19c

    :cond_28b
    move-object/from16 v0, p0

    move-object/from16 v3, p2

    const-string v4, "banner"

    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_19c

    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2b9

    iget-object v4, v2, Lzjh;->y:Ljb8;

    if-eqz v4, :cond_2b9

    new-instance v12, Lfre;

    iget-wide v13, v2, Lzjh;->p:J

    invoke-static {v1, v2, v3}, Ll45;->S(Ljava/lang/String;Lzjh;Ljava/lang/String;)Lp12;

    move-result-object v17

    iget-object v4, v0, Ll45;->c:Ljava/lang/Object;

    move-object/from16 v18, v4

    check-cast v18, Lqre;

    iget-object v2, v2, Lzjh;->y:Ljb8;

    move-wide/from16 v15, p3

    move-object/from16 v19, v2

    invoke-direct/range {v12 .. v19}, Lfre;-><init>(JJLp12;Lqre;Ljb8;)V

    goto :goto_2bb

    :cond_2b9
    move-object/from16 v12, v29

    :goto_2bb
    if-eqz v12, :cond_19c

    invoke-virtual {v7, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_19c

    :cond_2c2
    move-object v0, v1

    move-object v1, v3

    move-object v3, v2

    move-object v2, v4

    iget-object v4, v2, Lzjh;->u:[Lmw7;

    if-eqz v16, :cond_3ff

    if-eqz v20, :cond_3ff

    if-eqz v10, :cond_3ff

    array-length v11, v10

    const/4 v12, 0x3

    if-lt v11, v12, :cond_3ff

    aget-object v11, v10, p1

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_3ff

    aget-object v11, v10, v28

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_3ff

    aget-object v11, v10, v27

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_3ff

    if-eqz v4, :cond_3ff

    array-length v11, v4

    if-eqz v11, :cond_3ff

    new-instance v11, Ljava/util/ArrayList;

    array-length v12, v4

    invoke-direct {v11, v12}, Ljava/util/ArrayList;-><init>(I)V

    array-length v12, v4

    move/from16 v13, p1

    :goto_2f8
    if-ge v13, v12, :cond_36c

    aget-object v14, v4, v13

    move-object/from16 v19, v4

    if-eqz v14, :cond_360

    iget-object v4, v14, Lmw7;->c:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    move/from16 v16, v12

    iget v12, v14, Lmw7;->a:I

    if-lez v12, :cond_35d

    iget v12, v14, Lmw7;->b:I

    if-lez v12, :cond_35d

    iget-object v12, v14, Lmw7;->d:Ljava/lang/Object;

    check-cast v12, Ljava/lang/String;

    sget-object v20, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v12}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v36

    iget-object v12, v14, Lmw7;->e:Ljava/lang/Object;

    check-cast v12, Ljava/lang/String;

    invoke-static {v12}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v37

    iget-object v12, v14, Lmw7;->g:Ljava/io/Serializable;

    check-cast v12, Ljava/lang/String;

    invoke-static {v12}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v38

    move-object/from16 v12, v22

    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_333

    if-nez v36, :cond_344

    goto :goto_363

    :cond_333
    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_33c

    if-nez v37, :cond_344

    goto :goto_363

    :cond_33c
    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_363

    if-eqz v37, :cond_363

    :cond_344
    new-instance v35, Lhre;

    iget-object v4, v14, Lmw7;->f:Ljava/io/Serializable;

    move-object/from16 v39, v4

    check-cast v39, Ljava/lang/String;

    iget v4, v14, Lmw7;->a:I

    iget v14, v14, Lmw7;->b:I

    move/from16 v40, v4

    move/from16 v41, v14

    invoke-direct/range {v35 .. v41}, Lhre;-><init>(Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Ljava/lang/String;II)V

    move-object/from16 v4, v35

    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_363

    :cond_35d
    :goto_35d
    move-object/from16 v12, v22

    goto :goto_363

    :cond_360
    move/from16 v16, v12

    goto :goto_35d

    :cond_363
    :goto_363
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v22, v12

    move/from16 v12, v16

    move-object/from16 v4, v19

    goto :goto_2f8

    :cond_36c
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3ff

    new-instance v4, Ljava/util/ArrayList;

    array-length v8, v10

    invoke-direct {v4, v8}, Ljava/util/ArrayList;-><init>(I)V

    array-length v8, v10

    move/from16 v9, p1

    :goto_37b
    if-ge v9, v8, :cond_38d

    aget-object v12, v10, v9

    sget-object v13, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v12}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    if-eqz v12, :cond_38a

    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_38a
    add-int/lit8 v9, v9, 0x1

    goto :goto_37b

    :cond_38d
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3ff

    if-eqz v6, :cond_3a2

    iget-object v8, v6, Lesg;->b:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    iget-object v6, v6, Lesg;->c:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    move-object/from16 v25, v6

    move-object/from16 v24, v8

    goto :goto_3a6

    :cond_3a2
    move-object/from16 v24, v29

    move-object/from16 v25, v24

    :goto_3a6
    if-eqz v5, :cond_3bb

    iget v6, v5, Lr05;->b:I

    iget v8, v5, Lr05;->c:I

    iget v9, v5, Lr05;->d:I

    iget-object v5, v5, Lr05;->e:Ljava/lang/Object;

    move-object/from16 v29, v5

    check-cast v29, Ljava/util/ArrayList;

    move/from16 v26, v6

    move/from16 v27, v8

    move/from16 v28, v9

    goto :goto_3c1

    :cond_3bb
    move/from16 v26, p1

    move/from16 v27, v26

    move/from16 v28, v27

    :goto_3c1
    sget-object v5, Lwqm;->a:[Ljava/lang/String;

    invoke-static/range {v18 .. v18}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v18

    invoke-static/range {v17 .. v17}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    new-instance v14, Lire;

    move-object/from16 v16, v15

    iget-object v15, v2, Lzjh;->q:Ljava/lang/String;

    iget-object v5, v2, Lzjh;->n:Ljava/lang/String;

    iget-wide v8, v2, Lzjh;->p:J

    invoke-static {v1, v2, v3}, Ll45;->S(Ljava/lang/String;Lzjh;Ljava/lang/String;)Lp12;

    move-result-object v33

    iget-object v6, v2, Lzjh;->C:Ljava/util/List;

    iget-object v10, v2, Lzjh;->D:Ljava/util/List;

    iget-object v12, v2, Lzjh;->l:Ljava/lang/String;

    iget-object v13, v0, Ll45;->c:Ljava/lang/Object;

    move-object/from16 v37, v13

    check-cast v37, Lqre;

    iget-object v2, v2, Lzjh;->F:Lxlg;

    move-wide/from16 v22, p3

    move-object/from16 v38, v2

    move-object/from16 v31, v4

    move-object/from16 v17, v5

    move-wide/from16 v20, v8

    move-object/from16 v35, v10

    move-object/from16 v32, v11

    move-object/from16 v36, v12

    move-object/from16 v30, v34

    move-object/from16 v34, v6

    invoke-direct/range {v14 .. v38}, Lire;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lqre;Lxlg;)V

    goto :goto_401

    :cond_3ff
    move-object/from16 v14, v29

    :goto_401
    if-eqz v14, :cond_19c

    invoke-virtual {v7, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_19c

    :cond_408
    move-object v0, v1

    move-object v1, v3

    move-object/from16 v10, v25

    move-object/from16 v6, v26

    const/16 v19, 0x3

    move-object v3, v2

    move-object v2, v4

    move-object/from16 v25, v21

    if-eqz v24, :cond_5c8

    move-object/from16 v4, v24

    array-length v5, v4

    if-eqz v5, :cond_5c8

    if-eqz v16, :cond_5c8

    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    array-length v5, v4

    move-object/from16 v24, v7

    move/from16 v7, p1

    :goto_427
    if-ge v7, v5, :cond_59d

    aget-object v16, v4, v7

    invoke-virtual {v12}, Ljava/lang/String;->hashCode()I

    move-result v17

    const/16 v18, -0x1

    sparse-switch v17, :sswitch_data_5e0

    goto :goto_46c

    :sswitch_435
    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_46c

    const/16 v17, 0x5

    goto :goto_446

    :sswitch_43e
    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_46c

    const/16 v17, 0x4

    :goto_446
    move/from16 v18, v17

    goto :goto_46c

    :sswitch_449
    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_46c

    move/from16 v18, v19

    goto :goto_46c

    :sswitch_452
    invoke-virtual {v12, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_46c

    move/from16 v18, v27

    goto :goto_46c

    :sswitch_45b
    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_46c

    move/from16 v18, v28

    goto :goto_46c

    :sswitch_464
    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_46c

    move/from16 v18, p1

    :cond_46c
    :goto_46c
    packed-switch v18, :pswitch_data_5fa

    move-object/from16 v26, v6

    iget-object v6, v2, Lzjh;->z:Lnb8;

    move/from16 v32, v5

    move/from16 v30, v7

    move-object/from16 v31, v8

    move-object/from16 v33, v9

    move/from16 v34, v19

    move-object/from16 v8, v21

    move-object/from16 v9, v26

    move-object v7, v2

    move-object/from16 v26, v4

    move-object/from16 v2, v16

    move-wide/from16 v4, p3

    invoke-virtual/range {v0 .. v6}, Ll45;->U(Ljava/lang/String;Lzjh;Ljava/lang/String;JLnb8;)Lmsh;

    move-result-object v2

    move-object/from16 v35, v14

    move-object/from16 v36, v15

    goto/16 :goto_57e

    :pswitch_492
    move-object/from16 v26, v4

    move/from16 v32, v5

    move/from16 v30, v7

    move-object/from16 v31, v8

    move-object/from16 v33, v9

    move/from16 v34, v19

    move-object/from16 v8, v21

    move-object v7, v2

    move-object v9, v6

    move-object/from16 v2, v16

    iget-object v4, v2, Lzjh;->w:Lw9h;

    if-nez v4, :cond_4ae

    move-object/from16 v35, v14

    move-object/from16 v36, v15

    goto/16 :goto_55a

    :cond_4ae
    move-object v4, v14

    new-instance v14, Lmre;

    move-object v5, v15

    iget-object v15, v2, Lzjh;->r:Ljava/lang/String;

    move-object v6, v4

    move-object/from16 v16, v5

    iget-wide v4, v2, Lzjh;->p:J

    move-wide/from16 v17, v4

    iget-object v4, v2, Lzjh;->w:Lw9h;

    invoke-static {v1, v2, v3}, Ll45;->S(Ljava/lang/String;Lzjh;Ljava/lang/String;)Lp12;

    move-result-object v21

    iget-object v2, v0, Ll45;->c:Ljava/lang/Object;

    move-object/from16 v22, v2

    check-cast v22, Lqre;

    move-object/from16 v20, v4

    move-object/from16 v35, v6

    move-object/from16 v36, v16

    move-wide/from16 v16, v17

    move-wide/from16 v18, p3

    invoke-direct/range {v14 .. v22}, Lmre;-><init>(Ljava/lang/String;JJLw9h;Lp12;Lqre;)V

    move-object v2, v14

    goto/16 :goto_57e

    :pswitch_4d7
    move-object/from16 v26, v4

    move/from16 v32, v5

    move/from16 v30, v7

    move-object/from16 v31, v8

    move-object/from16 v33, v9

    move-object/from16 v35, v14

    move-object/from16 v36, v15

    move/from16 v34, v19

    move-object/from16 v8, v21

    move-wide/from16 v4, p3

    move-object v7, v2

    move-object v9, v6

    move-object/from16 v2, v16

    invoke-virtual/range {v0 .. v5}, Ll45;->V(Ljava/lang/String;Lzjh;Ljava/lang/String;J)Ld9i;

    move-result-object v2

    :goto_4f3
    move-object/from16 v0, p0

    goto/16 :goto_57e

    :pswitch_4f7
    move-object/from16 v26, v4

    move/from16 v32, v5

    move/from16 v30, v7

    move-object/from16 v31, v8

    move-object/from16 v33, v9

    move-object/from16 v35, v14

    move-object/from16 v36, v15

    move/from16 v34, v19

    move-object/from16 v8, v21

    move-wide/from16 v4, p3

    move-object v7, v2

    move-object v9, v6

    move-object/from16 v2, v16

    invoke-virtual/range {v0 .. v5}, Ll45;->X(Ljava/lang/String;Lzjh;Ljava/lang/String;J)Lure;

    move-result-object v2

    goto :goto_4f3

    :pswitch_514
    move-object/from16 v26, v4

    move/from16 v32, v5

    move/from16 v30, v7

    move-object/from16 v31, v8

    move-object/from16 v33, v9

    move-object/from16 v35, v14

    move-object/from16 v36, v15

    move/from16 v34, v19

    move-object/from16 v8, v21

    move-object v7, v2

    move-object v9, v6

    move-object/from16 v2, v16

    iget-object v0, v2, Lzjh;->r:Ljava/lang/String;

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_545

    iget-object v0, v2, Lzjh;->F:Lxlg;

    if-nez v0, :cond_539

    move-object/from16 v2, v29

    goto :goto_4f3

    :cond_539
    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v3, p2

    move-wide/from16 v4, p3

    invoke-virtual/range {v0 .. v6}, Ll45;->U(Ljava/lang/String;Lzjh;Ljava/lang/String;JLnb8;)Lmsh;

    move-result-object v2

    goto :goto_4f3

    :cond_545
    iget-object v0, v2, Lzjh;->r:Ljava/lang/String;

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_558

    move-object/from16 v0, p0

    move-object/from16 v3, p2

    move-wide/from16 v4, p3

    invoke-virtual/range {v0 .. v5}, Ll45;->V(Ljava/lang/String;Lzjh;Ljava/lang/String;J)Ld9i;

    move-result-object v2

    goto :goto_57e

    :cond_558
    move-object/from16 v0, p0

    :goto_55a
    move-object/from16 v2, v29

    goto :goto_57e

    :pswitch_55d
    move-object/from16 v26, v4

    move/from16 v32, v5

    move/from16 v30, v7

    move-object/from16 v31, v8

    move-object/from16 v33, v9

    move-object/from16 v35, v14

    move-object/from16 v36, v15

    move/from16 v34, v19

    move-object/from16 v8, v21

    move-object v7, v2

    move-object v9, v6

    move-object/from16 v2, v16

    const/4 v6, 0x1

    move-object/from16 v0, p0

    move-object/from16 v3, p2

    move-wide/from16 v4, p3

    invoke-virtual/range {v0 .. v6}, Ll45;->W(Ljava/lang/String;Lzjh;Ljava/lang/String;JZ)Lrre;

    move-result-object v2

    :goto_57e
    if-eqz v2, :cond_583

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_583
    add-int/lit8 v2, v30, 0x1

    move-object v3, v7

    move v7, v2

    move-object v2, v3

    move-object/from16 v3, p2

    move-object/from16 v21, v8

    move-object v6, v9

    move-object/from16 v4, v26

    move-object/from16 v8, v31

    move/from16 v5, v32

    move-object/from16 v9, v33

    move/from16 v19, v34

    move-object/from16 v14, v35

    move-object/from16 v15, v36

    goto/16 :goto_427

    :cond_59d
    move-object v7, v2

    move-object/from16 v8, v21

    move-object/from16 v2, v23

    invoke-virtual {v12, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5aa

    iget-object v12, v7, Lzjh;->e:Ljava/lang/String;

    :cond_5aa
    move-object/from16 v16, v12

    new-instance v14, Lere;

    iget-object v15, v7, Lzjh;->q:Ljava/lang/String;

    iget-object v2, v7, Lzjh;->c:Ljava/lang/String;

    iget-object v3, v0, Ll45;->c:Ljava/lang/Object;

    move-object/from16 v20, v3

    check-cast v20, Lqre;

    iget-object v3, v7, Lzjh;->z:Lnb8;

    const/16 v17, 0x0

    move-object/from16 v18, v2

    move-object/from16 v22, v3

    move-object/from16 v21, v8

    move-object/from16 v19, v25

    invoke-direct/range {v14 .. v22}, Lere;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lqre;Ljava/util/ArrayList;Lnb8;)V

    goto :goto_5cc

    :cond_5c8
    move-object/from16 v24, v7

    move-object/from16 v14, v29

    :goto_5cc
    move-object/from16 v2, v24

    if-eqz v14, :cond_5d3

    invoke-virtual {v2, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5d3
    :goto_5d3
    add-int/lit8 v11, v45, 0x1

    move-object v7, v2

    move-object/from16 v8, v43

    move/from16 v9, v44

    move-object v2, v1

    goto/16 :goto_17

    :cond_5dd
    move-object v2, v7

    return-object v2

    nop

    :sswitch_data_5e0
    .sparse-switch
        -0x7275e8c3 -> :sswitch_464
        -0x53da20a3 -> :sswitch_45b
        -0x2d8eda -> :sswitch_452
        -0x1ff16 -> :sswitch_449
        0xb503f86 -> :sswitch_43e
        0x726e9df7 -> :sswitch_435
    .end sparse-switch

    :pswitch_data_5fa
    .packed-switch 0x0
        :pswitch_55d
        :pswitch_514
        :pswitch_4f7
        :pswitch_4d7
        :pswitch_4f7
        :pswitch_492
    .end packed-switch
.end method

.method public final U(Ljava/lang/String;Lzjh;Ljava/lang/String;JLnb8;)Lmsh;
    .registers 41

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-object v2, v1, Lzjh;->q:Ljava/lang/String;

    iget-object v3, v1, Lzjh;->o:[Ljava/lang/String;

    iget-object v4, v1, Lzjh;->i:Ljava/lang/String;

    const/4 v5, 0x0

    if-eqz v2, :cond_ad

    iget-object v2, v1, Lzjh;->g:Ljava/lang/String;

    if-eqz v2, :cond_ad

    if-eqz v4, :cond_ad

    if-eqz v3, :cond_ad

    array-length v2, v3

    if-eqz v2, :cond_ad

    const/4 v2, 0x0

    aget-object v6, v3, v2

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_ad

    aget-object v3, v3, v2

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    if-eqz v10, :cond_ad

    iget-object v3, v1, Lzjh;->f:Lesg;

    if-eqz v3, :cond_3a

    iget-object v6, v3, Lesg;->b:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    iget-object v3, v3, Lesg;->c:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    move-object/from16 v21, v3

    move-object/from16 v20, v6

    goto :goto_3e

    :cond_3a
    move-object/from16 v20, v5

    move-object/from16 v21, v20

    :goto_3e
    iget-object v3, v1, Lzjh;->k:Lr05;

    if-eqz v3, :cond_55

    iget v2, v3, Lr05;->b:I

    iget v6, v3, Lr05;->c:I

    iget v7, v3, Lr05;->d:I

    iget-object v3, v3, Lr05;->e:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    move/from16 v22, v2

    move-object/from16 v25, v3

    move/from16 v23, v6

    move/from16 v24, v7

    goto :goto_5d

    :cond_55
    move/from16 v22, v2

    move/from16 v23, v22

    move/from16 v24, v23

    move-object/from16 v25, v5

    :goto_5d
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    if-eqz v13, :cond_ad

    iget-object v2, v1, Lzjh;->m:Ljava/lang/String;

    sget-object v3, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v2}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v14

    iget-object v2, v1, Lzjh;->t:Ljava/lang/String;

    invoke-static {v2}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v15

    new-instance v6, Lmsh;

    iget-object v7, v1, Lzjh;->q:Ljava/lang/String;

    iget-object v8, v1, Lzjh;->r:Ljava/lang/String;

    iget-object v9, v1, Lzjh;->n:Ljava/lang/String;

    iget-object v2, v1, Lzjh;->h:Ljava/lang/String;

    invoke-static {v2}, Ll45;->T(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {v0, v1}, Ll45;->q(Lzjh;)Landroid/net/Uri;

    move-result-object v12

    iget-wide v2, v1, Lzjh;->p:J

    iget-object v4, v1, Lzjh;->b:Ljava/lang/String;

    invoke-static/range {p1 .. p3}, Ll45;->S(Ljava/lang/String;Lzjh;Ljava/lang/String;)Lp12;

    move-result-object v27

    iget-object v5, v1, Lzjh;->C:Ljava/util/List;

    move-wide/from16 v16, v2

    iget-object v2, v1, Lzjh;->D:Ljava/util/List;

    iget-object v3, v1, Lzjh;->l:Ljava/lang/String;

    iget-object v0, v0, Ll45;->c:Ljava/lang/Object;

    move-object/from16 v31, v0

    check-cast v31, Lqre;

    iget-object v0, v1, Lzjh;->F:Lxlg;

    move-wide/from16 v18, p4

    move-object/from16 v33, p6

    move-object/from16 v32, v0

    move-object/from16 v29, v2

    move-object/from16 v30, v3

    move-object/from16 v26, v4

    move-object/from16 v28, v5

    invoke-direct/range {v6 .. v33}, Lmsh;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;ILandroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lqre;Lxlg;Lnb8;)V

    return-object v6

    :cond_ad
    return-object v5
.end method

.method public final V(Ljava/lang/String;Lzjh;Ljava/lang/String;J)Ld9i;
    .registers 22

    move-object/from16 v0, p2

    iget-object v1, v0, Lzjh;->q:Ljava/lang/String;

    iget-object v2, v0, Lzjh;->F:Lxlg;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_44

    if-eqz v2, :cond_44

    new-instance v3, Ld9i;

    iget-object v4, v0, Lzjh;->q:Ljava/lang/String;

    iget-object v5, v0, Lzjh;->n:Ljava/lang/String;

    iget-object v1, v2, Lxlg;->c:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v1}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    iget-object v1, v0, Lzjh;->m:Ljava/lang/String;

    invoke-static {v1}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    iget-wide v8, v0, Lzjh;->p:J

    iget-object v1, v0, Lzjh;->t:Ljava/lang/String;

    invoke-static {v1}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    invoke-static/range {p1 .. p3}, Ll45;->S(Ljava/lang/String;Lzjh;Ljava/lang/String;)Lp12;

    move-result-object v13

    move-object/from16 v1, p0

    iget-object v1, v1, Ll45;->c:Ljava/lang/Object;

    move-object v14, v1

    check-cast v14, Lqre;

    iget-object v15, v0, Lzjh;->F:Lxlg;

    move-wide/from16 v10, p4

    invoke-direct/range {v3 .. v15}, Ld9i;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Landroid/net/Uri;JJLandroid/net/Uri;Lp12;Lqre;Lxlg;)V

    return-object v3

    :cond_44
    const/4 v0, 0x0

    return-object v0
.end method

.method public final W(Ljava/lang/String;Lzjh;Ljava/lang/String;JZ)Lrre;
    .registers 43

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-object v2, v1, Lzjh;->q:Ljava/lang/String;

    iget-object v3, v1, Lzjh;->A:Ljava/lang/String;

    iget-object v4, v1, Lzjh;->o:[Ljava/lang/String;

    iget-object v5, v1, Lzjh;->i:Ljava/lang/String;

    const/4 v6, 0x0

    if-eqz v2, :cond_bc

    iget-object v2, v1, Lzjh;->g:Ljava/lang/String;

    if-eqz v2, :cond_bc

    if-eqz v5, :cond_bc

    if-eqz v4, :cond_bc

    array-length v2, v4

    if-eqz v2, :cond_bc

    const/4 v2, 0x0

    aget-object v7, v4, v2

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_bc

    if-eqz v3, :cond_bc

    aget-object v4, v4, v2

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    if-eqz v11, :cond_bc

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v28

    if-eqz v28, :cond_bc

    iget-object v3, v1, Lzjh;->B:Ljava/lang/String;

    sget-object v4, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v3}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    iget-object v3, v1, Lzjh;->f:Lesg;

    if-eqz v3, :cond_4b

    iget-object v4, v3, Lesg;->b:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget-object v3, v3, Lesg;->c:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    move-object/from16 v22, v3

    move-object/from16 v21, v4

    goto :goto_4f

    :cond_4b
    move-object/from16 v21, v6

    move-object/from16 v22, v21

    :goto_4f
    iget-object v3, v1, Lzjh;->k:Lr05;

    if-eqz v3, :cond_66

    iget v2, v3, Lr05;->b:I

    iget v4, v3, Lr05;->c:I

    iget v7, v3, Lr05;->d:I

    iget-object v3, v3, Lr05;->e:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    move/from16 v23, v2

    move-object/from16 v26, v3

    move/from16 v24, v4

    move/from16 v25, v7

    goto :goto_6e

    :cond_66
    move/from16 v23, v2

    move/from16 v24, v23

    move/from16 v25, v24

    move-object/from16 v26, v6

    :goto_6e
    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v14

    if-eqz v14, :cond_bc

    iget-object v2, v1, Lzjh;->m:Ljava/lang/String;

    invoke-static {v2}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v15

    iget-object v2, v1, Lzjh;->t:Ljava/lang/String;

    invoke-static {v2}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v16

    new-instance v7, Lrre;

    iget-object v8, v1, Lzjh;->q:Ljava/lang/String;

    iget-object v9, v1, Lzjh;->r:Ljava/lang/String;

    iget-object v10, v1, Lzjh;->n:Ljava/lang/String;

    iget-object v2, v1, Lzjh;->h:Ljava/lang/String;

    invoke-static {v2}, Ll45;->T(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v0, v1}, Ll45;->q(Lzjh;)Landroid/net/Uri;

    move-result-object v13

    iget-wide v2, v1, Lzjh;->p:J

    iget-object v4, v1, Lzjh;->b:Ljava/lang/String;

    invoke-static/range {p1 .. p3}, Ll45;->S(Ljava/lang/String;Lzjh;Ljava/lang/String;)Lp12;

    move-result-object v29

    iget-object v5, v1, Lzjh;->C:Ljava/util/List;

    iget-object v6, v1, Lzjh;->D:Ljava/util/List;

    move-wide/from16 v17, v2

    iget-object v2, v1, Lzjh;->l:Ljava/lang/String;

    iget-object v0, v0, Ll45;->c:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Lqre;

    iget-object v0, v1, Lzjh;->F:Lxlg;

    move-wide/from16 v19, p4

    move/from16 v33, p6

    move-object/from16 v35, v0

    move-object/from16 v32, v2

    move-object/from16 v27, v4

    move-object/from16 v30, v5

    move-object/from16 v31, v6

    invoke-direct/range {v7 .. v35}, Lrre;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;ILandroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Landroid/net/Uri;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;ZLqre;Lxlg;)V

    return-object v7

    :cond_bc
    return-object v6
.end method

.method public final X(Ljava/lang/String;Lzjh;Ljava/lang/String;J)Lure;
    .registers 48

    move-object/from16 v0, p2

    iget-object v1, v0, Lzjh;->q:Ljava/lang/String;

    iget-object v2, v0, Lzjh;->v:Lh4n;

    iget-object v3, v0, Lzjh;->i:Ljava/lang/String;

    iget-object v4, v0, Lzjh;->o:[Ljava/lang/String;

    const/4 v5, 0x0

    if-eqz v1, :cond_db

    iget-object v1, v0, Lzjh;->g:Ljava/lang/String;

    if-eqz v1, :cond_db

    if-eqz v3, :cond_db

    if-eqz v4, :cond_db

    array-length v1, v4

    if-eqz v1, :cond_db

    const/4 v1, 0x0

    aget-object v6, v4, v1

    if-eqz v6, :cond_db

    if-eqz v2, :cond_db

    new-instance v6, Ljava/util/ArrayList;

    array-length v7, v4

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    array-length v7, v4

    move v8, v1

    :goto_27
    if-ge v8, v7, :cond_39

    aget-object v9, v4, v8

    sget-object v10, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v9}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    if-eqz v9, :cond_36

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_36
    add-int/lit8 v8, v8, 0x1

    goto :goto_27

    :cond_39
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_db

    iget-object v4, v0, Lzjh;->f:Lesg;

    if-eqz v4, :cond_50

    iget-object v7, v4, Lesg;->b:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    iget-object v4, v4, Lesg;->c:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    move-object/from16 v19, v4

    move-object/from16 v18, v7

    goto :goto_54

    :cond_50
    move-object/from16 v18, v5

    move-object/from16 v19, v18

    :goto_54
    iget-object v4, v0, Lzjh;->k:Lr05;

    if-eqz v4, :cond_6b

    iget v1, v4, Lr05;->b:I

    iget v7, v4, Lr05;->c:I

    iget v8, v4, Lr05;->d:I

    iget-object v4, v4, Lr05;->e:Ljava/lang/Object;

    check-cast v4, Ljava/util/ArrayList;

    move/from16 v20, v1

    move-object/from16 v23, v4

    move/from16 v21, v7

    move/from16 v22, v8

    goto :goto_73

    :cond_6b
    move/from16 v20, v1

    move/from16 v21, v20

    move/from16 v22, v21

    move-object/from16 v23, v5

    :goto_73
    iget-object v1, v0, Lzjh;->m:Ljava/lang/String;

    sget-object v4, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v1}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    iget-object v1, v0, Lzjh;->t:Ljava/lang/String;

    invoke-static {v1}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    if-eqz v11, :cond_db

    iget-object v1, v0, Lzjh;->A:Ljava/lang/String;

    invoke-static {v1}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v34

    new-instance v7, Lure;

    iget-object v8, v0, Lzjh;->q:Ljava/lang/String;

    iget-object v9, v0, Lzjh;->r:Ljava/lang/String;

    iget-object v10, v0, Lzjh;->n:Ljava/lang/String;

    iget-wide v14, v0, Lzjh;->p:J

    iget-object v1, v0, Lzjh;->b:Ljava/lang/String;

    iget-wide v3, v2, Lh4n;->a:J

    move-wide/from16 v26, v3

    iget-wide v3, v2, Lh4n;->b:J

    iget v5, v2, Lh4n;->c:I

    move-object/from16 v24, v1

    iget v1, v2, Lh4n;->d:I

    move/from16 v31, v1

    iget v1, v2, Lh4n;->e:I

    move/from16 v32, v1

    iget v1, v2, Lh4n;->f:I

    iget v2, v2, Lh4n;->g:I

    move/from16 v33, v1

    iget-object v1, v0, Lzjh;->w:Lw9h;

    invoke-static/range {p1 .. p3}, Ll45;->S(Ljava/lang/String;Lzjh;Ljava/lang/String;)Lp12;

    move-result-object v37

    move-object/from16 v36, v1

    iget-object v1, v0, Lzjh;->C:Ljava/util/List;

    move-object/from16 v38, v1

    iget-object v1, v0, Lzjh;->D:Ljava/util/List;

    iget-object v0, v0, Lzjh;->l:Ljava/lang/String;

    move-object/from16 v40, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Ll45;->c:Ljava/lang/Object;

    move-object/from16 v41, v0

    check-cast v41, Lqre;

    move-wide/from16 v16, p4

    move-object/from16 v39, v1

    move/from16 v35, v2

    move-wide/from16 v28, v3

    move/from16 v30, v5

    move-object/from16 v25, v6

    invoke-direct/range {v7 .. v41}, Lure;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;IIILjava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;JJIIIILandroid/net/Uri;ILw9h;Lp12;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lqre;)V

    return-object v7

    :cond_db
    return-object v5
.end method

.method public final a()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final b()Z
    .registers 2

    iget-object p0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p0, :cond_1a

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_1a

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {v0, p0}, Ljz4;->n(Lcom/opera/android/browser/chromium/ChromiumContent;)Z

    move-result p0

    if-eqz p0, :cond_1c

    :cond_1a
    const/4 p0, 0x0

    return p0

    :cond_1c
    const/4 p0, 0x1

    return p0
.end method

.method public final c()V
    .registers 5

    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-virtual {p0}, Ll45;->J()Ljava/util/HashSet;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v2, Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    const-string v3, "upload.stamps"

    invoke-virtual {p0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v3, ","

    invoke-static {v3, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, p0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    monitor-exit v0

    return-void

    :goto_39
    monitor-exit v0
    :try_end_3a
    .catchall {:try_start_3 .. :try_end_3a} :catchall_3b

    throw p0

    :catchall_3b
    move-exception p0

    goto :goto_39
.end method

.method public final d()Z
    .registers 2

    invoke-virtual {p0}, Ll45;->J()Ljava/util/HashSet;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    move-result p0

    const/16 v0, 0xa

    if-lt p0, v0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final destroy()V
    .registers 2

    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v0, Landroid/media/AudioManager;

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Lvf2;

    invoke-virtual {v0, p0}, Landroid/media/AudioManager;->unregisterAudioDeviceCallback(Landroid/media/AudioDeviceCallback;)V

    return-void
.end method

.method public final e(Lpna;Ljava/lang/Object;)V
    .registers 6

    check-cast p2, Lm45;

    new-instance p0, Lk45;

    iget-object v0, p2, Lm45;->a:Ljf2;

    iget-object v0, p2, Lm45;->b:Ljava/lang/Object;

    invoke-direct {p0, p1, v0}, Lk45;-><init>(Lpna;Ljava/lang/Object;)V

    iget-object v0, p2, Lm45;->c:Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lk45;->d:Lnd3;

    iput-object v0, p2, Lm45;->d:Lkotlin/jvm/functions/Function0;

    iget-object p0, p0, Lk45;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 v0, 0x0

    :goto_1b
    if-ge v0, p2, :cond_2d

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    check-cast v1, Ljga;

    iget-object v2, v1, Ljga;->a:Lf45;

    iget-object v1, v1, Ljga;->b:Lkuk;

    invoke-interface {v2, p1, v1}, Lf45;->m(Lpna;Lkuk;)V

    goto :goto_1b

    :cond_2d
    return-void
.end method

.method public final getKey()Ljf2;
    .registers 1

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Ljf2;

    return-object p0
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v0, :cond_28

    invoke-virtual {v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->p()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_17

    return-object v1

    :cond_17
    invoke-virtual {v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->r()Ljava/lang/String;

    move-result-object v0

    const-string v1, "article_share_url"

    invoke-static {v0, v1}, Lcom/opera/android/browser/UrlMangler;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_28

    return-object v0

    :cond_28
    iget-object p0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final h()Ln20;
    .registers 4

    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    const/4 v1, 0x0

    if-eqz v0, :cond_35

    iget-object v2, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    if-eqz v2, :cond_2f

    iget-object v2, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v2, Lm20;

    if-eqz v2, :cond_29

    new-instance v1, Ln20;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v2, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Lm20;

    invoke-direct {v1, v0, v2, p0}, Ln20;-><init>(IILm20;)V

    return-object v1

    :cond_29
    const-string p0, "variant not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_2f
    const-string p0, "tag size not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_35
    const-string p0, "key size not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1
.end method

.method public final i()V
    .registers 13

    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lchb;

    iget-object v0, v2, Lbzo;->d:Lw06;

    iget-object v1, p0, Ll45;->c:Ljava/lang/Object;

    move-object v9, v1

    check-cast v9, Lq00;

    invoke-virtual {v0}, Lw06;->d()Z

    move-result v1

    if-nez v1, :cond_3e

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ls00;->q(Lw06;I)Z

    move-result v1

    if-eqz v1, :cond_3e

    new-instance v1, Lh10;

    iget-object p0, p0, Ll45;->b:Ljava/lang/Object;

    move-object v3, p0

    check-cast v3, Ljava/lang/String;

    iget-object v4, v9, Lk43;->d:Ldl;

    new-instance v5, Lp00;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    sget p0, Ls00;->w:I

    add-int/lit8 v6, p0, 0x1

    sput v6, Ls00;->w:I

    iget-object p0, v9, Lq00;->l:Ls00;

    iget-object v7, p0, Lbqi;->h:Li3j;

    iget-wide v10, v2, Lbzo;->e:D

    invoke-static {v10, v11}, Lap;->a(D)Lap;

    move-result-object v8

    invoke-direct/range {v1 .. v8}, Lh10;-><init>(Lchb;Ljava/lang/String;Ldl;Lp00;ILi3j;Lap;)V

    invoke-virtual {v9, v1}, Lk43;->d(Laqi;)V

    return-void

    :cond_3e
    invoke-static {v0}, Ls00;->p(Lw06;)Lv50;

    move-result-object v7

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "Unsupported type #"

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-byte v0, v7, Lv50;->a:B

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v4, 0x0

    move-object v3, v9

    invoke-virtual/range {v3 .. v8}, Lk43;->b(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    return-void
.end method

.method public final j(II)Z
    .registers 4

    invoke-virtual {p0}, Ll45;->b()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    iget-object p0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-static {p0, p1, p2}, LJ/N;->M$0a8QHM(Ljava/lang/Object;II)Z

    move-result p0

    return p0
.end method

.method public final k(Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;
    .registers 4

    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lm45;

    iget-object v1, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v1, Ljf2;

    iget-object p0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    invoke-direct {p1, v1, v0, p0}, Lm45;-><init>(Ljf2;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)V

    return-object p1
.end method

.method public final l()Ln40;
    .registers 5

    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v0, Ls40;

    const/4 v1, 0x0

    if-eqz v0, :cond_92

    iget-object v2, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v2, Li4d;

    if-eqz v2, :cond_92

    iget v3, v0, Ls40;->a:I

    iget-object v2, v2, Li4d;->b:Ljava/lang/Object;

    check-cast v2, Lm54;

    iget-object v2, v2, Lm54;->a:[B

    array-length v2, v2

    if-ne v3, v2, :cond_8c

    invoke-virtual {v0}, Ls40;->a()Z

    move-result v0

    if-eqz v0, :cond_2a

    iget-object v0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_2a

    const-string p0, "Cannot create key without ID requirement with parameters with ID requirement"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_2a
    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v0, Ls40;

    invoke-virtual {v0}, Ls40;->a()Z

    move-result v0

    if-nez v0, :cond_40

    iget-object v0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_40

    const-string p0, "Cannot create key with ID requirement with parameters without ID requirement"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_40
    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v0, Ls40;

    iget-object v0, v0, Ls40;->b:Lr40;

    sget-object v2, Lr40;->e:Lr40;

    if-ne v0, v2, :cond_4d

    sget-object v0, Ljuf;->a:Lm54;

    goto :goto_6e

    :cond_4d
    sget-object v2, Lr40;->d:Lr40;

    if-ne v0, v2, :cond_5e

    iget-object v0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Ljuf;->a(I)Lm54;

    move-result-object v0

    goto :goto_6e

    :cond_5e
    sget-object v2, Lr40;->c:Lr40;

    if-ne v0, v2, :cond_80

    iget-object v0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Ljuf;->b(I)Lm54;

    move-result-object v0

    :goto_6e
    new-instance v1, Ln40;

    iget-object v2, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v2, Ls40;

    iget-object v3, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v3, Li4d;

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    invoke-direct {v1, v2, v3, v0, p0}, Ln40;-><init>(Ls40;Li4d;Lm54;Ljava/lang/Integer;)V

    return-object v1

    :cond_80
    iget-object p0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast p0, Ls40;

    iget-object p0, p0, Ls40;->b:Lr40;

    const-string v0, "Unknown AesGcmSivParameters.Variant: "

    invoke-static {p0, v0}, Lj9h;->u(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v1

    :cond_8c
    const-string p0, "Key size mismatch"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_92
    const-string p0, "Cannot build without parameters and/or key material"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1
.end method

.method public final m(Landroid/graphics/Bitmap;Z)V
    .registers 9

    iget-object p2, p0, Ll45;->a:Ljava/lang/Object;

    check-cast p2, Lesg;

    new-instance v0, Lc84;

    iget-object v1, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-direct {v0, v1, p1}, Lc84;-><init>(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    iget-object v1, p2, Lesg;->b:Ljava/lang/Object;

    check-cast v1, Ld84;

    iput-object v0, v1, Ld84;->a:Lc84;

    iget-object p2, p2, Lesg;->c:Ljava/lang/Object;

    check-cast p2, Lr9i;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_20

    move-object v1, v2

    goto :goto_21

    :cond_20
    move-object v1, p1

    :goto_21
    if-eqz v1, :cond_49

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_49

    iget-object v3, p2, Lr9i;->d:Ljava/lang/Object;

    check-cast v3, Lumi;

    new-instance v4, Lk3;

    const/16 v5, 0x11

    invoke-direct {v4, p2, v1, v0, v5}, Lk3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v3, v4}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v1, Loml;

    invoke-direct {v1, v0}, Loml;-><init>(Lnml;)V

    iget-object p2, p2, Lr9i;->e:Ljava/lang/Object;

    check-cast p2, Lqie;

    invoke-virtual {p2, v1, v2}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    :cond_49
    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Lwx;

    invoke-virtual {p0, p1}, Lwx;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final n()Ldp2;
    .registers 4

    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_9

    const-string v0, " backendName"

    goto :goto_b

    :cond_9
    const-string v0, ""

    :goto_b
    iget-object v1, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v1, Lmyg;

    if-nez v1, :cond_17

    const-string v1, " priority"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_17
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2f

    new-instance v0, Ldp2;

    iget-object v1, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v2, [B

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Lmyg;

    invoke-direct {v0, v1, v2, p0}, Ldp2;-><init>(Ljava/lang/String;[BLmyg;)V

    return-object v0

    :cond_2f
    const-string p0, "Missing required properties:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final p(Lbm;)V
    .registers 8

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lq00;

    sget-object p0, Lbm;->d:Lbm;

    if-ne p1, p0, :cond_c

    const/4 p0, 0x1

    :goto_a
    move v1, p0

    goto :goto_e

    :cond_c
    const/4 p0, 0x0

    goto :goto_a

    :goto_e
    iget-object v2, p1, Lbm;->c:Ljava/lang/String;

    sget-object v4, Lv50;->k:Lv50;

    const/4 v5, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v5}, Lk43;->b(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    return-void
.end method

.method public final q(Lzjh;)Landroid/net/Uri;
    .registers 9

    iget-object v0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v0, Lqtm;

    iget-object v1, p1, Lzjh;->E:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_14

    iget-object p1, p1, Lzjh;->E:Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    :goto_12
    move-object v1, p1

    goto :goto_1f

    :cond_14
    iget-object p1, p1, Lzjh;->b:Ljava/lang/String;

    iget-object v1, v0, Ld93;->a:Lyla;

    iget-object v1, v1, Lyla;->b:Ljava/net/URL;

    invoke-static {v1, p1}, Ll45;->o(Ljava/net/URL;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_12

    :goto_1f
    iget-object p0, p0, Ll45;->a:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Landroid/content/Context;

    iget-wide v3, v0, Ld93;->b:J

    iget-object v5, v0, Ld93;->c:Ljava/lang/String;

    iget-object p0, v0, Ld93;->a:Lyla;

    iget-object v6, p0, Lyla;->e:Ll0c;

    invoke-static/range {v1 .. v6}, Ll45;->x(Landroid/net/Uri;Landroid/content/Context;JLjava/lang/String;Ll0c;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public final s(Landroid/os/Bundle;)V
    .registers 8

    iget-object v0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    iget-object v1, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    const v2, 0x7f140195

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    if-eqz p1, :cond_60

    :try_start_11
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {p1}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1e
    :goto_1e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_45

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {p1, v4, v5}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1e

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-class v5, Lv7b;

    invoke-virtual {v5, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_1e

    invoke-virtual {v0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    :cond_45
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_49
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_60

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {p0, v0, v2}, Ll45;->t(Ljava/lang/Class;Ljava/util/HashSet;)Ljava/lang/Object;
    :try_end_58
    .catch Ljava/lang/ClassNotFoundException; {:try_start_11 .. :try_end_58} :catch_59

    goto :goto_49

    :catch_59
    move-exception p0

    new-instance p1, Le22;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :cond_60
    return-void
.end method

.method public final t(Ljava/lang/Class;Ljava/util/HashSet;)Ljava/lang/Object;
    .registers 9

    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "Cannot initialize "

    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_26

    :try_start_d
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x7f

    if-gt v4, v5, :cond_1b

    move-object v4, v2

    goto :goto_1c

    :cond_1b
    move-object v4, v3

    :goto_1c
    if-nez v4, :cond_23

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    :cond_23
    invoke-static {v4}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :cond_26
    invoke-virtual {p2, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_81

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_79

    invoke-virtual {p2, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_35
    .catchall {:try_start_d .. :try_end_35} :catchall_9c

    :try_start_35
    invoke-virtual {p1, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lv7b;

    invoke-interface {v1}, Lv7b;->dependencies()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_63

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4d
    :goto_4d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_63

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Class;

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4d

    invoke-virtual {p0, v3, p2}, Ll45;->t(Ljava/lang/Class;Ljava/util/HashSet;)Ljava/lang/Object;

    goto :goto_4d

    :cond_63
    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-interface {v1, p0}, Lv7b;->create(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p2, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_71
    .catchall {:try_start_35 .. :try_end_71} :catchall_72

    goto :goto_7d

    :catchall_72
    move-exception p0

    :try_start_73
    new-instance p1, Le22;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :cond_79
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_7d
    .catchall {:try_start_73 .. :try_end_7d} :catchall_9c

    :goto_7d
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-object p0

    :cond_81
    :try_start_81
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ". Cycle detected."

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_9c
    .catchall {:try_start_81 .. :try_end_9c} :catchall_9c

    :catchall_9c
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public final u(I)V
    .registers 2

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Lwx;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lwx;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final v()V
    .registers 1

    return-void
.end method

.method public final w(Ltw1;Ljava/lang/String;)V
    .registers 5

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    iget-object p0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast p0, Lx5f;

    iget-object p1, p1, Ltw1;->a:Ljava/lang/String;

    const/16 v1, 0x1d

    if-nez v0, :cond_17

    new-instance p2, Ltx0;

    invoke-direct {p2, p1, v1}, Ltx0;-><init>(Ljava/lang/String;B)V

    invoke-virtual {p0, p2}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    return-void

    :cond_17
    const-string v0, ":"

    invoke-static {p1, v0, p2}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ltx0;

    invoke-direct {p2, p1, v1}, Ltx0;-><init>(Ljava/lang/String;B)V

    invoke-virtual {p0, p2}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final y()Lvg;
    .registers 9

    iget-object v0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    new-instance v3, Lvg;

    iget-object v4, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v4, Lb59;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/SharedPreferences;

    const-string v5, "LastActiveTimeStamp"

    const-wide/16 v6, 0x0

    invoke-interface {v4, v5, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    sub-long v4, v1, v4

    const-wide/32 v6, 0x1499700

    cmp-long v4, v4, v6

    if-gtz v4, :cond_2a

    const/4 v4, 0x1

    goto :goto_2b

    :cond_2a
    const/4 v4, 0x0

    :goto_2b
    iget-object p0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast p0, Lni6;

    invoke-virtual {p0, v1, v2}, Lni6;->a(J)I

    move-result p0

    invoke-direct {v3, v4, p0}, Lvg;-><init>(ZI)V
    :try_end_36
    .catchall {:try_start_7 .. :try_end_36} :catchall_3a

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-object v3

    :catchall_3a
    move-exception p0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw p0
.end method

.method public final z()Ljava/util/ArrayList;
    .registers 11

    iget-object v0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_f2

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iget-object v2, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    move v5, v4

    :cond_1a
    :goto_1a
    const/4 v6, 0x0

    const/4 v7, 0x1

    if-ge v5, v3, :cond_44

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v5, v5, 0x1

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    invoke-virtual {v9}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_36

    invoke-static {v9, v7}, LJ/N;->MnEPjazD(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    :cond_36
    new-instance v7, Lc01;

    invoke-direct {v7, v8, v9, v6}, Lc01;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    if-eqz v9, :cond_1a

    invoke-virtual {v1, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    :cond_44
    invoke-static {}, LJ/N;->M9qRRZZC()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_52
    :goto_52
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_6f

    invoke-static {v5, v7}, LJ/N;->MnEPjazD(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    goto :goto_70

    :cond_6f
    move-object v8, v6

    :goto_70
    new-instance v9, Lc01;

    invoke-direct {v9, v3, v5, v8}, Lc01;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    if-eqz v5, :cond_52

    invoke-virtual {v1, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_52

    :cond_7e
    const/4 v2, 0x3

    invoke-static {v2}, Lhj;->a(I)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_87
    :goto_87
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_c2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_87

    new-instance v6, Landroid/net/Uri$Builder;

    invoke-direct {v6}, Landroid/net/Uri$Builder;-><init>()V

    const-string v8, "http"

    invoke-virtual {v6, v8}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v7}, LJ/N;->MnEPjazD(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    new-instance v9, Lc01;

    invoke-direct {v9, v6, v5, v8}, Lc01;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_87

    :cond_c2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v0, Lc9;

    invoke-direct {v0, v2}, Lc9;-><init>(B)V

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Ll45;->b:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_de
    if-ge v4, v0, :cond_f2

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v4, v4, 0x1

    check-cast v2, Lc01;

    iget-object v3, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    iget-object v2, v2, Lc01;->a:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_de

    :cond_f2
    iget-object p0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    return-object p0
.end method
