.class public final Ljl;
.super Lll;
.source "SourceFile"


# direct methods
.method public static c(Lorb;)Ljl;
    .registers 9

    const-string v0, "style"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lvep;->a(Ljava/lang/String;)I

    move-result v2

    new-instance v1, Ljl;

    const-string v0, "pid"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v0, 0x0

    iget-object v3, p0, Lorb;->a:Lorg/json/JSONObject;

    const-string v5, "rotateEvery"

    invoke-virtual {v3, v5, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    invoke-static {p0}, Ldl;->b(Lorb;)Ljava/util/TreeSet;

    move-result-object v5

    invoke-static {p0}, Ldl;->a(Lorb;)Ljava/util/TreeSet;

    move-result-object v6

    const/4 v7, 0x0

    sget-object v3, Lq50;->g:Lq50;

    invoke-direct/range {v1 .. v7}, Ldl;-><init>(ILq50;Ljava/lang/String;Ljava/util/TreeSet;Ljava/util/TreeSet;Liq;)V

    return-object v1
.end method
