.class public final Lt8l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lk6l;

.field public final b:Lpde;

.field public final c:Lpde;


# direct methods
.method public constructor <init>(Lndc;Lk6l;Lpde;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lt8l;->a:Lk6l;

    iput-object p3, p0, Lt8l;->b:Lpde;

    new-instance v0, Lpde;

    invoke-virtual {p0}, Lt8l;->a()Lq8l;

    move-result-object v1

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lt8l;->c:Lpde;

    new-instance v0, Ls8l;

    invoke-direct {v0, p0}, Ls8l;-><init>(Lt8l;)V

    new-instance v1, Lr8l;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lr8l;-><init>(Lt8l;B)V

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v2

    invoke-static {p2, v2, v0, v1}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    iget-object p2, p2, Lk6l;->w:Lxg;

    new-instance v0, Lq6l;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lq6l;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lr8l;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lr8l;-><init>(Lt8l;B)V

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v2

    invoke-static {p2, v2, v0, v1}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance p2, Ln6k;

    const/16 v0, 0x1a

    invoke-direct {p2, p0, v0}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lw4i;

    const/16 v0, 0x17

    invoke-direct {p0, p2, v0}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()Lq8l;
    .registers 3

    iget-object v0, p0, Lt8l;->b:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v1

    if-nez v0, :cond_15

    sget-object p0, Lq8l;->c:Lq8l;

    return-object p0

    :cond_15
    iget-object p0, p0, Lt8l;->a:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_2f

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->e:Lw6j;

    iget-object p0, p0, Lw6j;->d:Ljava/lang/Object;

    check-cast p0, Lknf;

    if-nez p0, :cond_28

    sget-object p0, Lq8l;->c:Lq8l;

    goto :goto_2c

    :cond_28
    invoke-interface {p0}, Lknf;->D()Lq8l;

    move-result-object p0

    :goto_2c
    if-eqz p0, :cond_2f

    return-object p0

    :cond_2f
    sget-object p0, Lq8l;->c:Lq8l;

    return-object p0
.end method
