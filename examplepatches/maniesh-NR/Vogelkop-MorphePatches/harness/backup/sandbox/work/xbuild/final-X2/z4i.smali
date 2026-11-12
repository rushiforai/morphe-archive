.class public final Lz4i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwkn;


# instance fields
.field public final a:Ltu9;

.field public final b:Lh42;

.field public final c:Lh42;


# direct methods
.method public constructor <init>(Lx4i;Lru9;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lrag;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Lrag;-><init>(B)V

    new-instance v1, Ltu9;

    sget-object v2, Lru9;->h:Lpu9;

    invoke-direct {v1, v2, v0, p2}, Ltu9;-><init>(Lou9;Lkotlin/jvm/functions/Function2;Lru9;)V

    iput-object v1, p0, Lz4i;->a:Ltu9;

    iget-object p1, p1, Lx4i;->h:Lode;

    new-instance p2, Lu4h;

    const/16 v0, 0x15

    invoke-direct {p2, v0}, Lu4h;-><init>(B)V

    invoke-static {p1, p2}, Lb8h;->j(Lekc;Lkotlin/jvm/functions/Function1;)Lh42;

    move-result-object p1

    iput-object p1, p0, Lz4i;->b:Lh42;

    new-instance p2, Lh42;

    invoke-direct {p2}, Lh42;-><init>()V

    new-instance v0, Ly4i;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Ly4i;-><init>(Lz4i;B)V

    new-instance v2, Lt7d;

    const/16 v3, 0x9

    invoke-direct {v2, v0, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1, v2}, Lh42;->s(Lekc;Lf7f;)V

    new-instance p1, Ly4i;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Ly4i;-><init>(Lz4i;B)V

    new-instance v0, Lt7d;

    invoke-direct {v0, p1, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, v1, v0}, Lh42;->s(Lekc;Lf7f;)V

    iput-object p2, p0, Lz4i;->c:Lh42;

    return-void
.end method


# virtual methods
.method public final a()Lekc;
    .registers 1

    iget-object p0, p0, Lz4i;->c:Lh42;

    return-object p0
.end method

.method public final b()V
    .registers 6

    iget-object v0, p0, Lz4i;->a:Ltu9;

    invoke-virtual {v0}, Lekc;->i()Z

    move-result v1

    if-eqz v1, :cond_5d

    iget-object v1, p0, Lz4i;->b:Lh42;

    invoke-virtual {v1}, Lekc;->i()Z

    move-result v2

    if-eqz v2, :cond_5d

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_1a

    sget-object v0, Ll08;->a:Ll08;

    :cond_1a
    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    if-nez v1, :cond_24

    sget-object v1, Lv08;->a:Lv08;

    :cond_24
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/util/Collection;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Le82;->m([Ljava/lang/Object;)Lkotlin/sequences/Sequence;

    move-result-object v0

    new-instance v1, Lbli;

    const/16 v2, 0xa

    invoke-direct {v1, v2}, Lbli;-><init>(B)V

    instance-of v2, v0, Lm2m;

    if-eqz v2, :cond_48

    check-cast v0, Lm2m;

    new-instance v2, Lr79;

    iget-object v3, v0, Lm2m;->a:Lkotlin/sequences/Sequence;

    iget-object v0, v0, Lm2m;->b:Lkotlin/jvm/functions/Function1;

    invoke-direct {v2, v3, v0, v1}, Lr79;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    goto :goto_54

    :cond_48
    new-instance v2, Lr79;

    new-instance v3, Lbli;

    const/16 v4, 0xb

    invoke-direct {v3, v4}, Lbli;-><init>(B)V

    invoke-direct {v2, v0, v3, v1}, Lr79;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    :goto_54
    invoke-static {v2}, Ly1j;->h(Lkotlin/sequences/Sequence;)Ljava/util/Set;

    move-result-object v0

    iget-object p0, p0, Lz4i;->c:Lh42;

    invoke-static {p0, v0}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    :cond_5d
    return-void
.end method
