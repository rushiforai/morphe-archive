.class public final Lg1c;
.super Lcx4;
.source "SourceFile"


# instance fields
.field public final h:Luj;

.field public final i:Luj;

.field public final j:Luj;

.field public final k:Ljava/util/List;


# direct methods
.method public constructor <init>(Lj1c;Luj;Luj;Luj;)V
    .registers 6

    iget-object p1, p1, Lj1c;->e:Ljava/lang/Object;

    check-cast p1, Lv9j;

    sget-object v0, Ld9j;->a:[Ld9j;

    const/16 v0, 0x7148

    invoke-direct {p0, p1, v0}, Lcx4;-><init>(Lekc;I)V

    iput-object p2, p0, Lg1c;->h:Luj;

    iput-object p3, p0, Lg1c;->i:Luj;

    iput-object p4, p0, Lg1c;->j:Luj;

    const/4 p1, 0x3

    new-array p1, p1, [Ldx4;

    const/4 v0, 0x0

    aput-object p2, p1, v0

    const/4 p2, 0x1

    aput-object p3, p1, p2

    const/4 p2, 0x2

    aput-object p4, p1, p2

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lg1c;->k:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Lhx4;Ljava/lang/Object;)Lix4;
    .registers 3

    check-cast p2, Lh1c;

    iget-object p0, p2, Lh1c;->d:Le5m;

    iget-boolean p0, p0, Le5m;->a:Z

    if-nez p0, :cond_12

    iget-object p0, p1, Lhx4;->c:Ljava/util/LinkedHashSet;

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    invoke-virtual {p1}, Lhx4;->a()Lix4;

    move-result-object p0

    return-object p0

    :cond_12
    invoke-virtual {p1}, Lhx4;->a()Lix4;

    move-result-object p0

    return-object p0
.end method

.method public final d()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lg1c;->k:Ljava/util/List;

    return-object p0
.end method
