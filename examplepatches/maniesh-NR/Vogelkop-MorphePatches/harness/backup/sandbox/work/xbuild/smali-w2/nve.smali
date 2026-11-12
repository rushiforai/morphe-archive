.class public final Lnve;
.super Luue;
.source "SourceFile"


# instance fields
.field public final p:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;Lmve;Lrl3;Lp0c;)V
    .registers 5

    invoke-direct {p0, p1, p2, p3, p4}, Luue;-><init>(Landroid/view/View;Lr9i;Lrl3;Lp0c;)V

    const p2, 0x7f0a0467

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lnve;->p:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 7

    invoke-super {p0, p1, p2}, Lgu8;->V(Lja2;Z)V

    if-eqz p2, :cond_6

    return-void

    :cond_6
    iget-object p1, p0, Lgu8;->d:Lr9i;

    check-cast p1, Lmve;

    invoke-virtual {p0}, Luue;->m0()Lmsh;

    move-result-object p2

    iget-byte p1, p1, Lmve;->h:B

    packed-switch p1, :pswitch_data_66

    check-cast p2, Lure;

    iget p1, p2, Lure;->G:I

    goto :goto_20

    :pswitch_18
    check-cast p2, Ldre;

    iget-object p1, p2, Ldre;->D:Llog;

    iget-object p1, p1, Llog;->e:Lkog;

    iget p1, p1, Lkog;->c:I

    :goto_20
    div-int/lit16 p2, p1, 0xe10

    mul-int/lit16 v0, p2, 0xe10

    sub-int/2addr p1, v0

    div-int/lit8 v0, p1, 0x3c

    mul-int/lit8 v1, v0, 0x3c

    sub-int/2addr p1, v1

    if-lez p2, :cond_2f

    const-string v1, "%02d"

    goto :goto_31

    :cond_2f
    const-string v1, "%d"

    :goto_31
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    const-string v3, ":%02d"

    invoke-virtual {v1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {v0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v2, v1, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    if-lez p2, :cond_5f

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    filled-new-array {p2, p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string p2, "%d:%s"

    invoke-static {v0, p2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :cond_5f
    iget-object p0, p0, Lnve;->p:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    nop

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method

.method public final u0()Lr9i;
    .registers 1

    iget-object p0, p0, Lgu8;->d:Lr9i;

    check-cast p0, Lmve;

    return-object p0
.end method
