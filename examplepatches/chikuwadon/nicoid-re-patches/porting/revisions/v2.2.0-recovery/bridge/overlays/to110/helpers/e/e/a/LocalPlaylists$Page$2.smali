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

    .line 121
    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iput-object p2, p0, Le/e/a/LocalPlaylists$Page$2;->val$nativeRows:Landroid/widget/BaseAdapter;

    iput-object p3, p0, Le/e/a/LocalPlaylists$Page$2;->val$identities:Ljava/util/Map;

    iput-object p4, p0, Le/e/a/LocalPlaylists$Page$2;->val$rows:Ljava/util/ArrayList;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method

.method static synthetic lambda$0(Landroid/widget/TextView;Ljava/lang/String;Landroid/widget/FrameLayout;Landroid/view/View;)Z
    .registers 5

    .line 149
    const-string p3, "nicoid-local-playlist"

    invoke-static {p3, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p3

    .line 150
    invoke-static {p2}, Le/e/a/ReorderMotion98;->shadow(Landroid/view/View;)Landroid/view/View$DragShadowBuilder;

    move-result-object v0

    const/4 p2, 0x0

    .line 148
    invoke-virtual {p0, p3, v0, p1, p2}, Landroid/widget/TextView;->startDragAndDrop(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    move-result p0

    return p0
.end method

.method static synthetic lambda$1(Landroid/view/View;)V
    .registers 1

    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 1

    .line 122
    iget-object p0, p0, Le/e/a/LocalPlaylists$Page$2;->val$nativeRows:Landroid/widget/BaseAdapter;

    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->getCount()I

    move-result p0

    return p0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 2

    .line 122
    iget-object p0, p0, Le/e/a/LocalPlaylists$Page$2;->val$nativeRows:Landroid/widget/BaseAdapter;

    invoke-virtual {p0, p1}, Landroid/widget/BaseAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public getItemId(I)J
    .registers 2

    int-to-long p0, p1

    return-wide p0
.end method

.method public getItemViewType(I)I
    .registers 2

    .line 123
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-boolean p1, p1, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-eqz p1, :cond_0

    const/4 p0, 0x2

    return p0

    :cond_0
    iget-object p0, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-boolean p0, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 11

    .line 125
    instance-of v0, p2, Landroid/widget/FrameLayout;

    const-string v1, "nicoid_playlist_selection"

    const-string v2, "nicoid_playlist_reorder"

    const/4 v3, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    move-object v0, p2

    check-cast v0, Landroid/widget/FrameLayout;

    goto :goto_0

    :cond_1
    move-object v0, v3

    .line 126
    :goto_0
    iget-object v4, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-boolean v4, v4, Le/e/a/LocalPlaylists$Page;->selecting:Z

    const/4 v5, 0x0

    if-nez v4, :cond_2

    iget-object v4, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-boolean v4, v4, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-nez v4, :cond_2

    if-nez v0, :cond_3

    goto :goto_1

    :cond_2
    if-nez v0, :cond_4

    :cond_3
    move-object p2, v3

    goto :goto_1

    :cond_4
    invoke-virtual {v0, v5}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    .line 127
    :goto_1
    iget-object v3, p0, Le/e/a/LocalPlaylists$Page$2;->val$nativeRows:Landroid/widget/BaseAdapter;

    invoke-virtual {v3, p1, p2, p3}, Landroid/widget/BaseAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    iget-object p3, p0, Le/e/a/LocalPlaylists$Page$2;->val$identities:Ljava/util/Map;

    iget-object v3, p0, Le/e/a/LocalPlaylists$Page$2;->val$rows:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {p3, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lorg/json/JSONObject;

    .line 128
    iget-object v3, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-boolean v3, v3, Le/e/a/LocalPlaylists$Page;->selecting:Z

    if-nez v3, :cond_5

    iget-object v3, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-boolean v3, v3, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-nez v3, :cond_5

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page$2;->val$nativeRows:Landroid/widget/BaseAdapter;

    invoke-static {p2, v0, p1}, Le/e/a/ListActions;->bind(Landroid/view/View;Ljava/lang/Object;I)V

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->display:Landroid/widget/BaseAdapter;

    invoke-static {p2, p0, p3}, Le/e/a/LocalPlaylists;->bindArtwork(Landroid/view/View;Landroid/widget/BaseAdapter;Lorg/json/JSONObject;)V

    return-object p2

    .line 129
    :cond_5
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object p1, p1, Le/e/a/LocalPlaylists$Page;->display:Landroid/widget/BaseAdapter;

    invoke-static {p2, p1, p3}, Le/e/a/LocalPlaylists;->bindArtwork(Landroid/view/View;Landroid/widget/BaseAdapter;Lorg/json/JSONObject;)V

    .line 130
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    invoke-virtual {p1, p2}, Le/e/a/LocalPlaylists$Page;->disable(Landroid/view/View;)V

    .line 131
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-boolean p1, p1, Le/e/a/LocalPlaylists$Page;->reordering:Z

    const/4 v3, 0x1

    const-string v4, "id"

    if-eqz p1, :cond_a

    if-eqz v0, :cond_8

    .line 132
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getTag()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    .line 133
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-ne p1, v0, :cond_8

    invoke-virtual {v0, p2}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    goto :goto_2

    .line 140
    :cond_6
    invoke-virtual {v0, v5}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    if-eq p0, p2, :cond_9

    .line 141
    invoke-virtual {v0, v5}, Landroid/widget/FrameLayout;->removeViewAt(I)V

    .line 142
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of p0, p0, Landroid/view/ViewGroup;

    if-eqz p0, :cond_7

    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 143
    :cond_7
    invoke-virtual {v0, p2, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    goto :goto_3

    .line 134
    :cond_8
    :goto_2
    new-instance v0, Landroid/widget/FrameLayout;

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object p1, p1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v0, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 135
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object p1, p1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string p2, "\u283f"

    const/16 v1, 0x18

    invoke-static {p1, p2, v1}, Le/e/a/Ui110;->compact(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    invoke-static {p1}, Le/e/a/ReorderMotion98;->grip(Landroid/widget/TextView;)V

    .line 136
    iget-object p2, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object p2, p2, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {p2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 p2, 0x11

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 137
    iget-object p2, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object p2, p2, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v1, "Hold and drag to reorder"

    const-string/jumbo v2, "\u9577\u6309\u4e26\u62d6\u52d5\u6392\u5e8f"

    const-string/jumbo v5, "\u9577\u62bc\u3057\u3057\u3066\u4e26\u3073\u66ff\u3048"

    invoke-static {p2, v5, v1, v2}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 138
    iget-object p2, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object p2, p2, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object v1, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v1

    const/16 v2, 0x8

    invoke-static {p2, v1, v2}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 139
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v1, 0x30

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    const/4 v1, -0x1

    const v2, 0x800015

    invoke-direct {p2, p0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 145
    :cond_9
    :goto_3
    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    .line 146
    invoke-virtual {p3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 148
    new-instance p2, Le/e/a/LocalPlaylists$Page$2$0;

    invoke-direct {p2, p0, p1, v0}, Le/e/a/LocalPlaylists$Page$2$0;-><init>(Landroid/widget/TextView;Ljava/lang/String;Landroid/widget/FrameLayout;)V

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 151
    new-instance p0, Le/e/a/LocalPlaylists$Page$2$1;

    invoke-direct {p0}, Le/e/a/LocalPlaylists$Page$2$1;-><init>()V

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    return-object v0

    :cond_a
    if-nez v0, :cond_b

    .line 153
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

    const v6, 0x800035

    invoke-direct {p2, v1, v2, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_4

    .line 154
    :cond_b
    invoke-virtual {v0, v5}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    if-eq p1, p2, :cond_c

    invoke-virtual {v0, v5}, Landroid/widget/FrameLayout;->removeViewAt(I)V

    invoke-virtual {v0, p2, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 155
    :cond_c
    :goto_4
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object p1, p1, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-virtual {p3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    if-eqz p1, :cond_d

    const-string v1, "\u2713"

    goto :goto_5

    :cond_d
    const-string v1, "\u25a1"

    :goto_5
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p2, Le/e/a/LocalPlaylists$Page$2$2;

    invoke-direct {p2, p0, p3}, Le/e/a/LocalPlaylists$Page$2$2;-><init>(Le/e/a/LocalPlaylists$Page$2;Lorg/json/JSONObject;)V

    invoke-virtual {v0, p2}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    if-eqz p1, :cond_e

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p0

    const p1, 0xffffff

    and-int/2addr p0, p1

    const/high16 p1, 0x33000000

    or-int v5, p0, p1

    :cond_e
    invoke-virtual {v0, v5}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    return-object v0
.end method

.method public getViewTypeCount()I
    .registers 1

    const/4 p0, 0x3

    return p0
.end method

.method synthetic lambda$2$e-e-a-LocalPlaylists$Page$2(Lorg/json/JSONObject;Landroid/view/View;)V
    .registers 3

    .line 155
    iget-object p0, p0, Le/e/a/LocalPlaylists$Page$2;->this$1:Le/e/a/LocalPlaylists$Page;

    const-string p2, "id"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/LocalPlaylists$Page;->toggle(Ljava/lang/String;)V

    return-void
.end method
