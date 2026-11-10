.class public final Lh/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lh/g;

.field public final synthetic b:Lh/p;

.field public final synthetic c:Lh/n;

.field public final synthetic d:LC/j;


# direct methods
.method public constructor <init>(LC/j;Lh/g;Lh/p;Lh/n;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh/f;->d:LC/j;

    iput-object p2, p0, Lh/f;->a:Lh/g;

    iput-object p3, p0, Lh/f;->b:Lh/p;

    iput-object p4, p0, Lh/f;->c:Lh/n;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lh/f;->a:Lh/g;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lh/f;->d:LC/j;

    iget-object v2, v1, LC/j;->b:Ljava/lang/Object;

    check-cast v2, Lh/h;

    const/4 v3, 0x1

    iput-boolean v3, v2, Lh/h;->z:Z

    iget-object v0, v0, Lh/g;->b:Lh/n;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lh/n;->c(Z)V

    iget-object v0, v1, LC/j;->b:Ljava/lang/Object;

    check-cast v0, Lh/h;

    iput-boolean v2, v0, Lh/h;->z:Z

    :cond_0
    iget-object v0, p0, Lh/f;->b:Lh/p;

    invoke-virtual {v0}, Lh/p;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lh/p;->hasSubMenu()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lh/f;->c:Lh/n;

    const/4 v2, 0x4

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3, v2}, Lh/n;->q(Landroid/view/MenuItem;Lh/z;I)Z

    :cond_1
    return-void
.end method
