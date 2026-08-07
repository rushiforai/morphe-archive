.class public Ll/nt00;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/nt00$b;,
        Ll/nt00$a;
    }
.end annotation


# static fields
.field public static volatile d:Ll/nt00;


# instance fields
.field public a:[I

.field public b:Ll/nt00$a;

.field public c:Z


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->d1:I

    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->t2:I

    .line 7
    .line 8
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->v2:I

    .line 9
    .line 10
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->u2:I

    .line 11
    .line 12
    filled-new-array {v0, v1, v2, v3}, [I

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/nt00;->a:[I

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 29
    .line 30
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Ll/nt00;->c:Z

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/nt00;->v()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic a([Ll/nqy;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/nqy;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic b(Ll/nt00;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nt00;->r(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic c([Ll/nqy;Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/nqy;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic d([Ll/nqy;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/nqy;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e(Ll/nt00;Lcom/p1/mobile/putong/feed/data/Moment;[Ll/nqy;Lcom/p1/mobile/android/app/Act;Ll/nt00$b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/nt00;->q(Lcom/p1/mobile/putong/feed/data/Moment;[Ll/nqy;Lcom/p1/mobile/android/app/Act;Ll/nt00$b;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic f(Ll/nt00;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/nt00;->c:Z

    return p0
.end method

.method public static k()Ll/nt00;
    .locals 2

    .line 1
    sget-object v0, Ll/nt00;->d:Ll/nt00;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/nt00;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/nt00;->d:Ll/nt00;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/nt00;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/nt00;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/nt00;->d:Ll/nt00;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/nt00;->d:Ll/nt00;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public final g()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/util/Pair;

    .line 7
    .line 8
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->d1:I

    .line 9
    .line 10
    invoke-virtual {p0, v2}, Ll/nt00;->s(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->g1:I

    .line 15
    .line 16
    invoke-virtual {p0, v3}, Ll/nt00;->s(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    new-instance v1, Landroid/util/Pair;

    .line 27
    .line 28
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->c1:I

    .line 29
    .line 30
    invoke-virtual {p0, v2}, Ll/nt00;->s(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->h1:I

    .line 35
    .line 36
    invoke-virtual {p0, v3}, Ll/nt00;->s(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    new-instance v1, Landroid/util/Pair;

    .line 47
    .line 48
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->e1:I

    .line 49
    .line 50
    invoke-virtual {p0, v2}, Ll/nt00;->s(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->i1:I

    .line 55
    .line 56
    invoke-virtual {p0, v3}, Ll/nt00;->s(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    new-instance v1, Landroid/util/Pair;

    .line 67
    .line 68
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->j1:I

    .line 69
    .line 70
    invoke-virtual {p0, v2}, Ll/nt00;->s(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string v2, ""

    .line 75
    .line 76
    invoke-direct {v1, p0, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    return-object v0
.end method

.method public h()I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/nt00;->i(Lcom/p1/mobile/putong/feed/data/Moment;)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public i(Lcom/p1/mobile/putong/feed/data/Moment;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nt00;->p(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/nt00;->n(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public j()Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/nt00;->p(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0, v0}, Ll/nt00;->n(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Ll/nt00;->a:[I

    .line 11
    .line 12
    aget v0, v1, v0

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/nt00;->s(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final l(Ljava/util/List;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/util/List<",
            "Lv/VListCell$a;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/util/Pair;

    .line 21
    .line 22
    new-instance v1, Lv/VListCell$a;

    .line 23
    .line 24
    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v2, Ljava/lang/CharSequence;

    .line 27
    .line 28
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 29
    .line 30
    move-object v3, v0

    .line 31
    check-cast v3, Ljava/lang/CharSequence;

    .line 32
    .line 33
    const/4 v6, -0x1

    .line 34
    sget v7, Ll/tec0;->y1:I

    .line 35
    .line 36
    const/4 v4, 0x0

    .line 37
    const/4 v5, -0x1

    .line 38
    invoke-direct/range {v1 .. v7}, Lv/VListCell$a;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;III)V

    .line 39
    .line 40
    .line 41
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    return-object p0
.end method

.method public m(I)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nt00;->a:[I

    .line 2
    .line 3
    aget p1, v0, p1

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/nt00;->s(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final n(Ljava/lang/String;)I
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, -0x1

    .line 12
    sparse-switch p0, :sswitch_data_0

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :sswitch_0
    const-string p0, "stranger"

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v3, v0

    .line 26
    goto :goto_0

    .line 27
    :sswitch_1
    const-string p0, "selfOnly"

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move v3, v1

    .line 37
    goto :goto_0

    .line 38
    :sswitch_2
    const-string p0, "matches"

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    move v3, v2

    .line 48
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 49
    .line 50
    .line 51
    return v2

    .line 52
    :pswitch_0
    return v0

    .line 53
    :pswitch_1
    const/4 p0, 0x3

    .line 54
    return p0

    .line 55
    :pswitch_2
    return v1

    .line 56
    nop

    .line 57
    :sswitch_data_0
    .sparse-switch
        0x321e8933 -> :sswitch_2
        0x470add18 -> :sswitch_1
        0x6a8cf076 -> :sswitch_0
    .end sparse-switch

    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public o(I)Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_2

    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    if-eq p1, p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x3

    .line 8
    if-eq p1, p0, :cond_0

    .line 9
    .line 10
    const-string p0, "everyone"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const-string p0, "selfOnly"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_1
    const-string p0, "stranger"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_2
    const-string p0, "matches"

    .line 20
    .line 21
    return-object p0
.end method

.method public p(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean p0, p0, Ll/nt00;->c:Z

    .line 2
    .line 3
    if-eqz p0, :cond_2

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 20
    .line 21
    const-string v0, "selfOnly"

    .line 22
    .line 23
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 30
    .line 31
    const-string p1, "stranger"

    .line 32
    .line 33
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    :cond_0
    return-object v0

    .line 40
    :cond_1
    const-string p0, "matches"

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 50
    .line 51
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_3

    .line 56
    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 58
    .line 59
    const-string v0, "unknown_"

    .line 60
    .line 61
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_3

    .line 66
    .line 67
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_3
    const-string p0, "everyone"

    .line 75
    .line 76
    return-object p0
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/feed/data/Moment;[Ll/nqy;Lcom/p1/mobile/android/app/Act;Ll/nt00$b;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p5, :cond_1

    .line 7
    .line 8
    iget-object p4, p1, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 9
    .line 10
    iget-object p5, p0, Ll/nt00;->b:Ll/nt00$a;

    .line 11
    .line 12
    invoke-static {p5}, Ll/nt00$a;->G(Ll/nt00$a;)I

    .line 13
    .line 14
    .line 15
    move-result p5

    .line 16
    invoke-virtual {p0, p5}, Ll/nt00;->o(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p5

    .line 20
    invoke-static {p4, p5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p4

    .line 24
    if-eqz p4, :cond_0

    .line 25
    .line 26
    aget-object p0, p2, v0

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/nqy;->b()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    sget-object p4, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 35
    .line 36
    .line 37
    move-result-object p5

    .line 38
    invoke-interface {p5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p5

    .line 42
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v0, p0, Ll/nt00;->b:Ll/nt00$a;

    .line 45
    .line 46
    invoke-static {v0}, Ll/nt00$a;->G(Ll/nt00$a;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-virtual {p0, v0}, Ll/nt00;->o(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p4, p5, p1, p0}, Ll/jka;->yd(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p3, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    new-instance p1, Ll/kt00;

    .line 63
    .line 64
    invoke-direct {p1, p2}, Ll/kt00;-><init>([Ll/nqy;)V

    .line 65
    .line 66
    .line 67
    new-instance p3, Ll/lt00;

    .line 68
    .line 69
    invoke-direct {p3, p2}, Ll/lt00;-><init>([Ll/nqy;)V

    .line 70
    .line 71
    .line 72
    invoke-static {p1, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_2

    .line 85
    .line 86
    iget-object p1, p0, Ll/nt00;->b:Ll/nt00$a;

    .line 87
    .line 88
    invoke-static {p1}, Ll/nt00$a;->F(Ll/nt00$a;)Ljava/util/List;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iget-object p3, p0, Ll/nt00;->b:Ll/nt00$a;

    .line 93
    .line 94
    invoke-static {p3}, Ll/nt00$a;->G(Ll/nt00$a;)I

    .line 95
    .line 96
    .line 97
    move-result p3

    .line 98
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    check-cast p1, Lv/VListCell$a;

    .line 103
    .line 104
    iget-object p0, p0, Ll/nt00;->b:Ll/nt00$a;

    .line 105
    .line 106
    invoke-static {p0}, Ll/nt00$a;->G(Ll/nt00$a;)I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    invoke-interface {p4, p1, p0}, Ll/nt00$b;->a(Lv/VListCell$a;I)V

    .line 111
    .line 112
    .line 113
    :cond_2
    aget-object p0, p2, v0

    .line 114
    .line 115
    invoke-virtual {p0}, Ll/nqy;->b()V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hidePublicMoments:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput-boolean p1, p0, Ll/nt00;->c:Z

    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final s(I)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public t(Lcom/p1/mobile/android/app/Act;ILl/nt00$b;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0, p2, p3}, Ll/nt00;->u(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;ILl/nt00$b;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public u(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;ILl/nt00$b;)V
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v6, v0, [Ll/nqy;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v7, 0x0

    .line 6
    aput-object v0, v6, v7

    .line 7
    .line 8
    new-instance v0, Ll/nt00$a;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/nt00;->g()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {p0, v2}, Ll/nt00;->l(Ljava/util/List;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    move-object v1, p0

    .line 19
    move-object v3, p1

    .line 20
    move-object v5, p2

    .line 21
    move v4, p3

    .line 22
    invoke-direct/range {v0 .. v5}, Ll/nt00$a;-><init>(Ll/nt00;Ljava/util/List;Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/feed/data/Moment;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/nt00;->b:Ll/nt00$a;

    .line 26
    .line 27
    new-instance v8, Ll/nqy$a;

    .line 28
    .line 29
    invoke-direct {v8, p1}, Ll/nqy$a;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->f1:I

    .line 33
    .line 34
    invoke-virtual {v8, v0}, Ll/nqy$a;->e0(I)Ll/nqy$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {}, Ll/j4h;->h()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    sget v2, Ll/lbc0;->m:I

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    sget v2, Ll/lbc0;->l:I

    .line 48
    .line 49
    :goto_0
    invoke-virtual {v0, v2}, Ll/nqy$a;->X(I)Ll/nqy$a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v2, Ll/it00;

    .line 54
    .line 55
    invoke-direct {v2, v6}, Ll/it00;-><init>([Ll/nqy;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v2}, Ll/nqy$a;->W(Landroid/view/View$OnClickListener;)Ll/nqy$a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->i:I

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Ll/nqy$a;->Z(I)Ll/nqy$a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static {}, Ll/j4h;->h()Z

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    if-eqz v4, :cond_1

    .line 77
    .line 78
    sget v4, Ll/k9c0;->i:I

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_1
    sget v4, Ll/k9c0;->n:I

    .line 82
    .line 83
    :goto_1
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    invoke-virtual {v0, v2}, Ll/nqy$a;->b0(I)Ll/nqy$a;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    const/high16 v2, 0x41880000    # 17.0f

    .line 92
    .line 93
    invoke-virtual {v0, v2}, Ll/nqy$a;->d0(F)Ll/nqy$a;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const/high16 v2, 0x41a00000    # 20.0f

    .line 98
    .line 99
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    invoke-virtual {v0, v2}, Ll/nqy$a;->c0(I)Ll/nqy$a;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0, v7}, Ll/nqy$a;->j0(Z)Ll/nqy$a;

    .line 108
    .line 109
    .line 110
    move-result-object v9

    .line 111
    new-instance v0, Ll/jt00;

    .line 112
    .line 113
    move-object v1, p0

    .line 114
    move-object v4, p1

    .line 115
    move-object v2, p2

    .line 116
    move-object v5, p4

    .line 117
    move-object v3, v6

    .line 118
    invoke-direct/range {v0 .. v5}, Ll/jt00;-><init>(Ll/nt00;Lcom/p1/mobile/putong/feed/data/Moment;[Ll/nqy;Lcom/p1/mobile/android/app/Act;Ll/nt00$b;)V

    .line 119
    .line 120
    .line 121
    move-object v2, v0

    .line 122
    move-object v0, v3

    .line 123
    invoke-virtual {v9, v2}, Ll/nqy$a;->Y(Landroid/view/View$OnClickListener;)Ll/nqy$a;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v2, v7}, Ll/nqy$a;->h0(I)Ll/nqy$a;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {v2, v7}, Ll/nqy$a;->i0(I)Ll/nqy$a;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    new-instance v4, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 136
    .line 137
    invoke-direct {v4, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v2, v4}, Ll/nqy$a;->V(Landroidx/recyclerview/widget/RecyclerView$o;)Ll/nqy$a;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    iget-object v1, p0, Ll/nt00;->b:Ll/nt00$a;

    .line 145
    .line 146
    invoke-virtual {v2, v1}, Ll/nqy$a;->O(Landroidx/recyclerview/widget/RecyclerView$Adapter;)Ll/nqy$a;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v8}, Ll/nqy$a;->N()Ll/nqy;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    aput-object v1, v0, v7

    .line 154
    .line 155
    invoke-virtual {v1}, Ll/nqy;->g()V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public final v()V
    .locals 2

    .line 1
    invoke-static {}, Ll/mrb0;->B()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ht00;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/ht00;-><init>(Ll/nt00;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method
