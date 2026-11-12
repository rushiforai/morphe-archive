.class public final Le2c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;B)V
    .registers 3

    iput-byte p2, p0, Le2c;->a:B

    iput-object p1, p0, Le2c;->b:Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 3

    iget-byte v0, p0, Le2c;->a:B

    iget-object p0, p0, Le2c;->b:Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;

    packed-switch v0, :pswitch_data_24

    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_14

    check-cast p1, Landroid/widget/TextView;

    iget p0, p0, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->C:I

    if-eqz p0, :cond_14

    invoke-static {p1, p0}, Lxf8;->r0(Landroid/widget/TextView;I)V

    :cond_14
    return-void

    :pswitch_15
    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_22

    check-cast p1, Landroid/widget/TextView;

    iget p0, p0, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->B:I

    if-eqz p0, :cond_22

    invoke-static {p1, p0}, Lxf8;->r0(Landroid/widget/TextView;I)V

    :cond_22
    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
