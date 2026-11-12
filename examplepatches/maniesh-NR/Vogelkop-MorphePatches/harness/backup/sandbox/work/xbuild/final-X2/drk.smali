.class public final synthetic Ldrk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmrk;


# direct methods
.method public synthetic constructor <init>(Lmrk;B)V
    .registers 3

    iput-byte p2, p0, Ldrk;->a:B

    iput-object p1, p0, Ldrk;->b:Lmrk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Ldrk;->a:B

    iget-object p0, p0, Ldrk;->b:Lmrk;

    packed-switch v0, :pswitch_data_3c

    check-cast p1, Leri;

    iget-object p1, p0, Lmrk;->x:Lpde;

    invoke-virtual {p0}, Lmrk;->e()Lfyj;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :pswitch_13
    check-cast p1, Lhv7;

    invoke-virtual {p0}, Lmrk;->g()V

    return-void

    :pswitch_19
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_3a

    iget-boolean p1, p0, Lmrk;->T:Z

    if-nez p1, :cond_3a

    invoke-virtual {p0}, Lmrk;->c()Z

    move-result p1

    if-eqz p1, :cond_3a

    iget-object p1, p0, Lmrk;->H:Lxpm;

    iget-object p1, p1, Lxpm;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lmrk;->i(Ljava/lang/String;)V

    :cond_3a
    return-void

    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_19
        :pswitch_13
    .end packed-switch
.end method
