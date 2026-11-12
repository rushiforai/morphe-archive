.class public final Lnbh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Lorm;

.field public final d:Lskm;

.field public final e:Lcsh;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lorm;Lskm;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnbh;->a:Landroid/content/Context;

    iput-object p2, p0, Lnbh;->b:Lumi;

    iput-object p3, p0, Lnbh;->c:Lorm;

    iput-object p4, p0, Lnbh;->d:Lskm;

    new-instance p2, Lzre;

    invoke-direct {p2, p1}, Lzre;-><init>(Landroid/content/Context;)V

    new-instance p1, Lp98;

    const/4 p3, 0x1

    invoke-direct {p1, p3}, Lp98;-><init>(B)V

    new-instance p3, Lp98;

    const/4 p4, 0x0

    invoke-direct {p3, p4}, Lp98;-><init>(B)V

    sget-object p4, Lh1b;->b:La1b;

    filled-new-array {p2, p1, p3}, [Ljava/lang/Object;

    move-result-object p1

    const/4 p2, 0x3

    invoke-static {p2, p1}, Lc09;->e(I[Ljava/lang/Object;)V

    invoke-static {p2, p1}, Lh1b;->o(I[Ljava/lang/Object;)Lcsh;

    move-result-object p1

    iput-object p1, p0, Lnbh;->e:Lcsh;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/os/Bundle;Z)Lwbh;
    .registers 16

    const-string v0, "notification_type"

    invoke-virtual {p2, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_bf

    const/4 v1, -0x1

    invoke-virtual {p2, v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, 0x5

    invoke-static {v3}, Lvep;->B(I)[I

    move-result-object v4

    array-length v6, v4

    const/4 v7, 0x0

    move v8, v7

    :goto_15
    if-ge v8, v6, :cond_22

    aget v9, v4, v8

    invoke-static {v9}, Lv0g;->f(I)B

    move-result v10

    if-eq v10, v2, :cond_23

    add-int/lit8 v8, v8, 0x1

    goto :goto_15

    :cond_22
    move v9, v7

    :cond_23
    const/4 v2, 0x0

    if-eqz v9, :cond_b9

    if-eqz p3, :cond_8d

    const-string v0, "notification_action_type"

    invoke-virtual {p2, v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v4, 0x7

    invoke-static {v4}, Lvep;->B(I)[I

    move-result-object v4

    array-length v6, v4

    move v8, v7

    :goto_35
    if-ge v8, v6, :cond_42

    aget v10, v4, v8

    invoke-static {v10}, Lv0g;->e(I)B

    move-result v11

    if-eq v11, v1, :cond_43

    add-int/lit8 v8, v8, 0x1

    goto :goto_35

    :cond_42
    move v10, v7

    :cond_43
    if-eqz v10, :cond_8d

    invoke-static {v10}, Lvep;->A(I)I

    move-result v1

    if-eqz v1, :cond_88

    if-eq v1, v3, :cond_82

    const/4 v3, 0x6

    if-eq v1, v3, :cond_7c

    invoke-static {v10}, Lvep;->A(I)I

    move-result v1

    const/4 v3, 0x1

    iget-object v4, p0, Lnbh;->b:Lumi;

    if-eq v1, v3, :cond_6d

    const/4 v3, 0x2

    if-eq v1, v3, :cond_67

    const/4 v3, 0x4

    if-eq v1, v3, :cond_61

    move-object v1, v2

    goto :goto_72

    :cond_61
    new-instance v1, Leij;

    invoke-direct {v1, p1, v4, p2}, Leij;-><init>(Landroid/content/Context;Lumi;Landroid/os/Bundle;)V

    goto :goto_72

    :cond_67
    new-instance v1, Lxhj;

    invoke-direct {v1, p2}, Lxhj;-><init>(Landroid/os/Bundle;)V

    goto :goto_72

    :cond_6d
    new-instance v1, Lvhj;

    invoke-direct {v1, p1, v4, p2}, Lvhj;-><init>(Landroid/content/Context;Lumi;Landroid/os/Bundle;)V

    :goto_72
    if-eqz v1, :cond_76

    move-object v2, v1

    goto :goto_8d

    :cond_76
    new-instance p0, Ldjb;

    invoke-direct {p0, v0, v2}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0

    :cond_7c
    new-instance v2, Lkgf;

    invoke-direct {v2, p2}, Lkgf;-><init>(Landroid/os/Bundle;)V

    goto :goto_8d

    :cond_82
    new-instance v2, Lrgf;

    invoke-direct {v2, p2}, Lrgf;-><init>(Landroid/os/Bundle;)V

    goto :goto_8d

    :cond_88
    new-instance v2, Lwgf;

    invoke-direct {v2, p1, p2}, Lwgf;-><init>(Landroid/content/Context;Landroid/os/Bundle;)V

    :cond_8d
    :goto_8d
    move-object v6, v2

    iget-object v0, p0, Lnbh;->e:Lcsh;

    invoke-virtual {v0, v7}, Lh1b;->u(I)La1b;

    move-result-object v0

    :cond_94
    invoke-virtual {v0}, Lq4;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b3

    invoke-virtual {v0}, Lq4;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lxbh;

    invoke-interface {v1, v9}, Lxbh;->a(I)Z

    move-result v2

    if-eqz v2, :cond_94

    iget-object v3, p0, Lnbh;->c:Lorm;

    iget-object v4, p0, Lnbh;->d:Lskm;

    move-object v2, p1

    move-object v5, p2

    move-object v0, v1

    move v1, v9

    invoke-interface/range {v0 .. v6}, Lxbh;->b(ILandroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;)Lwbh;

    move-result-object p0

    return-object p0

    :cond_b3
    new-instance p0, Lejb;

    invoke-direct {p0}, Lejb;-><init>()V

    throw p0

    :cond_b9
    new-instance p0, Ldjb;

    invoke-direct {p0, v0, v2}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0

    :cond_bf
    new-instance p0, Ldjb;

    invoke-direct {p0, v0}, Ldjb;-><init>(Ljava/lang/String;)V

    throw p0
.end method
