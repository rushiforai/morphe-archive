.class public final Lno8;
.super Lk43;
.source "SourceFile"


# instance fields
.field public final k:Li3j;

.field public final l:Lap;

.field public final m:Lbp;

.field public final n:Lyo;


# direct methods
.method public constructor <init>(Loo8;Lzy;Ldl;Li3j;Lap;)V
    .registers 6

    invoke-direct {p0, p1, p2, p3}, Lk43;-><init>(Lbqi;Lzy;Ldl;)V

    iput-object p4, p0, Lno8;->k:Li3j;

    iput-object p5, p0, Lno8;->l:Lap;

    new-instance p2, Lbp;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lno8;->m:Lbp;

    iget-object p1, p1, Lbqi;->e:Lyo;

    iput-object p1, p0, Lno8;->n:Lyo;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 9

    new-instance v0, Lbp8;

    iget-object v1, p0, Lk43;->c:Ljava/lang/String;

    iget-object v2, p0, Lno8;->n:Lyo;

    iget-object v4, p0, Lk43;->d:Ldl;

    iget-object v5, p0, Lno8;->m:Lbp;

    iget-object v6, p0, Lno8;->k:Li3j;

    iget-object v7, p0, Lno8;->l:Lap;

    move-object v3, v1

    invoke-direct/range {v0 .. v7}, Lbp8;-><init>(Ljava/lang/String;Lyo;Ljava/lang/String;Ldl;Lbp;Li3j;Lap;)V

    invoke-virtual {p0, v0}, Lk43;->d(Laqi;)V

    return-void
.end method
