.class public final Ltw2;
.super Ljava/lang/Object;

# interfaces
.implements Lkud;
.implements Lcrn;
.implements Lf94;
.implements Loq2;
.implements Lgk8;
.implements Lbcf;
.implements Lann;
.implements Lqc6;
.implements Lir6;


# static fields
.field public static volatile c:Lbr3;

.field public static final d:Lyu9;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lyu9;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lyu9;-><init>(B)V

    sput-object v0, Ltw2;->d:Lyu9;

    return-void
.end method

.method public constructor <init>(B)V
    .registers 6

    iput-byte p1, p0, Ltw2;->a:B

    sparse-switch p1, :sswitch_data_68

    const-class p1, Ltw2;

    monitor-enter p1

    :try_start_8
    const-string v0, "BC"

    invoke-static {v0}, Ljava/security/Security;->getProvider(Ljava/lang/String;)Ljava/security/Provider;

    move-result-object v0

    instance-of v1, v0, Lbr3;

    if-nez v1, :cond_1f

    sget-object v0, Ltw2;->c:Lbr3;

    if-nez v0, :cond_1d

    new-instance v0, Lbr3;

    invoke-direct {v0}, Lbr3;-><init>()V

    sput-object v0, Ltw2;->c:Lbr3;

    :cond_1d
    sget-object v0, Ltw2;->c:Lbr3;
    :try_end_1f
    .catchall {:try_start_8 .. :try_end_1f} :catchall_2a

    :cond_1f
    monitor-exit p1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    check-cast v0, Lbr3;

    iput-object v0, p0, Ltw2;->b:Ljava/lang/Object;

    return-void

    :goto_28
    :try_start_28
    monitor-exit p1
    :try_end_29
    .catchall {:try_start_28 .. :try_end_29} :catchall_2a

    throw p0

    :catchall_2a
    move-exception p0

    goto :goto_28

    :sswitch_2c
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lfee;->k()Lfee;

    move-result-object p1

    iput-object p1, p0, Ltw2;->b:Ljava/lang/Object;

    return-void

    :sswitch_36
    new-instance p1, Li9d;

    sget-object v0, Ltw2;->d:Lyu9;

    sget-object v1, Ly6h;->c:Ly6h;

    :try_start_3c
    const-string v1, "androidx.datastore.preferences.protobuf.DescriptorMessageInfoFactory"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getInstance"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v1, v3, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpvd;
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_4f} :catch_50

    move-object v0, v1

    :catch_50
    const/4 v1, 0x2

    new-array v1, v1, [Lpvd;

    sget-object v2, Lyu9;->b:Lyu9;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object v0, v1, v2

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p1, Li9d;->a:[Lpvd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Ljfb;->a:Ljava/nio/charset/Charset;

    iput-object p1, p0, Ltw2;->b:Ljava/lang/Object;

    return-void

    :sswitch_data_68
    .sparse-switch
        0x2 -> :sswitch_36
        0x10 -> :sswitch_2c
    .end sparse-switch
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 104
    iput-byte p2, p0, Ltw2;->a:B

    iput-object p1, p0, Ltw2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lu59;Lvrb;)V
    .registers 3

    const/16 p2, 0x18

    iput-byte p2, p0, Ltw2;->a:B

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput-object p1, p0, Ltw2;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lxqe;)V
    .registers 4

    const/16 v0, 0x9

    iput-byte v0, p0, Ltw2;->a:B

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-object p1, p0, Ltw2;->b:Ljava/lang/Object;

    .line 109
    new-instance v0, Lq02;

    const/16 v1, 0xb

    invoke-direct {v0, p0, v1}, Lq02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lxqe;->n(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static q(Lh5a;Ljava/util/List;)Ljt8;
    .registers 10

    check-cast p1, Ljava/lang/Iterable;

    instance-of v0, p1, Ljava/util/Collection;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_11

    move-object v3, p1

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_27

    :cond_11
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_15
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_27

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lqrm;

    instance-of v4, v4, Lewa;

    if-eqz v4, :cond_15

    move v3, v1

    goto :goto_28

    :cond_27
    move v3, v2

    :goto_28
    if-eqz v0, :cond_33

    move-object v4, p1

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4f

    :cond_33
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_37
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lqrm;

    instance-of v6, v5, Lswg;

    if-nez v6, :cond_4d

    invoke-static {v5}, Lz7h;->t(Lqrm;)Z

    move-result v5

    if-eqz v5, :cond_37

    :cond_4d
    move v4, v1

    goto :goto_50

    :cond_4f
    move v4, v2

    :goto_50
    if-eqz v0, :cond_5b

    move-object v5, p1

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_7b

    :cond_5b
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_5f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lqrm;

    instance-of v7, v6, Lswg;

    if-nez v7, :cond_79

    instance-of v7, v6, Lqva;

    if-nez v7, :cond_79

    invoke-static {v6}, Lz7h;->t(Lqrm;)Z

    move-result v6

    if-eqz v6, :cond_5f

    :cond_79
    move v5, v1

    goto :goto_7c

    :cond_7b
    move v5, v2

    :goto_7c
    if-eqz v0, :cond_87

    move-object v0, p1

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_9e

    :cond_87
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_8b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqrm;

    invoke-static {v0}, Lz7h;->t(Lqrm;)Z

    move-result v0

    if-eqz v0, :cond_8b

    move v2, v1

    :cond_9e
    invoke-virtual {p0}, Lh5a;->a()Lvt8;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const-string v0, " or "

    const/4 v6, 0x0

    if-eqz p1, :cond_126

    if-eq p1, v1, :cond_105

    const/4 v1, 0x3

    const/4 v4, 0x2

    if-eq p1, v4, :cond_ce

    if-eq p1, v1, :cond_c4

    const/4 v0, 0x4

    if-ne p1, v0, :cond_c0

    sget-object p1, Ldtm;->f:Ldtm;

    invoke-virtual {p1}, Ldtm;->toString()Ljava/lang/String;

    move-result-object p1

    if-nez v2, :cond_13e

    goto/16 :goto_13f

    :cond_c0
    invoke-static {}, Lh9o;->p()V

    return-object v6

    :cond_c4
    sget-object p1, Ldtm;->d:Ldtm;

    invoke-virtual {p1}, Ldtm;->toString()Ljava/lang/String;

    move-result-object p1

    if-nez v3, :cond_13e

    goto/16 :goto_13f

    :cond_ce
    move-object p1, p0

    check-cast p1, Lu4n;

    iget-object p1, p1, Lu4n;->a:Lt4n;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eq p1, v4, :cond_fc

    if-ne p1, v1, :cond_13e

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Ldtm;->c:Ldtm;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ldtm;->f:Ldtm;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Ldtm;->e:Ldtm;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    if-nez v5, :cond_13e

    goto :goto_13f

    :cond_fc
    sget-object p1, Ldtm;->f:Ldtm;

    invoke-virtual {p1}, Ldtm;->toString()Ljava/lang/String;

    move-result-object p1

    if-nez v2, :cond_13e

    goto :goto_13f

    :cond_105
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Ldtm;->c:Ldtm;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ldtm;->f:Ldtm;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Ldtm;->e:Ldtm;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    if-nez v5, :cond_13e

    goto :goto_13f

    :cond_126
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Ldtm;->c:Ldtm;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Ldtm;->f:Ldtm;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    if-eqz v4, :cond_13f

    :cond_13e
    move-object p1, v6

    :cond_13f
    :goto_13f
    if-eqz p1, :cond_147

    new-instance v0, Ljt8;

    invoke-direct {v0, p1, p0}, Ljt8;-><init>(Ljava/lang/String;Lh5a;)V

    return-object v0

    :cond_147
    return-object v6
.end method

.method public static r(IIIIZZ)Ltw2;
    .registers 7

    new-instance v0, Ltw2;

    invoke-static/range {p0 .. p5}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;->obtain(IIIIZZ)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    move-result-object p0

    const/4 p1, 0x3

    invoke-direct {v0, p0, p1}, Ltw2;-><init>(Ljava/lang/Object;B)V

    return-object v0
.end method

.method public static t(Lgt;)Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_29

    const/4 v0, 0x1

    if-eq p0, v0, :cond_26

    const/4 v0, 0x2

    if-eq p0, v0, :cond_23

    const/4 v0, 0x3

    if-eq p0, v0, :cond_20

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1d

    const/4 v0, 0x5

    if-ne p0, v0, :cond_18

    const-string p0, "search"

    return-object p0

    :cond_18
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_1d
    const-string p0, "bookmarks"

    return-object p0

    :cond_20
    const-string p0, "tools_you_may_like"

    return-object p0

    :cond_23
    const-string p0, "frequently_visited"

    return-object p0

    :cond_26
    const-string p0, "categories"

    return-object p0

    :cond_29
    const-string p0, "popular_sites"

    return-object p0
.end method

.method public static w(Lkq8;)Ljava/lang/String;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    packed-switch p0, :pswitch_data_36

    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :pswitch_c
    const-string p0, "travel"

    return-object p0

    :pswitch_f
    const-string p0, "sport"

    return-object p0

    :pswitch_12
    const-string p0, "social"

    return-object p0

    :pswitch_15
    const-string p0, "shopping"

    return-object p0

    :pswitch_18
    const-string p0, "search"

    return-object p0

    :pswitch_1b
    const-string p0, "other"

    return-object p0

    :pswitch_1e
    const-string p0, "news"

    return-object p0

    :pswitch_21
    const-string p0, "government"

    return-object p0

    :pswitch_24
    const-string p0, "gaming"

    return-object p0

    :pswitch_27
    const-string p0, "finance"

    return-object p0

    :pswitch_2a
    const-string p0, "entertainment"

    return-object p0

    :pswitch_2d
    const-string p0, "education"

    return-object p0

    :pswitch_30
    const-string p0, "dating"

    return-object p0

    :pswitch_33
    const-string p0, "betting"

    return-object p0

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_33
        :pswitch_30
        :pswitch_2d
        :pswitch_2a
        :pswitch_27
        :pswitch_24
        :pswitch_21
        :pswitch_1e
        :pswitch_1b
        :pswitch_18
        :pswitch_15
        :pswitch_12
        :pswitch_f
        :pswitch_c
    .end packed-switch
.end method


# virtual methods
.method public final a()I
    .registers 2

    invoke-virtual {p0}, Ltw2;->k()S

    move-result v0

    shl-int/lit8 v0, v0, 0x8

    invoke-virtual {p0}, Ltw2;->k()S

    move-result p0

    or-int/2addr v0, p0

    return v0
.end method

.method public final b()Landroid/view/ViewGroup;
    .registers 1

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lx22;

    iget-object p0, p0, Lx22;->g:Landroid/view/ViewGroup;

    return-object p0
.end method

.method public final c()V
    .registers 1

    return-void
.end method

.method public final d()V
    .registers 3

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Luk5;

    new-instance v0, Ldzh;

    const-string v1, "Wallpaper"

    invoke-direct {v0, v1}, Ldzh;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Lrw7;

    invoke-direct {v1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Luk5;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final e()V
    .registers 3

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Luk5;

    new-instance v0, Ldzh;

    const-string v1, "Wallpaper"

    invoke-direct {v0, v1}, Ldzh;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Lrw7;

    invoke-direct {v1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Luk5;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final f(Litd;Z)V
    .registers 11

    iget-byte v0, p0, Ltw2;->a:B

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_58

    check-cast p0, Lxp1;

    invoke-virtual {p1}, Litd;->k()Litd;

    move-result-object v0

    const/4 v2, 0x1

    if-eq v0, p1, :cond_13

    move v3, v2

    goto :goto_14

    :cond_13
    move v3, v1

    :goto_14
    if-eqz v3, :cond_17

    move-object p1, v0

    :cond_17
    iget-object v4, p0, Lxp1;->K:[Lwp1;

    if-eqz v4, :cond_1d

    array-length v5, v4

    goto :goto_1e

    :cond_1d
    move v5, v1

    :goto_1e
    if-ge v1, v5, :cond_2b

    aget-object v6, v4, v1

    if-eqz v6, :cond_28

    iget-object v7, v6, Lwp1;->h:Litd;

    if-eq v7, p1, :cond_2c

    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    :cond_2b
    const/4 v6, 0x0

    :cond_2c
    if-eqz v6, :cond_3c

    if-eqz v3, :cond_39

    iget p1, v6, Lwp1;->a:I

    invoke-virtual {p0, p1, v6, v0}, Lxp1;->p(ILwp1;Litd;)V

    invoke-virtual {p0, v6, v2}, Lxp1;->r(Lwp1;Z)V

    goto :goto_3c

    :cond_39
    invoke-virtual {p0, v6, p2}, Lxp1;->r(Lwp1;Z)V

    :cond_3c
    :goto_3c
    return-void

    :pswitch_3d
    instance-of v0, p1, Lakk;

    if-eqz v0, :cond_4d

    move-object v0, p1

    check-cast v0, Lakk;

    iget-object v0, v0, Lakk;->A:Litd;

    invoke-virtual {v0}, Litd;->k()Litd;

    move-result-object v0

    invoke-virtual {v0, v1}, Litd;->c(Z)V

    :cond_4d
    check-cast p0, Lne;

    iget-object p0, p0, Lne;->e:Lkud;

    if-eqz p0, :cond_56

    invoke-interface {p0, p1, p2}, Lkud;->f(Litd;Z)V

    :cond_56
    return-void

    nop

    :pswitch_data_58
    .packed-switch 0x4
        :pswitch_3d
    .end packed-switch
.end method

.method public final g()Z
    .registers 2

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lx22;

    iget-object v0, p0, Lx22;->u:Lsba;

    if-nez v0, :cond_10

    iget-object p0, p0, Lx22;->g:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result p0

    if-nez p0, :cond_12

    :cond_10
    const/4 p0, 0x0

    return p0

    :cond_12
    const/4 p0, 0x1

    return p0
.end method

.method public final h()Ljava/lang/Object;
    .registers 1

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    return-object p0
.end method

.method public final i()Lfee;
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final j()Lrn9;
    .registers 4

    new-instance v0, Lrn9;

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lx22;

    iget-object p0, p0, Lx22;->h:Lwv1;

    iget-object p0, p0, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorm;

    const/16 v1, 0x12

    sget-object v2, Lmf0;->i:Lmf0;

    invoke-direct {v0, p0, v2, v1}, Lrn9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0
.end method

.method public final k()S
    .registers 2

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Ljava/io/InputStream;

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result p0

    const/4 v0, -0x1

    if-eq p0, v0, :cond_d

    int-to-short p0, p0

    return p0

    :cond_d
    new-instance p0, Lhr6;

    invoke-direct {p0}, Lhr6;-><init>()V

    throw p0
.end method

.method public final l(Lru2;)V
    .registers 3

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lmq2;

    iget-object v0, p0, Lmq2;->j:Lhp2;

    invoke-virtual {v0}, Lhp2;->a()Z

    move-result v0

    if-eqz v0, :cond_d

    return-void

    :cond_d
    iget-object p0, p0, Lmq2;->e:Lzy9;

    invoke-virtual {p0, p1}, Lzy9;->l(Lru2;)V

    return-void
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 7

    iget-byte p1, p0, Ltw2;->a:B

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_7c

    check-cast p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    invoke-virtual {p0}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result p1

    if-eqz p1, :cond_11

    move-object p1, p2

    goto :goto_12

    :cond_11
    const/4 p1, 0x0

    :goto_12
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->D:Lg3o;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1f

    iput-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->D:Lg3o;

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    :cond_1f
    iget-object p0, p2, Lg3o;->a:Ld3o;

    invoke-virtual {p0}, Ld3o;->c()Lg3o;

    move-result-object p0

    return-object p0

    :pswitch_26
    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->b:Lzy4;

    iget-boolean v0, p1, Lzy4;->n:Z

    const/16 v1, 0x287

    if-eqz v0, :cond_33

    const/16 v0, 0x207

    goto :goto_34

    :cond_33
    move v0, v1

    :goto_34
    iget-object v2, p2, Lg3o;->a:Ld3o;

    invoke-virtual {v2, v0}, Ld3o;->i(I)Lr9b;

    move-result-object v0

    invoke-virtual {v2}, Ld3o;->n()Lr9b;

    move-result-object v3

    invoke-virtual {v2, v1}, Ld3o;->i(I)Lr9b;

    move-result-object v1

    iget v2, v3, Lr9b;->d:I

    iget v1, v1, Lr9b;->d:I

    if-gt v2, v1, :cond_49

    const/4 v2, 0x0

    :cond_49
    iget-object v1, p1, Lzy4;->b:Lr9b;

    invoke-virtual {v1, v0}, Lr9b;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_55

    iget v1, p1, Lzy4;->e:I

    if-eq v1, v2, :cond_68

    :cond_55
    iput-object v0, p1, Lzy4;->b:Lr9b;

    iput v2, p1, Lzy4;->e:I

    invoke-virtual {p1}, Lzy4;->S()V

    iget v1, p1, Lzy4;->q:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_68

    invoke-virtual {p1}, Lzy4;->R()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a(I)V

    :cond_68
    iget p1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->f:I

    iget v1, v0, Lr9b;->b:I

    iget v0, v0, Lr9b;->d:I

    if-ne p1, v1, :cond_74

    iget p1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->g:I

    if-eq p1, v0, :cond_7b

    :cond_74
    iput v1, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->f:I

    iput v0, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->g:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_7b
    return-object p2

    :pswitch_data_7c
    .packed-switch 0x13
        :pswitch_26
    .end packed-switch
.end method

.method public final m(Lsba;Llrn;)V
    .registers 4

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lx22;

    invoke-virtual {p1, p2}, Llz3;->a(Lkz3;)V

    new-instance p2, Lq22;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lq22;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Llz3;->a(Lkz3;)V

    invoke-virtual {p1}, Llz3;->f()V

    iput-object p1, p0, Lx22;->u:Lsba;

    return-void
.end method

.method public final n(Ljava/lang/String;)Lcom/usercentrics/sdk/v2/settings/data/ConsentDisclosureObject;
    .registers 4

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lu59;

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Leqa;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Loup;->M()V

    iget-object v0, p0, Leqa;->a:Ld71;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Leqa;->a(Ljava/util/Map;)Ljava/util/LinkedHashMap;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Ld71;->a(Ljava/lang/String;Ljava/util/LinkedHashMap;)Ljava/net/HttpURLConnection;

    move-result-object p0

    const-string p1, "GET"

    invoke-virtual {p0, p1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    invoke-static {p0}, Ld71;->d(Ljava/net/HttpURLConnection;)Lgqa;

    move-result-object p0

    iget-object p0, p0, Lgqa;->b:Ljava/lang/String;

    sget-object p1, Lxrb;->a:Lcrb;

    iget-object v0, p1, Lrpb;->b:Lx79;

    const-class v1, Lcom/usercentrics/sdk/v2/settings/data/ConsentDisclosureObject;

    invoke-static {v1}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v1

    invoke-static {v0, v1}, Lzwg;->p(Lx79;Lytb;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-virtual {p1, p0, v0}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/usercentrics/sdk/v2/settings/data/ConsentDisclosureObject;

    return-object p0
.end method

.method public final o(Lbp3;Ljava/util/ArrayList;ILjava/util/List;)Lkt8;
    .registers 10

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p3, v0, :cond_b2

    iget-object p2, p1, Lbp3;->f:Ljava/lang/Object;

    check-cast p2, Ljava/util/Set;

    check-cast p4, Ljava/lang/Iterable;

    invoke-static {p2, p4}, Lb5j;->e(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    iget-object p3, p1, Lbp3;->h:Ljava/lang/Object;

    check-cast p3, Ljava/util/List;

    invoke-static {p3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    new-instance p3, Ljava/util/ArrayList;

    const/16 p4, 0xa

    invoke-static {p2, p4}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result p4

    invoke-direct {p3, p4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :goto_29
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3d

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lh5a;

    invoke-virtual {v0}, Lh5a;->a()Lvt8;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_29

    :cond_3d
    invoke-static {p3}, Lkotlin/collections/CollectionsKt;->F(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p3

    check-cast p3, Ljava/lang/Iterable;

    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_47
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    const/4 v0, 0x1

    if-eqz p4, :cond_7b

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lvt8;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5d
    :goto_5d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_74

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lh5a;

    invoke-virtual {v4}, Lh5a;->a()Lvt8;

    move-result-object v4

    if-ne v4, p4, :cond_5d

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5d

    :cond_74
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p4

    if-le p4, v0, :cond_47

    goto :goto_af

    :cond_7b
    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lxd4;

    new-instance p3, Lwth;

    invoke-direct {p3, p2, v0}, Lwth;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :cond_8b
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a1

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lh5a;

    invoke-virtual {v1, p1, p0}, Lh5a;->b(Lbp3;Lxd4;)Z

    move-result v2

    if-nez v2, :cond_8b

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    goto :goto_af

    :cond_a1
    :try_start_a1
    invoke-static {p0, p1, p3}, Ly7h;->j(Lxd4;Lbp3;Lwth;)V
    :try_end_a4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a1 .. :try_end_a4} :catch_af
    .catch Lkg4; {:try_start_a1 .. :try_end_a4} :catch_af

    new-instance p0, Lgt8;

    new-instance p1, Lwth;

    invoke-direct {p1, p2, v0}, Lwth;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p0, p1}, Lgt8;-><init>(Lwth;)V

    return-object p0

    :catch_af
    :goto_af
    sget-object p0, Lht8;->a:Lht8;

    return-object p0

    :cond_b2
    add-int/lit8 v0, p3, 0x1

    move-object v1, p4

    check-cast v1, Ljava/util/Collection;

    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    invoke-static {p3, v1}, Lkotlin/collections/CollectionsKt;->W(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p3

    invoke-virtual {p0, p1, p2, v0, p3}, Ltw2;->o(Lbp3;Ljava/util/ArrayList;ILjava/util/List;)Lkt8;

    move-result-object p3

    instance-of v1, p3, Lgt8;

    if-eqz v1, :cond_c8

    return-object p3

    :cond_c8
    invoke-virtual {p0, p1, p2, v0, p4}, Ltw2;->o(Lbp3;Ljava/util/ArrayList;ILjava/util/List;)Lkt8;

    move-result-object p0

    return-object p0
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 4

    invoke-interface {p1}, Lv84;->isCanceled()Z

    move-result p1

    if-eqz p1, :cond_7

    return-void

    :cond_7
    new-instance p1, Lxi2;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lxi2;-><init>(Ltw2;Ljava/io/IOException;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 5

    const-string p1, "Invalid JSON: "

    :try_start_2
    iget-object v0, p2, Lpzh;->g:Lvzh;

    invoke-virtual {v0}, Lvzh;->string()Ljava/lang/String;

    move-result-object v0

    iget-boolean v1, p2, Lpzh;->q:Z
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_a} :catch_34

    if-eqz v1, :cond_2a

    :try_start_c
    iget-object p2, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p2, Lyi2;

    invoke-virtual {p2, v0}, Lyi2;->d(Ljava/lang/String;)V
    :try_end_13
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_13} :catch_14
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_13} :catch_34

    goto :goto_3e

    :catch_14
    :try_start_14
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Lbi2;

    const/4 v0, 0x3

    invoke-direct {p2, p0, p1, v0}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_3e

    :cond_2a
    new-instance p1, Lbi2;

    const/4 v0, 0x4

    invoke-direct {p1, p0, p2, v0}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_33} :catch_34

    goto :goto_3e

    :catch_34
    move-exception p1

    new-instance p2, Lxi2;

    const/4 v0, 0x0

    invoke-direct {p2, p0, p1, v0}, Lxi2;-><init>(Ltw2;Ljava/io/IOException;B)V

    invoke-static {p2}, Lvml;->c(Ljava/lang/Runnable;)V

    :goto_3e
    return-void
.end method

.method public final p(Litd;)Z
    .registers 3

    iget-byte v0, p0, Ltw2;->a:B

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3c

    check-cast p0, Lxp1;

    invoke-virtual {p1}, Litd;->k()Litd;

    move-result-object v0

    if-ne p1, v0, :cond_24

    iget-boolean v0, p0, Lxp1;->E:Z

    if-eqz v0, :cond_24

    iget-object v0, p0, Lxp1;->l:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v0

    if-eqz v0, :cond_24

    iget-boolean p0, p0, Lxp1;->P:Z

    if-nez p0, :cond_24

    const/16 p0, 0x6c

    invoke-interface {v0, p0, p1}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    :cond_24
    const/4 p0, 0x1

    return p0

    :pswitch_26
    check-cast p0, Lne;

    iget-object v0, p0, Lne;->c:Litd;

    if-eq p1, v0, :cond_3a

    move-object v0, p1

    check-cast v0, Lakk;

    iget-object v0, v0, Lakk;->B:Lptd;

    iget-object p0, p0, Lne;->e:Lkud;

    if-eqz p0, :cond_3a

    invoke-interface {p0, p1}, Lkud;->p(Litd;)Z

    move-result p0

    goto :goto_3b

    :cond_3a
    const/4 p0, 0x0

    :goto_3b
    return p0

    :pswitch_data_3c
    .packed-switch 0x4
        :pswitch_26
    .end packed-switch
.end method

.method public final s(Landroid/view/View;)V
    .registers 3

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_b

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_b
    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lna3;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lna3;->b(I)V

    return-void
.end method

.method public final skip(J)J
    .registers 10

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Ljava/io/InputStream;

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gez v2, :cond_b

    return-wide v0

    :cond_b
    move-wide v2, p1

    :goto_c
    cmp-long v4, v2, v0

    if-lez v4, :cond_24

    invoke-virtual {p0, v2, v3}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v4

    cmp-long v6, v4, v0

    if-lez v6, :cond_1a

    :goto_18
    sub-long/2addr v2, v4

    goto :goto_c

    :cond_1a
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_24

    const-wide/16 v4, 0x1

    goto :goto_18

    :cond_24
    sub-long/2addr p1, v2

    return-wide p1
.end method

.method public final u(Lbnn;)V
    .registers 3

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Luk5;

    new-instance p1, Ldzh;

    const-string v0, "Wallpaper"

    invoke-direct {p1, v0}, Ldzh;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    new-instance v0, Lrw7;

    invoke-direct {v0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Luk5;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final x(Lst;ZLgt;)V
    .registers 6

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lorm;

    const/4 v0, 0x0

    if-eqz p2, :cond_8a

    invoke-static {p3}, Ltw2;->t(Lgt;)Ljava/lang/String;

    move-result-object p2

    check-cast p0, Lx5f;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-eqz v1, :cond_15

    const/4 v1, 0x1

    invoke-virtual {p0, v1, p2, v0}, Lx5f;->j(ILjava/lang/String;Z)V

    :cond_15
    sget-object p2, Lgt;->f:Lgt;

    if-ne p3, p2, :cond_94

    iget-object p2, p1, Lst;->e:Lht;

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    const/4 p3, 0x0

    packed-switch p2, :pswitch_data_9a

    invoke-static {}, Lh9o;->p()V

    return-void

    :pswitch_27
    sget-object p3, Lip0;->u:Lip0;

    goto/16 :goto_84

    :pswitch_2b
    sget-object p3, Lip0;->v:Lip0;

    goto/16 :goto_84

    :pswitch_2f
    sget-object p3, Lip0;->r:Lip0;

    goto :goto_84

    :pswitch_32
    sget-object p3, Lip0;->s:Lip0;

    goto :goto_84

    :pswitch_35
    iget-object p1, p1, Lst;->f:Ljava/util/Set;

    if-eqz p1, :cond_44

    check-cast p1, Ljava/util/Collection;

    sget-object p2, Luih;->a:Ltih;

    invoke-static {p1, p2}, Lkotlin/collections/CollectionsKt;->X(Ljava/util/Collection;Ltih;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkq8;

    goto :goto_45

    :cond_44
    move-object p1, p3

    :goto_45
    if-nez p1, :cond_49

    const/4 p1, -0x1

    goto :goto_51

    :cond_49
    sget-object p2, Lwt;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, p2, p1

    :goto_51
    packed-switch p1, :pswitch_data_b0

    :pswitch_54
    invoke-static {}, Lh9o;->p()V

    return-void

    :pswitch_58
    sget-object p3, Lip0;->i:Lip0;

    goto :goto_84

    :pswitch_5b
    sget-object p3, Lip0;->h:Lip0;

    goto :goto_84

    :pswitch_5e
    sget-object p3, Lip0;->k:Lip0;

    goto :goto_84

    :pswitch_61
    sget-object p3, Lip0;->g:Lip0;

    goto :goto_84

    :pswitch_64
    sget-object p3, Lip0;->f:Lip0;

    goto :goto_84

    :pswitch_67
    sget-object p3, Lip0;->e:Lip0;

    goto :goto_84

    :pswitch_6a
    sget-object p3, Lip0;->j:Lip0;

    goto :goto_84

    :pswitch_6d
    sget-object p3, Lip0;->o:Lip0;

    goto :goto_84

    :pswitch_70
    sget-object p3, Lip0;->m:Lip0;

    goto :goto_84

    :pswitch_73
    sget-object p3, Lip0;->l:Lip0;

    goto :goto_84

    :pswitch_76
    sget-object p3, Lip0;->d:Lip0;

    goto :goto_84

    :pswitch_79
    sget-object p3, Lip0;->n:Lip0;

    goto :goto_84

    :pswitch_7c
    sget-object p3, Lip0;->c:Lip0;

    goto :goto_84

    :pswitch_7f
    sget-object p3, Lip0;->b:Lip0;

    goto :goto_84

    :pswitch_82
    sget-object p3, Lip0;->t:Lip0;

    :goto_84
    :pswitch_84
    if-eqz p3, :cond_94

    invoke-virtual {p0, p3}, Lx5f;->u(Lip0;)V

    return-void

    :cond_8a
    invoke-static {p3}, Ltw2;->t(Lgt;)Ljava/lang/String;

    move-result-object p1

    check-cast p0, Lx5f;

    iget-boolean p2, p0, Lx5f;->h:Z

    if-nez p2, :cond_95

    :cond_94
    return-void

    :cond_95
    const/4 p2, 0x2

    invoke-virtual {p0, p2, p1, v0}, Lx5f;->j(ILjava/lang/String;Z)V

    return-void

    :pswitch_data_9a
    .packed-switch 0x0
        :pswitch_82
        :pswitch_35
        :pswitch_84
        :pswitch_32
        :pswitch_84
        :pswitch_2f
        :pswitch_2b
        :pswitch_27
        :pswitch_84
    .end packed-switch

    :pswitch_data_b0
    .packed-switch -0x1
        :pswitch_84
        :pswitch_54
        :pswitch_7f
        :pswitch_7c
        :pswitch_79
        :pswitch_76
        :pswitch_73
        :pswitch_70
        :pswitch_6d
        :pswitch_6a
        :pswitch_67
        :pswitch_64
        :pswitch_61
        :pswitch_5e
        :pswitch_5b
        :pswitch_58
    .end packed-switch
.end method

.method public final z(Lcnn;)V
    .registers 3

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Luk5;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v0, Lsw7;

    invoke-direct {v0, p1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Luk5;->run(Ljava/lang/Object;)V

    return-void
.end method
