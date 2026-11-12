.class public final Lktg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lydn;

.field public final b:Lkze;


# direct methods
.method public constructor <init>(Lydn;Lgmk;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lkze;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lktg;->b:Lkze;

    iput-object p1, p0, Lktg;->a:Lydn;

    iget-object p1, p2, Lgmk;->a:Lkze;

    new-instance p2, Ld8d;

    const/16 v0, 0x18

    invoke-direct {p2, p0, v0}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lekc;->k(Lf7f;)V

    return-void
.end method
