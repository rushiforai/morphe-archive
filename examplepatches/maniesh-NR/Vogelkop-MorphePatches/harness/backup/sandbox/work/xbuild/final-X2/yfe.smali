.class public final Lyfe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmb9;


# instance fields
.field public final synthetic a:Lfge;


# direct methods
.method public constructor <init>(Lfge;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyfe;->a:Lfge;

    return-void
.end method


# virtual methods
.method public final f(II)V
    .registers 3

    iget-object p0, p0, Lyfe;->a:Lfge;

    iget-object p1, p0, Lfge;->K:Landroid/view/MenuItem;

    iget-object p0, p0, Lfge;->x:Lrc9;

    iget-object p0, p0, Lrc9;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-lez p0, :cond_10

    const/4 p0, 0x1

    goto :goto_11

    :cond_10
    const/4 p0, 0x0

    :goto_11
    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public final h(II)V
    .registers 3

    iget-object p0, p0, Lyfe;->a:Lfge;

    iget-object p1, p0, Lfge;->K:Landroid/view/MenuItem;

    iget-object p0, p0, Lfge;->x:Lrc9;

    iget-object p0, p0, Lrc9;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-lez p0, :cond_10

    const/4 p0, 0x1

    goto :goto_11

    :cond_10
    const/4 p0, 0x0

    :goto_11
    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public final m(I)V
    .registers 2

    return-void
.end method
