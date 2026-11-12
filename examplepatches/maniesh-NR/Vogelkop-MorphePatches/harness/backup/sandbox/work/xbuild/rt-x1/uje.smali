.class public final Luje;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lua7;


# direct methods
.method public constructor <init>(Lua7;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luje;->a:Lua7;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-object p0, p0, Luje;->a:Lua7;

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Lnwf;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0a013d

    if-ne p1, v0, :cond_11

    const/4 p1, 0x1

    goto :goto_12

    :cond_11
    const/4 p1, 0x0

    :goto_12
    new-instance v0, Lzp3;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, v1}, Lzp3;-><init>(Lt0h;ZB)V

    return-void
.end method

.method public final onLongClick(Landroid/view/View;)Z
    .registers 6

    iget-object p0, p0, Luje;->a:Lua7;

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Lnwf;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a013d

    const/4 v2, 0x1

    if-ne v0, v1, :cond_12

    move v0, v2

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    new-instance v1, Laq3;

    const/4 v3, 0x2

    invoke-direct {v1, p0, p1, v0, v3}, Laq3;-><init>(Lt0h;Ljava/lang/Object;ZB)V

    return v2
.end method
