.class public final Lbva;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Ljava/lang/Runnable;

.field public b:Z

.field public final synthetic c:Lcva;


# direct methods
.method public constructor <init>(Lcva;Ljava/lang/Runnable;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbva;->c:Lcva;

    iput-object p2, p0, Lbva;->a:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-boolean v0, p0, Lbva;->b:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lbva;->b:Z

    iget-object v0, p0, Lbva;->c:Lcva;

    invoke-virtual {v0, p0}, Lcva;->c(Ljava/lang/Runnable;)Z

    move-result v0

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object p0, p0, Lbva;->a:Ljava/lang/Runnable;

    if-eqz v0, :cond_19

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_19
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lbva;->a:Ljava/lang/Runnable;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
