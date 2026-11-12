.class public final synthetic Lb35;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Le35;


# direct methods
.method public synthetic constructor <init>(Le35;B)V
    .registers 3

    iput-byte p2, p0, Lb35;->a:B

    iput-object p1, p0, Lb35;->b:Le35;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lb35;->a:B

    iget-object p0, p0, Lb35;->b:Le35;

    packed-switch p1, :pswitch_data_1a

    invoke-virtual {p0}, Le35;->J0()V

    return-void

    :pswitch_b
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Le35;->l0(Z)V

    return-void

    :pswitch_10
    new-instance p1, Ld35;

    invoke-direct {p1, p0}, Ld35;-><init>(Le35;)V

    invoke-virtual {p1}, Ld35;->run()V

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_10
        :pswitch_b
    .end packed-switch
.end method
