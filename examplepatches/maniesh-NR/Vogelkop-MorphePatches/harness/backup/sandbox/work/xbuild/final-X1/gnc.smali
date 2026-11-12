.class public final Lgnc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv9i;


# instance fields
.field public final synthetic a:Lhnc;


# direct methods
.method public constructor <init>(Lhnc;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgnc;->a:Lhnc;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/util/HashMap;)V
    .registers 5

    iget-object p0, p0, Lgnc;->a:Lhnc;

    iget-object p1, p0, Lhnc;->q:Lq65;

    invoke-virtual {p1}, Ln1;->S()V

    iget-boolean p1, p0, Lhnc;->r:Z

    if-eqz p1, :cond_16

    iget-object p1, p0, Lhnc;->p:Lq65;

    iget-object p0, p0, Lhnc;->b:Lumi;

    const-wide/16 v0, 0x14

    sget-object p2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, p0, v0, v1, p2}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    :cond_16
    return-void
.end method

.method public final b(Lr72;Ljava/util/Map;)V
    .registers 3

    iget-object p0, p0, Lgnc;->a:Lhnc;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lhnc;->a(Z)V

    return-void
.end method

.method public final c(Ljava/util/HashMap;)V
    .registers 2

    return-void
.end method
