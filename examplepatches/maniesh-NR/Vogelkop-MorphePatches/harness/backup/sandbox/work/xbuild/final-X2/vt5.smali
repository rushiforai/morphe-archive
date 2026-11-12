.class public final Lvt5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkz3;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ll53;


# direct methods
.method public synthetic constructor <init>(Ll53;B)V
    .registers 3

    iput-byte p2, p0, Lvt5;->a:B

    iput-object p1, p0, Lvt5;->b:Ll53;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Llz3;)V
    .registers 3

    iget-byte p1, p0, Lvt5;->a:B

    const/4 v0, 0x1

    iget-object p0, p0, Lvt5;->b:Ll53;

    packed-switch p1, :pswitch_data_24

    check-cast p0, Lioc;

    iget-object p0, p0, Lioc;->d:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    if-eqz p0, :cond_15

    invoke-interface {p0, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_15
    return-void

    :pswitch_16
    check-cast p0, Lwt5;

    iget-object p0, p0, Lwt5;->c:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    if-eqz p0, :cond_23

    invoke-interface {p0, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_23
    return-void

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
