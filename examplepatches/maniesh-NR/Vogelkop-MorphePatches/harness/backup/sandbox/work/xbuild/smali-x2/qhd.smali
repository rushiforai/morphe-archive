.class public final synthetic Lqhd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldid;
.implements Lvqd;
.implements Lurg;
.implements Lwdi;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(JLdp2;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lqhd;->a:J

    iput-object p3, p0, Lqhd;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(JLjava/lang/Object;)V
    .registers 4

    .line 8
    iput-object p3, p0, Lqhd;->b:Ljava/lang/Object;

    iput-wide p1, p0, Lqhd;->a:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-object v0, p0, Lqhd;->b:Ljava/lang/Object;

    check-cast v0, Ldp2;

    check-cast p1, Landroid/database/sqlite/SQLiteDatabase;

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "next_request_ms"

    iget-wide v3, p0, Lqhd;->a:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v1, v2, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-object p0, v0, Ldp2;->a:Ljava/lang/String;

    iget-object v0, v0, Ldp2;->c:Lmyg;

    invoke-static {v0}, Lryg;->a(Lmyg;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    filled-new-array {p0, v2}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "transport_contexts"

    const-string v4, "backend_name = ? and priority = ?"

    invoke-virtual {p1, v3, v1, v4, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ge v2, v4, :cond_47

    const-string v2, "backend_name"

    invoke-virtual {v1, v2, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lryg;->a(Lmyg;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const-string v0, "priority"

    invoke-virtual {v1, v0, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {p1, v3, v5, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    :cond_47
    return-object v5
.end method

.method public final c(Lssa;I)V
    .registers 6

    iget-object v0, p0, Lqhd;->b:Ljava/lang/Object;

    check-cast v0, Lgid;

    iget-wide v1, p0, Lqhd;->a:J

    iget-object p0, v0, Lgid;->c:Llid;

    invoke-interface {p1, p0, p2, v1, v2}, Lssa;->y0(Lksa;IJ)V

    return-void
.end method

.method public final l(Lnpd;Lnod;I)Ljava/lang/Object;
    .registers 10

    iget-object p3, p0, Lqhd;->b:Ljava/lang/Object;

    check-cast p3, Lqjd;

    invoke-static {p3}, Lh1b;->v(Ljava/lang/Object;)Lcsh;

    move-result-object v2

    const/4 v3, 0x0

    iget-wide v4, p0, Lqhd;->a:J

    move-object v0, p1

    move-object v1, p2

    invoke-virtual/range {v0 .. v5}, Lnpd;->p(Lnod;Lcsh;IJ)Lc5j;

    move-result-object p0

    return-object p0
.end method

.method public final test(Ljava/lang/Object;)Z
    .registers 7

    iget-object v0, p0, Lqhd;->b:Ljava/lang/Object;

    check-cast v0, Lvi5;

    check-cast p1, Lilh;

    iget-wide v1, p1, Lilh;->k:J

    iget-wide v3, v0, Lvi5;->c:J

    cmp-long v1, v1, v3

    if-gtz v1, :cond_1f

    iget-wide v1, p1, Lilh;->d:J

    iget-wide p0, p0, Lqhd;->a:J

    sub-long/2addr p0, v1

    iget-wide v1, v0, Lvi5;->a:J

    cmp-long v1, p0, v1

    if-ltz v1, :cond_1f

    iget-wide v0, v0, Lvi5;->b:J

    cmp-long p0, p0, v0

    if-lez p0, :cond_21

    :cond_1f
    const/4 p0, 0x0

    return p0

    :cond_21
    const/4 p0, 0x1

    return p0
.end method
