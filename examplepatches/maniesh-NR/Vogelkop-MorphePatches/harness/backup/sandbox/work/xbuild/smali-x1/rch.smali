.class public final Lrch;
.super Ler8;
.source "SourceFile"


# instance fields
.field public final B:Lskm;

.field public final C:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lskm;Ltta;Lvr8;)V
    .registers 6

    const/4 v0, 0x0

    invoke-direct {p0, p1, p3, p4, v0}, Ler8;-><init>(Landroid/content/Context;Ltta;Lvr8;Lzzj;)V

    iput-object p2, p0, Lrch;->B:Lskm;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lnr8;->e(Landroid/content/Context;)I

    move-result p1

    iput p1, p0, Lrch;->C:I

    return-void
.end method


# virtual methods
.method public final k()I
    .registers 1

    iget p0, p0, Lrch;->C:I

    return p0
.end method

.method public final u(Ljava/lang/String;)Lvmj;
    .registers 10

    sget v0, Lvmj;->g:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v6, Lna5;->d:Lna5;

    const/4 v7, 0x1

    sget-object v3, Lumj;->b:Lumj;

    iget v4, p0, Lfr8;->c:I

    move v5, v4

    move-object v2, p1

    invoke-static/range {v1 .. v7}, Ltmj;->l(Landroid/content/Context;Ljava/lang/String;Lumj;IILna5;Z)Lvmj;

    move-result-object p0

    return-object p0
.end method

.method public final w()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Ler8;->s:Lhq8;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lhq8;->h()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    if-eqz v0, :cond_19

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_19

    const/4 p0, 0x0

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_19
    invoke-super {p0}, Ler8;->w()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final y()V
    .registers 8

    iget-object v0, p0, Ler8;->s:Lhq8;

    instance-of v1, v0, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    if-eqz v1, :cond_16

    check-cast v0, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    iget-object v2, v0, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    invoke-static {v0}, Lsfe;->W(Lhq8;)Lfr;

    move-result-object v3

    const-wide/16 v4, 0x0

    const/4 v6, 0x6

    iget-object v1, p0, Lrch;->B:Lskm;

    invoke-static/range {v1 .. v6}, Lsfe;->u0(Lskm;Ltqi;Lfr;JI)V

    :cond_16
    return-void
.end method
