.class public final Ljrc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/widget/LinearLayout;

.field public final c:Lcom/google/android/material/button/MaterialButton;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/LinearLayout;Lcom/google/android/material/button/MaterialButton;B)V
    .registers 4

    iput-byte p3, p0, Ljrc;->a:B

    iput-object p1, p0, Ljrc;->b:Landroid/widget/LinearLayout;

    iput-object p2, p0, Ljrc;->c:Lcom/google/android/material/button/MaterialButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Ljrc;->a:B

    packed-switch v0, :pswitch_data_e

    iget-object p0, p0, Ljrc;->b:Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Ljrc;->b:Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_b
    iget-object p0, p0, Ljrc;->b:Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method
