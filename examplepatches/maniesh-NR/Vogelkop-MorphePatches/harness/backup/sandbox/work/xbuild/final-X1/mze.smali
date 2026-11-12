.class public final synthetic Lmze;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhv3;


# direct methods
.method public synthetic constructor <init>(Lhv3;B)V
    .registers 3

    iput-byte p2, p0, Lmze;->a:B

    iput-object p1, p0, Lmze;->b:Lhv3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lmze;->a:B

    iget-object p0, p0, Lmze;->b:Lhv3;

    packed-switch p1, :pswitch_data_26

    sget-object p1, Lhbf;->a:Lhbf;

    invoke-virtual {p0, p1}, Lhv3;->b(Lhbf;)V

    return-void

    :pswitch_d
    sget-object p1, Lhbf;->a:Lhbf;

    invoke-virtual {p0, p1}, Lhv3;->b(Lhbf;)V

    return-void

    :pswitch_13
    sget-object p1, Lhbf;->a:Lhbf;

    invoke-virtual {p0, p1}, Lhv3;->b(Lhbf;)V

    return-void

    :pswitch_19
    sget-object p1, Lhbf;->a:Lhbf;

    invoke-virtual {p0, p1}, Lhv3;->b(Lhbf;)V

    return-void

    :pswitch_1f
    sget-object p1, Lhbf;->a:Lhbf;

    invoke-virtual {p0, p1}, Lhv3;->b(Lhbf;)V

    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_19
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
