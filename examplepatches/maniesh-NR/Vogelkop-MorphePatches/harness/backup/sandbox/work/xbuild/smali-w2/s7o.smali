.class public final Ls7o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Laz;


# instance fields
.field public final a:Laz;

.field public final b:Ldl;


# direct methods
.method public constructor <init>(Laz;Ldl;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls7o;->a:Laz;

    iput-object p2, p0, Ls7o;->b:Ldl;

    return-void
.end method


# virtual methods
.method public final a()Ldl;
    .registers 1

    iget-object p0, p0, Ls7o;->b:Ldl;

    return-object p0
.end method

.method public final b()Z
    .registers 1

    iget-object p0, p0, Ls7o;->a:Laz;

    invoke-interface {p0}, Laz;->b()Z

    move-result p0

    return p0
.end method

.method public final c()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Ls7o;->a:Laz;

    invoke-interface {p0}, Laz;->c()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final d()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ls7o;->a:Laz;

    invoke-interface {p0}, Laz;->d()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final e()Z
    .registers 1

    iget-object p0, p0, Ls7o;->a:Laz;

    invoke-interface {p0}, Laz;->e()Z

    move-result p0

    return p0
.end method

.method public final f()Z
    .registers 1

    iget-object p0, p0, Ls7o;->a:Laz;

    invoke-interface {p0}, Laz;->f()Z

    move-result p0

    return p0
.end method
