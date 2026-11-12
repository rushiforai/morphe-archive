.class public final Ldye;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhfk;


# instance fields
.field public final a:Lxd6;


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lxd6;

    const/4 v1, 0x7

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1}, Lxd6;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ldye;->a:Lxd6;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 1

    return-void
.end method

.method public final b(Llfk;)V
    .registers 2

    return-void
.end method

.method public final d()V
    .registers 1

    return-void
.end method

.method public final getState()Lf99;
    .registers 1

    iget-object p0, p0, Ldye;->a:Lxd6;

    return-object p0
.end method
