.class public final Ljcj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljjm;


# instance fields
.field public final a:Ldcj;

.field public b:Lkjm;

.field public c:Z

.field public d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ldcj;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljcj;->a:Ldcj;

    return-void
.end method


# virtual methods
.method public final finish(Lhjm;)V
    .registers 4

    iget-boolean v0, p0, Ljcj;->c:Z

    if-nez v0, :cond_17

    const/4 v0, 0x1

    iput-boolean v0, p0, Ljcj;->c:Z

    iget-object v0, p0, Ljcj;->a:Ldcj;

    if-eqz v0, :cond_10

    iget-object v1, p0, Ljcj;->d:Ljava/lang/String;

    invoke-interface {v0, p0, v1}, Ldcj;->b(Ljjm;Ljava/lang/String;)V

    :cond_10
    iget-object v0, p0, Ljcj;->b:Lkjm;

    if-eqz v0, :cond_17

    invoke-interface {v0, p0, p1}, Lkjm;->o(Ljjm;Lhjm;)V

    :cond_17
    return-void
.end method

.method public final setRequestDismisser(Lkjm;)V
    .registers 2

    iput-object p1, p0, Ljcj;->b:Lkjm;

    return-void
.end method
