.class public final synthetic Li8k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lj8k;


# direct methods
.method public synthetic constructor <init>(Lj8k;B)V
    .registers 3

    iput-byte p2, p0, Li8k;->a:B

    iput-object p1, p0, Li8k;->b:Lj8k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Li8k;->a:B

    iget-object p0, p0, Li8k;->b:Lj8k;

    packed-switch p1, :pswitch_data_2c

    iget-object p1, p0, Lj8k;->d:Lor2;

    iget-object v0, p1, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {p0, v0}, Lj8k;->b0(Landroid/view/View;)V

    iget-object v0, p1, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    iget-object p1, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    sget-object v1, Lpc;->A:Lpc;

    invoke-virtual {p0, v0, p1, v1}, Lj8k;->c0(Landroid/view/View;Lcom/opera/android/custom_views/StylingTextView;Lpc;)V

    return-void

    :pswitch_1e
    iget-object p1, p0, Lj8k;->d:Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Landroid/widget/FrameLayout;

    invoke-virtual {p0, p1}, Lj8k;->b0(Landroid/view/View;)V

    invoke-virtual {p0}, Lj8k;->e0()V

    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
