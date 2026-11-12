.class public final Lyhi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpw;


# instance fields
.field public final a:Lqw;

.field public final b:Lcb7;


# direct methods
.method public constructor <init>(Lqw;Lcb7;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyhi;->a:Lqw;

    iput-object p2, p0, Lyhi;->b:Lcb7;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p2, Lxhi;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lxhi;

    iget v1, v0, Lxhi;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lxhi;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lxhi;

    invoke-direct {v0, p0, p2}, Lxhi;-><init>(Lyhi;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lxhi;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lxhi;->w:I

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_37

    if-eq v2, v5, :cond_31

    if-ne v2, v4, :cond_2b

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_58

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_31
    iget-object p1, v0, Lxhi;->t:Ljava/lang/String;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4b

    :cond_37
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v0, Lxhi;->t:Ljava/lang/String;

    iput v5, v0, Lxhi;->w:I

    iget-object p0, p0, Lyhi;->a:Lqw;

    iget-object p0, p0, Lqw;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object p2, p0

    check-cast p2, Lbgo;

    if-eq p2, v1, :cond_57

    :goto_4b
    check-cast p2, Lbgo;

    iput-object v3, v0, Lxhi;->t:Ljava/lang/String;

    iput v4, v0, Lxhi;->w:I

    invoke-virtual {p2, p1, v0}, Lbgo;->a(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_58

    :cond_57
    return-object v1

    :cond_58
    :goto_58
    check-cast p2, Lozh;

    invoke-virtual {p2}, Lozh;->a()Z

    move-result p0

    iget-object p1, p2, Lozh;->a:Lfr6;

    if-nez p0, :cond_134

    invoke-virtual {p1}, Lfr6;->e()Lzqa;

    move-result-object p0

    iget p0, p0, Lzqa;->a:I

    const/16 v0, 0x194

    if-ne p0, v0, :cond_6f

    sget-object p0, Lmw;->a:Lmw;

    return-object p0

    :cond_6f
    new-instance p0, Llw;

    sget-object v0, Lpoa;->a:Lcrb;

    iget-object p2, p2, Lozh;->c:Ljava/lang/Object;

    instance-of v0, p2, Lfr6;

    if-eqz v0, :cond_7c

    check-cast p2, Lfr6;

    goto :goto_7d

    :cond_7c
    move-object p2, v3

    :goto_7d
    invoke-virtual {p1}, Lfr6;->e()Lzqa;

    move-result-object v0

    invoke-virtual {p1}, Lfr6;->T()Ltna;

    move-result-object p1

    iget-object p1, p1, Ltna;->b:Lrpa;

    if-nez p1, :cond_8a

    move-object p1, v3

    :cond_8a
    invoke-interface {p1}, Lrpa;->getUrl()Lgpm;

    move-result-object p1

    iget-object p1, p1, Lgpm;->a:Ljava/lang/String;

    if-eqz p2, :cond_11a

    :try_start_92
    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Lyf;

    const/16 v2, 0x1d

    invoke-direct {v1, v2, v3, p2}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    sget-object p2, Lkotlin/coroutines/h;->a:Lkotlin/coroutines/h;

    invoke-static {p2, v1}, Lscd;->g0(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    sget-object v1, Lpoa;->a:Lcrb;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lkotlinx/serialization/json/c;->Companion:Lkotlinx/serialization/json/JsonObject$Companion;

    invoke-virtual {v2}, Lkotlinx/serialization/json/JsonObject$Companion;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v1, p2, v2}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lkotlinx/serialization/json/c;

    const-string v1, "error"

    invoke-virtual {p2, v1}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlinx/serialization/json/b;

    if-eqz v1, :cond_d5

    instance-of v2, v1, Lkotlinx/serialization/json/d;

    if-eqz v2, :cond_c7

    check-cast v1, Lkotlinx/serialization/json/d;

    goto :goto_c8

    :cond_c7
    move-object v1, v3

    :goto_c8
    if-eqz v1, :cond_d5

    invoke-virtual {v1}, Lkotlinx/serialization/json/d;->c()Z

    move-result v2

    if-eqz v2, :cond_d5

    invoke-virtual {v1}, Lkotlinx/serialization/json/d;->b()Ljava/lang/String;

    move-result-object v1

    goto :goto_d6

    :cond_d5
    move-object v1, v3

    :goto_d6
    const-string v2, "message"

    invoke-virtual {p2, v2}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lkotlinx/serialization/json/b;

    if-eqz p2, :cond_f5

    instance-of v2, p2, Lkotlinx/serialization/json/d;

    if-eqz v2, :cond_e7

    check-cast p2, Lkotlinx/serialization/json/d;

    goto :goto_e8

    :cond_e7
    move-object p2, v3

    :goto_e8
    if-eqz p2, :cond_f5

    invoke-virtual {p2}, Lkotlinx/serialization/json/d;->c()Z

    move-result v2

    if-eqz v2, :cond_f5

    invoke-virtual {p2}, Lkotlinx/serialization/json/d;->b()Ljava/lang/String;

    move-result-object p2

    goto :goto_f6

    :cond_f5
    move-object p2, v3

    :goto_f6
    const-string v2, "Error"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_106

    if-eqz v1, :cond_106

    invoke-static {v1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v2
    :try_end_104
    .catchall {:try_start_92 .. :try_end_104} :catchall_10a

    if-eqz v2, :cond_112

    :cond_106
    if-eqz p2, :cond_112

    move-object v1, p2

    goto :goto_112

    :catchall_10a
    move-exception p2

    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Lq0i;

    invoke-direct {v1, p2}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :cond_112
    :goto_112
    instance-of p2, v1, Lq0i;

    if-eqz p2, :cond_117

    move-object v1, v3

    :cond_117
    check-cast v1, Ljava/lang/String;

    goto :goto_11b

    :cond_11a
    move-object v1, v3

    :goto_11b
    invoke-static {v0}, Lalo;->X(Lzqa;)Z

    move-result p2

    if-nez p2, :cond_12e

    iget p2, v0, Lzqa;->a:I

    iget-object v0, v0, Lzqa;->b:Ljava/lang/String;

    new-instance v2, Lnoa;

    invoke-direct {v2, p2, v0, p1, v1}, Lnoa;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v2}, Llw;-><init>(Ljava/lang/Throwable;)V

    return-object p0

    :cond_12e
    const-string p0, "Failed requirement."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v3

    :cond_134
    iget-object p0, p2, Lozh;->b:Ljava/lang/Object;

    const-string p1, "Required value was null."

    if-eqz p0, :cond_161

    check-cast p0, Lx1d;

    new-instance p2, Lnw;

    sget-object v0, Lwv;->Companion:Luv;

    iget-object v1, p0, Lx1d;->a:Ljava/lang/String;

    if-eqz v1, :cond_15d

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Luv;->b(Ljava/lang/String;)Lwv;

    move-result-object p1

    sget-object v0, Lpn7;->b:Lon7;

    iget-wide v0, p0, Lx1d;->b:J

    sget-object p0, Lun7;->e:Lun7;

    invoke-static {v0, v1, p0}, Lcs5;->y0(JLun7;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    invoke-direct {p2, p1, v0, v1}, Lnw;-><init>(Lwv;J)V

    return-object p2

    :cond_15d
    invoke-static {p1}, Lqp2;->o(Ljava/lang/String;)V

    return-object v3

    :cond_161
    invoke-static {p1}, Lqp2;->o(Ljava/lang/String;)V

    return-object v3
.end method
