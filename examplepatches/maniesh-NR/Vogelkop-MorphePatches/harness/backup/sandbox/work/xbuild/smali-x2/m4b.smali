.class public abstract Lm4b;
.super Lk8;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Lpro;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lk8;-><init>(Landroid/content/Context;Lpro;)V

    iget-object p0, p2, Lpro;->b:Lsm;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method
