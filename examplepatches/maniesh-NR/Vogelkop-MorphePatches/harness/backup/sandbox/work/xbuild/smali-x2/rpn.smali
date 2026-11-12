.class public final Lrpn;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lnak;

.field public final c:Lnak;

.field public final d:Lrlh;


# direct methods
.method public constructor <init>()V
    .registers 8

    invoke-direct {p0}, Ll7n;-><init>()V

    new-instance v0, Lqpn;

    new-instance v1, Lptl;

    new-instance v2, Lrxh;

    const v3, 0x7f141463

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    sget-object v3, Lvsl;->a:Lvsl;

    invoke-direct {v1, v2, v3}, Lptl;-><init>(Lpxh;Lxsl;)V

    sget-object v2, Lpsp;->c:Lpsp;

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-direct {v0, v1, v4, v2, v5}, Lqpn;-><init>(Lptl;ZLp68;Z)V

    invoke-static {v0}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v0

    iput-object v0, p0, Lrpn;->b:Lnak;

    invoke-static {v3}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v1

    iput-object v1, p0, Lrpn;->c:Lnak;

    new-instance v2, Lkm4;

    const/4 v3, 0x3

    const/16 v4, 0xc

    const/4 v6, 0x0

    invoke-direct {v2, v3, v6, v4}, Lkm4;-><init>(ILmt5;B)V

    new-instance v3, Lya9;

    invoke-direct {v3, v0, v1, v2, v5}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object v1

    new-instance v2, Lf9k;

    const-wide/16 v4, 0x1388

    invoke-direct {v2, v4, v5}, Lf9k;-><init>(J)V

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v3, v1, v2, v0}, La26;->o0(Lf99;Lnx5;Lbej;Ljava/lang/Object;)Lrlh;

    move-result-object v0

    iput-object v0, p0, Lrpn;->d:Lrlh;

    return-void
.end method
