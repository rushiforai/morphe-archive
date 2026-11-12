.class public final Lizj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:Landroid/content/Context;

.field public final c:Likc;

.field public final d:Lpde;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lndc;Likc;Likc;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lizj;->a:Ljava/util/ArrayList;

    iput-object p1, p0, Lizj;->b:Landroid/content/Context;

    iput-object p3, p0, Lizj;->c:Likc;

    new-instance v0, Lpde;

    invoke-virtual {p3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {p1, v1}, Lj14;->B(Landroid/content/Context;Z)Ltta;

    move-result-object v1

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lizj;->d:Lpde;

    new-instance v1, Lgzj;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lgzj;-><init>(Lizj;B)V

    invoke-virtual {p3, p2, v1}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v1, Lgzj;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lgzj;-><init>(Lizj;B)V

    invoke-virtual {p4, p2, v1}, Lekc;->j(Lndc;Lf7f;)V

    invoke-virtual {p3}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    invoke-static {p1, p0}, Lj14;->B(Landroid/content/Context;Z)Ltta;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lhzj;

    iget-object p0, p0, Lizj;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lhzj;

    iget-object p0, p0, Lizj;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method
