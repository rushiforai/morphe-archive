.class public final Ls2f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljjm;


# instance fields
.field public a:Lkjm;

.field public b:Z

.field public final c:Ljava/lang/String;

.field public final d:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls2f;->c:Ljava/lang/String;

    iput-boolean p2, p0, Ls2f;->d:Z

    return-void
.end method


# virtual methods
.method public final finish(Lhjm;)V
    .registers 3

    iget-boolean v0, p0, Ls2f;->b:Z

    if-nez v0, :cond_b

    const/4 v0, 0x1

    iput-boolean v0, p0, Ls2f;->b:Z

    iget-object v0, p0, Ls2f;->a:Lkjm;

    if-nez v0, :cond_c

    :cond_b
    return-void

    :cond_c
    invoke-interface {v0, p0, p1}, Lkjm;->o(Ljjm;Lhjm;)V

    return-void
.end method

.method public final setRequestDismisser(Lkjm;)V
    .registers 2

    iput-object p1, p0, Ls2f;->a:Lkjm;

    return-void
.end method
