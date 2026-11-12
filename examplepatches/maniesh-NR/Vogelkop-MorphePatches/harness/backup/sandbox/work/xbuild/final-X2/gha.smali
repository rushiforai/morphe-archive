.class public final Lgha;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leha;


# static fields
.field public static final e:Ljava/util/Map;

.field public static final f:Ljava/util/Map;

.field public static final g:Ljava/util/Map;


# instance fields
.field public final a:Lx5f;

.field public final b:Lx5f;

.field public c:La98;

.field public d:Lfha;


# direct methods
.method static constructor <clinit>()V
    .registers 16

    new-instance v0, Lkotlin/Pair;

    const-string v1, "free_esim_intro_page"

    sget-object v2, Lgd0;->b:Lgd0;

    invoke-direct {v0, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "destination"

    sget-object v3, Lgd0;->c:Lgd0;

    invoke-direct {v1, v2, v3}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lkotlin/Pair;

    const-string v3, "plan_summary"

    sget-object v4, Lgd0;->d:Lgd0;

    invoke-direct {v2, v3, v4}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v3, Lkotlin/Pair;

    const-string v4, "install_esim_network_error"

    sget-object v5, Lgd0;->e:Lgd0;

    invoke-direct {v3, v4, v5}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v4, Lkotlin/Pair;

    const-string v5, "install_esim_installation_error"

    sget-object v6, Lgd0;->f:Lgd0;

    invoke-direct {v4, v5, v6}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v5, Lkotlin/Pair;

    const-string v6, "install_esim_in_progress"

    sget-object v7, Lgd0;->g:Lgd0;

    invoke-direct {v5, v6, v7}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v6, Lkotlin/Pair;

    const-string v7, "faq_page"

    sget-object v8, Lgd0;->h:Lgd0;

    invoke-direct {v6, v7, v8}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v7, Lkotlin/Pair;

    const-string v8, "device_compatibility"

    sget-object v9, Lgd0;->i:Lgd0;

    invoke-direct {v7, v8, v9}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v8, Lkotlin/Pair;

    const-string v9, "offer_redeemed"

    sget-object v10, Lgd0;->j:Lgd0;

    invoke-direct {v8, v9, v10}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v9, Lkotlin/Pair;

    const-string v10, "my_plans_current"

    sget-object v11, Lgd0;->k:Lgd0;

    invoke-direct {v9, v10, v11}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v10, Lkotlin/Pair;

    const-string v11, "my_plans_expired"

    sget-object v12, Lgd0;->l:Lgd0;

    invoke-direct {v10, v11, v12}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v11, Lkotlin/Pair;

    const-string v12, "data_plan_options"

    sget-object v13, Lgd0;->m:Lgd0;

    invoke-direct {v11, v12, v13}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v12, Lkotlin/Pair;

    const-string v13, "checkout"

    sget-object v14, Lgd0;->n:Lgd0;

    invoke-direct {v12, v13, v14}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v13, Lkotlin/Pair;

    const-string v14, "checkout_purchase_error"

    sget-object v15, Lgd0;->o:Lgd0;

    invoke-direct {v13, v14, v15}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array/range {v0 .. v13}, [Lkotlin/Pair;

    move-result-object v0

    invoke-static {v0}, Lrbd;->c([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lgha;->e:Ljava/util/Map;

    new-instance v0, Lkotlin/Pair;

    const-string v1, "active"

    sget-object v2, Ljd0;->b:Ljd0;

    invoke-direct {v0, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "expired"

    sget-object v3, Ljd0;->c:Ljd0;

    invoke-direct {v1, v2, v3}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lkotlin/Pair;

    const-string v3, "not_activated"

    sget-object v4, Ljd0;->d:Ljd0;

    invoke-direct {v2, v3, v4}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v0, v1, v2}, [Lkotlin/Pair;

    move-result-object v0

    invoke-static {v0}, Lrbd;->c([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lgha;->f:Ljava/util/Map;

    new-instance v0, Lkotlin/Pair;

    const-string v1, "success"

    sget-object v2, Lxc0;->b:Lxc0;

    invoke-direct {v0, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "error"

    sget-object v3, Lxc0;->c:Lxc0;

    invoke-direct {v1, v2, v3}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lkotlin/Pair;

    const-string v3, "refund"

    sget-object v4, Lxc0;->d:Lxc0;

    invoke-direct {v2, v3, v4}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v0, v1, v2}, [Lkotlin/Pair;

    move-result-object v0

    invoke-static {v0}, Lrbd;->c([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lgha;->g:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Lx5f;Lx5f;La98;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgha;->a:Lx5f;

    iput-object p2, p0, Lgha;->b:Lx5f;

    iput-object p3, p0, Lgha;->c:La98;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;)V
    .registers 6

    sget-object v0, Lgha;->e:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgd0;

    if-eqz p1, :cond_39

    iget-object v0, p0, Lgha;->d:Lfha;

    if-eqz v0, :cond_33

    iget-object p0, v0, Lfha;->e:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz p2, :cond_24

    iget-object p0, v0, Lfha;->f:Ljava/lang/String;

    invoke-virtual {p2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_24

    iput-object p2, v0, Lfha;->f:Ljava/lang/String;

    const/4 p0, 0x0

    iput-object p0, v0, Lfha;->g:Ljava/lang/Long;

    iput-object p0, v0, Lfha;->h:Ljava/lang/Long;

    :cond_24
    if-eqz p3, :cond_39

    iput-object p3, v0, Lfha;->h:Ljava/lang/Long;

    if-nez p4, :cond_30

    const-wide/16 p0, -0x1

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    :cond_30
    iput-object p4, v0, Lfha;->g:Ljava/lang/Long;

    return-void

    :cond_33
    iget-object p0, p0, Lgha;->a:Lx5f;

    iget-boolean p2, p0, Lx5f;->h:Z

    if-nez p2, :cond_3a

    :cond_39
    return-void

    :cond_3a
    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p3

    new-instance p4, Lck0;

    invoke-direct {p4, p2, p3}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object p2, p4, Lck0;->v:Lzyk;

    invoke-virtual {p2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lnd0;

    new-instance p4, Lrkc;

    const/16 v0, 0x1a

    invoke-direct {p4, p1, v0}, Lrkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p4}, Lnd0;->a(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, p3}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final c(Lxc0;)V
    .registers 18

    move-object/from16 v0, p0

    iget-object v1, v0, Lgha;->d:Lfha;

    if-nez v1, :cond_7

    return-void

    :cond_7
    iget-object v3, v1, Lfha;->a:Ldd0;

    iget-object v2, v1, Lfha;->b:La98;

    iget-object v4, v2, La98;->a:Ljava/lang/String;

    iget-object v5, v2, La98;->b:Ljava/lang/String;

    iget-object v6, v1, Lfha;->e:Ljava/util/ArrayList;

    iget-object v7, v1, Lfha;->c:Lkm0;

    iget-boolean v8, v1, Lfha;->d:Z

    iget-object v10, v1, Lfha;->f:Ljava/lang/String;

    iget-object v11, v1, Lfha;->g:Ljava/lang/Long;

    iget-object v12, v1, Lfha;->h:Ljava/lang/Long;

    iget-object v1, v0, Lgha;->a:Lx5f;

    iget-boolean v2, v1, Lx5f;->h:Z

    if-eqz v2, :cond_3a

    iget-object v2, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v14

    new-instance v15, Lck0;

    invoke-direct {v15, v2, v14}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v2, Ll5f;

    const/4 v13, 0x0

    move-object/from16 v9, p1

    invoke-direct/range {v2 .. v13}, Ll5f;-><init>(Ldd0;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Lkm0;ZLxc0;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;B)V

    invoke-virtual {v15, v2}, Lck0;->a(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v1, v14}, Lx5f;->U0(Lx56;)V

    :cond_3a
    const/4 v1, 0x0

    iput-object v1, v0, Lgha;->d:Lfha;

    return-void
.end method
