.class public final Lpi3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ltcl;

.field public final b:Lu55;

.field public final c:Lwnm;

.field public final d:Lmi3;

.field public final e:Loi3;

.field public final f:Lqie;


# direct methods
.method public constructor <init>(Ltcl;Lu55;Lwnm;Lmi3;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpi3;->a:Ltcl;

    iput-object p2, p0, Lpi3;->b:Lu55;

    iput-object p3, p0, Lpi3;->c:Lwnm;

    iput-object p4, p0, Lpi3;->d:Lmi3;

    iget-object p1, p4, Lmi3;->a:Ly5i;

    iget-object p1, p1, Ly5i;->f:Lpjb;

    const/4 p2, 0x0

    if-nez p1, :cond_13

    move-object p1, p2

    :cond_13
    const-string v0, "active_block_lists"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lf32;

    const/16 v3, 0x14

    invoke-direct {v2, p4, v3}, Lf32;-><init>(Ljava/lang/Object;B)V

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v3, v2}, Lpjb;->a([Ljava/lang/String;ZLkotlin/jvm/functions/Function1;)Lb6i;

    move-result-object p1

    new-instance v1, Lf32;

    const/16 v2, 0x15

    invoke-direct {v1, v2}, Lf32;-><init>(B)V

    invoke-static {p1, v1}, Lb8h;->j(Lekc;Lkotlin/jvm/functions/Function1;)Lh42;

    move-result-object p1

    invoke-static {p1}, Lb8h;->d(Lekc;)Lh42;

    move-result-object p1

    new-instance v1, Loi3;

    invoke-direct {v1}, Lh42;-><init>()V

    new-instance v2, Lt02;

    const/16 v4, 0x1a

    invoke-direct {v2, v1, v4}, Lt02;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Lug;

    const/16 v5, 0xa

    invoke-direct {v4, v2, v5}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p1, v4}, Lh42;->s(Lekc;Lf7f;)V

    new-instance p1, Lt02;

    const/16 v2, 0x1b

    invoke-direct {p1, p0, v2}, Lt02;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lug;

    invoke-direct {v2, p1, v5}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p3, v2}, Lh42;->s(Lekc;Lf7f;)V

    iput-object v1, p0, Lpi3;->e:Loi3;

    iget-object p1, p4, Lmi3;->a:Ly5i;

    iget-object p1, p1, Ly5i;->f:Lpjb;

    if-eqz p1, :cond_62

    move-object p2, p1

    :cond_62
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object p1

    new-instance p3, Lf32;

    const/16 p4, 0x13

    invoke-direct {p3, p4}, Lf32;-><init>(B)V

    invoke-virtual {p2, p1, v3, p3}, Lpjb;->a([Ljava/lang/String;ZLkotlin/jvm/functions/Function1;)Lb6i;

    new-instance p1, Lqie;

    invoke-direct {p1, p4}, Lqie;-><init>(B)V

    iput-object p1, p0, Lpi3;->f:Lqie;

    return-void
.end method


# virtual methods
.method public final a(ZJLjava/util/Set;)V
    .registers 14

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v2, p0, Lpi3;->a:Ltcl;

    invoke-direct {v0, v1, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v3, Lni3;

    move-object v4, p0

    move v5, p1

    move-wide v6, p2

    move-object v8, p4

    invoke-direct/range {v3 .. v8}, Lni3;-><init>(Lpi3;ZJLjava/util/Set;)V

    invoke-virtual {v0, v3}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    new-instance p1, Lf32;

    const/16 p2, 0x17

    invoke-direct {p1, p2}, Lf32;-><init>(B)V

    invoke-virtual {p0, p1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    iget-object p1, v4, Lpi3;->f:Lqie;

    invoke-virtual {p0, p1}, Lplk;->m(Lqie;)Lp1j;

    return-void
.end method
