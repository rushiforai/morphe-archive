.class public final synthetic Leal;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lfal;


# direct methods
.method public synthetic constructor <init>(Lfal;B)V
    .registers 3

    iput-byte p2, p0, Leal;->a:B

    iput-object p1, p0, Leal;->b:Lfal;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 3

    iget-byte p1, p0, Leal;->a:B

    iget-object p0, p0, Leal;->b:Lfal;

    packed-switch p1, :pswitch_data_16

    iget-object p0, p0, Lfal;->c:Lqvk;

    invoke-virtual {p0, p2}, Lqvk;->a(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    :pswitch_e
    iget-object p0, p0, Lfal;->c:Lqvk;

    invoke-virtual {p0, p2}, Lqvk;->a(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
