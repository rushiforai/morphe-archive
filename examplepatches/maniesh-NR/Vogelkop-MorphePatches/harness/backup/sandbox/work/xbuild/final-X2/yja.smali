.class public final Lyja;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzja;


# virtual methods
.method public final a()Lorb;
    .registers 3

    new-instance p0, Lorb;

    invoke-direct {p0}, Lorb;-><init>()V

    const/4 v0, 0x1

    const-string v1, "success"

    invoke-virtual {p0, v1, v0}, Lorb;->r(Ljava/lang/String;Z)V

    return-object p0
.end method
