.class public final Lnml;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Ln5o;

.field public final c:Lrmi;

.field public d:Loml;


# direct methods
.method public constructor <init>(Lumi;Ln5o;Lrmi;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnml;->a:Lumi;

    iput-object p2, p0, Lnml;->b:Ln5o;

    iput-object p3, p0, Lnml;->c:Lrmi;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)Loml;
    .registers 3

    new-instance v0, Loml;

    invoke-direct {v0, p0}, Loml;-><init>(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p1, p0}, Loml;->a(Ljava/lang/Object;Ljri;)V

    return-object v0
.end method

.method public final b(Lnml;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Loml;

    invoke-direct {v0, p1}, Loml;-><init>(Lnml;)V

    iget-object p1, p0, Lnml;->d:Loml;

    if-nez p1, :cond_f

    iput-object v0, p0, Lnml;->d:Loml;

    return-void

    :cond_f
    invoke-static {}, Lh9o;->e()V

    return-void
.end method

.method public final c(Ln5o;)Loml;
    .registers 3

    iget-object v0, p0, Lnml;->a:Lumi;

    invoke-virtual {v0, p1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnml;->b(Lnml;)V

    new-instance p1, Loml;

    invoke-direct {p1, p0}, Loml;-><init>(Lnml;)V

    return-object p1
.end method
