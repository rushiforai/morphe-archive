.class public final Lip6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lyo6;

.field public final b:Lf99;

.field public final c:Lf99;

.field public final d:Lf99;

.field public final e:Lf99;

.field public final f:Lf99;


# direct methods
.method public constructor <init>(Lyo6;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lip6;->a:Lyo6;

    iget-object v0, p1, Lyo6;->b:Lf99;

    new-instance v1, Lyc1;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Lyc1;-><init>(Lf99;B)V

    invoke-static {v1}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v0

    iput-object v0, p0, Lip6;->b:Lf99;

    iget-object v0, p1, Lyo6;->c:Lf99;

    iput-object v0, p0, Lip6;->c:Lf99;

    iget-object v0, p1, Lyo6;->d:Lf99;

    new-instance v1, Lyc1;

    const/4 v2, 0x2

    invoke-direct {v1, v0, v2}, Lyc1;-><init>(Lf99;B)V

    invoke-static {v1}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v0

    iput-object v0, p0, Lip6;->d:Lf99;

    iget-object v0, p1, Lyo6;->e:Lf99;

    iget-object v1, p1, Lyo6;->f:Lf99;

    new-instance v3, Lkm4;

    const/4 v4, 0x0

    const/4 v5, 0x3

    invoke-direct {v3, v5, v4, v2}, Lkm4;-><init>(ILmt5;B)V

    new-instance v2, Lya9;

    const/4 v4, 0x0

    invoke-direct {v2, v0, v1, v3, v4}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v0

    iput-object v0, p0, Lip6;->e:Lf99;

    iget-object p1, p1, Lyo6;->g:Lf99;

    iput-object p1, p0, Lip6;->f:Lf99;

    return-void
.end method
