.class public final Lw3e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lab7;


# instance fields
.field public final a:Ldx5;

.field public final b:Ljg8;

.field public final c:Ljg8;


# direct methods
.method public constructor <init>(Lwjh;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Lcv6;

    iput-object v0, p0, Lw3e;->a:Ldx5;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcv6;->K(ILjava/lang/String;)Ldx5;

    iget-object v0, p1, Lwjh;->d:Ljava/lang/Object;

    check-cast v0, Ljg8;

    iput-object v0, p0, Lw3e;->b:Ljg8;

    invoke-virtual {v0, v1, v2}, Ldx5;->K(ILjava/lang/String;)Ldx5;

    iget-object p1, p1, Lwjh;->f:Ljava/lang/Object;

    check-cast p1, Ljg8;

    iput-object p1, p0, Lw3e;->c:Ljg8;

    return-void
.end method


# virtual methods
.method public final a()Ldx5;
    .registers 1

    iget-object p0, p0, Lw3e;->a:Ldx5;

    return-object p0
.end method

.method public final b()Ldx5;
    .registers 1

    iget-object p0, p0, Lw3e;->b:Ljg8;

    return-object p0
.end method

.method public final c()Ldx5;
    .registers 1

    iget-object p0, p0, Lw3e;->c:Ljg8;

    return-object p0
.end method
