.class public final synthetic Lyu8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcv8;


# direct methods
.method public synthetic constructor <init>(Lcv8;B)V
    .registers 3

    iput-byte p2, p0, Lyu8;->a:B

    iput-object p1, p0, Lyu8;->b:Lcv8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lyu8;->a:B

    iget-object p0, p0, Lyu8;->b:Lcv8;

    packed-switch v0, :pswitch_data_32

    iget-object p0, p0, Lcv8;->a:Lcom/opera/android/settings/SettingsManager;

    return-object p0

    :pswitch_a
    invoke-virtual {p0}, Lcv8;->b()Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_10
    iget-object p0, p0, Lcv8;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_18
    iget-object p0, p0, Lcv8;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_23
    iget-object p0, p0, Lcv8;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_2e
    iget-object p0, p0, Lcv8;->a:Lcom/opera/android/settings/SettingsManager;

    return-object p0

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_2e
        :pswitch_23
        :pswitch_18
        :pswitch_10
        :pswitch_a
    .end packed-switch
.end method
