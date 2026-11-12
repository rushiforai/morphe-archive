.class public final Lma3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lma3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 4

    iget-byte p0, p0, Lma3;->a:B

    const/4 v0, 0x1

    packed-switch p0, :pswitch_data_12

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p0

    if-ne p0, v0, :cond_f

    invoke-static {p1}, Lq9n;->u(Landroid/view/View;)Z

    :cond_f
    const/4 p0, 0x0

    return p0

    :pswitch_11
    return v0

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_11
        :pswitch_11
    .end packed-switch
.end method
