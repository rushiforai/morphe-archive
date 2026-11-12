.class public final Lm0a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ltah;

.field public final b:Liv7;

.field public final c:Lode;

.field public d:Ljava/util/Set;

.field public final e:Lpde;


# direct methods
.method public constructor <init>(Lndc;Lh0a;Ltah;Liv7;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lm0a;->a:Ltah;

    iput-object p4, p0, Lm0a;->b:Liv7;

    iget-object p2, p2, Lh0a;->d:Lode;

    iput-object p2, p0, Lm0a;->c:Lode;

    sget-object v0, Lv08;->a:Lv08;

    iput-object v0, p0, Lm0a;->d:Ljava/util/Set;

    new-instance v0, Lpde;

    invoke-virtual {p0}, Lm0a;->a()Ll0a;

    move-result-object v1

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lm0a;->e:Lpde;

    new-instance v1, Lj0a;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lj0a;-><init>(Lm0a;B)V

    new-instance v2, Lug;

    const/16 v3, 0x18

    invoke-direct {v2, v1, v3}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1, v2}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p2, p4, Liv7;->f:Lpde;

    new-instance v1, Lj0a;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lj0a;-><init>(Lm0a;B)V

    new-instance v2, Lug;

    invoke-direct {v2, v1, v3}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1, v2}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p2, p3, Ltah;->h:Ljava/lang/Object;

    check-cast p2, Lpde;

    new-instance p3, Lj0a;

    const/4 v1, 0x2

    invoke-direct {p3, p0, v1}, Lj0a;-><init>(Lm0a;B)V

    new-instance p0, Lug;

    invoke-direct {p0, p3, v3}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    new-instance p0, Lx77;

    invoke-direct {p0, p1, v0, p4}, Lx77;-><init>(Lndc;Lpde;Liv7;)V

    return-void
.end method


# virtual methods
.method public final a()Ll0a;
    .registers 4

    iget-object v0, p0, Lm0a;->c:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Li0a;

    iget-object v0, p0, Lm0a;->b:Liv7;

    iget-object v0, v0, Liv7;->c:Llg;

    invoke-virtual {v0}, Llg;->b()Leri;

    move-result-object v0

    sget-object v1, Leti;->a:Lq6e;

    if-nez v0, :cond_16

    const/4 v0, 0x0

    goto :goto_18

    :cond_16
    instance-of v0, v0, Lf1a;

    :goto_18
    iget-object p0, p0, Lm0a;->a:Ltah;

    iget-object p0, p0, Ltah;->h:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    new-instance p0, Ll0a;

    sget-object v1, Lv08;->a:Lv08;

    sget-object v2, Ll08;->a:Ll08;

    invoke-direct {p0, v0, v1, v2}, Ll0a;-><init>(ZLv08;Ll08;)V

    return-object p0
.end method

.method public final b()V
    .registers 2

    iget-object v0, p0, Lm0a;->e:Lpde;

    invoke-virtual {p0}, Lm0a;->a()Ll0a;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method
