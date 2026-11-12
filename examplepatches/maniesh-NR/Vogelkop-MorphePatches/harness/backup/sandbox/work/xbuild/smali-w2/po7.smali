.class public final Lpo7;
.super Lode;
.source "SourceFile"

# interfaces
.implements Lmo7;


# instance fields
.field public final synthetic l:Lno7;


# direct methods
.method public constructor <init>(Lno7;)V
    .registers 2

    iput-object p1, p0, Lpo7;->l:Lno7;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lekc;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final l()V
    .registers 2

    iget-object v0, p0, Lpo7;->l:Lno7;

    invoke-virtual {v0, p0}, Lno7;->g(Lmo7;)V

    return-void
.end method

.method public final m()V
    .registers 2

    iget-object v0, p0, Lpo7;->l:Lno7;

    invoke-virtual {v0, p0}, Lno7;->p(Lmo7;)V

    return-void
.end method

.method public final o(Z)V
    .registers 2

    iget-object p1, p0, Lpo7;->l:Lno7;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
