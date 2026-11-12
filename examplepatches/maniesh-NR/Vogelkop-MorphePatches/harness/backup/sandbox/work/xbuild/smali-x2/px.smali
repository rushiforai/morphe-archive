.class public final Lpx;
.super Llyf;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lyo;Lrm;Ljava/lang/String;)V
    .registers 5

    .line 10
    new-instance v0, Llyf;

    invoke-direct {v0, p1, p2}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p0, v0, p3}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Lyz;)V
    .registers 4

    iget-object v0, p1, Lyz;->i:Lyo;

    iget-object v1, p1, Lyz;->j:Lrm;

    iget-object p1, p1, Lyz;->g:Ljava/lang/String;

    invoke-direct {p0, v0, v1, p1}, Lpx;-><init>(Lyo;Lrm;Ljava/lang/String;)V

    return-void
.end method
