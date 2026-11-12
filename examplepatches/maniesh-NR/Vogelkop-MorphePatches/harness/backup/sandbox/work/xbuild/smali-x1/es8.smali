.class public abstract Les8;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# static fields
.field public static e:Z


# instance fields
.field public final b:Lfr8;

.field public final c:Lds8;

.field public d:Lns8;


# direct methods
.method public constructor <init>(Lfr8;)V
    .registers 4

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    new-instance v0, Lds8;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lds8;-><init>(Les8;B)V

    iput-object v0, p0, Les8;->c:Lds8;

    iput-object p1, p0, Les8;->b:Lfr8;

    return-void
.end method


# virtual methods
.method public U(Ljava/lang/StringBuilder;)V
    .registers 3

    const/16 v0, 0x2f

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p0, p0, Les8;->d:Lns8;

    if-eqz p0, :cond_c

    const-string p0, "1"

    goto :goto_e

    :cond_c
    const-string p0, "0"

    :goto_e
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public V()V
    .registers 2

    iget-object v0, p0, Les8;->c:Lds8;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iget-object p0, p0, Les8;->b:Lfr8;

    iput-boolean v0, p0, Lfr8;->l:Z

    invoke-virtual {p0}, Lfr8;->s()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final X()V
    .registers 4

    iget-object v0, p0, Les8;->c:Lds8;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object v0, p0, Les8;->d:Lns8;

    if-eqz v0, :cond_17

    iget-boolean v1, v0, Lns8;->t:Z

    if-eqz v1, :cond_17

    iget-object v1, v0, Lns8;->q:Ljava/util/HashMap;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, p0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lns8;->U()V

    :cond_17
    return-void
.end method
