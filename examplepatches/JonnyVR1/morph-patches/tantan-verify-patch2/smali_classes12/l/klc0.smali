.class public abstract Ll/klc0;
.super Ll/eli0;
.source "SourceFile"


# instance fields
.field protected B:Ll/bkm;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eli0;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Ll/qt2;->D(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public abstract G0(Z)V
.end method

.method public abstract H0(I)V
.end method

.method public I0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/eli0;->s0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J0(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x6

    .line 2
    invoke-virtual {p0, v0, p1}, Ll/eli0;->p0(II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/klc0;->B:Ll/bkm;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/bkm;->e()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/klc0;->B:Ll/bkm;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/eli0;->C0(Ll/bkm;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public l(Landroid/os/Message;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/qt2;->l(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Landroid/os/Message;->what:I

    .line 5
    .line 6
    const/4 v1, 0x6

    .line 7
    if-eq v0, v1, :cond_1

    .line 8
    .line 9
    const/4 v1, 0x7

    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/klc0;->H0(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    if-ne p1, v0, :cond_2

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_2
    const/4 v0, 0x0

    .line 26
    :goto_0
    invoke-virtual {p0, v0}, Ll/klc0;->G0(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public x0(I)V
    .locals 1

    .line 1
    const/4 v0, 0x7

    .line 2
    invoke-virtual {p0, v0, p1}, Ll/eli0;->p0(II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public y(Ll/crf0;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/eli0;->y(Ll/crf0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/klc0;->B:Ll/bkm;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/bkm;->n(Ll/crf0;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
