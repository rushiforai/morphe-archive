.class public final Lzq2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/widget/LinearLayout;

.field public final c:Lcom/google/android/material/button/MaterialButton;

.field public final d:Lcom/google/android/material/button/MaterialButton;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/LinearLayout;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;B)V
    .registers 5

    iput-byte p4, p0, Lzq2;->a:B

    iput-object p1, p0, Lzq2;->b:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lzq2;->c:Lcom/google/android/material/button/MaterialButton;

    iput-object p3, p0, Lzq2;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lzq2;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lzq2;->b:Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lzq2;->b:Landroid/widget/LinearLayout;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
