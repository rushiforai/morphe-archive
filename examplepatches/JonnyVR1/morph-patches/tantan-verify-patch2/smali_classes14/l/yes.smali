.class public Ll/yes;
.super Ll/o2n;
.source "SourceFile"


# instance fields
.field public h:Ljava/lang/String;

.field public i:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/o2n;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "ca-app-pub-6567608331519569/1198718362"

    .line 5
    .line 6
    iput-object v0, p0, Ll/yes;->h:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/yes;->i:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic k(Ll/yes;Lcom/google/android/gms/ads/AdView;)Lcom/google/android/gms/ads/AdView;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yes;->l(Lcom/google/android/gms/ads/AdView;)Lcom/google/android/gms/ads/AdView;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public c(Lcom/p1/mobile/android/app/Act;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            ")",
            "Lrx/c<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/n70;->g()Ll/n70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/n70;->f()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-boolean v0, p0, Ll/yes;->i:Z

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p1, v1}, Ll/o2n;->h(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    invoke-virtual {p0, p1}, Ll/yes;->m(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public final synthetic l(Lcom/google/android/gms/ads/AdView;)Lcom/google/android/gms/ads/AdView;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o2n;->b:Lcom/google/android/gms/ads/AdView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/o2n;->b:Lcom/google/android/gms/ads/AdView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/google/android/gms/ads/BaseAdView;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iput-object p1, p0, Ll/o2n;->b:Lcom/google/android/gms/ads/AdView;

    .line 21
    .line 22
    :cond_1
    return-object p1
.end method

.method public final m(Lcom/p1/mobile/android/app/Act;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            ")",
            "Lrx/c<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/sd2;->INSTANCE:Ll/sd2;

    .line 2
    .line 3
    iget-object v1, p0, Ll/yes;->h:Ljava/lang/String;

    .line 4
    .line 5
    filled-new-array {v1}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x7

    .line 10
    invoke-virtual {v0, p1, v2, v1}, Ll/sd2;->f(Lcom/p1/mobile/android/app/Act;I[Ljava/lang/String;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/xes;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/xes;-><init>(Ll/yes;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {}, Ll/psd0;->R()Lrx/c$d;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method
