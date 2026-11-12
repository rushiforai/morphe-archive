.class public final Lxk;
.super Ldx4;
.source "SourceFile"


# instance fields
.field public final g:Luj;

.field public final h:Luj;

.field public final i:Ljava/util/List;


# direct methods
.method public constructor <init>(Luj;Luj;)V
    .registers 5

    sget-object v0, Ld9j;->a:[Ld9j;

    const/16 v0, 0x61a8

    invoke-direct {p0, v0}, Ldx4;-><init>(I)V

    iput-object p1, p0, Lxk;->g:Luj;

    iput-object p2, p0, Lxk;->h:Luj;

    const/4 v0, 0x2

    new-array v0, v0, [Ldx4;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 p1, 0x1

    aput-object p2, v0, p1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lxk;->i:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final d()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lxk;->i:Ljava/util/List;

    return-object p0
.end method
