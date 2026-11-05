.class Le/e/a/ChannelPage$1;
.super Landroid/widget/BaseAdapter;
.source "ChannelPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/ChannelPage;->open(Landroid/app/Activity;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$adapter:Landroid/widget/BaseAdapter;

.field private final synthetic val$rows:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Landroid/widget/BaseAdapter;Ljava/util/ArrayList;)V
    .registers 3

    .line 13
    iput-object p1, p0, Le/e/a/ChannelPage$1;->val$adapter:Landroid/widget/BaseAdapter;

    iput-object p2, p0, Le/e/a/ChannelPage$1;->val$rows:Ljava/util/ArrayList;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .line 13
    iget-object v0, p0, Le/e/a/ChannelPage$1;->val$adapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3

    .line 13
    iget-object v0, p0, Le/e/a/ChannelPage$1;->val$adapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/BaseAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .registers 4

    .line 13
    iget-object v0, p0, Le/e/a/ChannelPage$1;->val$adapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/BaseAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 6

    .line 13
    iget-object v0, p0, Le/e/a/ChannelPage$1;->val$adapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0, p1, p2, p3}, Landroid/widget/BaseAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    const p3, 0x7f0801e2

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    if-eqz p3, :cond_14

    const/16 v0, 0x8

    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_14
    const p3, 0x7f0801d3

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    instance-of v0, p3, Landroid/widget/TextView;

    if-eqz v0, :cond_34

    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    check-cast p3, Landroid/widget/TextView;

    iget-object v0, p0, Le/e/a/ChannelPage$1;->val$rows:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "videoinfo"

    invoke-static {v0, v1}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0}, Le/e/a/VideoCounts;->setText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    :cond_34
    iget-object p3, p0, Le/e/a/ChannelPage$1;->val$adapter:Landroid/widget/BaseAdapter;

    invoke-static {p2, p3, p1}, Le/e/a/ListActions;->bind(Landroid/view/View;Ljava/lang/Object;I)V

    return-object p2
.end method
