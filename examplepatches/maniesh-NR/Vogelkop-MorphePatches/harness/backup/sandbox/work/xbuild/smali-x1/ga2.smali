.class public final Lga2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrjm;


# instance fields
.field public a:Lsjm;

.field public final synthetic b:Lha2;


# direct methods
.method public constructor <init>(Lha2;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lga2;->b:Lha2;

    sget-object p1, Lsjm;->b:Lqjm;

    iput-object p1, p0, Lga2;->a:Lsjm;

    return-void
.end method


# virtual methods
.method public final b(Lsjm;)V
    .registers 4

    iput-object p1, p0, Lga2;->a:Lsjm;

    iget-object p0, p0, Lga2;->b:Lha2;

    iget-object p0, p0, Lha2;->d:Lf1p;

    iget-object p0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast p0, Li7f;

    const-class v0, Lrjm;

    invoke-static {p0, v0}, Lsfe;->R(Ljava/lang/Iterable;Ljava/lang/Class;)Lzlb;

    move-result-object p0

    invoke-virtual {p0}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_14
    move-object v0, p0

    check-cast v0, Lbmb;

    invoke-virtual {v0}, Lbmb;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_27

    invoke-virtual {v0}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrjm;

    invoke-interface {v0, p1}, Lrjm;->b(Lsjm;)V

    goto :goto_14

    :cond_27
    return-void
.end method
