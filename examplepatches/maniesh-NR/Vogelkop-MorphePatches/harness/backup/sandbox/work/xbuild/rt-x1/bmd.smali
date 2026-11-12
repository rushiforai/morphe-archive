.class public final synthetic Lbmd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lbmd;->a:B

    iput-object p1, p0, Lbmd;->b:Ljava/lang/Object;

    iput-object p2, p0, Lbmd;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 6

    iget-byte v0, p0, Lbmd;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lbmd;->c:Ljava/lang/Object;

    iget-object p0, p0, Lbmd;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3c

    check-cast p0, Laoo;

    check-cast v2, Landroid/view/GestureDetector;

    invoke-virtual {p0, p1, p2}, Laoo;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    invoke-virtual {v2, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    return v1

    :pswitch_15
    check-cast p0, Landroid/view/ScaleGestureDetector;

    check-cast v2, Landroid/view/GestureDetector;

    invoke-virtual {p0, p2}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    invoke-virtual {v2, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    or-int/2addr p0, p1

    return p0

    :pswitch_23
    check-cast p0, Lcmd;

    check-cast v2, Lz0c;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_3b

    iget-object p1, v2, Lz0c;->b:Ljava/lang/Object;

    check-cast p1, Lnvk;

    iget-object p2, v2, Lz0c;->c:Ljava/lang/Object;

    check-cast p2, Lflb;

    const/4 v1, 0x1

    iput-boolean v1, p1, Lnvk;->t:Z

    invoke-virtual {p2, p0}, Lflb;->s(Landroidx/recyclerview/widget/i;)V

    :cond_3b
    return v1

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_23
        :pswitch_15
    .end packed-switch
.end method
