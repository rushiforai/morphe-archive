.class public final Lcwo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhko;


# instance fields
.field public final synthetic a:Lpxo;


# direct methods
.method public constructor <init>(Lpxo;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcwo;->a:Lpxo;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 1

    const/16 p0, 0x32

    return p0
.end method

.method public final b()I
    .registers 1

    .line 62
    const/16 p0, 0x3e8

    return p0
.end method

.method public final b()V
    .registers 10

    iget-object v0, p0, Lcwo;->a:Lpxo;

    iget-object v0, v0, Lpxo;->e:Lbap;

    invoke-virtual {v0}, Lbap;->e()V

    iget-object v0, p0, Lcwo;->a:Lpxo;

    iget-object v0, v0, Lpxo;->i:Lp7p;

    if-eqz v0, :cond_2d

    iget-object v1, v0, Lp7p;->a:Lvoo;

    new-instance v2, Ltep;

    iget-object v3, v1, Lvoo;->c:Ljava/lang/String;

    iget-object v4, v1, Lvoo;->b:Lpro;

    iget-object v4, v4, Lpro;->a:Ljava/lang/String;

    iget-object v5, v1, Lvoo;->j:Ljava/lang/String;

    iget-object v6, v1, Lvoo;->l:Lfuo;

    iget-wide v7, v1, Lvoo;->k:D

    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    invoke-direct/range {v2 .. v7}, Ltep;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/Double;)V

    invoke-virtual {v1}, Lvoo;->c()Ljava/util/List;

    move-result-object v1

    iget-object v0, v0, Lp7p;->b:Ljava/util/LinkedHashSet;

    invoke-static {v2, v1, v0}, Lp7p;->e(Lp8p;Ljava/util/List;Ljava/util/LinkedHashSet;)V

    :cond_2d
    iget-object p0, p0, Lcwo;->a:Lpxo;

    iget-object v0, p0, Lpxo;->f:Landroid/view/ViewGroup;

    if-eqz v0, :cond_3d

    new-instance v1, Lttn;

    const/16 v2, 0x10

    invoke-direct {v1, p0, v2}, Lttn;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_3d
    return-void
.end method
