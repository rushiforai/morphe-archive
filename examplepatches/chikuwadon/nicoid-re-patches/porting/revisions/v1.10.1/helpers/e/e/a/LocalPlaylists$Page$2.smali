.class Le/e/a/LocalPlaylists$Page$2;
.super Landroid/widget/BaseAdapter;
.source "LocalPlaylists.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/LocalPlaylists$Page;->render()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/LocalPlaylists$Page;

.field private final synthetic val$identities:Ljava/util/Map;

.field private final synthetic val$nativeRows:Landroid/widget/BaseAdapter;

.field private final synthetic val$rows:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/BaseAdapter;Ljava/util/Map;Ljava/util/ArrayList;)V
    .registers 5

    .line 43
    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iput-object p2, p0, Le/e/a/LocalPlaylists$Page$2;->val$nativeRows:Landroid/widget/BaseAdapter;

    iput-object p3, p0, Le/e/a/LocalPlaylists$Page$2;->val$identities:Ljava/util/Map;

    iput-object p4, p0, Le/e/a/LocalPlaylists$Page$2;->val$rows:Ljava/util/ArrayList;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .line 44
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page$2;->val$nativeRows:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3

    .line 44
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page$2;->val$nativeRows:Landroid/widget/BaseAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/BaseAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .registers 4

    .line 44
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 2

    .line 45
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-boolean p1, p1, Le/e/a/LocalPlaylists$Page;->selecting:Z

    return p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 9

    .line 47
    instance-of v0, p2, Landroid/widget/FrameLayout;

    const-string v1, "nicoid_playlist_selection"

    const/4 v2, 0x0

    if-eqz v0, :cond_15

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    move-object v0, p2

    check-cast v0, Landroid/widget/FrameLayout;

    goto :goto_16

    :cond_15
    move-object v0, v2

    .line 48
    :goto_16
    iget-object v3, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-boolean v3, v3, Le/e/a/LocalPlaylists$Page;->selecting:Z

    const/4 v4, 0x0

    if-eqz v3, :cond_25

    if-nez v0, :cond_20

    goto :goto_28

    :cond_20
    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    goto :goto_29

    :cond_25
    if-nez v0, :cond_28

    goto :goto_29

    :cond_28
    :goto_28
    move-object p2, v2

    .line 49
    :goto_29
    iget-object v2, p0, Le/e/a/LocalPlaylists$Page$2;->val$nativeRows:Landroid/widget/BaseAdapter;

    invoke-virtual {v2, p1, p2, p3}, Landroid/widget/BaseAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    iget-object p3, p0, Le/e/a/LocalPlaylists$Page$2;->val$identities:Ljava/util/Map;

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page$2;->val$rows:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lorg/json/JSONObject;

    .line 50
    iget-object v2, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-boolean v2, v2, Le/e/a/LocalPlaylists$Page;->selecting:Z

    if-nez v2, :cond_49

    iget-object p3, p0, Le/e/a/LocalPlaylists$Page$2;->val$nativeRows:Landroid/widget/BaseAdapter;

    invoke-static {p2, p3, p1}, Le/e/a/ListActions;->bind(Landroid/view/View;Ljava/lang/Object;I)V

    return-object p2

    .line 51
    :cond_49
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    invoke-virtual {p1, p2}, Le/e/a/LocalPlaylists$Page;->disable(Landroid/view/View;)V

    if-nez v0, :cond_8d

    new-instance v0, Landroid/widget/FrameLayout;

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object p1, p1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v0, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object p1, p1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string p2, ""

    const/16 v1, 0x16

    invoke-static {p1, p2, v1}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object p2, p2, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {p2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object v1, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v2, 0x28

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    const/4 v2, -0x2

    const v3, 0x800035

    invoke-direct {p2, v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_99

    .line 52
    :cond_8d
    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    if-eq p1, p2, :cond_99

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->removeViewAt(I)V

    invoke-virtual {v0, p2, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 53
    :cond_99
    :goto_99
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object p1, p1, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    const-string p2, "id"

    invoke-virtual {p3, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    const/4 p2, 0x1

    invoke-virtual {v0, p2}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    if-eqz p1, :cond_b3

    const-string v1, "\u2713"

    goto :goto_b5

    :cond_b3
    const-string v1, "\u25a1"

    :goto_b5
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p2, Le/e/a/LocalPlaylists$Page$2$$ExternalSyntheticLambda1;

    invoke-direct {p2, p0, p3}, Le/e/a/LocalPlaylists$Page$2$$ExternalSyntheticLambda1;-><init>(Le/e/a/LocalPlaylists$Page$2;Lorg/json/JSONObject;)V

    invoke-virtual {v0, p2}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz p1, :cond_d2

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object p1, p1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {p1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p1

    const p2, 0xffffff

    and-int/2addr p1, p2

    const/high16 p2, 0x33000000

    or-int v4, p1, p2

    :cond_d2
    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    return-object v0
.end method

.method public getViewTypeCount()I
    .registers 2

    .line 45
    const/4 v0, 0x2

    return v0
.end method

.method synthetic lambda$0$e-e-a-LocalPlaylists$Page$2(Lorg/json/JSONObject;Landroid/view/View;)V
    .registers 4

    .line 53
    iget-object p2, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    const-string v0, "id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Le/e/a/LocalPlaylists$Page;->toggle(Ljava/lang/String;)V

    return-void
.end method
