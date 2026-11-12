.class public final Lcq3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lcq3;->a:B

    iput-object p1, p0, Lcq3;->b:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/bubbleview/BubbleView;Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;)V
    .registers 3

    const/4 p2, 0x3

    iput-byte p2, p0, Lcq3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcq3;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lcq3;->a:B

    iget-object p0, p0, Lcq3;->b:Landroid/view/View;

    packed-switch v0, :pswitch_data_20

    check-cast p0, Lcom/opera/android/custom_views/LineHeaderTextView;

    return-object p0

    :pswitch_a
    check-cast p0, Lcom/opera/android/custom_views/ThemeSelector;

    return-object p0

    :pswitch_d
    check-cast p0, Lcom/opera/android/custom_views/AccentSelector;

    return-object p0

    :pswitch_10
    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    return-object p0

    :pswitch_13
    check-cast p0, Lcom/opera/android/bubbleview/BubbleView;

    return-object p0

    :pswitch_16
    check-cast p0, Lcom/opera/hype/emoji/EmojiTextView;

    return-object p0

    :pswitch_19
    check-cast p0, Lcom/opera/android/suggestion/ChatSuggestionView;

    return-object p0

    :pswitch_1c
    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    return-object p0

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_19
        :pswitch_16
        :pswitch_13
        :pswitch_10
        :pswitch_d
        :pswitch_a
    .end packed-switch
.end method
