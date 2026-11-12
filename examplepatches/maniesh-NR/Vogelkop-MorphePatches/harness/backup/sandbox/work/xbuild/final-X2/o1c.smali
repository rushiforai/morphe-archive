.class public final Lo1c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lp1c;


# direct methods
.method public constructor <init>(Lp1c;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo1c;->a:Lp1c;

    return-void
.end method


# virtual methods
.method public a(Lq5j;)V
    .registers 3
    .annotation runtime Lvkk;
    .end annotation

    const-string v0, "recommendations_language_region"

    iget-object p1, p1, Lq5j;->b:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    iget-object p0, p0, Lo1c;->a:Lp1c;

    iget-object p1, p0, Lp1c;->q:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lt7j;->c()V

    :cond_15
    return-void
.end method
