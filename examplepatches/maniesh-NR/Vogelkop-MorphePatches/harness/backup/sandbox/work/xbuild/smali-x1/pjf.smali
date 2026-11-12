.class public final Lpjf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkz3;


# instance fields
.field public final synthetic a:Lqjf;


# direct methods
.method public constructor <init>(Lqjf;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpjf;->a:Lqjf;

    return-void
.end method


# virtual methods
.method public final c(Z)V
    .registers 2

    iget-object p0, p0, Lpjf;->a:Lqjf;

    iget-object p0, p0, Lqjf;->f:Ltjf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_e

    sget-object p1, Lrjf;->f:Lrjf;

    invoke-virtual {p0, p1}, Ltjf;->i(Lrjf;)V

    :cond_e
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ltjf;->a(Z)V

    return-void
.end method

.method public final h()V
    .registers 1

    iget-object p0, p0, Lpjf;->a:Lqjf;

    iget-object p0, p0, Lqjf;->f:Ltjf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method
