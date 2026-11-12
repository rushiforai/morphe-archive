.class public final La0e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lb0e;


# direct methods
.method public constructor <init>(Lb0e;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La0e;->a:Lb0e;

    return-void
.end method


# virtual methods
.method public final L(Lb2l;Z)V
    .registers 3

    iget-object p0, p0, La0e;->a:Lb0e;

    iget-object p0, p0, Lb0e;->k:Lrn9;

    invoke-virtual {p0}, Lrn9;->N()V

    return-void
.end method

.method public final h(Lb2l;I)V
    .registers 3

    iget-object p0, p0, La0e;->a:Lb0e;

    iget-object p0, p0, Lb0e;->k:Lrn9;

    invoke-virtual {p0}, Lrn9;->N()V

    return-void
.end method

.method public final o(Lb2l;IZ)V
    .registers 4

    iget-object p0, p0, La0e;->a:Lb0e;

    iget-object p0, p0, Lb0e;->k:Lrn9;

    invoke-virtual {p0}, Lrn9;->N()V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    iget-object p0, p0, La0e;->a:Lb0e;

    sget-object v0, Ll08;->a:Ll08;

    invoke-virtual {p0, v0}, Ldt1;->K(Ljava/util/Collection;)V

    return-void
.end method
