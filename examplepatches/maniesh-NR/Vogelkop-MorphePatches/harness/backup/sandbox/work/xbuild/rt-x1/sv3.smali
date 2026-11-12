.class public final Lsv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liq9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lsv3;->a:B

    iput-object p1, p0, Lsv3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Z)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final F(ZZ)V
    .registers 3

    iget-byte p2, p0, Lsv3;->a:B

    iget-object p0, p0, Lsv3;->b:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_36

    check-cast p0, Lcom/opera/android/browser/BrowserFragment;

    invoke-virtual {p0}, Lcom/opera/android/browser/BrowserFragment;->k0()V

    return-void

    :pswitch_d
    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget p2, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p2

    if-eqz p2, :cond_2b

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    if-nez p0, :cond_1c

    const/4 p0, 0x0

    :cond_1c
    iget-boolean p2, p0, Lcom/opera/android/RootView;->m:Z

    if-eq p1, p2, :cond_2b

    iput-boolean p1, p0, Lcom/opera/android/RootView;->m:Z

    invoke-virtual {p0}, Lcom/opera/android/RootView;->f()V

    invoke-virtual {p0}, Lcom/opera/android/RootView;->requestLayout()V

    invoke-virtual {p0}, Landroid/view/View;->requestApplyInsets()V

    :cond_2b
    return-void

    :pswitch_2c
    check-cast p0, Lcom/opera/android/browser/BrowserContainer;

    const/4 p2, 0x4

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/browser/BrowserContainer;->e(IZ)V

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_2c
        :pswitch_d
    .end packed-switch
.end method

.method public final P(Z)V
    .registers 3

    iget-byte v0, p0, Lsv3;->a:B

    iget-object p0, p0, Lsv3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_18

    check-cast p0, Lcom/opera/android/browser/BrowserFragment;

    invoke-virtual {p0}, Lcom/opera/android/browser/BrowserFragment;->k0()V

    :pswitch_c
    return-void

    :pswitch_d
    check-cast p0, Lcom/opera/android/browser/BrowserContainer;

    const/4 v0, 0x2

    invoke-virtual {p0, v0, p1}, Lcom/opera/android/browser/BrowserContainer;->e(IZ)V

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
    .end packed-switch
.end method
