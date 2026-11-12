.class public final Ltx;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final synthetic c:Lux;


# direct methods
.method public constructor <init>(Lux;Lyl;)V
    .registers 3

    iput-object p1, p0, Ltx;->c:Lux;

    const/16 p1, 0x1c

    invoke-direct {p0, p2, p1}, Ln1;-><init>(Ljava/lang/Object;B)V

    return-void
.end method


# virtual methods
.method public final c(Ldl;)V
    .registers 3

    invoke-super {p0, p1}, Ln1;->c(Ldl;)V

    iget-object p0, p0, Ltx;->c:Lux;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lux;->b(Ldl;Z)V

    return-void
.end method

.method public final p(Lyz;Ldl;Z)V
    .registers 4

    invoke-super {p0, p1, p2, p3}, Ln1;->p(Lyz;Ldl;Z)V

    iget-object p0, p0, Ltx;->c:Lux;

    const/4 p1, 0x0

    invoke-virtual {p0, p2, p1}, Lux;->b(Ldl;Z)V

    return-void
.end method

.method public final t(Ldl;)V
    .registers 3

    invoke-super {p0, p1}, Ln1;->t(Ldl;)V

    iget-object p0, p0, Ltx;->c:Lux;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lux;->b(Ldl;Z)V

    return-void
.end method
