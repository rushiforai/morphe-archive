.class public final Lu0a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpde;


# direct methods
.method public constructor <init>(Lq6e;Lhx5;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lpde;

    sget-object v1, Lr0a;->a:Lr0a;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lu0a;->a:Lpde;

    new-instance v0, Lkv1;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lkv1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lq6e;->a(Lkri;)V

    new-instance p1, Ltu7;

    const/16 v0, 0x14

    invoke-direct {p1, p0, v0}, Ltu7;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lcl4;

    const/16 v0, 0x19

    invoke-direct {p0, p1, v0}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method
