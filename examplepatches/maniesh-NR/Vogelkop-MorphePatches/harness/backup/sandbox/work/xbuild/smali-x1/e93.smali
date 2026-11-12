.class public abstract Le93;
.super Llj;
.source "SourceFile"


# virtual methods
.method public G0()I
    .registers 1

    const p0, 0x7f0d046b

    return p0
.end method

.method public H0(ILandroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 4

    invoke-virtual {p2, p1, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 4

    invoke-virtual {p0}, Le93;->G0()I

    move-result v0

    invoke-virtual {p0, v0, p1, p2}, Le93;->H0(ILandroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    return-void
.end method
