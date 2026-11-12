.class public final Lblf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvm;


# instance fields
.field public final synthetic a:Lalf;


# direct methods
.method public constructor <init>(Lalf;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lblf;->a:Lalf;

    return-void
.end method


# virtual methods
.method public final C(Lcm;)V
    .registers 2

    iget-object p0, p0, Lblf;->a:Lalf;

    invoke-virtual {p0}, Lalf;->c()V

    return-void
.end method

.method public final g()V
    .registers 1

    iget-object p0, p0, Lblf;->a:Lalf;

    iget-object p0, p0, Lalf;->v:Lbp;

    invoke-virtual {p0}, Lbp;->W()V

    return-void
.end method

.method public final onAdClicked()V
    .registers 1

    iget-object p0, p0, Lblf;->a:Lalf;

    iget-object p0, p0, Lalf;->v:Lbp;

    invoke-virtual {p0}, Lbp;->V()V

    return-void
.end method

.method public final onAdDismissed()V
    .registers 1

    iget-object p0, p0, Lblf;->a:Lalf;

    invoke-virtual {p0}, Lalf;->c()V

    return-void
.end method
