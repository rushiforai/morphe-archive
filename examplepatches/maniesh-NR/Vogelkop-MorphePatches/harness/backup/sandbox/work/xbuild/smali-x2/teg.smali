.class public final Lteg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzy;


# instance fields
.field public final synthetic a:Lzy;

.field public final synthetic b:Laz;

.field public final synthetic c:Lueg;


# direct methods
.method public constructor <init>(Lueg;Lzy;Laz;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lteg;->a:Lzy;

    iput-object p3, p0, Lteg;->b:Laz;

    iput-object p1, p0, Lteg;->c:Lueg;

    return-void
.end method


# virtual methods
.method public final a(Lyz;)Z
    .registers 2

    iget-object p0, p0, Lteg;->a:Lzy;

    invoke-interface {p0, p1}, Lzy;->a(Lyz;)Z

    move-result p0

    return p0
.end method

.method public final b(Lyz;)V
    .registers 2

    iget-object p0, p0, Lteg;->a:Lzy;

    invoke-interface {p0, p1}, Lzy;->b(Lyz;)V

    return-void
.end method

.method public final c()V
    .registers 1

    iget-object p0, p0, Lteg;->a:Lzy;

    invoke-interface {p0}, Lzy;->c()V

    return-void
.end method

.method public final onFailed(Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lteg;->b:Laz;

    iget-object v1, p0, Lteg;->c:Lueg;

    invoke-virtual {v1, v0}, Lueg;->m(Laz;)Lyz;

    move-result-object v0

    iget-object p0, p0, Lteg;->a:Lzy;

    if-eqz v0, :cond_16

    invoke-interface {p0, v0}, Lzy;->a(Lyz;)Z

    move-result p0

    if-nez p0, :cond_15

    invoke-virtual {v0}, Lyz;->b()V

    :cond_15
    return-void

    :cond_16
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-object v0, v1, Lueg;->d:Ldl;

    iget-object v0, v0, Ldl;->c:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "pid="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Lzy;->onFailed(Ljava/lang/String;)V

    return-void
.end method
