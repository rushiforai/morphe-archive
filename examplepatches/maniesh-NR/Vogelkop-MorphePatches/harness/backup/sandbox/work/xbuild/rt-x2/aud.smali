.class public final Laud;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lptb;


# instance fields
.field public a:I

.field final synthetic b:Landroid/view/Menu;


# direct methods
.method public constructor <init>(Litd;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laud;->b:Landroid/view/Menu;

    return-void
.end method


# virtual methods
.method public final hasNext()Z
    .registers 2

    iget v0, p0, Laud;->a:I

    iget-object p0, p0, Laud;->b:Landroid/view/Menu;

    invoke-interface {p0}, Landroid/view/Menu;->size()I

    move-result p0

    if-ge v0, p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public final next()Ljava/lang/Object;
    .registers 4

    iget-object v0, p0, Laud;->b:Landroid/view/Menu;

    iget v1, p0, Laud;->a:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Laud;->a:I

    invoke-interface {v0, v1}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object p0

    if-eqz p0, :cond_f

    return-object p0

    :cond_f
    invoke-static {}, Lt3p;->t()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final remove()V
    .registers 3

    iget-object v0, p0, Laud;->b:Landroid/view/Menu;

    iget v1, p0, Laud;->a:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Laud;->a:I

    invoke-interface {v0, v1}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object p0

    if-eqz p0, :cond_16

    invoke-interface {p0}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    invoke-interface {v0, p0}, Landroid/view/Menu;->removeItem(I)V

    return-void

    :cond_16
    invoke-static {}, Lt3p;->t()V

    return-void
.end method
