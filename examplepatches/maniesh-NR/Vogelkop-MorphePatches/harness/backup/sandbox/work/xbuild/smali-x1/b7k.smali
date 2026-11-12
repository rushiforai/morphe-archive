.class public final Lb7k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/view/View;

.field public final c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLandroid/view/View;Ljava/lang/Object;)V
    .registers 4

    .line 11
    iput-byte p1, p0, Lb7k;->a:B

    iput-object p2, p0, Lb7k;->b:Landroid/view/View;

    iput-object p3, p0, Lb7k;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/widget/ThemeableLottieAnimationView;Landroid/widget/TextSwitcher;)V
    .registers 4

    const/4 p2, 0x2

    iput-byte p2, p0, Lb7k;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb7k;->b:Landroid/view/View;

    iput-object p3, p0, Lb7k;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lb7k;->a:B

    iget-object p0, p0, Lb7k;->b:Landroid/view/View;

    packed-switch v0, :pswitch_data_20

    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_a
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_d
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_10
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_13
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_16
    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    return-object p0

    :pswitch_19
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    :pswitch_1b
    return-object p0

    :pswitch_1c
    check-cast p0, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    return-object p0

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_1b
        :pswitch_19
        :pswitch_16
        :pswitch_13
        :pswitch_10
        :pswitch_d
        :pswitch_a
    .end packed-switch
.end method
