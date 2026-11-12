.class public final synthetic Lm9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw73;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lndc;


# direct methods
.method public synthetic constructor <init>(Lndc;B)V
    .registers 3

    iput-byte p2, p0, Lm9;->a:B

    iput-object p1, p0, Lm9;->b:Lndc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;FZ)V
    .registers 5

    iget-byte v0, p0, Lm9;->a:B

    iget-object p0, p0, Lm9;->b:Lndc;

    check-cast p1, Lcom/google/android/material/slider/Slider;

    packed-switch v0, :pswitch_data_46

    check-cast p0, Lywf;

    if-eqz p3, :cond_1f

    iget-boolean p1, p0, Lywf;->g:Z

    if-nez p1, :cond_1f

    float-to-int p1, p2

    invoke-static {p1}, Loup;->n0(I)D

    move-result-wide p2

    invoke-virtual {p0, p2, p3}, Lywf;->d(D)V

    invoke-virtual {p0, p1}, Lywf;->k(I)V

    invoke-virtual {p0, p1}, Lywf;->j(I)V

    :cond_1f
    return-void

    :pswitch_20
    check-cast p0, Lp9;

    if-eqz p3, :cond_45

    invoke-virtual {p0}, Lp9;->I0()Lt9;

    move-result-object p0

    float-to-int p1, p2

    iget-object p2, p0, Lt9;->e:Lode;

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lr9;

    if-eqz p3, :cond_41

    invoke-virtual {p0, p1}, Lt9;->g(I)Lndo;

    move-result-object p0

    iget-boolean p1, p3, Lr9;->b:Z

    iget p3, p3, Lr9;->c:I

    new-instance v0, Lr9;

    invoke-direct {v0, p0, p1, p3}, Lr9;-><init>(Lndo;ZI)V

    goto :goto_42

    :cond_41
    const/4 v0, 0x0

    :goto_42
    invoke-virtual {p2, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_45
    return-void

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_20
    .end packed-switch
.end method
