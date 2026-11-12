.class public final Lth6;
.super Landroid/widget/ArrayAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lth6;->a:B

    const v0, 0x7f0d031b

    invoke-direct {p0, p1, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    iput-object p2, p0, Lth6;->b:Ljava/lang/Object;

    sget-object p1, Lui6;->o:[Llag;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {v1, v0, p2, p1}, Lui6;->B(ZZLjava/lang/String;[Llag;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/ArrayAdapter;->addAll(Ljava/util/Collection;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lth6;->a:B

    const v0, 0x7f0d00f2

    .line 23
    invoke-direct {p0, p1, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 24
    iput-object p1, p0, Lth6;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lro9;Landroid/content/Context;[Ljava/lang/Object;Lza9;)V
    .registers 5

    const/4 p1, 0x1

    iput-byte p1, p0, Lth6;->a:B

    .line 25
    iput-object p4, p0, Lth6;->b:Ljava/lang/Object;

    const p1, 0x7f0d03b6

    invoke-direct {p0, p2, p1, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final areAllItemsEnabled()Z
    .registers 2

    iget-byte v0, p0, Lth6;->a:B

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0}, Landroid/widget/BaseAdapter;->areAllItemsEnabled()Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p0, Lth6;->b:Ljava/lang/Object;

    check-cast p0, Lza9;

    iget-boolean v0, p0, Lza9;->a:Z

    if-eqz v0, :cond_18

    iget-boolean p0, p0, Lza9;->b:Z

    if-eqz p0, :cond_18

    const/4 p0, 0x1

    goto :goto_19

    :cond_18
    const/4 p0, 0x0

    :goto_19
    return p0

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final getCount()I
    .registers 2

    iget-byte v0, p0, Lth6;->a:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result p0

    return p0

    :pswitch_a
    invoke-super {p0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    return p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 9

    iget-byte v0, p0, Lth6;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Lth6;->b:Ljava/lang/Object;

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_c2

    if-nez p2, :cond_12

    const p2, 0x7f0d031b

    invoke-static {p3, p2, p3, v3}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_12
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    move-object v0, p2

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0, p1}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/Pair;

    iget-object p1, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast p1, Llag;

    iget-object v1, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Lkag;

    new-instance v3, Lylf;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->B(Li41;)V

    invoke-static {p1, v1}, Lui6;->z(Llag;Lkag;)I

    move-result v3

    new-instance v4, Llxh;

    invoke-direct {v4, v3}, Llxh;-><init>(I)V

    invoke-virtual {v0, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    invoke-static {p3, p1}, Lui6;->S(Landroid/content/Context;Llag;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_47

    new-instance v4, Lqxh;

    invoke-direct {v4, v3}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_48

    :cond_47
    const/4 v4, 0x0

    :goto_48
    invoke-virtual {v0, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/opera/android/browser/BrowserUtils;->getHostString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p3, p1, v1, v2}, Lui6;->R(Landroid/content/Context;Llag;Lkag;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance p3, Lqxh;

    invoke-direct {p3, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-virtual {v0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-object p2

    :pswitch_61
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    check-cast v2, Lza9;

    if-eqz p1, :cond_72

    if-eq p1, v1, :cond_6f

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_74

    :cond_6f
    iget-boolean v3, v2, Lza9;->b:Z

    goto :goto_74

    :cond_72
    iget-boolean v3, v2, Lza9;->a:Z

    :goto_74
    invoke-virtual {p0, v3}, Landroid/view/View;->setEnabled(Z)V

    return-object p0

    :pswitch_78
    check-cast v2, Landroid/content/Context;

    if-nez p2, :cond_87

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0d00f2

    invoke-virtual {p2, v0, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_87
    const p3, 0x7f0a02c3

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    const v0, 0x7f0a02c2

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lth6;->getCount()I

    move-result v3

    sub-int/2addr v3, v1

    if-ne p1, v3, :cond_b0

    const p0, 0x7f14054e

    invoke-virtual {v2, p0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-string p0, ""

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_c0

    :cond_b0
    invoke-virtual {p0, p1}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/chromium/content/browser/picker/DateTimeSuggestion;

    iget-object p1, p0, Lorg/chromium/content/browser/picker/DateTimeSuggestion;->b:Ljava/lang/String;

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lorg/chromium/content/browser/picker/DateTimeSuggestion;->c:Ljava/lang/String;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_c0
    return-object p2

    nop

    :pswitch_data_c2
    .packed-switch 0x0
        :pswitch_78
        :pswitch_61
    .end packed-switch
.end method

.method public final isEnabled(I)Z
    .registers 3

    iget-byte v0, p0, Lth6;->a:B

    packed-switch v0, :pswitch_data_1e

    invoke-super {p0, p1}, Landroid/widget/BaseAdapter;->isEnabled(I)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p0, Lth6;->b:Ljava/lang/Object;

    check-cast p0, Lza9;

    if-eqz p1, :cond_1b

    const/4 v0, 0x1

    if-eq p1, v0, :cond_18

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    goto :goto_1d

    :cond_18
    iget-boolean p0, p0, Lza9;->b:Z

    goto :goto_1d

    :cond_1b
    iget-boolean p0, p0, Lza9;->a:Z

    :goto_1d
    return p0

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method
