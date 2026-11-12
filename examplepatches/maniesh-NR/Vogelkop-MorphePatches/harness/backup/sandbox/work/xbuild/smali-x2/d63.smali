.class public abstract Ld63;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lb87;


# instance fields
.field protected mDismissReason:Lhjm;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private mFinished:Z

.field private mRequestDismisser:Lkjm;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lhjm;->b:Lhjm;

    iput-object v0, p0, Ld63;->mDismissReason:Lhjm;

    return-void
.end method


# virtual methods
.method public final finish(Lhjm;)V
    .registers 3
    .param p1    # Lhjm;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-boolean v0, p0, Ld63;->mFinished:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Ld63;->mFinished:Z

    iput-object p1, p0, Ld63;->mDismissReason:Lhjm;

    iget-object v0, p0, Ld63;->mRequestDismisser:Lkjm;

    if-eqz v0, :cond_11

    invoke-interface {v0, p0, p1}, Lkjm;->o(Ljjm;Lhjm;)V

    :cond_11
    invoke-virtual {p0, p1}, Ld63;->onFinished(Lhjm;)V

    return-void
.end method

.method public isFinished()Z
    .registers 1

    iget-boolean p0, p0, Ld63;->mFinished:Z

    return p0
.end method

.method public onFinished(Lhjm;)V
    .registers 2
    .param p1    # Lhjm;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public final setRequestDismisser(Lkjm;)V
    .registers 2
    .param p1    # Lkjm;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Ld63;->mRequestDismisser:Lkjm;

    return-void
.end method
