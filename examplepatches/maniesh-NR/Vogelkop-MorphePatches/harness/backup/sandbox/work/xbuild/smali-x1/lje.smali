.class public final synthetic Llje;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/StatusBarDrawingFrameLayout;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/StatusBarDrawingFrameLayout;B)V
    .registers 3

    iput-byte p2, p0, Llje;->a:B

    iput-object p1, p0, Llje;->b:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 4

    iget-byte v0, p0, Llje;->a:B

    iget-object p0, p0, Llje;->b:Lcom/opera/android/StatusBarDrawingFrameLayout;

    packed-switch v0, :pswitch_data_32

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0402d8

    const v1, 0x7f061084

    invoke-static {v0, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/opera/android/StatusBarDrawingFrameLayout;->e(I)V

    return-void

    :pswitch_19
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f040398

    const v1, 0x7f06063b

    invoke-static {v0, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    iget v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    if-eq p1, v0, :cond_30

    iput p1, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    invoke-virtual {p0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->b()V

    :cond_30
    return-void

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method
