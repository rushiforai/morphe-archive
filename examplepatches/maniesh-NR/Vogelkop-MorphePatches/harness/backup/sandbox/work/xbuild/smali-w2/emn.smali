.class public final synthetic Lemn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljmn;


# direct methods
.method public synthetic constructor <init>(Ljmn;B)V
    .registers 3

    iput-byte p2, p0, Lemn;->a:B

    iput-object p1, p0, Lemn;->b:Ljmn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lemn;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lemn;->b:Ljmn;

    packed-switch v0, :pswitch_data_2a

    iput-boolean v2, p0, Ljmn;->D:Z

    return-void

    :pswitch_c
    invoke-virtual {p0}, Ljmn;->O0()V

    return-void

    :pswitch_10
    iput-boolean v1, p0, Ljmn;->D:Z

    iget-object p0, p0, Ljmn;->z:Lkmn;

    iget-object p0, p0, Lkmn;->i:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_1c
    const/16 v0, 0xfa

    invoke-virtual {p0, v1, v0}, Ljmn;->G0(II)V

    iget-object p0, p0, Ljmn;->s:Lonn;

    iget-object p0, p0, Lonn;->h:Lnnn;

    if-eqz p0, :cond_29

    iput-boolean v2, p0, Lnnn;->b:Z

    :cond_29
    return-void

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_10
        :pswitch_c
    .end packed-switch
.end method
