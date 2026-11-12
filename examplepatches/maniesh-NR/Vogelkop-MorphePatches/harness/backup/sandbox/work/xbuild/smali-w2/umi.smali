.class public final Lumi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltcl;


# instance fields
.field public final a:Luml;

.field public final b:Ldhi;

.field public final c:Ldhi;

.field public final d:Ldhi;


# direct methods
.method public constructor <init>(Luml;Ldhi;Ldhi;Ldhi;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lumi;->a:Luml;

    iput-object p2, p0, Lumi;->b:Ldhi;

    iput-object p3, p0, Lumi;->c:Ldhi;

    iput-object p4, p0, Lumi;->d:Ldhi;

    return-void
.end method


# virtual methods
.method public final e(Ln5o;)Lnml;
    .registers 4

    new-instance v0, Lnml;

    iget-object v1, p0, Lumi;->b:Ldhi;

    invoke-direct {v0, p0, p1, v1}, Lnml;-><init>(Lumi;Ln5o;Lrmi;)V

    return-object v0
.end method

.method public final f(Ln5o;)Lnml;
    .registers 4

    new-instance v0, Lnml;

    iget-object v1, p0, Lumi;->a:Luml;

    invoke-direct {v0, p0, p1, v1}, Lnml;-><init>(Lumi;Ln5o;Lrmi;)V

    return-object v0
.end method

.method public final g(Ln5o;)Lnml;
    .registers 4

    new-instance v0, Lnml;

    iget-object v1, p0, Lumi;->d:Ldhi;

    invoke-direct {v0, p0, p1, v1}, Lnml;-><init>(Lumi;Ln5o;Lrmi;)V

    return-object v0
.end method
