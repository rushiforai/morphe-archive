.class public final Lkbe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final a:J


# direct methods
.method public constructor <init>(J)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lkbe;->a:J

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 11

    check-cast p1, Ljbe;

    check-cast p2, Ljbe;

    iget-object v0, p2, Ljbe;->a:Lb2l;

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->isActive()Z

    move-result v0

    iget-object v1, p1, Ljbe;->a:Lb2l;

    check-cast v1, Ld7l;

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->isActive()Z

    move-result v1

    if-eq v0, v1, :cond_33

    iget-object p0, p2, Ljbe;->a:Lb2l;

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->isActive()Z

    move-result p0

    iget-object p1, p1, Ljbe;->a:Lb2l;

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->isActive()Z

    move-result p1

    invoke-static {p0, p1}, Ljava/lang/Boolean;->compare(ZZ)I

    move-result p0

    return p0

    :cond_33
    iget-wide v0, p1, Ljbe;->c:J

    iget-wide v2, p0, Lkbe;->a:J

    cmp-long p0, v0, v2

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ltz p0, :cond_3f

    move p0, v5

    goto :goto_40

    :cond_3f
    move p0, v4

    :goto_40
    iget-wide v6, p2, Ljbe;->c:J

    cmp-long v2, v6, v2

    if-ltz v2, :cond_47

    move v4, v5

    :cond_47
    if-eqz p0, :cond_54

    if-eqz v4, :cond_54

    cmp-long v2, v0, v6

    if-eqz v2, :cond_54

    invoke-static {v6, v7, v0, v1}, Lkotlin/jvm/internal/Intrinsics;->c(JJ)I

    move-result p0

    return p0

    :cond_54
    if-eq p0, v4, :cond_5b

    invoke-static {v4, p0}, Ljava/lang/Boolean;->compare(ZZ)I

    move-result p0

    return p0

    :cond_5b
    iget p0, p1, Ljbe;->b:I

    iget p1, p2, Ljbe;->b:I

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->b(II)I

    move-result p0

    return p0
.end method
