.class public final synthetic Lark;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmrk;


# direct methods
.method public synthetic constructor <init>(Lmrk;B)V
    .registers 3

    iput-byte p2, p0, Lark;->a:B

    iput-object p1, p0, Lark;->b:Lmrk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lark;->a:B

    iget-object p0, p0, Lark;->b:Lmrk;

    packed-switch p1, :pswitch_data_10

    invoke-virtual {p0}, Lmrk;->b()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Lmrk;->b()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
