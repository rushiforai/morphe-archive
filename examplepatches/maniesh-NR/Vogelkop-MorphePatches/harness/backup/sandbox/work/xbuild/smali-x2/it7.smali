.class public final Lit7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lit7;->a:B

    iput-object p1, p0, Lit7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lfya;)V
    .registers 5

    iget-byte v0, p0, Lit7;->a:B

    iget-object p0, p0, Lit7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_30

    check-cast p0, Llxa;

    iget-object v0, p0, Llxa;->s:Lzba;

    new-instance v1, Lxba;

    sget-object v2, Lwba;->a:Lwba;

    invoke-direct {v1, v2, p1}, Lxba;-><init>(Lwba;Landroid/os/Parcelable;)V

    invoke-virtual {v0, v1}, Lzba;->a(Lxba;)V

    invoke-virtual {p0}, Llxa;->h()V

    return-void

    :pswitch_19
    check-cast p0, Lcom/opera/hype/image/editor/EditImage;

    instance-of v0, p1, Lba3;

    if-eqz v0, :cond_2c

    check-cast p1, Lba3;

    sget-object v0, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    invoke-virtual {p0, p1}, Lcom/opera/hype/image/editor/EditImage;->e(Lba3;)Lbfl;

    move-result-object v0

    if-nez v0, :cond_2c

    invoke-virtual {p0, p1}, Lcom/opera/hype/image/editor/EditImage;->b(Lba3;)Lbfl;

    :cond_2c
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method

.method public final b(Lcya;)V
    .registers 5

    iget-byte v0, p0, Lit7;->a:B

    iget-object p0, p0, Lit7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_4a

    check-cast p0, Llxa;

    iget-object v0, p0, Llxa;->s:Lzba;

    new-instance v1, Lxba;

    sget-object v2, Lwba;->c:Lwba;

    invoke-direct {v1, v2, p1}, Lxba;-><init>(Lwba;Landroid/os/Parcelable;)V

    invoke-virtual {v0, v1}, Lzba;->a(Lxba;)V

    invoke-virtual {p0}, Llxa;->h()V

    return-void

    :pswitch_19
    check-cast p0, Lcom/opera/hype/image/editor/EditImage;

    iget-object p1, p1, Lcya;->a:Lfya;

    instance-of v0, p1, Lba3;

    if-eqz v0, :cond_45

    check-cast p1, Lba3;

    sget-object v0, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    invoke-virtual {p0, p1}, Lcom/opera/hype/image/editor/EditImage;->e(Lba3;)Lbfl;

    move-result-object v0

    if-eqz v0, :cond_45

    iget-object v1, v0, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    invoke-virtual {p1, v1}, Lba3;->h(Lcom/opera/hype/image/editor/TextBoxEditText;)V

    iget-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->g:Lbpd;

    iget-object v1, p1, Lbpd;->c:Ljava/lang/Object;

    check-cast v1, Li97;

    iget-object p1, p1, Lbpd;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {v1, p1}, Li97;->c(Lcom/opera/hype/image/editor/EditImage;)Z

    move-result p1

    if-eqz p1, :cond_45

    sget-object p1, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    invoke-virtual {v0, v1}, Lbfl;->d(Li97;)V

    :cond_45
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method

.method public final c(Lfya;)V
    .registers 5

    iget-byte v0, p0, Lit7;->a:B

    iget-object p0, p0, Lit7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2a

    check-cast p0, Llxa;

    iget-object v0, p0, Llxa;->s:Lzba;

    new-instance v1, Lxba;

    sget-object v2, Lwba;->b:Lwba;

    invoke-direct {v1, v2, p1}, Lxba;-><init>(Lwba;Landroid/os/Parcelable;)V

    invoke-virtual {v0, v1}, Lzba;->a(Lxba;)V

    invoke-virtual {p0}, Llxa;->h()V

    return-void

    :pswitch_19
    check-cast p0, Lcom/opera/hype/image/editor/EditImage;

    instance-of v0, p1, Lba3;

    if-eqz v0, :cond_26

    check-cast p1, Lba3;

    sget-object v0, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    invoke-virtual {p0, p1}, Lcom/opera/hype/image/editor/EditImage;->h(Lba3;)V

    :cond_26
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method
