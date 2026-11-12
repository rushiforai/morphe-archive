.class public abstract Lf92;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Luqe;

.field public final b:Lj4c;

.field public final c:Lj4c;

.field public final d:La92;

.field public final e:Lj4c;


# direct methods
.method public constructor <init>(Lau8;Luqe;Ljava/lang/String;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ly82;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ly82;-><init>(Lf92;B)V

    new-instance v2, Lj4c;

    invoke-direct {v2, v0, v1}, Lj4c;-><init>(Lesk;B)V

    iput-object v2, p0, Lf92;->b:Lj4c;

    new-instance v0, Ly82;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v2}, Ly82;-><init>(Lf92;B)V

    new-instance v2, Lj4c;

    invoke-direct {v2, v0, v1}, Lj4c;-><init>(Lesk;B)V

    iput-object v2, p0, Lf92;->c:Lj4c;

    new-instance v0, La92;

    invoke-direct {v0, p0}, La92;-><init>(Lf92;)V

    iput-object v0, p0, Lf92;->d:La92;

    iput-object p2, p0, Lf92;->a:Luqe;

    new-instance p2, Lz82;

    invoke-direct {p2, v1, p0, p1, p3}, Lz82;-><init>(BLjava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p1, Lj4c;

    invoke-direct {p1, p2, v1}, Lj4c;-><init>(Lesk;B)V

    iput-object p1, p0, Lf92;->e:Lj4c;

    return-void
.end method


# virtual methods
.method public a()Lu82;
    .registers 1

    new-instance p0, Lb92;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0
.end method

.method public b()Ld53;
    .registers 1

    new-instance p0, Ld92;

    invoke-direct {p0}, Ld53;-><init>()V

    return-object p0
.end method

.method public c()Lu82;
    .registers 1

    iget-object p0, p0, Lf92;->c:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lu82;

    return-object p0
.end method

.method public d()Ld53;
    .registers 1

    iget-object p0, p0, Lf92;->b:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld53;

    return-object p0
.end method

.method public final e(Ljava/lang/Object;Loqe;Lw82;)V
    .registers 7

    if-nez p2, :cond_1a

    iget-object v0, p0, Lf92;->e:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhv2;

    iget-object v1, v0, Lhv2;->g:Lc53;

    if-eqz v1, :cond_1a

    const/4 p0, 0x0

    iput-object p0, v0, Lhv2;->g:Lc53;

    iget-object p0, v0, Lhv2;->e:Lip1;

    invoke-virtual {p0, v1}, Lip1;->accept(Ljava/lang/Object;)V

    invoke-interface {p3, v1}, Lw82;->a(Lc53;)V

    return-void

    :cond_1a
    invoke-virtual {p0}, Lf92;->d()Ld53;

    move-result-object v0

    new-instance v1, Lv82;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lv82;-><init>(B)V

    iget-object v2, v1, Lv82;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    iget-object p0, p0, Lf92;->d:La92;

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, p1, p2, v1}, Ld53;->e(Ljava/lang/Object;Loqe;Lw82;)V

    return-void
.end method

.method public f(Lc53;)V
    .registers 2

    return-void
.end method
