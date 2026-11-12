.class public final Ly91;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwa1;


# instance fields
.field public final a:Lap9;


# direct methods
.method public constructor <init>(Lap9;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly91;->a:Lap9;

    return-void
.end method


# virtual methods
.method public final close()V
    .registers 1

    iget-object p0, p0, Ly91;->a:Lap9;

    invoke-interface {p0}, Ljava/io/Closeable;->close()V

    return-void
.end method

.method public final execute()J
    .registers 3

    iget-object p0, p0, Ly91;->a:Lap9;

    invoke-virtual {p0}, Lap9;->h()I

    move-result p0

    int-to-long v0, p0

    return-wide v0
.end method

.method public final w(ILjava/lang/String;)V
    .registers 3

    iget-object p0, p0, Ly91;->a:Lap9;

    add-int/lit8 p1, p1, 0x1

    if-nez p2, :cond_a

    invoke-interface {p0, p1}, Lrsk;->j1(I)V

    return-void

    :cond_a
    invoke-interface {p0, p1, p2}, Lrsk;->w(ILjava/lang/String;)V

    return-void
.end method

.method public final x(ILjava/lang/Long;)V
    .registers 5

    iget-object p0, p0, Ly91;->a:Lap9;

    add-int/lit8 p1, p1, 0x1

    if-nez p2, :cond_a

    invoke-interface {p0, p1}, Lrsk;->j1(I)V

    return-void

    :cond_a
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-interface {p0, p1, v0, v1}, Lrsk;->T0(IJ)V

    return-void
.end method

.method public final y(Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public final z(I[B)V
    .registers 3

    iget-object p0, p0, Ly91;->a:Lap9;

    add-int/lit8 p1, p1, 0x1

    if-nez p2, :cond_a

    invoke-interface {p0, p1}, Lrsk;->j1(I)V

    return-void

    :cond_a
    invoke-interface {p0, p1, p2}, Lrsk;->Z0(I[B)V

    return-void
.end method
