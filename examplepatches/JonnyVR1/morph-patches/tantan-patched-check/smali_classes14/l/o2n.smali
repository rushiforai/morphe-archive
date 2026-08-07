.class public Ll/o2n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z60;


# instance fields
.field public a:Ll/md20;

.field public b:Lcom/google/android/gms/ads/AdView;

.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Landroid/view/ViewGroup;

.field public e:Ll/cfs;

.field public f:Ll/yes;

.field public g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/o2n;->g:Ljava/util/Map;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d(Ll/o2n;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/o2n;->i(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method private synthetic i(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/android/app/c;->c:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    if-ne v0, p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Ll/o2n;->a:Ll/md20;

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
    iget-object p1, p0, Ll/o2n;->a:Ll/md20;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/md20;->a()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Ll/o2n;->b:Lcom/google/android/gms/ads/AdView;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_3

    .line 27
    .line 28
    iget-object p0, p0, Ll/o2n;->b:Lcom/google/android/gms/ads/AdView;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/google/android/gms/ads/BaseAdView;->a()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 35
    .line 36
    if-ne v0, p1, :cond_2

    .line 37
    .line 38
    iget-object p1, p0, Ll/o2n;->b:Lcom/google/android/gms/ads/AdView;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_3

    .line 45
    .line 46
    iget-object p0, p0, Ll/o2n;->b:Lcom/google/android/gms/ads/AdView;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/google/android/gms/ads/BaseAdView;->c()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 53
    .line 54
    if-ne v0, p1, :cond_3

    .line 55
    .line 56
    iget-object p1, p0, Ll/o2n;->b:Lcom/google/android/gms/ads/AdView;

    .line 57
    .line 58
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    iget-object p0, p0, Ll/o2n;->b:Lcom/google/android/gms/ads/AdView;

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/google/android/gms/ads/BaseAdView;->d()V

    .line 67
    .line 68
    .line 69
    :cond_3
    return-void
.end method


# virtual methods
.method public g(I)Ll/o2n;
    .locals 0

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0

    .line 6
    :pswitch_0
    new-instance p0, Ll/fsw;

    .line 7
    .line 8
    invoke-direct {p0}, Ll/fsw;-><init>()V

    .line 9
    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_1
    new-instance p0, Ll/lfy;

    .line 13
    .line 14
    invoke-direct {p0}, Ll/lfy;-><init>()V

    .line 15
    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_2
    new-instance p0, Ll/lgy;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/lgy;-><init>()V

    .line 21
    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_3
    iget-object p1, p0, Ll/o2n;->f:Ll/yes;

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    new-instance p1, Ll/yes;

    .line 29
    .line 30
    invoke-direct {p1}, Ll/yes;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Ll/o2n;->f:Ll/yes;

    .line 34
    .line 35
    :cond_0
    iget-object p0, p0, Ll/o2n;->f:Ll/yes;

    .line 36
    .line 37
    return-object p0

    .line 38
    :pswitch_4
    iget-object p1, p0, Ll/o2n;->e:Ll/cfs;

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    new-instance p1, Ll/cfs;

    .line 43
    .line 44
    invoke-direct {p1}, Ll/cfs;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Ll/o2n;->e:Ll/cfs;

    .line 48
    .line 49
    :cond_1
    iget-object p0, p0, Ll/o2n;->e:Ll/cfs;

    .line 50
    .line 51
    return-object p0

    .line 52
    :pswitch_5
    new-instance p0, Ll/ffm0;

    .line 53
    .line 54
    invoke-direct {p0}, Ll/ffm0;-><init>()V

    .line 55
    .line 56
    .line 57
    return-object p0

    .line 58
    :pswitch_6
    new-instance p0, Ll/qhe0;

    .line 59
    .line 60
    invoke-direct {p0}, Ll/qhe0;-><init>()V

    .line 61
    .line 62
    .line 63
    return-object p0

    .line 64
    :pswitch_7
    new-instance p0, Ll/mb50;

    .line 65
    .line 66
    invoke-direct {p0}, Ll/mb50;-><init>()V

    .line 67
    .line 68
    .line 69
    return-object p0

    .line 70
    :pswitch_8
    new-instance p0, Ll/xn90;

    .line 71
    .line 72
    invoke-direct {p0, p1}, Ll/xn90;-><init>(I)V

    .line 73
    .line 74
    .line 75
    return-object p0

    .line 76
    :pswitch_9
    new-instance p0, Ll/y60;

    .line 77
    .line 78
    invoke-direct {p0}, Ll/y60;-><init>()V

    .line 79
    .line 80
    .line 81
    return-object p0

    .line 82
    nop

    .line 83
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_8
        :pswitch_0
    .end packed-switch
.end method

.method public h(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o2n;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Ll/o2n;->d:Landroid/view/ViewGroup;

    .line 4
    .line 5
    invoke-interface {p0}, Ll/z60;->b()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance p2, Ll/l2n;

    .line 16
    .line 17
    invoke-direct {p2}, Ll/l2n;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance p2, Ll/m2n;

    .line 25
    .line 26
    invoke-direct {p2, p0}, Ll/m2n;-><init>(Ll/o2n;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/n2n;

    .line 30
    .line 31
    invoke-direct {p0}, Ll/n2n;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public j(Ljava/lang/String;Ljava/lang/Object;)Ll/o2n;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o2n;->g:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
