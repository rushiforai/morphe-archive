.class public final Lkka;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljka;


# virtual methods
.method public final a()Lorb;
    .registers 2

    const-string p0, "not-found"

    const-string v0, "status"

    invoke-static {v0, p0}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object p0

    return-object p0
.end method
