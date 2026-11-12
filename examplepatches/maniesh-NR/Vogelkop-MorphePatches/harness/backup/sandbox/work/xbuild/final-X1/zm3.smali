.class public final Lzm3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lgn3;


# direct methods
.method public constructor <init>(Lgn3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzm3;->a:Lgn3;

    return-void
.end method


# virtual methods
.method public a(Lk3b;)V
    .registers 6
    .param p1    # Lk3b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-byte v0, p1, Lk3b;->a:B

    const/4 v1, 0x1

    if-ne v0, v1, :cond_23

    iget-wide v0, p1, Lk3b;->b:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-lez p1, :cond_23

    iget-object p0, p0, Lzm3;->a:Lgn3;

    iget-object p1, p0, Lgn3;->s:Lxm3;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lxm3;->H(I)Lqhc;

    move-result-object p1

    if-eqz p1, :cond_23

    iget v0, p1, Lqhc;->b:I

    const/16 v1, 0x9

    if-ne v0, v1, :cond_23

    iget-object p0, p0, Lgn3;->s:Lxm3;

    invoke-virtual {p0, p1}, Lxm3;->K(Lqhc;)V

    :cond_23
    return-void
.end method
