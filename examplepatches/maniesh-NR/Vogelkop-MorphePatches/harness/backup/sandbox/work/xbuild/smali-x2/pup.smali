.class public final Lpup;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Lg40;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lg40;

    const-string v1, "SplitInstallInfoProvider"

    invoke-direct {v0, v1}, Lg40;-><init>(Ljava/lang/String;)V

    sput-object v0, Lpup;->c:Lg40;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpup;->a:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lpup;->b:Ljava/lang/String;

    return-void
.end method

.method public static d(Ljava/lang/String;)Z
    .registers 2

    const-string v0, "config."

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, ".config."

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_12

    const/4 p0, 0x0

    return p0

    :cond_12
    const/4 p0, 0x1

    return p0
.end method

.method public static final e(Landroid/content/pm/PackageInfo;)Ljava/util/HashSet;
    .registers 4

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {p0}, Lpup;->f(Landroid/content/pm/PackageInfo;)Ljava/util/HashSet;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_d
    :goto_d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_23

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lpup;->d(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_d

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_23
    return-object v0
.end method

.method public static final f(Landroid/content/pm/PackageInfo;)Ljava/util/HashSet;
    .registers 7

    sget-object v0, Lpup;->c:Lg40;

    iget-object v1, p0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    const/4 v3, 0x0

    if-eqz v1, :cond_38

    const-string v4, "com.android.dynamic.apk.fused.modules"

    invoke-virtual {v1, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_31

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_31

    const-string v4, ","

    const/4 v5, -0x1

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    const-string v1, ""

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    const-string v1, "base"

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_38

    :cond_31
    const-string v1, "App has no fused modules."

    new-array v4, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v4}, Lg40;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_38
    :goto_38
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->splitNames:[Ljava/lang/String;

    if-eqz p0, :cond_4d

    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v3, "Adding splits from package manager: %s"

    invoke-virtual {v0, v3, v1}, Lg40;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {v2, p0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    goto :goto_54

    :cond_4d
    new-array p0, v3, [Ljava/lang/Object;

    const-string v1, "No splits are found or app cannot be found in package manager."

    invoke-virtual {v0, v1, p0}, Lg40;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_54
    sget-object p0, Lmup;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfup;

    if-eqz p0, :cond_73

    iget-object p0, p0, Lfup;->a:Ln0k;

    iget-object v0, p0, Ln0k;->c:Ljava/util/HashSet;

    monitor-enter v0

    :try_start_63
    new-instance v1, Ljava/util/HashSet;

    iget-object p0, p0, Ln0k;->c:Ljava/util/HashSet;

    invoke-direct {v1, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    monitor-exit v0
    :try_end_6b
    .catchall {:try_start_63 .. :try_end_6b} :catchall_71

    invoke-interface {v2, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    return-object v2

    :goto_6f
    :try_start_6f
    monitor-exit v0
    :try_end_70
    .catchall {:try_start_6f .. :try_end_70} :catchall_71

    throw p0

    :catchall_71
    move-exception p0

    goto :goto_6f

    :cond_73
    return-object v2
.end method


# virtual methods
.method public final a(Landroid/os/Bundle;)Lppp;
    .registers 10

    const/4 v0, 0x0

    const/4 v1, 0x0

    sget-object v2, Lpup;->c:Lg40;

    if-nez p1, :cond_e

    new-array p0, v1, [Ljava/lang/Object;

    const-string p1, "No metadata found in Context."

    invoke-virtual {v2, p1, p0}, Lg40;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0

    :cond_e
    const-string v3, "com.android.vending.splits"

    invoke-virtual {p1, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_1e

    new-array p0, v1, [Ljava/lang/Object;

    const-string p1, "No metadata found in AndroidManifest."

    invoke-virtual {v2, p1, p0}, Lg40;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0

    :cond_1e
    :try_start_1e
    iget-object p0, p0, Lpup;->a:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object p0
    :try_end_28
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_1e .. :try_end_28} :catch_d1

    new-instance p1, Lrc6;

    const/4 v3, 0x3

    invoke-direct {p1, v3}, Lrc6;-><init>(B)V

    :cond_2e
    :goto_2e
    :try_start_2e
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_c3

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_2e

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v6, "splits"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4c

    invoke-static {p0}, Lt0h;->t(Landroid/content/res/XmlResourceParser;)V

    goto :goto_2e

    :cond_4c
    :goto_4c
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v4

    if-eq v4, v3, :cond_2e

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v4

    if-ne v4, v5, :cond_4c

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v6, "module"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_bf

    const-string v4, "name"

    invoke-static {v4, p0}, Lt0h;->s(Ljava/lang/String;Landroid/content/res/XmlResourceParser;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_bb

    :cond_6c
    :goto_6c
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v6

    if-eq v6, v3, :cond_4c

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v6

    if-ne v6, v5, :cond_6c

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "language"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_88

    invoke-static {p0}, Lt0h;->t(Landroid/content/res/XmlResourceParser;)V

    goto :goto_6c

    :cond_88
    :goto_88
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v6

    if-eq v6, v3, :cond_6c

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v6

    if-ne v6, v5, :cond_88

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "entry"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b7

    const-string v6, "key"

    invoke-static {v6, p0}, Lt0h;->s(Ljava/lang/String;Landroid/content/res/XmlResourceParser;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "split"

    invoke-static {v7, p0}, Lt0h;->s(Ljava/lang/String;Landroid/content/res/XmlResourceParser;)Ljava/lang/String;

    move-result-object v7

    invoke-static {p0}, Lt0h;->t(Landroid/content/res/XmlResourceParser;)V

    if-eqz v6, :cond_88

    if-eqz v7, :cond_88

    invoke-virtual {p1, v4, v6, v7}, Lrc6;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_88

    :cond_b7
    invoke-static {p0}, Lt0h;->t(Landroid/content/res/XmlResourceParser;)V

    goto :goto_88

    :cond_bb
    invoke-static {p0}, Lt0h;->t(Landroid/content/res/XmlResourceParser;)V

    goto :goto_4c

    :cond_bf
    invoke-static {p0}, Lt0h;->t(Landroid/content/res/XmlResourceParser;)V

    goto :goto_4c

    :cond_c3
    invoke-virtual {p1}, Lrc6;->c()Lppp;

    move-result-object v0
    :try_end_c7
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2e .. :try_end_c7} :catch_c7
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_c7} :catch_c7
    .catch Ljava/lang/IllegalStateException; {:try_start_2e .. :try_end_c7} :catch_c7

    :catch_c7
    if-nez v0, :cond_d0

    new-array p0, v1, [Ljava/lang/Object;

    const-string p1, "Can\'t parse languages metadata."

    invoke-virtual {v2, p1, p0}, Lg40;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_d0
    return-object v0

    :catch_d1
    new-array p0, v1, [Ljava/lang/Object;

    const-string p1, "Resource with languages metadata doesn\'t exist."

    invoke-virtual {v2, p1, p0}, Lg40;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0
.end method

.method public final b()Ljava/util/HashSet;
    .registers 3

    :try_start_0
    iget-object v0, p0, Lpup;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object p0, p0, Lpup;->b:Ljava/lang/String;

    const/16 v1, 0x80

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0
    :try_end_e
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_e} :catch_f

    goto :goto_1a

    :catch_f
    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    sget-object v0, Lpup;->c:Lg40;

    const-string v1, "App is not found in PackageManager"

    invoke-virtual {v0, v1, p0}, Lg40;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 p0, 0x0

    :goto_1a
    if-eqz p0, :cond_25

    iget-object v0, p0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v0, :cond_25

    invoke-static {p0}, Lpup;->e(Landroid/content/pm/PackageInfo;)Ljava/util/HashSet;

    move-result-object p0

    return-object p0

    :cond_25
    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    return-object p0
.end method

.method public final c()Ljava/util/HashSet;
    .registers 5

    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lpup;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-object v2, p0, Lpup;->b:Ljava/lang/String;

    const/16 v3, 0x80

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1
    :try_end_f
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_f} :catch_10

    goto :goto_1b

    :catch_10
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    sget-object v2, Lpup;->c:Lg40;

    const-string v3, "App is not found in PackageManager"

    invoke-virtual {v2, v3, v1}, Lg40;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    move-object v1, v0

    :goto_1b
    if-eqz v1, :cond_6c

    iget-object v2, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v2, :cond_6c

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    invoke-virtual {p0, v2}, Lpup;->a(Landroid/os/Bundle;)Lppp;

    move-result-object p0

    if-eqz p0, :cond_6c

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v1}, Lpup;->f(Landroid/content/pm/PackageInfo;)Ljava/util/HashSet;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-static {v1}, Lpup;->e(Landroid/content/pm/PackageInfo;)Ljava/util/HashSet;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v1}, Lppp;->a(Ljava/util/Collection;)Ljava/util/HashMap;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_4a
    :goto_4a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v2, v3}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_4a

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_4a

    :cond_6c
    return-object v0
.end method
