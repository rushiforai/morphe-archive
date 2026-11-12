.class public final Lxnc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lkze;

.field public final b:Lkze;

.field public final c:Lkze;

.field public final d:Lz78;

.field public final e:Lode;

.field public final f:Lz78;


# direct methods
.method public constructor <init>(Lxnh;Lplh;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lkze;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lxnc;->a:Lkze;

    new-instance v0, Lkze;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lxnc;->b:Lkze;

    new-instance v0, Lkze;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lxnc;->c:Lkze;

    new-instance v0, Lz78;

    const/4 v1, 0x5

    invoke-direct {v0, p2, v1}, Lz78;-><init>(Lplh;B)V

    iput-object v0, p0, Lxnc;->d:Lz78;

    new-instance v0, Lode;

    invoke-direct {v0}, Lekc;-><init>()V

    iput-object v0, p0, Lxnc;->e:Lode;

    new-instance v0, Lz78;

    const/4 v1, 0x6

    invoke-direct {v0, p2, v1}, Lz78;-><init>(Lplh;B)V

    iput-object v0, p0, Lxnc;->f:Lz78;

    new-instance p2, Lty;

    const/4 v0, 0x3

    invoke-direct {p2, p1, p0, v0}, Lty;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lno7;->g(Lmo7;)V

    return-void
.end method
