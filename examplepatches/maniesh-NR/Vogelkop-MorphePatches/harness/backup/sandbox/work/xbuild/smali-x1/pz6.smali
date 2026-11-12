.class public final Lpz6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lddc;

.field public final b:Lxm5;

.field public final c:Lwx6;

.field public final d:Lga6;

.field public final e:Lxz6;

.field public f:Z

.field public final g:Lplh;

.field public final h:Lrlh;


# direct methods
.method public constructor <init>(Lddc;Lxm5;Lwx6;Lga6;Lpad;Lxz6;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpz6;->a:Lddc;

    iput-object p2, p0, Lpz6;->b:Lxm5;

    iput-object p3, p0, Lpz6;->c:Lwx6;

    iput-object p4, p0, Lpz6;->d:Lga6;

    iput-object p6, p0, Lpz6;->e:Lxz6;

    invoke-virtual {p5}, Lpad;->k()Lf99;

    move-result-object p2

    new-instance p3, Lf9k;

    const-wide/16 p4, 0x1388

    invoke-direct {p3, p4, p5}, Lf9k;-><init>(J)V

    const/4 p6, 0x1

    invoke-static {p2, p1, p3, p6}, La26;->l0(Lf99;Lnx5;Lbej;I)Lplh;

    move-result-object p2

    iput-object p2, p0, Lpz6;->g:Lplh;

    new-instance p3, Lzp6;

    const/4 p6, 0x6

    const/4 v0, 0x0

    invoke-direct {p3, p6, v0, p0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p2, p3}, Lma9;->b(Lf99;Lcr9;)Lbs4;

    move-result-object p2

    new-instance p3, Lf9k;

    invoke-direct {p3, p4, p5}, Lf9k;-><init>(J)V

    sget-object p4, Lwpn;->a:Lwpn;

    invoke-static {p2, p1, p3, p4}, La26;->o0(Lf99;Lnx5;Lbej;Ljava/lang/Object;)Lrlh;

    move-result-object p1

    iput-object p1, p0, Lpz6;->h:Lrlh;

    return-void
.end method
