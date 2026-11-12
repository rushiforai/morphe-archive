.class public final synthetic Lt65;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx65;


# direct methods
.method public synthetic constructor <init>(Lx65;B)V
    .registers 3

    iput-byte p2, p0, Lt65;->a:B

    iput-object p1, p0, Lt65;->b:Lx65;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lt65;->a:B

    iget-object p0, p0, Lt65;->b:Lx65;

    packed-switch p1, :pswitch_data_12

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lx65;->o0(Z)V

    return-void

    :pswitch_c
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lx65;->o0(Z)V

    return-void

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
