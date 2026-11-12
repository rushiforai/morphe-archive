.class public abstract Lhji;
.super Lcej;
.source "SourceFile"


# virtual methods
.method public final createSheetHost(Landroid/content/Context;)Lmej;
    .registers 3

    new-instance p0, Lwq3;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lwq3;-><init>(Landroid/content/Context;B)V

    iget-object p1, p0, Lvq3;->a:Lz46;

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    return-object p0
.end method
