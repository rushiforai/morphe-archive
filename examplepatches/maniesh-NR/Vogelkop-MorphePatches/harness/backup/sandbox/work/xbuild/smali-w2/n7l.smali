.class public final Ln7l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lo7l;


# static fields
.field public static final d:Lcrb;

.field public static final e:Lbpk;


# instance fields
.field public final a:Lumi;

.field public final b:Lzyk;

.field public final c:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lbvk;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lbvk;-><init>(B)V

    sget-object v1, Lrpb;->d:Lqpb;

    invoke-static {v1, v0}, Lphj;->o(Lrpb;Lkotlin/jvm/functions/Function1;)Lcrb;

    move-result-object v0

    sput-object v0, Ln7l;->d:Lcrb;

    new-instance v0, Lbpk;

    const/4 v1, 0x2

    const/4 v2, 0x6

    const/4 v3, 0x1

    invoke-direct {v0, v3, v1, v2}, Lbpk;-><init>(IIB)V

    sput-object v0, Ln7l;->e:Lbpk;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ln7l;->a:Lumi;

    new-instance p2, Lvg4;

    const/16 v0, 0x13

    invoke-direct {p2, p1, v0}, Lvg4;-><init>(Landroid/content/Context;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ln7l;->b:Lzyk;

    new-instance p1, Ldnj;

    const/16 p2, 0x1d

    invoke-direct {p1, p0, p2}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ln7l;->c:Lzyk;

    return-void
.end method


# virtual methods
.method public final a()Lf58;
    .registers 1

    iget-object p0, p0, Ln7l;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf58;

    return-object p0
.end method

.method public final e(Ljava/util/Set;Ltmi;)V
    .registers 6

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v2, p0, Ln7l;->a:Lumi;

    invoke-direct {v0, v1, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Ld7k;

    const/16 v2, 0x10

    invoke-direct {v1, p0, p1, v2}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    new-instance p1, Ln6k;

    const/16 v0, 0x19

    invoke-direct {p1, p2, v0}, Ln6k;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public final g(Lm7l;Lq7l;)V
    .registers 6

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v2, p0, Ln7l;->a:Lumi;

    invoke-direct {v0, v1, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Ld7k;

    const/16 v2, 0x11

    invoke-direct {v1, p0, p1, v2}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    new-instance v0, Li7l;

    const/4 v1, 0x0

    invoke-direct {v0, p2, p1, v1}, Li7l;-><init>(Lq7l;Lm7l;B)V

    invoke-virtual {p0, v0}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public final k(ILd7k;)V
    .registers 6

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v2, p0, Ln7l;->a:Lumi;

    invoke-direct {v0, v1, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Lh7l;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Lh7l;-><init>(Ln7l;IB)V

    invoke-virtual {v0, v1}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    new-instance p1, Ln6k;

    const/16 v0, 0x18

    invoke-direct {p1, p2, v0}, Ln6k;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public final l(ILd7k;)Loml;
    .registers 6

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v2, p0, Ln7l;->a:Lumi;

    invoke-direct {v0, v1, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Lh7l;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lh7l;-><init>(Ln7l;IB)V

    invoke-virtual {v0, v1}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    new-instance p1, Ln6k;

    const/16 v0, 0x17

    invoke-direct {p1, p2, v0}, Ln6k;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    move-result-object p0

    return-object p0
.end method
