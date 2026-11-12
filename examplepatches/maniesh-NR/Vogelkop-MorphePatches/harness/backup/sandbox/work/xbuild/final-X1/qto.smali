.class public final Lqto;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(I)Lfuo;
    .registers 4

    sget-object v0, Lfuo;->g:Lh58;

    invoke-static {v0, v0}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v0

    :cond_6
    invoke-virtual {v0}, Lw4;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-virtual {v0}, Lw4;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfuo;

    iget-byte v2, v1, Lfuo;->a:B

    if-ne v2, p0, :cond_6

    return-object v1

    :cond_17
    const-string p0, "Collection contains no element matching the predicate."

    invoke-static {p0}, Lh9o;->h(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final serializer()Lkotlinx/serialization/KSerializer;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/serialization/KSerializer;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object p0, Lfuo;->b:Ll4c;

    invoke-interface {p0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
