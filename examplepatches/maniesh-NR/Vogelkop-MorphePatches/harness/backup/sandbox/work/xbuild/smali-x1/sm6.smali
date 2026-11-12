.class public final Lsm6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:J


# instance fields
.field public final a:Ltw2;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/4 v0, 0x1

    sget-object v1, Lun7;->h:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lsm6;->b:J

    return-void
.end method

.method public constructor <init>(Ltw2;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsm6;->a:Ltw2;

    return-void
.end method


# virtual methods
.method public final a(Ld98;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lrm6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lrm6;

    iget v1, v0, Lrm6;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lrm6;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lrm6;

    invoke-direct {v0, p0, p2}, Lrm6;-><init>(Lsm6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lrm6;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lrm6;->w:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v4, :cond_2a

    iget-object p1, v0, Lrm6;->t:Ld98;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_56

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_30
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p2, p1, Ld98;->f:Le98;

    if-eqz p2, :cond_3b

    iget-boolean p2, p2, Le98;->a:Z

    if-eq p2, v4, :cond_c3

    :cond_3b
    iget-object p0, p0, Lsm6;->a:Ltw2;

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lg77;

    iget-object p0, p0, Lg77;->c:Ljava/lang/Object;

    check-cast p0, Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf99;

    iput-object p1, v0, Lrm6;->t:Ld98;

    iput v4, v0, Lrm6;->w:I

    invoke-static {p0, v0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_56

    return-object v1

    :cond_56
    :goto_56
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_c3

    iget-object p0, p1, Ld98;->e:Ljava/lang/Boolean;

    iget-object p2, p1, Ld98;->d:Lebb;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_c3

    if-eqz p2, :cond_c3

    iget-object p0, p1, Ld98;->c:Lf98;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_c3

    if-eq p0, v4, :cond_83

    const/4 p1, 0x2

    if-eq p0, p1, :cond_c3

    const/4 p1, 0x3

    if-eq p0, p1, :cond_c3

    const/4 p1, 0x4

    if-eq p0, p1, :cond_c3

    invoke-static {}, Lh9o;->p()V

    return-object v3

    :cond_83
    sget-object p0, Lebb;->c:Lebb;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lj06;->m(J)Lebb;

    move-result-object p0

    iget-wide v0, p1, Ld98;->b:J

    invoke-virtual {p2, v0, v1}, Lebb;->h(J)Lebb;

    move-result-object p1

    invoke-virtual {p1, p0}, Lebb;->g(Lebb;)J

    move-result-wide p0

    invoke-static {p0, p1}, Lpn7;->k(J)Z

    move-result p2

    if-eqz p2, :cond_c3

    sget-wide v0, Lsm6;->b:J

    invoke-static {p0, p1, v0, v1}, Lpn7;->l(JJ)J

    move-result-wide p0

    new-instance p2, Lpn7;

    invoke-direct {p2, p0, p1}, Lpn7;-><init>(J)V

    sget-object p0, Lpn7;->b:Lon7;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lpn7;

    const-wide/16 v0, 0x0

    invoke-direct {p0, v0, v1}, Lpn7;-><init>(J)V

    invoke-virtual {p2, p0}, Lpn7;->compareTo(Ljava/lang/Object;)I

    move-result p1

    if-gez p1, :cond_bb

    move-object p2, p0

    :cond_bb
    new-instance p0, Lomi;

    iget-wide p1, p2, Lpn7;->a:J

    invoke-direct {p0, p1, p2}, Lomi;-><init>(J)V

    return-object p0

    :cond_c3
    sget-object p0, Lnmi;->a:Lnmi;

    return-object p0
.end method
