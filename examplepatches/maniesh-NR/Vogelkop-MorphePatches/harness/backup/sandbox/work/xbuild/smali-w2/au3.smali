.class public final synthetic Lau3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/view/Window;


# direct methods
.method public synthetic constructor <init>(Landroid/view/Window;B)V
    .registers 3

    iput-byte p2, p0, Lau3;->a:B

    iput-object p1, p0, Lau3;->b:Landroid/view/Window;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lau3;->a:B

    iget-object p0, p0, Lau3;->b:Landroid/view/Window;

    packed-switch v0, :pswitch_data_18

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lvtp;->W(Landroid/view/Window;I)V

    return-void

    :pswitch_c
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
