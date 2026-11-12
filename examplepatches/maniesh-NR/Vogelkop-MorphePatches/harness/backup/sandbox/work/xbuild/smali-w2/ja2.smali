.class public abstract Lja2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lu0g;


# virtual methods
.method public final d()Z
    .registers 1

    iget-object p0, p0, Lja2;->a:Lu0g;

    if-eqz p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method
