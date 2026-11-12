.class public final Lyy0;
.super Landroid/widget/ArrayAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;II[Ljava/lang/Object;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Lyy0;->a:B

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II[Ljava/lang/Object;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;I[Ljava/lang/Object;)V
    .registers 5

    .line 7
    const/4 v0, 0x1

    iput-byte v0, p0, Lyy0;->a:B

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final getItemId(I)J
    .registers 3

    iget-byte v0, p0, Lyy0;->a:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0, p1}, Landroid/widget/ArrayAdapter;->getItemId(I)J

    move-result-wide p0

    return-wide p0

    :pswitch_a
    int-to-long p0, p1

    return-wide p0

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 6

    iget-byte v0, p0, Lyy0;->a:B

    packed-switch v0, :pswitch_data_48

    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :pswitch_a
    const/4 v0, 0x0

    if-nez p2, :cond_1c

    invoke-virtual {p0}, Landroid/widget/ArrayAdapter;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v1, 0x7f0d0317

    invoke-virtual {p2, v1, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_1c
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Liy4;

    move-object p1, p2

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p3, p0, Liy4;->a:Ljava/lang/String;

    new-instance v1, Lqxh;

    invoke-direct {v1, p3}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-object p0, p0, Liy4;->b:Ljava/lang/String;

    if-eqz p0, :cond_40

    new-instance p3, Lqxh;

    invoke-direct {p3, p0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_41

    :cond_40
    const/4 p3, 0x0

    :goto_41
    invoke-virtual {p1, p3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setFocusable(Z)V

    return-object p2

    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final hasStableIds()Z
    .registers 2

    iget-byte v0, p0, Lyy0;->a:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0}, Landroid/widget/BaseAdapter;->hasStableIds()Z

    move-result p0

    return p0

    :pswitch_a
    const/4 p0, 0x1

    return p0

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
