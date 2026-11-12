.class public final Lgmk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lkze;


# direct methods
.method public constructor <init>(Lslk;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lkze;

    sget-object v1, Luvg;->g:Luvg;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lgmk;->a:Lkze;

    iget-object p1, p1, Lslk;->i:Lkze;

    new-instance v0, Lqzg;

    const/16 v1, 0x16

    invoke-direct {v0, p0, v1}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lekc;->k(Lf7f;)V

    return-void
.end method
