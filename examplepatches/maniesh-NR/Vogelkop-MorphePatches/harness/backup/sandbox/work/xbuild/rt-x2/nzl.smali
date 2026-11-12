.class public final Lnzl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lj4c;

.field public final b:Lnx5;

.field public final c:Lrlh;

.field public final d:Lrlh;


# direct methods
.method public constructor <init>(Lj4c;Lf99;Lnx5;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnzl;->a:Lj4c;

    iput-object p3, p0, Lnzl;->b:Lnx5;

    new-instance p1, Lyc1;

    const/16 v0, 0x17

    invoke-direct {p1, p2, v0}, Lyc1;-><init>(Lf99;B)V

    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sget-object v0, Laej;->a:Lftj;

    invoke-static {p1, p3, v0, p2}, La26;->o0(Lf99;Lnx5;Lbej;Ljava/lang/Object;)Lrlh;

    move-result-object p1

    iput-object p1, p0, Lnzl;->c:Lrlh;

    new-instance p2, Lzp6;

    const/4 v1, 0x0

    const/16 v2, 0xb

    invoke-direct {p2, v2, v1, p0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p1, p2}, Lma9;->b(Lf99;Lcr9;)Lbs4;

    move-result-object p1

    sget-object p2, Ln08;->a:Ln08;

    invoke-static {p1, p3, v0, p2}, La26;->o0(Lf99;Lnx5;Lbej;Ljava/lang/Object;)Lrlh;

    move-result-object p1

    iput-object p1, p0, Lnzl;->d:Lrlh;

    return-void
.end method
