.class public final Lrml;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Ltcl;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ltcl;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrml;->a:Ljava/lang/Object;

    iput-object p2, p0, Lrml;->b:Ltcl;

    return-void
.end method


# virtual methods
.method public final a(Lkotlin/jvm/functions/Function1;)Lplk;
    .registers 4

    new-instance v0, Lqml;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lqml;-><init>(Lrml;Lkotlin/jvm/functions/Function1;B)V

    iget-object p1, p0, Lrml;->b:Ltcl;

    iget-object p0, p0, Lrml;->a:Ljava/lang/Object;

    invoke-static {p1, p0, v0}, Laoh;->k(Ltcl;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)Lplk;

    move-result-object p0

    return-object p0
.end method

.method public final b(Lkotlin/jvm/functions/Function1;)Lplk;
    .registers 4

    new-instance v0, Lqml;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lqml;-><init>(Lrml;Lkotlin/jvm/functions/Function1;B)V

    iget-object p1, p0, Lrml;->b:Ltcl;

    iget-object p0, p0, Lrml;->a:Ljava/lang/Object;

    invoke-static {p1, p0, v0}, Laoh;->k(Ltcl;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)Lplk;

    move-result-object p0

    return-object p0
.end method

.method public final c(Lkotlin/jvm/functions/Function1;)Lplk;
    .registers 4

    new-instance v0, Lqml;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, v1}, Lqml;-><init>(Lrml;Lkotlin/jvm/functions/Function1;B)V

    iget-object p1, p0, Lrml;->b:Ltcl;

    iget-object p0, p0, Lrml;->a:Ljava/lang/Object;

    invoke-static {p1, p0, v0}, Laoh;->k(Ltcl;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)Lplk;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lrml;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lrml;

    iget-object v1, p0, Lrml;->a:Ljava/lang/Object;

    iget-object v3, p1, Lrml;->a:Ljava/lang/Object;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object p0, p0, Lrml;->b:Ltcl;

    iget-object p1, p1, Lrml;->b:Ltcl;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    return v2

    :cond_22
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lrml;->a:Ljava/lang/Object;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    goto :goto_a

    :cond_6
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_a
    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lrml;->b:Ltcl;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
