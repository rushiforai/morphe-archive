.class public final Liuh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lo7h;
.implements Lhoj;
.implements Lcom/opera/android/browser/NavigationHistory;
.implements Lqvi;
.implements Loqp;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Liuh;->a:B

    packed-switch p1, :pswitch_data_40

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-object p1, p0, Liuh;->b:Ljava/lang/Object;

    iput-object p1, p0, Liuh;->c:Ljava/lang/Object;

    return-void

    :pswitch_e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lvci;

    const/16 v0, 0x80

    invoke-direct {p1, v0}, Lgub;-><init>(I)V

    iput-object p1, p0, Liuh;->b:Ljava/lang/Object;

    new-instance p1, Lvci;

    const/16 v0, 0x100

    invoke-direct {p1, v0}, Lvci;-><init>(I)V

    iput-object p1, p0, Liuh;->c:Ljava/lang/Object;

    return-void

    :pswitch_24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-class p1, Landroidx/camera/core/internal/compat/quirk/ImageCaptureFailedForSpecificCombinationQuirk;

    sget-object v0, La77;->a:Lygh;

    invoke-virtual {v0, p1}, Lygh;->b(Ljava/lang/Class;)Ltgh;

    move-result-object p1

    check-cast p1, Landroidx/camera/core/internal/compat/quirk/ImageCaptureFailedForSpecificCombinationQuirk;

    iput-object p1, p0, Liuh;->b:Ljava/lang/Object;

    const-class p1, Landroidx/camera/core/internal/compat/quirk/PreviewGreenTintQuirk;

    sget-object v0, La77;->a:Lygh;

    invoke-virtual {v0, p1}, Lygh;->b(Ljava/lang/Class;)Ltgh;

    move-result-object p1

    check-cast p1, Landroidx/camera/core/internal/compat/quirk/PreviewGreenTintQuirk;

    iput-object p1, p0, Liuh;->c:Ljava/lang/Object;

    return-void

    :pswitch_data_40
    .packed-switch 0x5
        :pswitch_24
        :pswitch_e
    .end packed-switch
.end method

.method public constructor <init>(Landroid/os/Handler;Lmi8;)V
    .registers 4

    const/16 v0, 0x9

    iput-byte v0, p0, Liuh;->a:B

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p2, :cond_d

    .line 89
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_e

    :cond_d
    const/4 p1, 0x0

    .line 90
    :goto_e
    iput-object p1, p0, Liuh;->b:Ljava/lang/Object;

    .line 91
    iput-object p2, p0, Liuh;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ld7l;Lcom/opera/android/browser/NavigationHistory;)V
    .registers 4

    const/4 v0, 0x7

    iput-byte v0, p0, Liuh;->a:B

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Liuh;->b:Ljava/lang/Object;

    iput-object p1, p0, Liuh;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 64
    iput-byte p3, p0, Liuh;->a:B

    iput-object p1, p0, Liuh;->b:Ljava/lang/Object;

    iput-object p2, p0, Liuh;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lmbi;Lcom/google/ads/interactivemedia/v3/impl/data/zzbg;)V
    .registers 4

    const/16 v0, 0xe

    iput-byte v0, p0, Liuh;->a:B

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/ads/interactivemedia/v3/internal/zzly;

    invoke-direct {v0, p1}, Lcom/google/ads/interactivemedia/v3/internal/zzly;-><init>(Lmbi;)V

    iput-object v0, p0, Liuh;->b:Ljava/lang/Object;

    iput-object p2, p0, Liuh;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lole;)V
    .registers 3

    const/4 v0, 0x4

    iput-byte v0, p0, Liuh;->a:B

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Liuh;->b:Ljava/lang/Object;

    .line 67
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Liuh;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lp7m;)V
    .registers 4

    const/16 v0, 0x8

    iput-byte v0, p0, Liuh;->a:B

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Liuh;->c:Ljava/lang/Object;

    .line 93
    new-instance p1, Lbq4;

    const/4 v0, 0x4

    new-array v1, v0, [B

    .line 94
    invoke-direct {p1, v1, v0}, Lbq4;-><init>([BI)V

    .line 95
    iput-object p1, p0, Liuh;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lqln;Landroidx/recyclerview/widget/RecyclerView;Lwjn;IILenn;)V
    .registers 18

    const/16 v0, 0xa

    iput-byte v0, p0, Liuh;->a:B

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p2, p0, Liuh;->b:Ljava/lang/Object;

    .line 70
    new-instance v0, Lujn;

    .line 71
    iget-object p1, p1, Lqln;->g:Lagm;

    const/4 v1, 0x0

    move-object/from16 v2, p6

    .line 72
    invoke-direct {v0, p3, p1, v1, v2}, Lujn;-><init>(Ln1;Lagm;Lcom/opera/android/settings/SettingsManager;Ltjn;)V

    .line 73
    iput-object v0, p0, Liuh;->c:Ljava/lang/Object;

    .line 74
    new-instance v4, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 75
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    const/4 p0, 0x1

    const/4 p1, 0x0

    .line 76
    invoke-direct {v4, p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(II)V

    .line 77
    new-instance v2, Lt79;

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v3, p2

    move v7, p4

    move/from16 v5, p5

    invoke-direct/range {v2 .. v10}, Lt79;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/GridLayoutManager;IIIIIB)V

    .line 78
    new-instance p0, Lk56;

    invoke-direct {p0}, Lk56;-><init>()V

    .line 79
    iput-boolean p1, p0, Lxkj;->g:Z

    .line 80
    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    .line 81
    invoke-virtual {p2, v4}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    .line 82
    new-instance p0, Li4a;

    invoke-direct {p0, v2}, Li4a;-><init>(Lk8;)V

    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    .line 83
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-void
.end method

.method public constructor <init>(Lv4b;)V
    .registers 3

    const/4 v0, 0x3

    iput-byte v0, p0, Liuh;->a:B

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-object p1, p0, Liuh;->b:Ljava/lang/Object;

    .line 87
    new-instance p1, Ljava/io/File;

    const-string v0, "site_images"

    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Liuh;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lwtm;)V
    .registers 3

    const/16 v0, 0xd

    iput-byte v0, p0, Liuh;->a:B

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Liuh;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lg1g;)V
    .registers 11

    iget-object v0, p0, Liuh;->c:Ljava/lang/Object;

    check-cast v0, Lp7m;

    iget-object v1, v0, Lp7m;->h:Landroid/util/SparseArray;

    iget-object p0, p0, Liuh;->b:Ljava/lang/Object;

    check-cast p0, Lbq4;

    invoke-virtual {p1}, Lg1g;->A()I

    move-result v2

    if-nez v2, :cond_68

    invoke-virtual {p1}, Lg1g;->A()I

    move-result v2

    and-int/lit16 v2, v2, 0x80

    if-eqz v2, :cond_68

    const/4 v2, 0x6

    invoke-virtual {p1, v2}, Lg1g;->O(I)V

    invoke-virtual {p1}, Lg1g;->a()I

    move-result v2

    const/4 v3, 0x4

    div-int/2addr v2, v3

    const/4 v4, 0x0

    move v5, v4

    :goto_24
    if-ge v5, v2, :cond_60

    iget-object v6, p0, Lbq4;->b:[B

    invoke-virtual {p1, v6, v4, v3}, Lg1g;->k([BII)V

    invoke-virtual {p0, v4}, Lbq4;->q(I)V

    const/16 v6, 0x10

    invoke-virtual {p0, v6}, Lbq4;->i(I)I

    move-result v6

    const/4 v7, 0x3

    invoke-virtual {p0, v7}, Lbq4;->t(I)V

    const/16 v7, 0xd

    if-nez v6, :cond_40

    invoke-virtual {p0, v7}, Lbq4;->t(I)V

    goto :goto_5d

    :cond_40
    invoke-virtual {p0, v7}, Lbq4;->i(I)I

    move-result v6

    invoke-virtual {v1, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_5d

    new-instance v7, Lrvi;

    new-instance v8, Lpyl;

    invoke-direct {v8, v0, v6}, Lpyl;-><init>(Lp7m;I)V

    invoke-direct {v7, v8}, Lrvi;-><init>(Lqvi;)V

    invoke-virtual {v1, v6, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget v6, v0, Lp7m;->n:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v0, Lp7m;->n:I

    :cond_5d
    :goto_5d
    add-int/lit8 v5, v5, 0x1

    goto :goto_24

    :cond_60
    iget-byte p0, v0, Lp7m;->a:B

    const/4 p1, 0x2

    if-eq p0, p1, :cond_68

    invoke-virtual {v1, v4}, Landroid/util/SparseArray;->remove(I)V

    :cond_68
    return-void
.end method

.method public final b(Lr4n;)V
    .registers 5

    iget-object v0, p0, Liuh;->b:Ljava/lang/Object;

    check-cast v0, Landroid/os/Handler;

    if-eqz v0, :cond_10

    new-instance v1, Lnpl;

    const/16 v2, 0x15

    invoke-direct {v1, p0, p1, v2}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_10
    return-void
.end method

.method public final d()I
    .registers 1

    iget-object p0, p0, Liuh;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result p0

    return p0
.end method

.method public final e(Lpql;Len8;Ls7m;)V
    .registers 4

    return-void
.end method

.method public final f(Ljava/lang/String;Ltmi;)V
    .registers 5

    iget-object v0, p0, Liuh;->b:Ljava/lang/Object;

    check-cast v0, Lv4b;

    new-instance v1, Ljava/io/File;

    iget-object p0, p0, Liuh;->c:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    invoke-direct {v1, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lv4b;->h(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {v0, p0}, Lv4b;->g(Landroid/net/Uri;)[B

    move-result-object p1

    if-nez p1, :cond_18

    const/4 p0, 0x0

    :cond_18
    invoke-virtual {p2, p0}, Ltmi;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final g(Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;)Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;
    .registers 8

    :try_start_0
    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->e()Lcom/google/ads/interactivemedia/v3/impl/data/zzbq;

    move-result-object v0

    sget-object v1, Lcom/google/ads/interactivemedia/v3/impl/data/zzbq;->GET:Lcom/google/ads/interactivemedia/v3/impl/data/zzbq;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_b

    move v0, v2

    goto :goto_c

    :cond_b
    const/4 v0, 0x1

    :goto_c
    iget-object v1, p0, Liuh;->b:Ljava/lang/Object;

    check-cast v1, Lcom/google/ads/interactivemedia/v3/internal/zzly;

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->f()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->b()Ljava/lang/String;

    move-result-object v4

    iget-object p0, p0, Liuh;->c:Ljava/lang/Object;

    check-cast p0, Lcom/google/ads/interactivemedia/v3/impl/data/zzbg;

    invoke-virtual {p0}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbg;->g()Z

    move-result p0

    if-eqz p0, :cond_2e

    new-instance p0, Lcom/google/ads/interactivemedia/v3/internal/zzls;

    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/google/ads/interactivemedia/v3/internal/zzls;-><init>(I)V

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    goto :goto_51

    :cond_2e
    invoke-static {}, Lcom/google/android/gms/common/api/internal/TaskApiCall;->builder()Lcom/google/android/gms/common/api/internal/TaskApiCall$Builder;

    move-result-object p0

    sget-object v5, Lcom/google/ads/interactivemedia/v3/internal/zzoa;->b:Lcom/google/android/gms/common/Feature;

    filled-new-array {v5}, [Lcom/google/android/gms/common/Feature;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/google/android/gms/common/api/internal/TaskApiCall$Builder;->setFeatures([Lcom/google/android/gms/common/Feature;)Lcom/google/android/gms/common/api/internal/TaskApiCall$Builder;

    move-result-object p0

    invoke-virtual {p0, v2}, Lcom/google/android/gms/common/api/internal/TaskApiCall$Builder;->setAutoResolveMissingFeatures(Z)Lcom/google/android/gms/common/api/internal/TaskApiCall$Builder;

    move-result-object p0

    new-instance v2, Lcom/google/ads/interactivemedia/v3/internal/zzlt;

    invoke-direct {v2, v1, v3, v0, v4}, Lcom/google/ads/interactivemedia/v3/internal/zzlt;-><init>(Lcom/google/ads/interactivemedia/v3/internal/zzly;Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {p0, v2}, Lcom/google/android/gms/common/api/internal/TaskApiCall$Builder;->run(Lcom/google/android/gms/common/api/internal/RemoteCall;)Lcom/google/android/gms/common/api/internal/TaskApiCall$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/TaskApiCall$Builder;->build()Lcom/google/android/gms/common/api/internal/TaskApiCall;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/google/android/gms/common/api/GoogleApi;->doRead(Lcom/google/android/gms/common/api/internal/TaskApiCall;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    :goto_51
    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->a()I

    move-result v0

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->d()I

    move-result v1

    add-int/2addr v0, v1

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v2, v0

    invoke-static {p0, v2, v3, v1}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->c()Ljava/lang/String;

    move-result-object v0

    const-string v1, "unknown"

    invoke-static {v0, p0, v1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;

    move-result-object p0
    :try_end_6d
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_6d} :catch_9e
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_6d} :catch_9e
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_6d} :catch_6e

    return-object p0

    :catch_6e
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    instance-of v0, p0, Lcom/google/ads/interactivemedia/v3/internal/zzls;

    if-eqz v0, :cond_84

    check-cast p0, Lcom/google/ads/interactivemedia/v3/internal/zzls;

    iget p0, p0, Lcom/google/ads/interactivemedia/v3/internal/zzls;->a:I

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->c()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;->d(ILjava/lang/String;)Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;

    move-result-object p0

    return-object p0

    :cond_84
    instance-of p0, p0, Lcom/google/android/gms/common/api/ApiException;

    if-eqz p0, :cond_93

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->c()Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x66

    invoke-static {p1, p0}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;->d(ILjava/lang/String;)Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;

    move-result-object p0

    return-object p0

    :cond_93
    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->c()Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x64

    invoke-static {p1, p0}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;->d(ILjava/lang/String;)Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;

    move-result-object p0

    return-object p0

    :catch_9e
    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbr;->c()Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x65

    invoke-static {p1, p0}, Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;->d(ILjava/lang/String;)Lcom/google/ads/interactivemedia/v3/impl/data/zzbs;

    move-result-object p0

    return-object p0
.end method

.method public final get()Ljava/lang/Object;
    .registers 7

    new-instance v1, Ltmj;

    const/16 v0, 0x9

    invoke-direct {v1, v0}, Ltmj;-><init>(B)V

    new-instance v2, Lcpj;

    const/4 v0, 0x7

    invoke-direct {v2, v0}, Lcpj;-><init>(B)V

    iget-object v0, p0, Liuh;->b:Ljava/lang/Object;

    check-cast v0, Lyhe;

    invoke-virtual {v0}, Lyhe;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object p0, p0, Liuh;->c:Ljava/lang/Object;

    move-object v5, p0

    check-cast v5, Lo7h;

    move-object p0, v0

    new-instance v0, Lydi;

    move-object v4, p0

    check-cast v4, Ldni;

    sget-object v3, Lkn2;->f:Lkn2;

    invoke-direct/range {v0 .. v5}, Lydi;-><init>(Lt55;Lt55;Lkn2;Ldni;Ln7h;)V

    return-object v0
.end method

.method public final i(I)Lcom/opera/android/browser/NavigationEntry;
    .registers 4

    iget-object v0, p0, Liuh;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {v0, p1}, Lcom/opera/android/browser/NavigationHistory;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object p1

    iget-object v0, p0, Liuh;->c:Ljava/lang/Object;

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->e:Lw6j;

    iget-object v0, v0, Lw6j;->b:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseArray;

    invoke-interface {p1}, Lcom/opera/android/browser/NavigationEntry;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lknf;

    if-nez v0, :cond_1f

    return-object p1

    :cond_1f
    new-instance v1, Lc7l;

    invoke-direct {v1, p0, v0, p1}, Lc7l;-><init>(Liuh;Lknf;Lcom/opera/android/browser/NavigationEntry;)V

    return-object v1
.end method

.method public final j()I
    .registers 1

    iget-object p0, p0, Liuh;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result p0

    return p0
.end method

.method public final m(Lcom/opera/android/browser/SimpleUrlLoader;Ljava/lang/String;Lxnj;)V
    .registers 7

    iget-object v0, p0, Liuh;->b:Ljava/lang/Object;

    check-cast v0, Lv4b;

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Liuh;->c:Ljava/lang/Object;

    check-cast v2, Ljava/io/File;

    invoke-direct {v1, v2, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lv4b;->h(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p2

    new-instance v0, Lm25;

    const/4 v1, 0x3

    invoke-direct {v0, p0, p2, p3, v1}, Lm25;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lwa;

    const/16 p2, 0x19

    invoke-direct {p0, p3, p2}, Lwa;-><init>(Ljava/lang/Object;B)V

    const/4 p2, 0x1

    invoke-virtual {p1, p2, v0, p0}, Lcom/opera/android/browser/SimpleUrlLoader;->b(ZLorg/chromium/base/Callback;Lorg/chromium/base/Callback;)V

    return-void
.end method

.method public final removeAll()V
    .registers 4

    iget-object v0, p0, Liuh;->b:Ljava/lang/Object;

    check-cast v0, Lv4b;

    iget-object p0, p0, Liuh;->c:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    invoke-virtual {v0, p0}, Lv4b;->h(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {v0, p0}, Lv4b;->i(Landroid/net/Uri;)Lehc;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lehc;->listIterator(I)Ljava/util/ListIterator;

    move-result-object p0

    :goto_15
    move-object v1, p0

    check-cast v1, Lmea;

    invoke-virtual {v1}, Lmea;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_28

    invoke-virtual {v1}, Lmea;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    invoke-virtual {v0, v1}, Lv4b;->k(Landroid/net/Uri;)V

    goto :goto_15

    :cond_28
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 9

    iget-byte v0, p0, Liuh;->a:B

    packed-switch v0, :pswitch_data_44

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Liuh;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p0, p0, Liuh;->c:Ljava/lang/Object;

    move-object v1, p0

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_29

    const-string p0, ""

    goto :goto_3b

    :cond_29
    const/4 v6, 0x0

    const/16 v7, 0x3e

    const-string v2, ";"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object p0

    const-string v1, "; "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_3b
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_44
    .packed-switch 0xb
        :pswitch_a
    .end packed-switch
.end method

.method public final v(I)Z
    .registers 2

    iget-object p0, p0, Liuh;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {p0, p1}, Lcom/opera/android/browser/NavigationHistory;->v(I)Z

    move-result p0

    return p0
.end method
