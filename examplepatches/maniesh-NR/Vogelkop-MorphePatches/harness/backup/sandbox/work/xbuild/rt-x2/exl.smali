.class public final Lexl;
.super Lmgh;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public d:Ldxl;


# direct methods
.method public constructor <init>(Ldxl;Lcom/opera/api/Callback;)V
    .registers 5

    const/4 v0, 0x0

    const/16 v1, 0x8

    invoke-direct {p0, v0, p2, v1}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p1, p0, Lexl;->d:Ldxl;

    return-void
.end method


# virtual methods
.method public final cancel()V
    .registers 2

    invoke-super {p0}, Lmgh;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lexl;->d:Ldxl;

    return-void
.end method

.method public final run()V
    .registers 2

    iget-object v0, p0, Lexl;->d:Ldxl;

    if-eqz v0, :cond_d

    invoke-interface {v0}, Ldxl;->f()Lmgh;

    move-result-object v0

    iput-object v0, p0, Lmgh;->b:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lexl;->d:Ldxl;

    :cond_d
    return-void
.end method
