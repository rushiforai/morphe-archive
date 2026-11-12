.class public final synthetic Lnm7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/custom_views/DropShadowFrameLayout;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/custom_views/DropShadowFrameLayout;B)V
    .registers 3

    iput-byte p2, p0, Lnm7;->a:B

    iput-object p1, p0, Lnm7;->b:Lcom/opera/android/custom_views/DropShadowFrameLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lnm7;->a:B

    iget-object p0, p0, Lnm7;->b:Lcom/opera/android/custom_views/DropShadowFrameLayout;

    packed-switch v0, :pswitch_data_1a

    sget v0, Lcom/opera/android/custom_views/DropShadowFrameLayout;->b:I

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    :goto_d
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_12
    sget v0, Lcom/opera/android/custom_views/DropShadowFrameLayout;->b:I

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    goto :goto_d

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
