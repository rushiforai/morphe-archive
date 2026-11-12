.class public final Lswc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/widget/FrameLayout;

.field public final c:Lcom/opera/android/custom_views/StylingTextView;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingTextView;B)V
    .registers 4

    iput-byte p3, p0, Lswc;->a:B

    iput-object p1, p0, Lswc;->b:Landroid/widget/FrameLayout;

    iput-object p2, p0, Lswc;->c:Lcom/opera/android/custom_views/StylingTextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lswc;->a:B

    packed-switch v0, :pswitch_data_e

    iget-object p0, p0, Lswc;->b:Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lswc;->b:Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_b
    iget-object p0, p0, Lswc;->b:Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method
