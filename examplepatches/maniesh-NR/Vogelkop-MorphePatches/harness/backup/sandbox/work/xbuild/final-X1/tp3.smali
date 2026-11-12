.class public final synthetic Ltp3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/custom_views/BottomIndicatorButton;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/custom_views/BottomIndicatorButton;B)V
    .registers 3

    iput-byte p2, p0, Ltp3;->a:B

    iput-object p1, p0, Ltp3;->b:Lcom/opera/android/custom_views/BottomIndicatorButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Ltp3;->a:B

    iget-object p0, p0, Ltp3;->b:Lcom/opera/android/custom_views/BottomIndicatorButton;

    packed-switch p1, :pswitch_data_14

    sget p1, Lcom/opera/android/custom_views/BottomIndicatorButton;->c:I

    invoke-virtual {p0}, Lcom/opera/android/custom_views/BottomIndicatorButton;->b()V

    return-void

    :pswitch_d
    sget p1, Lcom/opera/android/custom_views/BottomIndicatorButton;->c:I

    invoke-virtual {p0}, Lcom/opera/android/custom_views/BottomIndicatorButton;->c()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
