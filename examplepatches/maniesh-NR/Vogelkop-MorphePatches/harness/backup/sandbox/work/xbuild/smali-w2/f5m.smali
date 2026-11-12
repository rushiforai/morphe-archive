.class public final synthetic Lf5m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lh5m;


# direct methods
.method public synthetic constructor <init>(Lh5m;B)V
    .registers 3

    iput-byte p2, p0, Lf5m;->a:B

    iput-object p1, p0, Lf5m;->b:Lh5m;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 8

    iget-byte v0, p0, Lf5m;->a:B

    iget-object p0, p0, Lf5m;->b:Lh5m;

    packed-switch v0, :pswitch_data_64

    check-cast p1, Ld5m;

    iget-object v0, p1, Ld5m;->a:Lc5m;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_17

    if-ne v0, v1, :cond_50

    check-cast p1, Lb5m;

    goto :goto_50

    :cond_17
    check-cast p1, La5m;

    iget-byte p1, p1, La5m;->b:B

    if-eq p1, v1, :cond_24

    const/4 v0, 0x6

    if-eq p1, v0, :cond_24

    const p1, 0x7f1404e3

    goto :goto_27

    :cond_24
    const p1, 0x7f140749

    :goto_27
    iget-object v0, p0, Lh5m;->b:Lghf;

    new-instance v2, Lg5m;

    invoke-direct {v2, p0, v1}, Lg5m;-><init>(Lh5m;B)V

    iget-object v3, v0, Lghf;->d:Ljava/lang/Object;

    check-cast v3, Landroid/content/res/Resources;

    invoke-virtual {v3, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v3, v0, Lghf;->b:Ljava/lang/Object;

    check-cast v3, Lk6l;

    iget-object v3, v3, Lk6l;->o:Lb2l;

    if-eqz v3, :cond_4d

    new-instance v4, Lc4m;

    const v5, 0x7f140ebc

    invoke-direct {v4, v0, p1, v5, v2}, Lc4m;-><init>(Lghf;Ljava/lang/String;ILandroid/view/View$OnClickListener;)V

    iget-object p1, v0, Lghf;->c:Ljava/lang/Object;

    check-cast p1, Laal;

    invoke-virtual {p1, v4, v3, v1}, Laal;->S(Lo93;Lb2l;Z)V

    :cond_4d
    invoke-virtual {p0}, Lh5m;->a()V

    :cond_50
    :goto_50
    return-void

    :pswitch_51
    check-cast p1, Lj5m;

    iget-object v0, p0, Lh5m;->g:Lj5m;

    if-eqz v0, :cond_5c

    iget-object v0, v0, Lj5m;->d:Lkze;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    :cond_5c
    iput-object p1, p0, Lh5m;->g:Lj5m;

    iget-object p1, p1, Lj5m;->d:Lkze;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_51
    .end packed-switch
.end method
