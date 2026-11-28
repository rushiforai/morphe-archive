.class public final Le/e/a/PlaylistTransfer100;
.super Ljava/lang/Object;
.source "PlaylistTransfer100.java"


# instance fields
.field final base:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final moves:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final order:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final owner:Ljava/lang/String;

.field final page:Le/e/a/LocalPlaylists$Page;

.field final previousSort:I


# direct methods
.method constructor <init>(Le/e/a/LocalPlaylists$Page;Le/e/a/LocalPlaylistData;)V
    .registers 4

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Le/e/a/PlaylistTransfer100;->moves:Ljava/util/LinkedHashMap;

    .line 6
    iput-object p1, p0, Le/e/a/PlaylistTransfer100;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v0, p1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/PlaylistTransfer100;->owner:Ljava/lang/String;

    iget p1, p1, Le/e/a/LocalPlaylists$Page;->sort:I

    iput p1, p0, Le/e/a/PlaylistTransfer100;->previousSort:I

    iget-object p1, p2, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    const-string p2, "folder"

    iget-object v0, p0, Le/e/a/PlaylistTransfer100;->owner:Ljava/lang/String;

    invoke-static {p1, p2, v0}, Le/e/a/PlaylistTransfer100;->ids(Lorg/json/JSONArray;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Le/e/a/PlaylistTransfer100;->base:Ljava/util/ArrayList;

    new-instance p1, Ljava/util/ArrayList;

    iget-object p2, p0, Le/e/a/PlaylistTransfer100;->base:Ljava/util/ArrayList;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Le/e/a/PlaylistTransfer100;->order:Ljava/util/ArrayList;

    return-void
.end method

.method static active(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;)Z
    .registers 3

    .line 38
    if-eqz p1, :cond_0

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {p0}, Le/e/a/LocalePatch215;->isActivePlaylist(Landroid/app/Activity;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static back(Le/e/a/LocalPlaylists$Page;)Z
    .registers 9

    .line 48
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    return v2

    :cond_0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    const/4 v3, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Le/e/a/PlaylistTransfer100;->changed()Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v4, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v5, "Discard unsaved changes?"

    const-string/jumbo v6, "\u6368\u68c4\u672a\u5132\u5b58\u7684\u8b8a\u66f4\uff1f"

    const-string v7, "\u5909\u66f4\u3092\u4fdd\u5b58\u305b\u305a\u306b\u7d42\u4e86\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {v4, v7, v5, v6}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v4, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v4}, Le/e/a/PlaylistTransfer100;->cancel(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v3, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v4, "Discard"

    const-string/jumbo v5, "\u6368\u68c4"

    const-string/jumbo v6, "\u7834\u68c4"

    invoke-static {v3, v6, v4, v5}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Le/e/a/PlaylistTransfer100$13;

    invoke-direct {v4, p0, v0}, Le/e/a/PlaylistTransfer100$13;-><init>(Le/e/a/LocalPlaylists$Page;Le/e/a/PlaylistTransfer100;)V

    invoke-virtual {v1, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return v2

    :cond_1
    if-eqz v0, :cond_2

    iget v0, v0, Le/e/a/PlaylistTransfer100;->previousSort:I

    iput v0, p0, Le/e/a/LocalPlaylists$Page;->sort:I

    :cond_2
    iput-object v3, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    iput-boolean v1, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return v2

    :cond_3
    return v1
.end method

.method static cancel(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 7
    const-string v0, "Cancel"

    const-string v1, "\u53d6\u6d88"

    const-string v2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p0, v2, v0, v1}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static catalogMove(Le/e/a/LocalPlaylists$Page;Ljava/util/List;Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Le/e/a/LocalPlaylists$Page;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 40
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->catalog98:Le/e/a/CatalogReorder98;

    new-instance v1, Le/e/a/PlaylistTransfer100$4;

    invoke-direct {v1, p0, v0, p1, p2}, Le/e/a/PlaylistTransfer100$4;-><init>(Le/e/a/LocalPlaylists$Page;Le/e/a/CatalogReorder98;Ljava/util/List;Ljava/lang/String;)V

    invoke-static {p0, p2, v1}, Le/e/a/PlaylistTransfer100;->pickGroup(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/util/function/Consumer;)V

    :cond_0
    return-void
.end method

.method static catalogToggle(Landroid/app/Activity;)Z
    .registers 4

    .line 41
    sget-object v0, Le/e/a/LocalPlaylists;->PAGES:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/LocalPlaylists$Page;

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    iget-boolean v1, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    const/4 v2, 0x1

    if-nez v1, :cond_1

    iget-boolean v1, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-nez v1, :cond_0

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->catalog98:Le/e/a/CatalogReorder98;

    if-eqz v1, :cond_0

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->catalog98:Le/e/a/CatalogReorder98;

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->toggleSelection()V

    return v2

    :cond_0
    return v0

    :cond_1
    return v2
.end method

.method static copyButton(Landroid/widget/LinearLayout;Le/e/a/LocalPlaylists$Page;)V
    .registers 7

    .line 45
    new-instance v0, Landroid/widget/Button;

    iget-object v1, p1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iget-object v1, p1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Copy"

    const-string/jumbo v3, "\u8907\u88fd"

    const-string v4, "\u30b3\u30d4\u30fc"

    invoke-static {v1, v4, v2, v3}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinimumWidth(I)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    new-instance v2, Le/e/a/PlaylistTransfer100$0;

    invoke-direct {v2, p1}, Le/e/a/PlaylistTransfer100$0;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    iget-object p1, p1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v3, 0x30

    invoke-static {p1, v3}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result p1

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v2, v1, p1, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    return-void
.end method

.method static copyMenu(Le/e/a/LocalPlaylists$Page;Landroid/view/Menu;)V
    .registers 6

    .line 46
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v1, "Copy"

    const-string/jumbo v2, "\u8907\u88fd"

    const-string v3, "\u30b3\u30d4\u30fc"

    invoke-static {v0, v3, v1, v2}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    new-instance v0, Le/e/a/PlaylistTransfer100$12;

    invoke-direct {v0, p0}, Le/e/a/PlaylistTransfer100$12;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    return-void
.end method

.method static count(Lorg/json/JSONArray;Ljava/lang/String;)I
    .registers 3

    .line 22
    const-string v0, "folder"

    invoke-static {p0, v0, p1}, Le/e/a/PlaylistTransfer100;->ids(Lorg/json/JSONArray;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method static dest(Lorg/json/JSONArray;Ljava/lang/String;)Z
    .registers 3

    .line 10
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0, p1}, Le/e/a/PlaylistTransfer100;->find(Lorg/json/JSONArray;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static error(Le/e/a/LocalPlaylists$Page;)V
    .registers 5

    .line 35
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v1, "Could not apply changes. Saved data retained."

    const-string/jumbo v2, "\u7121\u6cd5\u5957\u7528\u8b8a\u66f4\uff0c\u5df2\u4fdd\u7559\u5132\u5b58\u8cc7\u6599"

    const-string v3, "\u5909\u66f4\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u4fdd\u5b58\u30c7\u30fc\u30bf\u306f\u4fdd\u6301\u3055\u308c\u3066\u3044\u307e\u3059"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x1

    invoke-static {v0, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static find(Lorg/json/JSONArray;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 5

    .line 9
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method static finish(Le/e/a/LocalPlaylists$Page;)Z
    .registers 6

    .line 47
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    return v2

    :cond_0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Le/e/a/PlaylistTransfer100;->changed()Z

    move-result v3

    if-eqz v3, :cond_1

    iput-boolean v2, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v3, Le/e/a/PlaylistTransfer100$10;

    invoke-direct {v3, v0}, Le/e/a/PlaylistTransfer100$10;-><init>(Le/e/a/PlaylistTransfer100;)V

    new-instance v4, Le/e/a/PlaylistTransfer100$11;

    invoke-direct {v4, p0, v0}, Le/e/a/PlaylistTransfer100$11;-><init>(Le/e/a/LocalPlaylists$Page;Le/e/a/PlaylistTransfer100;)V

    invoke-static {v1, v3, v4}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return v2

    :cond_1
    if-eqz v0, :cond_2

    iget v0, v0, Le/e/a/PlaylistTransfer100;->previousSort:I

    iput v0, p0, Le/e/a/LocalPlaylists$Page;->sort:I

    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    iput-boolean v1, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return v2

    :cond_3
    return v1
.end method

.method static ids(Lorg/json/JSONArray;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_0

    const-string v3, ""

    invoke-virtual {v2, p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, "id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method static immediate(Le/e/a/LocalPlaylists$Page;Ljava/util/List;Z)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Le/e/a/LocalPlaylists$Page;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 42
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    new-instance v1, Le/e/a/PlaylistTransfer100$3;

    invoke-direct {v1, p0, v0, p1, p2}, Le/e/a/PlaylistTransfer100$3;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/util/List;Z)V

    invoke-static {p0, v0, v1}, Le/e/a/PlaylistTransfer100;->pickPlaylist(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/util/function/Consumer;)V

    :cond_0
    return-void
.end method

.method static installVideoDrop(Le/e/a/LocalPlaylists$Page;)V
    .registers 6

    .line 54
    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Move to another playlist"

    const-string/jumbo v3, "\u79fb\u52d5\u81f3\u5176\u4ed6\u64ad\u653e\u6e05\u55ae"

    const-string v4, "\u5225\u306e\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u3078\u79fb\u52d5"

    invoke-static {v1, v4, v2, v3}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/PlaylistTransfer100;->zone(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v3, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v4, 0x34

    invoke-static {v3, v4}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v4, -0x1

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Le/e/a/PlaylistTransfer100$14;

    invoke-direct {v1, p0}, Le/e/a/PlaylistTransfer100$14;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    :cond_0
    return-void
.end method

.method static label(Landroid/content/Context;Lorg/json/JSONObject;Lorg/json/JSONArray;)Ljava/lang/String;
    .registers 9

    .line 23
    const-string p0, "name"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v1, v4, :cond_2

    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v4, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    add-int/lit8 v2, v2, 0x1

    if-eq v4, p1, :cond_0

    const-string v5, "id"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    :cond_0
    move v3, v2

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x1

    if-le v2, p0, :cond_3

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " ("

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "/"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ")"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_3
    return-object v0
.end method

.method static synthetic lambda$back$14(Le/e/a/LocalPlaylists$Page;Le/e/a/PlaylistTransfer100;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 48
    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    if-ne p2, p1, :cond_0

    iget p1, p1, Le/e/a/PlaylistTransfer100;->previousSort:I

    iput p1, p0, Le/e/a/LocalPlaylists$Page;->sort:I

    const/4 p1, 0x0

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_0
    return-void
.end method

.method static synthetic lambda$catalogMove$3(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Le/e/a/LocalPlaylistData;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 40
    iget-object v0, p3, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    iget-object p3, p3, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-static {v0, p3, p0, p1, p2}, Le/e/a/PlaylistTransfer100;->moveCatalog(Lorg/json/JSONArray;Lorg/json/JSONArray;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$catalogMove$4(Le/e/a/LocalPlaylists$Page;Ljava/lang/Boolean;)V
    .registers 3

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->refresh(Le/e/a/LocalPlaylists$Page;)V

    goto :goto_0

    :cond_0
    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->error(Le/e/a/LocalPlaylists$Page;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$catalogMove$5(Le/e/a/LocalPlaylists$Page;Le/e/a/CatalogReorder98;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 40
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->catalog98:Le/e/a/CatalogReorder98;

    if-ne v0, p1, :cond_0

    iget-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {p1}, Le/e/a/LocalePatch215;->isActivePlaylist(Landroid/app/Activity;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v0, Le/e/a/PlaylistTransfer100$15;

    invoke-direct {v0, p2, p3, p4}, Le/e/a/PlaylistTransfer100$15;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    new-instance p2, Le/e/a/PlaylistTransfer100$16;

    invoke-direct {p2, p0}, Le/e/a/PlaylistTransfer100$16;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {p1, v0, p2}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$copyButton$10(Le/e/a/LocalPlaylists$Page;Landroid/view/View;)V
    .registers 2

    .line 45
    const/4 p1, 0x1

    invoke-static {p0, p1}, Le/e/a/PlaylistTransfer100;->selected(Le/e/a/LocalPlaylists$Page;Z)V

    return-void
.end method

.method static synthetic lambda$copyMenu$11(Le/e/a/LocalPlaylists$Page;Landroid/view/MenuItem;)Z
    .registers 2

    .line 46
    const/4 p1, 0x1

    invoke-static {p0, p1}, Le/e/a/PlaylistTransfer100;->selected(Le/e/a/LocalPlaylists$Page;Z)V

    return p1
.end method

.method static synthetic lambda$finish$12(Le/e/a/PlaylistTransfer100;Le/e/a/LocalPlaylistData;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 47
    invoke-virtual {p0, p1}, Le/e/a/PlaylistTransfer100;->apply(Le/e/a/LocalPlaylistData;)V

    return-void
.end method

.method static synthetic lambda$finish$13(Le/e/a/LocalPlaylists$Page;Le/e/a/PlaylistTransfer100;Ljava/lang/Boolean;)V
    .registers 5

    .line 47
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    iget-object v1, p1, Le/e/a/PlaylistTransfer100;->owner:Ljava/lang/String;

    invoke-static {p0, v1}, Le/e/a/PlaylistTransfer100;->active(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    if-ne v1, p1, :cond_1

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    iput-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    const/4 p1, 0x3

    iput p1, p0, Le/e/a/LocalPlaylists$Page;->sort:I

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->saveSort()V

    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->refresh(Le/e/a/LocalPlaylists$Page;)V

    goto :goto_0

    :cond_0
    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->error(Le/e/a/LocalPlaylists$Page;)V

    :cond_1
    :goto_0
    return-void
.end method

.method static synthetic lambda$immediate$6([ILjava/util/List;Ljava/lang/String;Ljava/lang/String;ZLe/e/a/LocalPlaylistData;)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 42
    iget-object v0, p5, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    iget-object v1, p5, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Le/e/a/PlaylistTransfer100;->transfer(Lorg/json/JSONArray;Lorg/json/JSONArray;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Z)I

    move-result p1

    const/4 p2, 0x0

    aput p1, p0, p2

    return-void
.end method

.method static synthetic lambda$immediate$7(Le/e/a/LocalPlaylists$Page;[ILjava/lang/Boolean;)V
    .registers 9

    .line 42
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {p2}, Ljava/util/Set;->clear()V

    iput-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v3, "Videos transferred: "

    const-string v4, "\u5df2\u8655\u7406\u5f71\u7247\uff1a"

    const-string v5, "\u51e6\u7406\u3057\u305f\u52d5\u753b: "

    invoke-static {v2, v5, v3, v4}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget p1, p1, v0

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, " (duplicates retained)"

    const-string/jumbo v3, "\uff08\u4fdd\u7559\u91cd\u8907\u9805\u76ee\uff09"

    const-string/jumbo v4, "\uff08\u91cd\u8907\u306f\u7dad\u6301\uff09"

    invoke-static {v1, v4, v2, v3}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->refresh(Le/e/a/LocalPlaylists$Page;)V

    goto :goto_0

    :cond_0
    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->error(Le/e/a/LocalPlaylists$Page;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$immediate$8(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/util/List;ZLjava/lang/String;)V
    .registers 12

    .line 42
    invoke-static {p0, p1}, Le/e/a/PlaylistTransfer100;->active(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    const/4 v0, 0x0

    filled-new-array {v0}, [I

    move-result-object v2

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v1, Le/e/a/PlaylistTransfer100$5;

    move-object v4, p1

    move-object v3, p2

    move v6, p3

    move-object v5, p4

    invoke-direct/range {v1 .. v6}, Le/e/a/PlaylistTransfer100$5;-><init>([ILjava/util/List;Ljava/lang/String;Ljava/lang/String;Z)V

    new-instance p1, Le/e/a/PlaylistTransfer100$6;

    invoke-direct {p1, p0, v2}, Le/e/a/PlaylistTransfer100$6;-><init>(Le/e/a/LocalPlaylists$Page;[I)V

    invoke-static {v0, v1, p1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$installVideoDrop$15(Le/e/a/LocalPlaylists$Page;Le/e/a/PlaylistTransfer100;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11

    .line 54
    const-string v0, "videoId"

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    if-ne v1, p1, :cond_3

    iget-object v1, p1, Le/e/a/PlaylistTransfer100;->owner:Ljava/lang/String;

    invoke-static {p0, v1}, Le/e/a/PlaylistTransfer100;->active(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-boolean v1, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-eqz v1, :cond_3

    iget-boolean v1, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    if-nez v1, :cond_3

    :try_start_0
    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/LocalPlaylists;->read(Landroid/content/Context;)Le/e/a/LocalPlaylistData;

    move-result-object v1

    invoke-virtual {p1, v1}, Le/e/a/PlaylistTransfer100;->apply(Le/e/a/LocalPlaylistData;)V

    iget-object v2, v1, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-static {v2, p2}, Le/e/a/PlaylistTransfer100;->find(Lorg/json/JSONArray;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    iget-object v5, v1, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_1

    iget-object v5, v1, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v5, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "folder"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string/jumbo p3, "\u79fb\u52d5\u5148\u306b\u767b\u9332\u6e08\u307f\u3067\u3059"

    const-string v0, "Already registered at destination"

    const-string/jumbo v1, "\u76ee\u7684\u5730\u5df2\u6709\u6b64\u5f71\u7247"

    invoke-static {p2, p3, v0, v1}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_1

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p1, Le/e/a/PlaylistTransfer100;->moves:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p2, p3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p1, Le/e/a/PlaylistTransfer100;->order:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    goto :goto_1

    :cond_2
    new-instance p1, Lorg/json/JSONException;

    const-string p2, "Missing source"

    invoke-direct {p1, p2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->error(Le/e/a/LocalPlaylists$Page;)V

    :cond_3
    :goto_1
    return-void
.end method

.method static synthetic lambda$installVideoDrop$16(Le/e/a/LocalPlaylists$Page;Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 7

    .line 54
    invoke-virtual {p2}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    instance-of v3, v0, Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v3, v1, Le/e/a/PlaylistTransfer100;->order:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    if-nez v3, :cond_0

    invoke-virtual {p2}, Landroid/view/DragEvent;->getAction()I

    move-result p2

    const/4 v3, 0x1

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p0

    const p2, 0xffffff

    and-int/2addr p0, p2

    const/high16 p2, 0x44000000    # 512.0f

    or-int/2addr p0, p2

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    check-cast v0, Ljava/lang/String;

    iget-object p1, v1, Le/e/a/PlaylistTransfer100;->owner:Ljava/lang/String;

    new-instance p2, Le/e/a/PlaylistTransfer100$7;

    invoke-direct {p2, p0, v1, v0}, Le/e/a/PlaylistTransfer100$7;-><init>(Le/e/a/LocalPlaylists$Page;Le/e/a/PlaylistTransfer100;Ljava/lang/String;)V

    invoke-static {p0, p1, p2}, Le/e/a/PlaylistTransfer100;->pickPlaylist(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/util/function/Consumer;)V

    :goto_0
    return v3

    :cond_0
    return v2

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method static synthetic lambda$pick$0(Ljava/util/function/Consumer;Ljava/util/List;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 25
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$pickPlaylist$1([Ljava/lang/String;Ljava/util/function/Consumer;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 33
    const/4 p2, 0x0

    aget-object p3, p0, p2

    if-eqz p3, :cond_0

    aget-object p0, p0, p2

    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$pickPlaylist$2([Ljava/lang/String;Ljava/util/ArrayList;Landroid/app/AlertDialog;Ljava/util/ArrayList;Landroid/widget/ExpandableListView;Landroid/widget/Button;Landroid/widget/ExpandableListView;Landroid/view/View;IIJ)Z
    .registers 12

    .line 33
    invoke-virtual {p1, p8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-interface {p1, p9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const/4 p6, 0x0

    aput-object p1, p0, p6

    invoke-virtual {p3, p8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    invoke-interface {p0, p9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    const-string p1, "title"

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/CharSequence;

    invoke-virtual {p2, p0}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    invoke-static {p8, p9}, Landroid/widget/ExpandableListView;->getPackedPositionForChild(II)J

    move-result-wide p0

    invoke-virtual {p4, p0, p1}, Landroid/widget/ExpandableListView;->getFlatListPosition(J)I

    move-result p0

    const/4 p1, 0x1

    invoke-virtual {p4, p0, p1}, Landroid/widget/ExpandableListView;->setItemChecked(IZ)V

    invoke-virtual {p5, p1}, Landroid/widget/Button;->setEnabled(Z)V

    return p1
.end method

.method static synthetic lambda$single$9(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 44
    invoke-static {p0, p1}, Le/e/a/PlaylistTransfer100;->active(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-nez p1, :cond_2

    iget-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    if-nez p1, :cond_2

    const/4 p1, 0x2

    const/4 p3, 0x1

    if-ne p4, p1, :cond_0

    iput-boolean p3, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    invoke-virtual {p0, p2}, Le/e/a/LocalPlaylists$Page;->toggle(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    if-eq p4, p3, :cond_1

    const/4 p3, 0x0

    :cond_1
    invoke-static {p0, p1, p3}, Le/e/a/PlaylistTransfer100;->immediate(Le/e/a/LocalPlaylists$Page;Ljava/util/List;Z)V

    :cond_2
    :goto_0
    return-void
.end method

.method static moveCatalog(Lorg/json/JSONArray;Lorg/json/JSONArray;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Lorg/json/JSONArray;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 12
    invoke-static {p0, p4}, Le/e/a/PlaylistTransfer100;->dest(Lorg/json/JSONArray;Ljava/lang/String;)Z

    move-result p0

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p0, :cond_0

    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    move-result p0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    if-ne p0, v2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->require(Z)V

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "group"

    if-eqz v2, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {p1, v2}, Le/e/a/PlaylistTransfer100;->find(Lorg/json/JSONArray;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_1

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    goto :goto_2

    :cond_1
    const/4 v2, 0x0

    :goto_2
    invoke-static {v2}, Le/e/a/PlaylistTransfer100;->require(Z)V

    goto :goto_1

    :cond_2
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-static {p1, p2}, Le/e/a/PlaylistTransfer100;->find(Lorg/json/JSONArray;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    invoke-virtual {p2, v3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3

    :cond_3
    return-void
.end method

.method static moveCatalogMenu(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;)V
    .registers 5

    .line 39
    :try_start_0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/LocalPlaylists;->read(Landroid/content/Context;)Le/e/a/LocalPlaylistData;

    move-result-object v0

    iget-object v0, v0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-static {v0, p1}, Le/e/a/PlaylistTransfer100;->find(Lorg/json/JSONArray;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->error(Le/e/a/LocalPlaylists$Page;)V

    goto :goto_0

    :cond_0
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    const-string v1, "group"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Le/e/a/PlaylistTransfer100;->catalogMove(Le/e/a/LocalPlaylists$Page;Ljava/util/List;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->error(Le/e/a/LocalPlaylists$Page;)V

    :goto_0
    return-void
.end method

.method static pick(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/function/Consumer;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Le/e/a/LocalPlaylists$Page;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 25
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string p2, "No destination available"

    const-string/jumbo p3, "\u6c92\u6709\u53ef\u7528\u7684\u76ee\u7684\u5730"

    const-string/jumbo p4, "\u79fb\u52d5\u5148\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-static {p0, p4, p2, p3}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/String;

    invoke-interface {p3, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p3

    check-cast p3, [Ljava/lang/CharSequence;

    new-instance v0, Le/e/a/PlaylistTransfer100$9;

    invoke-direct {v0, p4, p2}, Le/e/a/PlaylistTransfer100$9;-><init>(Ljava/util/function/Consumer;Ljava/util/List;)V

    invoke-virtual {p1, p3, v0}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->cancel(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x0

    invoke-virtual {p1, p0, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method static pickGroup(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/util/function/Consumer;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Le/e/a/LocalPlaylists$Page;",
            "Ljava/lang/String;",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 24
    :try_start_0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/LocalPlaylists;->read(Landroid/content/Context;)Le/e/a/LocalPlaylistData;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, ""

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v3, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v4, "\u30d5\u30a9\u30eb\u30c0\u30fc\u672a\u5206\u985e"

    const-string v5, "Unfiled"

    const-string/jumbo v6, "\u672a\u5206\u985e"

    invoke-static {v3, v4, v5, v6}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    const/4 v3, 0x0

    :goto_0
    iget-object v4, v0, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_2

    iget-object v4, v0, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "id"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v5, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v6, v0, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-static {v5, v4, v6}, Le/e/a/PlaylistTransfer100;->label(Landroid/content/Context;Lorg/json/JSONObject;Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string/jumbo v0, "\u79fb\u52d5\u5148\u306e\u30d5\u30a9\u30eb\u30c0\u30fc\u3092\u9078\u629e"

    const-string v3, "Choose destination folder"

    const-string/jumbo v4, "\u9078\u64c7\u76ee\u7684\u8cc7\u6599\u593e"

    invoke-static {p1, v0, v3, v4}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v1, v2, p2}, Le/e/a/PlaylistTransfer100;->pick(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/function/Consumer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->error(Le/e/a/LocalPlaylists$Page;)V

    :goto_1
    return-void
.end method

.method static pickPlaylist(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/util/function/Consumer;)V
    .registers 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Le/e/a/LocalPlaylists$Page;",
            "Ljava/lang/String;",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 27
    move-object/from16 v1, p0

    move-object/from16 v0, p1

    const-string v2, ""

    :try_start_0
    iget-object v3, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v3}, Le/e/a/LocalPlaylists;->read(Landroid/content/Context;)Le/e/a/LocalPlaylistData;

    move-result-object v3

    iget-boolean v4, v1, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-eqz v4, :cond_0

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    if-eqz v4, :cond_0

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    iget-object v4, v4, Le/e/a/PlaylistTransfer100;->owner:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    invoke-virtual {v4, v3}, Le/e/a/PlaylistTransfer100;->apply(Le/e/a/LocalPlaylistData;)V

    .line 28
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v6, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v7, "\u30d5\u30a9\u30eb\u30c0\u30fc\u672a\u5206\u985e"

    const-string v8, "Unfiled"

    const-string/jumbo v9, "\u672a\u5206\u985e"

    invoke-static {v6, v7, v8, v9}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v7, 0x0

    :goto_0
    iget-object v8, v3, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v9, "id"

    if-ge v7, v8, :cond_1

    :try_start_1
    iget-object v8, v3, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v8, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v9, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v10, v3, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-static {v9, v8, v10}, Le/e/a/PlaylistTransfer100;->label(Landroid/content/Context;Lorg/json/JSONObject;Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 29
    :cond_1
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 30
    const/4 v8, 0x0

    const/4 v11, 0x0

    :goto_1
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v12
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const-string v13, "title"

    if-ge v8, v12, :cond_7

    :try_start_2
    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v16, v4

    const/4 v4, 0x0

    :goto_2
    move/from16 v17, v11

    iget-object v11, v3, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v4, v11, :cond_5

    iget-object v11, v3, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v11, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    if-eqz v11, :cond_4

    move/from16 v19, v4

    const-string v4, "group"

    invoke-virtual {v11, v4, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {v11, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    move-object/from16 v20, v2

    move-object/from16 v21, v9

    move-object/from16 v22, v12

    goto :goto_4

    :cond_2
    invoke-virtual {v11, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v20, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v21, v9

    iget-object v9, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    move-object/from16 v22, v12

    iget-object v12, v3, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-static {v9, v11, v12}, Le/e/a/PlaylistTransfer100;->label(Landroid/content/Context;Lorg/json/JSONObject;Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v9, " \u00b7 "

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v9, v3, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-static {v9, v4}, Le/e/a/PlaylistTransfer100;->count(Lorg/json/JSONArray;Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v13, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_3
    move-object/from16 v20, v2

    goto :goto_3

    :cond_4
    move-object/from16 v20, v2

    move/from16 v19, v4

    :goto_3
    move-object/from16 v21, v9

    move-object/from16 v22, v12

    :goto_4
    add-int/lit8 v4, v19, 0x1

    move-object/from16 v0, p1

    move/from16 v11, v17

    move-object/from16 v2, v20

    move-object/from16 v9, v21

    move-object/from16 v12, v22

    goto/16 :goto_2

    :cond_5
    move-object/from16 v20, v2

    move-object/from16 v21, v9

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_6

    move/from16 v11, v17

    goto :goto_5

    :cond_6
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " ("

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ")"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v13, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int v11, v17, v0

    :goto_5
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p1

    move-object/from16 v4, v16

    move-object/from16 v2, v20

    move-object/from16 v9, v21

    goto/16 :goto_1

    .line 31
    :cond_7
    move/from16 v17, v11

    if-nez v17, :cond_8

    iget-object v0, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v2, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string/jumbo v3, "\u79fb\u52d5\u5148\u304c\u3042\u308a\u307e\u305b\u3093"

    const-string v4, "No destination available"

    const-string/jumbo v5, "\u6c92\u6709\u53ef\u7528\u7684\u76ee\u7684\u5730"

    invoke-static {v2, v3, v4, v5}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    .line 32
    :cond_8
    iget-object v0, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v9

    new-instance v0, Landroid/widget/ExpandableListView;

    invoke-direct {v0, v9}, Landroid/widget/ExpandableListView;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/widget/ExpandableListView;->setChoiceMode(I)V

    new-array v12, v2, [Ljava/lang/String;

    const/16 v18, 0x0

    aput-object v13, v12, v18

    const v3, 0x1020014

    filled-new-array {v3}, [I

    move-result-object v13

    new-instance v8, Landroid/widget/SimpleExpandableListAdapter;

    const v11, 0x1090006

    const v15, 0x1090006

    move-object/from16 v16, v12

    move-object/from16 v17, v13

    invoke-direct/range {v8 .. v17}, Landroid/widget/SimpleExpandableListAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[ILjava/util/List;I[Ljava/lang/String;[I)V

    invoke-virtual {v0, v8}, Landroid/widget/ExpandableListView;->setAdapter(Landroid/widget/ExpandableListAdapter;)V

    .line 33
    new-array v12, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const/16 v18, 0x0

    aput-object v3, v12, v18

    invoke-static {v9}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    iget-object v5, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string/jumbo v6, "\u79fb\u52d5\u5148\u306e\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u3092\u9078\u629e"

    const-string v8, "Choose destination playlist"

    const-string/jumbo v9, "\u9078\u64c7\u76ee\u7684\u64ad\u653e\u6e05\u55ae"

    invoke-static {v5, v6, v8, v9}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    iget-object v5, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v5}, Le/e/a/PlaylistTransfer100;->cancel(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string/jumbo v5, "\u6c7a\u5b9a"

    const-string v6, "Confirm"

    const-string/jumbo v8, "\u78ba\u5b9a"

    invoke-static {v4, v5, v6, v8}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Le/e/a/PlaylistTransfer100$1;

    move-object/from16 v6, p2

    invoke-direct {v5, v12, v6}, Le/e/a/PlaylistTransfer100$1;-><init>([Ljava/lang/String;Ljava/util/function/Consumer;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    invoke-static {v3}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setEnabled(Z)V

    new-instance v11, Le/e/a/PlaylistTransfer100$2;

    move-object/from16 v16, v0

    move-object/from16 v17, v4

    move-object v13, v7

    move-object v15, v14

    move-object v14, v3

    invoke-direct/range {v11 .. v17}, Le/e/a/PlaylistTransfer100$2;-><init>([Ljava/lang/String;Ljava/util/ArrayList;Landroid/app/AlertDialog;Ljava/util/ArrayList;Landroid/widget/ExpandableListView;Landroid/widget/Button;)V

    invoke-virtual {v0, v11}, Landroid/widget/ExpandableListView;->setOnChildClickListener(Landroid/widget/ExpandableListView$OnChildClickListener;)V

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v3, v2, :cond_9

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/widget/ExpandableListView;->expandGroup(I)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 34
    :cond_9
    goto :goto_6

    :catch_0
    move-exception v0

    invoke-static {v1}, Le/e/a/PlaylistTransfer100;->error(Le/e/a/LocalPlaylists$Page;)V

    :goto_6
    return-void
.end method

.method static preview(Le/e/a/LocalPlaylists$Page;Le/e/a/LocalPlaylistData;)Le/e/a/LocalPlaylistData;
    .registers 6

    .line 51
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    iget-object v3, v3, Le/e/a/PlaylistTransfer100;->owner:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object v1, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    iput-boolean v2, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    return-object p1

    :cond_0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    if-nez v0, :cond_1

    new-instance v0, Le/e/a/PlaylistTransfer100;

    invoke-direct {v0, p0, p1}, Le/e/a/PlaylistTransfer100;-><init>(Le/e/a/LocalPlaylists$Page;Le/e/a/LocalPlaylistData;)V

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    :cond_1
    const/4 v0, 0x3

    iput v0, p0, Le/e/a/LocalPlaylists$Page;->sort:I

    :try_start_0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    invoke-virtual {v0, p1}, Le/e/a/PlaylistTransfer100;->apply(Le/e/a/LocalPlaylistData;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->error(Le/e/a/LocalPlaylists$Page;)V

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    iget p1, p1, Le/e/a/PlaylistTransfer100;->previousSort:I

    iput p1, p0, Le/e/a/LocalPlaylists$Page;->sort:I

    iput-object v1, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    iput-boolean v2, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {p0}, Le/e/a/LocalPlaylists;->read(Landroid/content/Context;)Le/e/a/LocalPlaylistData;

    move-result-object p0

    return-object p0

    :cond_2
    iput-object v1, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    return-object p1
.end method

.method static refresh(Le/e/a/LocalPlaylists$Page;)V
    .registers 2

    .line 36
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/LocalePatch215;->isActivePlaylist(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_0
    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->refreshOthers(Le/e/a/LocalPlaylists$Page;)V

    return-void
.end method

.method static refreshOthers(Le/e/a/LocalPlaylists$Page;)V
    .registers 4

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Le/e/a/LocalPlaylists;->PAGES:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/LocalPlaylists$Page;

    if-eq v1, p0, :cond_0

    if-eqz v1, :cond_0

    iget-boolean v2, v1, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-nez v2, :cond_0

    iget-boolean v2, v1, Le/e/a/LocalPlaylists$Page;->selecting:Z

    if-nez v2, :cond_0

    iget-object v2, v1, Le/e/a/LocalPlaylists$Page;->catalog98:Le/e/a/CatalogReorder98;

    if-eqz v2, :cond_1

    iget-object v2, v1, Le/e/a/LocalPlaylists$Page;->catalog98:Le/e/a/CatalogReorder98;

    iget-boolean v2, v2, Le/e/a/CatalogReorder98;->selecting:Z

    if-nez v2, :cond_0

    :cond_1
    iget-object v2, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/LocalePatch215;->isActivePlaylist(Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Le/e/a/LocalPlaylists$Page;->render()V

    goto :goto_0

    :cond_2
    return-void
.end method

.method static reorder(Le/e/a/LocalPlaylists$Page;Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Le/e/a/LocalPlaylists$Page;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->video100:Le/e/a/PlaylistTransfer100;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    if-nez v1, :cond_0

    iget-object v1, v0, Le/e/a/PlaylistTransfer100;->owner:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/util/HashSet;

    iget-object v2, v0, Le/e/a/PlaylistTransfer100;->order:Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Le/e/a/PlaylistTransfer100;->order:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v0, v0, Le/e/a/PlaylistTransfer100;->order:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_0
    return-void
.end method

.method static reorderVideos(Lorg/json/JSONArray;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 21
    const-string v0, "folder"

    invoke-static {p0, v0, p1}, Le/e/a/PlaylistTransfer100;->ids(Lorg/json/JSONArray;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v3

    if-ne v1, v3, :cond_0

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/HashSet;->size()I

    move-result v1

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    if-ne v1, v3, :cond_0

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, p3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/HashSet;->size()I

    move-result v1

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v3

    if-ne v1, v3, :cond_0

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2, p3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1, p2}, Ljava/util/HashSet;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-static {p2}, Le/e/a/PlaylistTransfer100;->require(Z)V

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const/4 v3, 0x0

    :goto_1
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_2

    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v5, "id"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge v2, p1, :cond_3

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_3
    return-void
.end method

.method static require(Z)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 11
    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Lorg/json/JSONException;

    const-string v0, "Playlist membership changed"

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static selected(Le/e/a/LocalPlaylists$Page;Z)V
    .registers 8

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONObject;

    iget-object v3, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    const-string v4, "id"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-static {p0, v0, p1}, Le/e/a/PlaylistTransfer100;->immediate(Le/e/a/LocalPlaylists$Page;Ljava/util/List;Z)V

    return-void
.end method

.method static single(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;)V
    .registers 9

    .line 44
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Move"

    const-string/jumbo v3, "\u79fb\u52d5"

    invoke-static {v1, v3, v2, v3}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Copy"

    const-string/jumbo v4, "\u8907\u88fd"

    const-string v5, "\u30b3\u30d4\u30fc"

    invoke-static {v1, v5, v3, v4}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "Select multiple"

    const-string/jumbo v5, "\u9078\u53d6\u591a\u500b"

    const-string/jumbo v6, "\u8907\u6570\u9078\u629e"

    invoke-static {v1, v6, v4, v5}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    const/4 v2, 0x1

    aput-object v3, v5, v2

    const/4 v2, 0x2

    aput-object v4, v5, v2

    invoke-static {v1}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Le/e/a/PlaylistTransfer100$8;

    invoke-direct {v3, p0, v0, p1}, Le/e/a/PlaylistTransfer100$8;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v5, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-static {v1}, Le/e/a/PlaylistTransfer100;->cancel(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    :cond_0
    return-void
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 7
    invoke-static {p0, p1, p2, p3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static transfer(Lorg/json/JSONArray;Lorg/json/JSONArray;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Z)I
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Lorg/json/JSONArray;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 15
    invoke-static {p0, p4}, Le/e/a/PlaylistTransfer100;->dest(Lorg/json/JSONArray;Ljava/lang/String;)Z

    move-result p0

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p0, :cond_0

    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    move-result p0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    if-ne p0, v2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->require(Z)V

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 16
    const/4 v4, 0x0

    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v5

    const-string v6, ""

    const-string v7, "videoId"

    const-string v8, "folder"

    const-string v9, "id"

    if-ge v4, v5, :cond_2

    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v9

    invoke-static {v9}, Le/e/a/PlaylistTransfer100;->require(Z)V

    invoke-virtual {v5, v8, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 17
    :cond_2
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {p1, v4}, Le/e/a/PlaylistTransfer100;->find(Lorg/json/JSONArray;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_3

    invoke-virtual {v4, v8, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    const/4 v5, 0x1

    goto :goto_3

    :cond_3
    const/4 v5, 0x0

    :goto_3
    invoke-static {v5}, Le/e/a/PlaylistTransfer100;->require(Z)V

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 18
    :cond_4
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    new-instance p3, Ljava/util/HashSet;

    invoke-direct {p3}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_5
    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    new-instance v4, Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v8, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz p5, :cond_7

    :cond_6
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-virtual {v4, v9, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_5

    :cond_7
    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :goto_5
    invoke-virtual {p2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 19
    :cond_8
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p0

    sub-int/2addr p0, v1

    :goto_6
    if-ltz p0, :cond_a

    invoke-virtual {p1, p0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p4

    invoke-virtual {p4, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_9

    invoke-virtual {p1, p0}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    :cond_9
    add-int/lit8 p0, p0, -0x1

    goto :goto_6

    :cond_a
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_7
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lorg/json/JSONObject;

    invoke-virtual {p1, p3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_7

    :cond_b
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method static zone(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;
    .registers 6

    .line 55
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "\n"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "Drag here"

    const-string v2, "\u62d6\u66f3\u5230\u6b64"

    const-string v3, "\u3053\u3053\u306b\u30c9\u30e9\u30c3\u30b0"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PlaylistTransfer100;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 p0, 0x11

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 p0, 0x41600000    # 14.0f

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    return-object v0
.end method


# virtual methods
.method apply(Le/e/a/LocalPlaylistData;)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 52
    iget-object v0, p1, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    iget-object v1, p0, Le/e/a/PlaylistTransfer100;->owner:Ljava/lang/String;

    invoke-static {v0, v1}, Le/e/a/PlaylistTransfer100;->dest(Lorg/json/JSONArray;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p1, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    const-string v3, "folder"

    iget-object v4, p0, Le/e/a/PlaylistTransfer100;->owner:Ljava/lang/String;

    invoke-static {v0, v3, v4}, Le/e/a/PlaylistTransfer100;->ids(Lorg/json/JSONArray;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v3, p0, Le/e/a/PlaylistTransfer100;->base:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Le/e/a/PlaylistTransfer100;->require(Z)V

    new-instance v0, Ljava/util/ArrayList;

    iget-object v3, p0, Le/e/a/PlaylistTransfer100;->order:Ljava/util/ArrayList;

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v3, p0, Le/e/a/PlaylistTransfer100;->moves:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    new-instance v3, Ljava/util/HashSet;

    iget-object v4, p0, Le/e/a/PlaylistTransfer100;->base:Ljava/util/ArrayList;

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v3}, Ljava/util/HashSet;->size()I

    move-result v3

    iget-object v4, p0, Le/e/a/PlaylistTransfer100;->base:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ne v3, v4, :cond_1

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v3}, Ljava/util/HashSet;->size()I

    move-result v3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ne v3, v4, :cond_1

    new-instance v3, Ljava/util/HashSet;

    iget-object v4, p0, Le/e/a/PlaylistTransfer100;->base:Ljava/util/ArrayList;

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    invoke-static {v3}, Le/e/a/PlaylistTransfer100;->require(Z)V

    iget-object v3, p0, Le/e/a/PlaylistTransfer100;->moves:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    iget-object v5, p1, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v5, v6}, Le/e/a/PlaylistTransfer100;->dest(Lorg/json/JSONArray;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Le/e/a/PlaylistTransfer100;->owner:Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const/4 v4, 0x1

    goto :goto_3

    :cond_2
    const/4 v4, 0x0

    :goto_3
    invoke-static {v4}, Le/e/a/PlaylistTransfer100;->require(Z)V

    goto :goto_2

    :cond_3
    iget-object v3, p1, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    iget-object v4, p0, Le/e/a/PlaylistTransfer100;->owner:Ljava/lang/String;

    iget-object v5, p0, Le/e/a/PlaylistTransfer100;->base:Ljava/util/ArrayList;

    invoke-static {v3, v4, v5, v0}, Le/e/a/PlaylistTransfer100;->reorderVideos(Lorg/json/JSONArray;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    iget-object v0, p0, Le/e/a/PlaylistTransfer100;->moves:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    iget-object v4, p1, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    iget-object v5, p1, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    iget-object v7, p0, Le/e/a/PlaylistTransfer100;->owner:Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    move-object v8, v3

    check-cast v8, Ljava/lang/String;

    const/4 v9, 0x0

    invoke-static/range {v4 .. v9}, Le/e/a/PlaylistTransfer100;->transfer(Lorg/json/JSONArray;Lorg/json/JSONArray;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Z)I

    move-result v3

    if-ne v3, v2, :cond_4

    const/4 v3, 0x1

    goto :goto_5

    :cond_4
    const/4 v3, 0x0

    :goto_5
    invoke-static {v3}, Le/e/a/PlaylistTransfer100;->require(Z)V

    goto :goto_4

    :cond_5
    return-void
.end method

.method changed()Z
    .registers 3

    .line 49
    iget-object v0, p0, Le/e/a/PlaylistTransfer100;->moves:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/PlaylistTransfer100;->base:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/PlaylistTransfer100;->order:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0
.end method
