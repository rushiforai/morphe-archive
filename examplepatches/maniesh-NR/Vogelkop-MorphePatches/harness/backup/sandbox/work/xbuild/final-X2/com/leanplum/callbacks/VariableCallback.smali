.class public abstract Lcom/leanplum/callbacks/VariableCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field private variable:Lcom/leanplum/Var;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/leanplum/Var<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract handle(Lcom/leanplum/Var;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/Var<",
            "TT;>;)V"
        }
    .end annotation
.end method

.method public run()V
    .registers 3

    iget-object v0, p0, Lcom/leanplum/callbacks/VariableCallback;->variable:Lcom/leanplum/Var;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lcom/leanplum/callbacks/VariableCallback;->variable:Lcom/leanplum/Var;

    invoke-virtual {p0, v1}, Lcom/leanplum/callbacks/VariableCallback;->handle(Lcom/leanplum/Var;)V

    monitor-exit v0

    return-void

    :goto_a
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_c

    throw p0

    :catchall_c
    move-exception p0

    goto :goto_a
.end method

.method public setVariable(Lcom/leanplum/Var;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/Var<",
            "TT;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/leanplum/callbacks/VariableCallback;->variable:Lcom/leanplum/Var;

    return-void
.end method
