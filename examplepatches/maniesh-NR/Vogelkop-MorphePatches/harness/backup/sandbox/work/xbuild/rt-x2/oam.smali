.class public final Loam;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lovm;
.implements Lbag;
.implements Lann;
.implements Llnk;
.implements Lylo;
.implements Lhtp;


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Loam;->a:Ljava/lang/Object;

    .line 91
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Loam;->b:Ljava/lang/Object;

    .line 92
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Loam;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loam;->a:Ljava/lang/Object;

    .line 81
    new-instance p1, Lthk;

    const/16 v0, 0x1b

    invoke-direct {p1, v0}, Lthk;-><init>(B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Loam;->b:Ljava/lang/Object;

    .line 82
    new-instance p1, Ly3d;

    const/16 v0, 0x10

    invoke-direct {p1, v0}, Ly3d;-><init>(I)V

    iput-object p1, p0, Loam;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Leq6;)V
    .registers 5

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p2, p0, Loam;->a:Ljava/lang/Object;

    .line 78
    new-instance p2, Lsul;

    const/16 v0, 0x10

    invoke-direct {p2, v0}, Lsul;-><init>(B)V

    const-string v0, "ga_usage_statistics"

    invoke-static {p1, v0, p2}, Luyg;->d(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function2;)Lf99;

    move-result-object p1

    iput-object p1, p0, Loam;->b:Ljava/lang/Object;

    const/4 p1, 0x0

    const/4 p2, 0x6

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 79
    invoke-static {v0, v1, p1, p2}, Lipe;->c(IILh04;I)Ljdj;

    move-result-object p1

    iput-object p1, p0, Loam;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    .line 83
    iput-object p2, p0, Loam;->a:Ljava/lang/Object;

    iput-object p3, p0, Loam;->b:Ljava/lang/Object;

    iput-object p1, p0, Loam;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Loam;->a:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    new-array v0, v0, [J

    iput-object v0, p0, Loam;->b:Ljava/lang/Object;

    const/4 v0, 0x0

    :goto_19
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_38

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgzn;

    shl-int/lit8 v2, v0, 0x1

    iget-object v3, p0, Loam;->b:Ljava/lang/Object;

    check-cast v3, [J

    iget-wide v4, v1, Lgzn;->b:J

    aput-wide v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    iget-wide v4, v1, Lgzn;->c:J

    aput-wide v4, v3, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    :cond_38
    iget-object p1, p0, Loam;->b:Ljava/lang/Object;

    check-cast p1, [J

    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object p1

    iput-object p1, p0, Loam;->c:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Arrays;->sort([J)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 4

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iput-object p1, p0, Loam;->a:Ljava/lang/Object;

    .line 86
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    new-array p1, p1, [Lhyl;

    iput-object p1, p0, Loam;->b:Ljava/lang/Object;

    .line 87
    new-instance p1, Lpr;

    new-instance v0, Lcrk;

    const/16 v1, 0x1d

    invoke-direct {v0, p0, v1}, Lcrk;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, v0}, Lpr;-><init>(Louh;)V

    iput-object p1, p0, Loam;->c:Ljava/lang/Object;

    const/4 p0, 0x3

    .line 88
    invoke-virtual {p1, p0}, Lpr;->D(I)V

    return-void
.end method

.method public constructor <init>(Lrwo;)V
    .registers 4

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Loam;->b:Ljava/lang/Object;

    new-instance v0, Landroid/os/Handler;

    .line 73
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Loam;->a:Ljava/lang/Object;

    .line 74
    iput-object p1, p0, Loam;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lwpp;Ljava/util/concurrent/ExecutorService;Loqp;)V
    .registers 4

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p2}, Lcom/google/ads/interactivemedia/v3/internal/zztc;->a(Ljava/util/concurrent/ExecutorService;)Lcom/google/ads/interactivemedia/v3/internal/zzsx;

    move-result-object p2

    iput-object p2, p0, Loam;->c:Ljava/lang/Object;

    iput-object p3, p0, Loam;->a:Ljava/lang/Object;

    iput-object p1, p0, Loam;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 71
    iput-object p2, p0, Loam;->a:Ljava/lang/Object;

    iput-object p3, p0, Loam;->b:Ljava/lang/Object;

    iput-object p4, p0, Loam;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 6

    iget-object v0, p0, Loam;->a:Ljava/lang/Object;

    check-cast v0, Lh61;

    iget-object v0, v0, Lh61;->a:Landroid/content/Context;

    iget-object v1, p0, Loam;->b:Ljava/lang/Object;

    check-cast v1, Lvlo;

    invoke-virtual {v1}, Lvlo;->a()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ligp;

    iget-object p0, p0, Loam;->c:Ljava/lang/Object;

    check-cast p0, Lrgh;

    new-instance v2, Lmgh;

    iget-object v3, p0, Lrgh;->a:Ljava/lang/Object;

    check-cast v3, Lh61;

    iget-object p0, p0, Lrgh;->b:Ljava/lang/Object;

    check-cast p0, Lylo;

    const/16 v4, 0xd

    invoke-direct {v2, v3, p0, v4}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lyfp;

    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lyfp;-><init>(B)V

    new-instance v3, Lypo;

    invoke-direct {v3, v0, v1, v2, p0}, Lypo;-><init>(Landroid/content/Context;Ligp;Lmgh;Lyfp;)V

    return-object v3
.end method

.method public final b(Ljava/util/zip/ZipFile;Ljava/util/HashSet;)V
    .registers 7

    iget-object v0, p0, Loam;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    iget-object v1, p0, Loam;->c:Ljava/lang/Object;

    check-cast v1, Lutp;

    iget-object p0, p0, Loam;->b:Ljava/lang/Object;

    check-cast p0, Leqp;

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    new-instance v3, Lwtm;

    invoke-direct {v3, v2, p0, p1}, Lwtm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, p0, p2, v3}, Lutp;->c(Leqp;Ljava/util/HashSet;Ljtp;)V

    invoke-interface {v0, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public final c(JLg1g;)V
    .registers 8

    invoke-virtual {p3}, Lg1g;->a()I

    move-result v0

    const/16 v1, 0x9

    if-lt v0, v1, :cond_27

    invoke-virtual {p3}, Lg1g;->m()I

    move-result v0

    invoke-virtual {p3}, Lg1g;->m()I

    move-result v1

    invoke-virtual {p3}, Lg1g;->A()I

    move-result v2

    const/16 v3, 0x1b2

    if-ne v0, v3, :cond_27

    const v0, 0x47413934

    if-ne v1, v0, :cond_27

    const/4 v0, 0x3

    if-ne v2, v0, :cond_27

    iget-object p0, p0, Loam;->c:Ljava/lang/Object;

    check-cast p0, Lpr;

    invoke-virtual {p0, p1, p2, p3}, Lpr;->b(JLg1g;)V

    :cond_27
    return-void
.end method

.method public final d()V
    .registers 1

    invoke-virtual {p0}, Loam;->m()V

    return-void
.end method

.method public final e()V
    .registers 1

    invoke-virtual {p0}, Loam;->m()V

    return-void
.end method

.method public final f(Ljava/lang/String;)I
    .registers 8

    iget-object v0, p0, Loam;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v0, v0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    invoke-static {p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Loam;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v2, v2, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    iget-object v3, p0, Loam;->a:Ljava/lang/Object;

    check-cast v3, Landroid/content/ContentValues;

    invoke-virtual {v3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2b

    const/4 v4, 0x0

    invoke-interface {v2, v1, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_35

    :cond_2b
    iget-object v4, p0, Loam;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/ContentValues;

    const-string v5, "__uscp_predefined_default"

    invoke-virtual {v4, v5}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_35
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5, v1, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-interface {v2, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_5a

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_5a

    iget-object p1, p0, Loam;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object p0, p0, Loam;->b:Ljava/lang/Object;

    check-cast p0, Landroid/net/Uri;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/UserSettingsContentProvider;->i(Landroid/net/Uri;)V

    const/4 p0, 0x1

    monitor-exit v0

    return p0

    :cond_5a
    monitor-exit v0

    const/4 p0, 0x0

    return p0

    :goto_5d
    monitor-exit v0
    :try_end_5e
    .catchall {:try_start_7 .. :try_end_5e} :catchall_5f

    throw p0

    :catchall_5f
    move-exception p0

    goto :goto_5d
.end method

.method public final getCues(J)Ljava/util/List;
    .registers 12

    iget-object v0, p0, Loam;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    move v4, v3

    :goto_10
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_45

    iget-object v5, p0, Loam;->b:Ljava/lang/Object;

    check-cast v5, [J

    shl-int/lit8 v6, v4, 0x1

    aget-wide v7, v5, v6

    cmp-long v7, v7, p1

    if-gtz v7, :cond_42

    add-int/lit8 v6, v6, 0x1

    aget-wide v5, v5, v6

    cmp-long v5, p1, v5

    if-gez v5, :cond_42

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lgzn;

    iget-object v6, v5, Lgzn;->a:Lx36;

    iget v7, v6, Lx36;->e:F

    const v8, -0x800001

    cmpl-float v7, v7, v8

    if-nez v7, :cond_3f

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_42

    :cond_3f
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_42
    :goto_42
    add-int/lit8 v4, v4, 0x1

    goto :goto_10

    :cond_45
    new-instance p0, Lomj;

    const/16 p1, 0x16

    invoke-direct {p0, p1}, Lomj;-><init>(B)V

    invoke-static {v2, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :goto_4f
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ge v3, p0, :cond_73

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgzn;

    iget-object p0, p0, Lgzn;->a:Lx36;

    invoke-virtual {p0}, Lx36;->a()Lw36;

    move-result-object p0

    rsub-int/lit8 p1, v3, -0x1

    int-to-float p1, p1

    iput p1, p0, Lw36;->e:F

    const/4 p1, 0x1

    iput p1, p0, Lw36;->f:I

    invoke-virtual {p0}, Lw36;->a()Lx36;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_4f

    :cond_73
    return-object v1
.end method

.method public final getEventTime(I)J
    .registers 5

    iget-object p0, p0, Loam;->c:Ljava/lang/Object;

    check-cast p0, [J

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ltz p1, :cond_a

    move v2, v1

    goto :goto_b

    :cond_a
    move v2, v0

    :goto_b
    invoke-static {v2}, Lz4o;->w(Z)V

    array-length v2, p0

    if-ge p1, v2, :cond_12

    move v0, v1

    :cond_12
    invoke-static {v0}, Lz4o;->w(Z)V

    aget-wide p0, p0, p1

    return-wide p0
.end method

.method public final getEventTimeCount()I
    .registers 1

    iget-object p0, p0, Loam;->c:Ljava/lang/Object;

    check-cast p0, [J

    array-length p0, p0

    return p0
.end method

.method public final getNextEventTimeIndex(J)I
    .registers 4

    iget-object p0, p0, Loam;->c:Ljava/lang/Object;

    check-cast p0, [J

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Ltym;->b([JJZ)I

    move-result p1

    array-length p0, p0

    if-ge p1, p0, :cond_d

    return p1

    :cond_d
    const/4 p0, -0x1

    return p0
.end method

.method public final h(Ljava/lang/String;)I
    .registers 10

    iget-object v0, p0, Loam;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v0, v0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    invoke-static {p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Loam;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v2, v2, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_24

    const-wide/16 v3, 0x0

    invoke-interface {v2, v1, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    goto :goto_32

    :cond_24
    iget-object v3, p0, Loam;->a:Ljava/lang/Object;

    check-cast v3, Landroid/content/ContentValues;

    const-string v4, "__uscp_predefined_default"

    invoke-virtual {v3, v4}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    :goto_32
    iget-object v5, p0, Loam;->a:Ljava/lang/Object;

    check-cast v5, Landroid/content/ContentValues;

    invoke-virtual {v5, p1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v5

    iget-object v6, p0, Loam;->a:Ljava/lang/Object;

    check-cast v6, Landroid/content/ContentValues;

    if-eqz v5, :cond_54

    invoke-virtual {v6, p1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7, v1, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_69

    :cond_54
    const-string v5, "__uscp_predefined_default"

    invoke-virtual {v6, v5}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :goto_69
    invoke-interface {v2, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_81

    cmp-long p1, v3, v5

    if-eqz p1, :cond_81

    iget-object p1, p0, Loam;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object p0, p0, Loam;->b:Ljava/lang/Object;

    check-cast p0, Landroid/net/Uri;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/UserSettingsContentProvider;->i(Landroid/net/Uri;)V

    const/4 p0, 0x1

    monitor-exit v0

    return p0

    :cond_81
    monitor-exit v0

    const/4 p0, 0x0

    return p0

    :goto_84
    monitor-exit v0
    :try_end_85
    .catchall {:try_start_7 .. :try_end_85} :catchall_86

    throw p0

    :catchall_86
    move-exception p0

    goto :goto_84
.end method

.method public final i(Ljava/lang/String;)I
    .registers 9

    iget-object v0, p0, Loam;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v0, v0, Lcom/opera/android/settings/UserSettingsContentProvider;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    const-string v1, "previous_version_code"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_90

    const-string v1, "version_code"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_90

    invoke-static {p1}, Lcom/opera/android/settings/UserSettingsContentProvider;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Loam;->c:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object v3, v3, Lcom/opera/android/settings/UserSettingsContentProvider;->a:Lb59;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    invoke-interface {v3, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_33

    invoke-interface {v3, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    goto :goto_41

    :cond_33
    iget-object v4, p0, Loam;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/ContentValues;

    const-string v5, "__uscp_predefined_default"

    invoke-virtual {v4, v5}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    :goto_41
    iget-object v5, p0, Loam;->a:Ljava/lang/Object;

    check-cast v5, Landroid/content/ContentValues;

    invoke-virtual {v5, p1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v5

    iget-object v6, p0, Loam;->a:Ljava/lang/Object;

    check-cast v6, Landroid/content/ContentValues;

    if-eqz v5, :cond_63

    invoke-virtual {v6, p1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6, v1, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_78

    :cond_63
    const-string v5, "__uscp_predefined_default"

    invoke-virtual {v6, v5}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :goto_78
    invoke-interface {v3, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_8e

    if-eq v4, v5, :cond_8e

    iget-object p1, p0, Loam;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/UserSettingsContentProvider;

    iget-object p0, p0, Loam;->b:Ljava/lang/Object;

    check-cast p0, Landroid/net/Uri;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/UserSettingsContentProvider;->i(Landroid/net/Uri;)V

    const/4 p0, 0x1

    monitor-exit v0

    return p0

    :cond_8e
    monitor-exit v0

    return v2

    :cond_90
    monitor-exit v0

    return v2

    :goto_92
    monitor-exit v0
    :try_end_93
    .catchall {:try_start_7 .. :try_end_93} :catchall_94

    throw p0

    :catchall_94
    move-exception p0

    goto :goto_92
.end method

.method public final j(Len8;Ls7m;)V
    .registers 11

    iget-object v0, p0, Loam;->b:Ljava/lang/Object;

    check-cast v0, [Lhyl;

    const/4 v1, 0x0

    move v2, v1

    :goto_6
    array-length v3, v0

    if-ge v2, v3, :cond_6c

    invoke-virtual {p2}, Ls7m;->a()V

    invoke-virtual {p2}, Ls7m;->b()V

    iget v3, p2, Ls7m;->d:I

    const/4 v4, 0x3

    invoke-interface {p1, v3, v4}, Len8;->track(II)Lhyl;

    move-result-object v3

    iget-object v4, p0, Loam;->a:Ljava/lang/Object;

    check-cast v4, Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Loj9;

    iget-object v5, v4, Loj9;->n:Ljava/lang/String;

    const-string v6, "application/cea-608"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_34

    const-string v6, "application/cea-708"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_34

    move v6, v1

    goto :goto_35

    :cond_34
    const/4 v6, 0x1

    :goto_35
    const-string v7, "Invalid closed caption MIME type provided: %s"

    invoke-static {v6, v7, v5}, Lz4o;->y(ZLjava/lang/String;Ljava/lang/Object;)V

    new-instance v6, Lnj9;

    invoke-direct {v6}, Lnj9;-><init>()V

    invoke-virtual {p2}, Ls7m;->b()V

    iget-object v7, p2, Ls7m;->e:Ljava/lang/String;

    iput-object v7, v6, Lnj9;->a:Ljava/lang/String;

    const-string v7, "video/mp2t"

    invoke-static {v7}, Ldzd;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lnj9;->l:Ljava/lang/String;

    invoke-static {v5}, Ldzd;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v6, Lnj9;->m:Ljava/lang/String;

    iget v5, v4, Loj9;->e:I

    iput v5, v6, Lnj9;->e:I

    iget-object v5, v4, Loj9;->d:Ljava/lang/String;

    iput-object v5, v6, Lnj9;->d:Ljava/lang/String;

    iget v5, v4, Loj9;->K:I

    iput v5, v6, Lnj9;->J:I

    iget-object v4, v4, Loj9;->q:Ljava/util/List;

    iput-object v4, v6, Lnj9;->p:Ljava/util/List;

    invoke-static {v6, v3}, Lz1m;->q(Lnj9;Lhyl;)V

    aput-object v3, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_6c
    return-void
.end method

.method public final k(Ls3f;Lnt5;)Ljava/lang/Object;
    .registers 11

    instance-of v0, p2, Lufo;

    if-eqz v0, :cond_14

    move-object v0, p2

    check-cast v0, Lufo;

    iget v1, v0, Lufo;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Lufo;->v:I

    :goto_12
    move-object v6, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Lufo;

    invoke-direct {v0, p0, p2}, Lufo;-><init>(Loam;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object p2, v6, Lufo;->t:Ljava/lang/Object;

    sget-object v0, Lpx5;->a:Lpx5;

    iget v1, v6, Lufo;->v:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_30

    if-ne v1, v2, :cond_2a

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_72

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_30
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    move-object p2, v3

    new-instance v3, Lceo;

    const/16 v1, 0x9

    invoke-direct {v3, p1, p0, v1}, Lceo;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p0, Loam;->c:Ljava/lang/Object;

    move-object v1, p1

    check-cast v1, Lqe6;

    iget-object p0, p0, Loam;->b:Ljava/lang/Object;

    check-cast p0, Lpna;

    const-class p1, Lt0i;

    invoke-static {p1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v4

    :try_start_4a
    const-class v5, Lv3f;

    invoke-static {v5}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v5

    sget-object v7, Lkotlin/reflect/KTypeProjection;->c:Lztb;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5}, Lztb;->a(Lcam;)Lkotlin/reflect/KTypeProjection;

    move-result-object v5

    invoke-static {p1, v5}, Luqh;->e(Ljava/lang/Class;Lkotlin/reflect/KTypeProjection;)Lcam;

    move-result-object p1
    :try_end_5d
    .catchall {:try_start_4a .. :try_end_5d} :catchall_5f

    :goto_5d
    move-object p2, v4

    goto :goto_61

    :catchall_5f
    move-object p1, p2

    goto :goto_5d

    :goto_61
    new-instance v4, Lx9m;

    invoke-direct {v4, p2, p1}, Lx9m;-><init>(Litb;Lcam;)V

    iput v2, v6, Lufo;->v:I

    const-string v5, ""

    move-object v2, p0

    invoke-virtual/range {v1 .. v6}, Lqe6;->U(Lpna;Lkotlin/jvm/functions/Function1;Lx9m;Ljava/lang/String;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v0, :cond_72

    return-object v0

    :cond_72
    :goto_72
    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    return-object p0
.end method

.method public final l(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 14

    instance-of v0, p2, Lnam;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lnam;

    iget v1, v0, Lnam;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lnam;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lnam;

    invoke-direct {v0, p0, p2}, Lnam;-><init>(Loam;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lnam;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lnam;->w:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_31

    if-ne v2, v4, :cond_2b

    iget-object p1, v0, Lnam;->t:Ljava/lang/String;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_a5

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_31
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v0, Lnam;->t:Ljava/lang/String;

    iput v4, v0, Lnam;->w:I

    new-instance p2, Lbhi;

    invoke-static {v0}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object v0

    invoke-direct {p2, v0}, Lbhi;-><init>(Lmt5;)V

    iget-object v0, p0, Loam;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    new-instance v2, Lth9;

    const v5, 0x7f030008

    invoke-direct {v2, p1, v5}, Lth9;-><init>(Ljava/lang/String;I)V

    new-instance v5, Lmam;

    invoke-direct {v5, p2, p1}, Lmam;-><init>(Lbhi;Ljava/lang/String;)V

    iget-object v6, p0, Loam;->b:Ljava/lang/Object;

    check-cast v6, Lzyk;

    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/os/Handler;

    new-instance v7, Ls6h;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v8

    if-nez v8, :cond_6e

    new-instance v8, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    goto :goto_73

    :cond_6e
    new-instance v8, Landroid/os/Handler;

    invoke-direct {v8}, Landroid/os/Handler;-><init>()V

    :goto_73
    new-instance v9, Lwd2;

    const/4 v10, 0x2

    invoke-direct {v9, v8, v10}, Lwd2;-><init>(Landroid/os/Handler;B)V

    const/4 v8, 0x0

    invoke-direct {v7, v5, v9, v8}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    new-instance v5, Lwd2;

    invoke-direct {v5, v6, v10}, Lwd2;-><init>(Landroid/os/Handler;B)V

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v4}, Ljava/util/ArrayList;-><init>(I)V

    aget-object v2, v2, v8

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v6}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-static {v0, v2, v8, v5, v7}, Lyh9;->c(Landroid/content/Context;Ljava/util/List;ILwd2;Ls6h;)Landroid/graphics/Typeface;

    invoke-virtual {p2}, Lbhi;->a()Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_a5

    return-object v1

    :cond_a5
    :goto_a5
    check-cast p2, Landroid/graphics/Typeface;

    if-nez p2, :cond_aa

    return-object v3

    :cond_aa
    iget-object p0, p0, Loam;->c:Ljava/lang/Object;

    check-cast p0, Ly3d;

    invoke-virtual {p0, p1, p2}, Ly3d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p2
.end method

.method public final m()V
    .registers 3

    iget-object v0, p0, Loam;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object p0, p0, Loam;->c:Ljava/lang/Object;

    check-cast p0, Lbmn;

    iget-object v1, p0, Lbmn;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    iget-object v0, p0, Lbmn;->e:Ljava/lang/String;

    iget-object v1, p0, Lbmn;->f:Lvkn;

    if-eqz v1, :cond_1b

    iget-object v1, v1, Lvkn;->f:Lplk;

    invoke-virtual {v1, v0}, Lplk;->r(Ljava/lang/String;)V

    :cond_1b
    iget-object v0, p0, Lbmn;->f:Lvkn;

    if-eqz v0, :cond_27

    const/4 v1, 0x0

    iput-object v1, p0, Lbmn;->e:Ljava/lang/String;

    iget-object p0, v0, Lvkn;->e:Lplk;

    invoke-virtual {p0, v1}, Lplk;->r(Ljava/lang/String;)V

    :cond_27
    return-void
.end method

.method public final o(Landroid/app/Activity;Lvdf;Lvdf;Lo8f;)Lb87;
    .registers 5

    invoke-virtual {p0, p1, p2, p3, p4}, Loam;->p(Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/Runnable;Lcom/opera/api/Callback;)Lb87;

    move-result-object p0

    return-object p0
.end method

.method public final p(Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/Runnable;Lcom/opera/api/Callback;)Lb87;
    .registers 9

    iget-object p0, p0, Loam;->c:Ljava/lang/Object;

    check-cast p0, Lmw0;

    const/4 v0, 0x0

    if-eqz p0, :cond_6f

    const v1, 0x7f140110

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f140126

    invoke-virtual {p1, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v3, 0x7f140125

    invoke-virtual {p1, v3, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_30

    new-instance v1, Lqxh;

    invoke-direct {v1, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_31

    :cond_30
    move-object v1, v0

    :goto_31
    new-instance p1, Lqj;

    const/4 v3, 0x1

    invoke-direct {p1, p2, v3}, Lqj;-><init>(Ljava/lang/Runnable;B)V

    iget-object p0, p0, Lmw0;->a:Lru9;

    new-instance p2, Lxj;

    const/4 v3, 0x7

    invoke-direct {p2, p0, p3, v3}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Llw0;

    const/4 p3, 0x0

    invoke-direct {p0, p4, p3}, Llw0;-><init>(Lcom/opera/api/Callback;B)V

    new-instance p4, Lgkj;

    invoke-direct {p4, p3, p3}, Lnz0;-><init>(ZZ)V

    iput-object v0, p4, Lgkj;->a:Ljava/lang/String;

    iput-object v0, p4, Lgkj;->b:Ljava/lang/String;

    iput-object v0, p4, Lgkj;->c:Ljava/lang/String;

    iput-object v2, p4, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object p0, p4, Lgkj;->e:Lekj;

    iput-object v0, p4, Lgkj;->f:Lfkj;

    iput-object v0, p4, Lgkj;->g:Lqp2;

    iput-object p2, p4, Lgkj;->h:Ldkj;

    iput-object p1, p4, Lgkj;->i:Ldkj;

    iput-object v0, p4, Lgkj;->j:Lql;

    const p0, 0x7f140812

    iput p0, p4, Lgkj;->k:I

    const p0, 0x7f140bea

    iput p0, p4, Lgkj;->l:I

    iput p3, p4, Lgkj;->m:I

    iput-boolean p3, p4, Lgkj;->n:Z

    iput-object v1, p4, Lgkj;->o:Lpxh;

    return-object p4

    :cond_6f
    return-object v0
.end method

.method public final q(Ljava/lang/String;)V
    .registers 10

    iget-object v0, p0, Loam;->b:Ljava/lang/Object;

    check-cast v0, Ld93;

    iget-object v1, p0, Loam;->c:Ljava/lang/Object;

    check-cast v1, Lrtm;

    iget-object v2, v1, Lrtm;->e:Lwtm;

    iget-object p0, p0, Loam;->a:Ljava/lang/Object;

    check-cast p0, Lwtm;

    if-ne v2, p0, :cond_27

    const/4 p0, 0x0

    iput-object p0, v1, Lrtm;->e:Lwtm;

    iget-boolean p0, v1, Lrtm;->d:Z

    if-nez p0, :cond_27

    if-nez p1, :cond_2f

    new-instance v2, Lqtm;

    iget-object v3, v0, Ld93;->a:Lyla;

    iget-wide v4, v0, Ld93;->b:J

    iget-object v6, v0, Ld93;->c:Ljava/lang/String;

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Lqtm;-><init>(Lyla;JLjava/lang/String;Ljava/lang/String;)V

    if-eqz p0, :cond_28

    :cond_27
    return-void

    :cond_28
    iget-object p0, v1, Lrtm;->a:Lisd;

    const/4 p1, 0x0

    invoke-virtual {p0, v2, p1}, Lisd;->E(Ljava/lang/Object;Z)V

    return-void

    :cond_2f
    const/4 p0, 0x1

    invoke-virtual {v1, v0, p1, p0}, Lrtm;->e(Ld93;Ljava/lang/String;Z)V

    invoke-virtual {v1, v0, p1}, Lrtm;->d(Ld93;Ljava/lang/String;)V

    return-void
.end method

.method public final r()V
    .registers 6

    iget-object v0, p0, Loam;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Loam;->c:Ljava/lang/Object;

    check-cast v1, Lrwo;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_11
    if-ge v3, v1, :cond_1f

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lepp;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_11

    :cond_1f
    iget-object v0, p0, Loam;->a:Ljava/lang/Object;

    check-cast v0, Landroid/os/Handler;

    new-instance v1, Luqp;

    invoke-direct {v1, p0, v2}, Luqp;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final s()V
    .registers 1

    iget-object p0, p0, Loam;->b:Ljava/lang/Object;

    check-cast p0, Ly47;

    invoke-virtual {p0}, Ly47;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final t()V
    .registers 1

    iget-object p0, p0, Loam;->a:Ljava/lang/Object;

    check-cast p0, Luef;

    invoke-virtual {p0}, Luef;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final u(Lbnn;)V
    .registers 2

    invoke-virtual {p0}, Loam;->m()V

    return-void
.end method

.method public final z(Lcnn;)V
    .registers 6

    iget-object p1, p0, Loam;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Loam;->c:Ljava/lang/Object;

    check-cast v0, Lbmn;

    iget-object v1, v0, Lbmn;->f:Lvkn;

    if-eqz v1, :cond_15

    iget-object v1, v1, Lvkn;->a:Lujn;

    invoke-virtual {v1, p1}, Lujn;->P(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_15
    iget-object p0, p0, Loam;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-object p1, v0, Lbmn;->f:Lvkn;

    if-eqz p1, :cond_26

    iget-object p1, p1, Lvkn;->a:Lujn;

    invoke-virtual {p1, p0}, Lujn;->P(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_26
    iget-object p1, v0, Lbmn;->e:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_53

    iget-object p1, v0, Lbmn;->b:Lqln;

    iget-byte v1, v0, Lbmn;->a:B

    const/4 v2, 0x3

    if-eqz v1, :cond_44

    const/4 v3, 0x1

    if-eq v1, v3, :cond_43

    const/4 v3, 0x2

    if-eq v1, v3, :cond_41

    if-eq v1, v2, :cond_3f

    move v2, v3

    goto :goto_44

    :cond_3f
    const/4 v2, 0x6

    goto :goto_44

    :cond_41
    const/4 v2, 0x5

    goto :goto_44

    :cond_43
    const/4 v2, 0x4

    :cond_44
    :goto_44
    invoke-virtual {p1, v2, p0}, Lqln;->p(ILjava/lang/String;)V

    iget-object p0, v0, Lbmn;->f:Lvkn;

    if-eqz p0, :cond_53

    const/4 p1, 0x0

    iput-object p1, v0, Lbmn;->e:Ljava/lang/String;

    iget-object p0, p0, Lvkn;->e:Lplk;

    invoke-virtual {p0, p1}, Lplk;->r(Ljava/lang/String;)V

    :cond_53
    return-void
.end method
