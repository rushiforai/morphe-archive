.class public final synthetic Lg5m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lh5m;


# direct methods
.method public synthetic constructor <init>(Lh5m;B)V
    .registers 3

    iput-byte p2, p0, Lg5m;->a:B

    iput-object p1, p0, Lg5m;->b:Lh5m;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lg5m;->a:B

    iget-object p0, p0, Lg5m;->b:Lh5m;

    packed-switch p1, :pswitch_data_14

    iget-object p0, p0, Lh5m;->d:Lo4m;

    invoke-virtual {p0}, Lo4m;->run()V

    return-void

    :pswitch_d
    iget-object p0, p0, Lh5m;->d:Lo4m;

    invoke-virtual {p0}, Lo4m;->run()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
