.class public final synthetic Lo99;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lp99;


# direct methods
.method public synthetic constructor <init>(Lp99;B)V
    .registers 3

    iput-byte p2, p0, Lo99;->a:B

    iput-object p1, p0, Lo99;->b:Lp99;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lo99;->a:B

    iget-object p0, p0, Lo99;->b:Lp99;

    packed-switch p1, :pswitch_data_10

    invoke-virtual {p0}, Lp99;->y0()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Lp99;->y0()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
