.class public abstract Li93;
.super Llj;
.source "SourceFile"

# interfaces
.implements Lon9;


# instance fields
.field public final r:Z

.field public final s:Lrn9;


# direct methods
.method public constructor <init>(I)V
    .registers 4

    const/4 v0, 0x0

    const/16 v1, 0xe

    .line 27
    invoke-direct {p0, p1, v0, v1}, Li93;-><init>(III)V

    return-void
.end method

.method public constructor <init>(II)V
    .registers 4

    const/16 v0, 0x8

    .line 26
    invoke-direct {p0, p1, p2, v0}, Li93;-><init>(III)V

    return-void
.end method

.method public synthetic constructor <init>(III)V
    .registers 5

    and-int/lit8 v0, p3, 0x2

    if-eqz v0, :cond_7

    const p2, 0x7f10000d

    :cond_7
    and-int/lit8 v0, p3, 0x4

    if-eqz v0, :cond_e

    sget v0, Lfki;->a:I

    goto :goto_f

    :cond_e
    const/4 v0, 0x2

    :goto_f
    and-int/lit8 p3, p3, 0x8

    if-eqz p3, :cond_15

    const/4 p3, 0x1

    goto :goto_16

    :cond_15
    const/4 p3, 0x0

    :goto_16
    invoke-direct {p0, p1, p2, v0, p3}, Li93;-><init>(IIIZ)V

    return-void
.end method

.method public constructor <init>(IIIZ)V
    .registers 5

    .line 28
    invoke-static {p3}, Lu7k;->f(I)Lu7k;

    move-result-object p3

    .line 29
    invoke-virtual {p3, p1}, Lu7k;->s(I)V

    .line 30
    iget-object p1, p3, Lu7k;->a:Ljava/lang/Object;

    check-cast p1, Litl;

    iput p2, p1, Litl;->b:I

    .line 31
    invoke-direct {p0, p1, p4}, Li93;-><init>(Litl;Z)V

    return-void
.end method

.method public constructor <init>(Litl;Z)V
    .registers 3

    .line 32
    invoke-direct {p0, p1}, Lltl;-><init>(Litl;)V

    .line 33
    iput-boolean p2, p0, Li93;->r:Z

    .line 34
    new-instance p1, Lrn9;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p0, p2}, Lrn9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p1, p0, Li93;->s:Lrn9;

    return-void
.end method


# virtual methods
.method public G0()Lh93;
    .registers 1

    sget-object p0, Lulp;->b:Lulp;

    return-object p0
.end method

.method public final H()Lqe6;
    .registers 1

    iget-object p0, p0, Lltl;->j:Lqe6;

    return-object p0
.end method

.method public a()Loba;
    .registers 7

    instance-of v0, p0, Lo37;

    if-eqz v0, :cond_1a

    move-object v0, p0

    check-cast v0, Lo37;

    invoke-interface {v0}, Lo37;->r()Lua7;

    move-result-object v0

    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object v0

    instance-of v1, v0, Lpn9;

    if-eqz v1, :cond_1a

    check-cast v0, Lpn9;

    invoke-interface {v0}, Lpn9;->a()Loba;

    move-result-object p0

    return-object p0

    :cond_1a
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p0

    const/4 v0, 0x0

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-nez p0, :cond_29

    new-instance p0, Loba;

    invoke-direct {p0, v1, v0, v2}, Loba;-><init>(II[I)V

    return-object p0

    :cond_29
    const-string v3, "highlights"

    invoke-virtual {p0, v3}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_39

    invoke-virtual {p0, v3}, Landroid/os/BaseBundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v4

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    goto :goto_3a

    :cond_39
    move-object v4, v2

    :goto_3a
    const-string v3, "highlight_scroll_to_view_behavior"

    invoke-virtual {p0, v3}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4e

    invoke-virtual {p0, v3, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    goto :goto_4f

    :cond_4e
    move-object v5, v2

    :goto_4f
    if-eqz v5, :cond_56

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result p0

    goto :goto_57

    :cond_56
    move p0, v1

    :goto_57
    if-nez v4, :cond_5f

    new-instance p0, Loba;

    invoke-direct {p0, v1, v0, v2}, Loba;-><init>(II[I)V

    return-object p0

    :cond_5f
    new-instance v0, Loba;

    invoke-direct {v0, v4, p0}, Loba;-><init>([II)V

    return-object v0
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 3

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a0932

    if-ne p1, v0, :cond_12

    invoke-virtual {p0}, Li93;->G0()Lh93;

    move-result-object p0

    invoke-interface {p0}, Lh93;->s()V

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-boolean p1, p0, Li93;->r:Z

    if-eqz p1, :cond_c

    iget-object p0, p0, Li93;->s:Lrn9;

    invoke-virtual {p0}, Lrn9;->F()V

    :cond_c
    return-void
.end method
