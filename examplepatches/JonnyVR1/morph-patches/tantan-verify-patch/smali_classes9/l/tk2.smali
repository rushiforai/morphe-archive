.class public Ll/tk2;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ll/iam;",
        ">",
        "Ll/y8s<",
        "Ll/oo2;",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S3(Ll/bkj0;Ll/bkj0;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p1, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    sub-int/2addr p0, p1

    .line 18
    return p0
.end method

.method public static synthetic T3(Ll/y20;Ll/uwl;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/tk2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    check-cast p1, Ll/tk2;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0}, Ll/awr;->a(Ljava/lang/Exception;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic U3(Ljava/util/List;Ll/bkj0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Landroid/view/View;

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic V3(Ll/aeg;Ll/tk2;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ll/tk2;->g4(Ll/aeg;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W3(Ljava/util/List;Ll/tk2;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/tk2;->a4()Ll/bkj0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/tk2;->a4()Ll/bkj0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic X3(Ll/aeg;Ll/tk2;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ll/tk2;->h4(Ll/aeg;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final Y3(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/tk2;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/sk2;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Ll/sk2;-><init>(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final Z3()Ll/x7g;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/oo2;->B:Ll/x7g;

    .line 6
    .line 7
    return-object p0
.end method

.method public a4()Ll/bkj0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public b4()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
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
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ll/nk2;

    .line 12
    .line 13
    invoke-direct {v2, v1}, Ll/nk2;-><init>(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v2}, Ll/tk2;->Y3(Ll/y20;)V

    .line 17
    .line 18
    .line 19
    new-instance p0, Ll/ok2;

    .line 20
    .line 21
    invoke-direct {p0}, Ll/ok2;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v1, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/pk2;

    .line 28
    .line 29
    invoke-direct {p0, v0}, Ll/pk2;-><init>(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, p0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    return-object v0
.end method

.method public final c4(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/bae0$a;

    .line 19
    .line 20
    const/16 v2, 0x1b59

    .line 21
    .line 22
    invoke-direct {v1, v2}, Ll/bae0$a;-><init>(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    if-eqz p2, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->hideFansClubDialog()Ll/v3f$c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    return-void
.end method

.method public d4()V
    .locals 1

    .line 1
    new-instance v0, Ll/qk2;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qk2;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/tk2;->Y3(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final e4(ZLl/aeg;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->hideFansClubDialog()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->showFansClubCompanyDialog()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ll/o6g;

    .line 25
    .line 26
    invoke-direct {v0, p1, p2}, Ll/o6g;-><init>(ZLl/aeg;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public f4(Ll/aeg;)V
    .locals 1

    .line 1
    new-instance v0, Ll/mk2;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/mk2;-><init>(Ll/aeg;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/tk2;->Y3(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g4(Ll/aeg;)V
    .locals 0

    .line 1
    return-void
.end method

.method public h4(Ll/aeg;)V
    .locals 1

    .line 1
    new-instance v0, Ll/rk2;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/rk2;-><init>(Ll/aeg;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/tk2;->Y3(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
