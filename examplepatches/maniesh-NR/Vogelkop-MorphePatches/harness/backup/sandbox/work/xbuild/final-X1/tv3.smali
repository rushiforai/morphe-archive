.class public final Ltv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Livj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ltv3;->a:B

    iput-object p1, p0, Ltv3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-byte v0, p0, Ltv3;->a:B

    iget-object p0, p0, Ltv3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_22

    check-cast p0, Lz1h;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lz1h;->b(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_f
    check-cast p0, Lar8;

    iget-object p0, p0, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void

    :pswitch_17
    check-cast p0, Lcom/opera/android/browser/BrowserContainer;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v1, v0}, Lcom/opera/android/browser/BrowserContainer;->e(IZ)V

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method

.method public final b()V
    .registers 2

    iget-byte v0, p0, Ltv3;->a:B

    iget-object p0, p0, Ltv3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_22

    check-cast p0, Lz1h;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lz1h;->b(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_f
    check-cast p0, Lar8;

    iget-object p0, p0, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void

    :pswitch_17
    check-cast p0, Lcom/opera/android/browser/BrowserContainer;

    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Lcom/opera/android/browser/BrowserContainer;->e(IZ)V

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method
