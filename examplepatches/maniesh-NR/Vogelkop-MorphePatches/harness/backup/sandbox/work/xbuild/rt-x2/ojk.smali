.class public final synthetic Lojk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/custom_views/StylingImageCheckableWithText;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/custom_views/StylingImageCheckableWithText;B)V
    .registers 3

    iput-byte p2, p0, Lojk;->a:B

    iput-object p1, p0, Lojk;->b:Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lojk;->a:B

    iget-object p0, p0, Lojk;->b:Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    packed-switch v0, :pswitch_data_14

    sget-object v0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->x:[I

    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    return-void

    :pswitch_d
    sget-object v0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->x:[I

    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
