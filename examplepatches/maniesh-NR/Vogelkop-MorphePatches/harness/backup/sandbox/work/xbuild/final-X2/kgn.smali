.class public final Lkgn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkz3;


# instance fields
.field public final synthetic a:Llgn;


# direct methods
.method public constructor <init>(Llgn;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkgn;->a:Llgn;

    return-void
.end method


# virtual methods
.method public final b(Lhjm;)V
    .registers 2

    iget-object p1, p0, Lkgn;->a:Llgn;

    iget-object p1, p1, Llgn;->c:Lmgn;

    iget-object p1, p1, Lmgn;->h:Lysl;

    invoke-interface {p1, p0}, Lysl;->f0(Ljava/lang/Object;)V

    return-void
.end method

.method public final g(Llz3;)V
    .registers 2

    iget-object p1, p0, Lkgn;->a:Llgn;

    iget-object p1, p1, Llgn;->c:Lmgn;

    iget-object p1, p1, Lmgn;->h:Lysl;

    invoke-interface {p1, p0}, Lysl;->r(Ljava/lang/Object;)V

    return-void
.end method
