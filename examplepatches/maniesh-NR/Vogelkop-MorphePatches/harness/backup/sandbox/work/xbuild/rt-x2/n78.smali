.class public final Ln78;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(ILjava/lang/String;)Ljava/lang/String;
    .registers 4

    const-string v0, "["

    if-eqz p1, :cond_b

    const-string v1, "] "

    invoke-static {p0, v0, v1, p1}, Lp3p;->j(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_b
    const-string p1, "]"

    invoke-static {p0, v0, p1}, Lp3p;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
