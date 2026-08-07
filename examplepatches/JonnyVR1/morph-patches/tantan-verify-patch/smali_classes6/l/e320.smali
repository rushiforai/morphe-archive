.class public Ll/e320;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/k6c;

.field public b:Ll/v370;

.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Lcom/p1/mobile/putong/data/Links;


# direct methods
.method public constructor <init>(Ll/k6c;Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/v370;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/v370;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/e320;->b:Ll/v370;

    .line 10
    .line 11
    iput-object p1, p0, Ll/e320;->a:Ll/k6c;

    .line 12
    .line 13
    iput-object p2, p0, Ll/e320;->c:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Ll/e320;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e320;->e(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic b(Ll/e320;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e320;->d(Ll/bkj0;)V

    return-void
.end method


# virtual methods
.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e320;->d:Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public final synthetic d(Ll/bkj0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e320;->a:Ll/k6c;

    .line 2
    .line 3
    iget-object v1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v2, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v2, Ljava/util/List;

    .line 14
    .line 15
    iget-object v3, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v3, Lcom/p1/mobile/putong/data/Links;

    .line 18
    .line 19
    invoke-interface {v0, v1, v2, v3}, Ll/k6c;->c(ILjava/util/List;Lcom/p1/mobile/putong/data/Links;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p1, Lcom/p1/mobile/putong/data/Links;

    .line 25
    .line 26
    iput-object p1, p0, Ll/e320;->d:Lcom/p1/mobile/putong/data/Links;

    .line 27
    .line 28
    return-void
.end method

.method public final synthetic e(Ll/bkj0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e320;->a:Ll/k6c;

    .line 2
    .line 3
    iget-object v1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v2, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v2, Ljava/util/List;

    .line 14
    .line 15
    iget-object v3, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v3, Lcom/p1/mobile/putong/data/Links;

    .line 18
    .line 19
    invoke-interface {v0, v1, v2, v3}, Ll/k6c;->c(ILjava/util/List;Lcom/p1/mobile/putong/data/Links;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p1, Lcom/p1/mobile/putong/data/Links;

    .line 25
    .line 26
    iput-object p1, p0, Ll/e320;->d:Lcom/p1/mobile/putong/data/Links;

    .line 27
    .line 28
    return-void
.end method

.method public f()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e320;->d:Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/e320;->c:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 16
    .line 17
    iget-object v2, p0, Ll/e320;->d:Lcom/p1/mobile/putong/data/Links;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v2}, Ll/dog;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v1, v2}, Ll/jka;->xc(Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/b320;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/b320;-><init>(Ll/e320;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/e320;->a:Ll/k6c;

    .line 39
    .line 40
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    new-instance v2, Ll/c320;

    .line 44
    .line 45
    invoke-direct {v2, p0}, Ll/c320;-><init>(Ll/k6c;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public g()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e320;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p0, Ll/e320;->b:Ll/v370;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/v370;->I()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/d320;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/d320;-><init>(Ll/e320;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/e320;->a:Ll/k6c;

    .line 19
    .line 20
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/c320;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/c320;-><init>(Ll/k6c;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method
