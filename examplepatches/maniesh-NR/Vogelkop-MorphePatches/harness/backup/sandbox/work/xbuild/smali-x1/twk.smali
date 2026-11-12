.class public final synthetic Ltwk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrwk;


# direct methods
.method public synthetic constructor <init>(Lrwk;B)V
    .registers 3

    iput-byte p2, p0, Ltwk;->a:B

    iput-object p1, p0, Ltwk;->b:Lrwk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Ltwk;->a:B

    iget-object p0, p0, Ltwk;->b:Lrwk;

    packed-switch p1, :pswitch_data_14

    iget-object p0, p0, Lrwk;->g:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_d
    iget-object p0, p0, Lrwk;->f:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
