.class final Le/e/a/LocalPlaylists$Page;
.super Ljava/lang/Object;
.source "LocalPlaylists.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/LocalPlaylists;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Page"
.end annotation


# instance fields
.field final a:Landroid/app/Activity;

.field catalog98:Le/e/a/CatalogReorder98;

.field continuous:Z

.field count:Landroid/widget/TextView;

.field createPopup:Landroid/widget/PopupWindow;

.field display:Landroid/widget/BaseAdapter;

.field folder:Ljava/lang/String;

.field footer:Landroid/widget/LinearLayout;

.field group:Ljava/lang/String;

.field images:Ljava/lang/Object;

.field reorderSaving:Z

.field reordering:Z

.field final root:Landroid/widget/LinearLayout;

.field final selected:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field selecting:Z

.field shuffle:Z

.field sort:I

.field sortFolder:Ljava/lang/String;

.field video100:Le/e/a/PlaylistTransfer100;

.field videoList:Landroid/widget/ListView;

.field visible:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 6

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->sortFolder:Ljava/lang/String;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    .line 68
    iput-object p1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    .line 69
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 70
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "nicoid_playlist_folder"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 71
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 72
    :cond_0
    const-string v2, "nicoid_local_playlist_last_folder_v1"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 70
    :goto_0
    iput-object v2, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    .line 73
    const-string v2, "nicoid_local_playlist_last_group_v1"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    .line 74
    invoke-static {p1}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object p1

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-static {p1}, Le/e/a/TabViewport110;->fill(Landroid/view/View;)V

    invoke-static {p1}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$10(ZLjava/lang/String;Ljava/lang/String;Le/e/a/LocalPlaylistData;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-eqz p0, :cond_0

    .line 209
    invoke-virtual {p3, p1}, Le/e/a/LocalPlaylistData;->group(Ljava/lang/String;)Ljava/lang/String;

    return-void

    :cond_0
    invoke-virtual {p3, p1}, Le/e/a/LocalPlaylistData;->folder(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p2, :cond_1

    const-string p1, "@unfiled"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {p3, p0, p2}, Le/e/a/LocalPlaylistData;->movePlaylist(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method static synthetic lambda$20(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 218
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$21(Ljava/lang/Runnable;Landroid/view/View;)Z
    .registers 2

    .line 218
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$24(ZLjava/lang/String;Ljava/lang/String;Le/e/a/LocalPlaylistData;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-eqz p0, :cond_0

    .line 219
    iget-object p0, p3, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    goto :goto_0

    :cond_0
    iget-object p0, p3, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    :goto_0
    const/4 p3, 0x0

    :goto_1
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lt p3, v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0, p3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0, p3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "name"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_2
    add-int/lit8 p3, p3, 0x1

    goto :goto_1
.end method

.method static synthetic lambda$27(Ljava/lang/String;Ljava/util/List;ILe/e/a/LocalPlaylistData;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 219
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p3, p0, p1}, Le/e/a/LocalPlaylistData;->movePlaylist(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$30(Ljava/lang/String;Le/e/a/LocalPlaylistData;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 219
    invoke-virtual {p1, p0}, Le/e/a/LocalPlaylistData;->removeGroup(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$36(Ljava/util/Set;Ljava/lang/String;Le/e/a/LocalPlaylistData;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 226
    invoke-virtual {p2, p0, p1}, Le/e/a/LocalPlaylistData;->move(Ljava/util/Set;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$40(Ljava/util/Set;Le/e/a/LocalPlaylistData;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 230
    invoke-virtual {p1, p0}, Le/e/a/LocalPlaylistData;->delete(Ljava/util/Set;)V

    return-void
.end method

.method static synthetic lambda$7(Ljava/lang/String;Ljava/util/ArrayList;Le/e/a/LocalPlaylistData;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 197
    invoke-static {p2, p0, p1}, Le/e/a/LocalPlaylists;->reorderFolder(Le/e/a/LocalPlaylistData;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 4

    .line 231
    invoke-static {p1, p2, p3}, Le/e/a/BulkSelection;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method canRefresh243()Z
    .registers 2

    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method catalog(Le/e/a/LocalPlaylistData;)V
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v7, p1

    .line 212
    iget-object v1, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Playlists"

    const-string/jumbo v3, "\u64ad\u653e\u6e05\u55ae"

    const-string v4, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u4e00\u89a7"

    invoke-static {v1, v4, v2, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    const-string v8, "@unfiled"

    if-eqz v2, :cond_0

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, v0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    invoke-virtual {v7, v2}, Le/e/a/LocalPlaylistData;->hasGroup(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x0

    iput-object v2, v0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    :cond_0
    const/4 v9, 0x0

    move v2, v9

    :goto_0
    iget-object v3, v7, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    const-string v10, "name"

    const-string v11, "id"

    if-lt v2, v3, :cond_11

    invoke-virtual {v0, v1}, Le/e/a/LocalPlaylists$Page;->toolbar(Ljava/lang/String;)V

    new-instance v12, Landroid/widget/FrameLayout;

    iget-object v1, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v12, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/ScrollView;

    iget-object v2, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v13, 0x1

    invoke-virtual {v1, v13}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    iget-object v2, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    iget-object v3, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v4, 0xc

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    iget-object v5, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v5, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    iget-object v5, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v6, 0x58

    invoke-static {v5, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v2, v3, v9, v4, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v14, -0x1

    invoke-direct {v3, v14, v14}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-static {v0, v12, v1, v3}, Le/e/a/LocalRefresh243;->add(Le/e/a/LocalPlaylists$Page;Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 213
    iget-object v1, v0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    const-string v15, "folder"

    const-string v3, "group"

    if-nez v1, :cond_9

    move v1, v9

    move v4, v1

    :goto_1
    iget-object v5, v7, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lt v1, v5, :cond_7

    move v1, v9

    move v5, v1

    :goto_2
    iget-object v6, v7, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v1, v6, :cond_5

    if-lez v4, :cond_1

    move v1, v13

    goto :goto_3

    :cond_1
    move v1, v9

    :goto_3
    add-int/2addr v5, v1

    iget-object v1, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v4, "Unfiled"

    const-string/jumbo v6, "\u672a\u5206\u985e"

    const-string v13, "\u30d5\u30a9\u30eb\u30c0\u30fc\u672a\u5206\u985e"

    invoke-static {v1, v13, v4, v6}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v6, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v13, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8 "

    const-string v14, "Playlists: "

    const-string/jumbo v9, "\u64ad\u653e\u6e05\u55ae "

    invoke-static {v6, v13, v14, v9}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Le/e/a/LocalPlaylists$Page$17;

    invoke-direct {v5, v0}, Le/e/a/LocalPlaylists$Page$17;-><init>(Le/e/a/LocalPlaylists$Page;)V

    const/4 v6, 0x0

    move-object/from16 v18, v3

    move-object v3, v1

    move-object v1, v2

    const-string v2, "folder"

    move-object/from16 v19, v12

    move-object/from16 v12, v18

    invoke-virtual/range {v0 .. v6}, Le/e/a/LocalPlaylists$Page;->catalogRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    const/4 v2, 0x0

    :goto_4
    iget-object v3, v7, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v2, v3, :cond_2

    move-object v2, v1

    goto/16 :goto_6

    :cond_2
    iget-object v3, v7, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v18, v1

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_5
    iget-object v1, v7, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lt v4, v1, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v4, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v4, v13, v14, v9}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Le/e/a/LocalPlaylists$Page$18;

    invoke-direct {v5, v0, v6}, Le/e/a/LocalPlaylists$Page$18;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;)V

    new-instance v1, Le/e/a/LocalPlaylists$Page$19;

    invoke-direct {v1, v0, v6, v3}, Le/e/a/LocalPlaylists$Page$19;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/lang/String;)V

    move v6, v2

    const-string v2, "folder"

    move/from16 v20, v6

    move-object v6, v1

    move-object/from16 v1, v18

    move/from16 v18, v20

    invoke-virtual/range {v0 .. v6}, Le/e/a/LocalPlaylists$Page;->catalogRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    move-object v2, v1

    add-int/lit8 v1, v18, 0x1

    move-object/from16 v20, v2

    move v2, v1

    move-object/from16 v1, v20

    goto :goto_4

    :cond_3
    move-object/from16 v20, v18

    move/from16 v18, v2

    move-object/from16 v2, v20

    iget-object v1, v7, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    add-int/lit8 v5, v5, 0x1

    :cond_4
    add-int/lit8 v4, v4, 0x1

    move/from16 v20, v18

    move-object/from16 v18, v2

    move/from16 v2, v20

    goto :goto_5

    :cond_5
    move-object/from16 v19, v12

    move-object v12, v3

    iget-object v3, v7, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_6

    add-int/lit8 v5, v5, 0x1

    :cond_6
    add-int/lit8 v1, v1, 0x1

    move-object v3, v12

    move-object/from16 v12, v19

    const/4 v9, 0x0

    const/4 v13, 0x1

    goto/16 :goto_2

    :cond_7
    move-object/from16 v19, v12

    move-object v12, v3

    iget-object v3, v7, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_8

    add-int/lit8 v4, v4, 0x1

    :cond_8
    add-int/lit8 v1, v1, 0x1

    move-object v3, v12

    move-object/from16 v12, v19

    const/4 v9, 0x0

    const/4 v13, 0x1

    goto/16 :goto_1

    :cond_9
    move-object/from16 v19, v12

    move-object v12, v3

    :goto_6
    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 214
    :goto_7
    iget-object v4, v7, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v1, v4, :cond_f

    iget-object v1, v0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v9, ""

    if-eqz v1, :cond_a

    if-eqz v3, :cond_a

    iget-object v1, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v3, "Unfiled videos"

    const-string/jumbo v4, "\u672a\u5206\u985e\u5f71\u7247"

    const-string/jumbo v5, "\u672a\u5206\u985e\u306e\u52d5\u753b"

    invoke-static {v1, v5, v3, v4}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v7, v9}, Le/e/a/LocalPlaylists$Page;->videoCount(Le/e/a/LocalPlaylistData;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Le/e/a/LocalPlaylists$Page$20;

    invoke-direct {v5, v0}, Le/e/a/LocalPlaylists$Page$20;-><init>(Le/e/a/LocalPlaylists$Page;)V

    const/4 v6, 0x0

    move-object v1, v2

    const-string v2, "playlist"

    invoke-virtual/range {v0 .. v6}, Le/e/a/LocalPlaylists$Page;->catalogRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    goto :goto_8

    :cond_a
    move-object v1, v2

    :goto_8
    const/4 v13, 0x0

    .line 215
    :goto_9
    iget-object v2, v7, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v13, v2, :cond_c

    .line 216
    iget-object v1, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "+"

    invoke-static {v1, v2}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    const/high16 v2, 0x41f00000    # 30.0f

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextSize(F)V

    invoke-static {v1}, Le/e/a/Ui110;->circle(Landroid/view/View;)V

    iget-object v2, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v3

    const/16 v4, 0x64

    invoke-static {v2, v3, v4}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_b

    iget-object v2, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v2

    goto :goto_a

    :cond_b
    const v2, -0xefeeec

    :goto_a
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextColor(I)V

    iget-object v2, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v3, "Create"

    const-string v4, "\u5efa\u7acb"

    const-string/jumbo v5, "\u65b0\u898f\u4f5c\u6210"

    invoke-static {v2, v5, v3, v4}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v3, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v4, 0x38

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    iget-object v5, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v5, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const v5, 0x800055

    invoke-direct {v2, v3, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    iget-object v3, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v4, 0x14

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    iget-object v5, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v5, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/4 v14, 0x0

    invoke-virtual {v2, v14, v14, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    move-object/from16 v15, v19

    invoke-virtual {v15, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Le/e/a/LocalPlaylists$Page$23;

    invoke-direct {v2, v0, v1}, Le/e/a/LocalPlaylists$Page$23;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/Button;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v1 .. v1}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    iget-object v0, v0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, -0x1

    invoke-direct {v1, v3, v14, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v15, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static/range {p0 .. p1}, Le/e/a/CatalogReorder98;->attach(Le/e/a/LocalPlaylists$Page;Le/e/a/LocalPlaylistData;)V

    return-void

    :cond_c
    move-object/from16 v15, v19

    .line 215
    iget-object v2, v7, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v2, v13}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    iget-object v4, v0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    if-eqz v4, :cond_d

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_d

    iget-object v4, v0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    goto :goto_b

    :cond_d
    move-object v4, v9

    :goto_b
    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e

    invoke-virtual {v2, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v7, v4}, Le/e/a/LocalPlaylists$Page;->videoCount(Le/e/a/LocalPlaylistData;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v6, v5

    new-instance v5, Le/e/a/LocalPlaylists$Page$21;

    invoke-direct {v5, v0, v4}, Le/e/a/LocalPlaylists$Page$21;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;)V

    move-object/from16 v16, v6

    new-instance v6, Le/e/a/LocalPlaylists$Page$22;

    invoke-direct {v6, v0, v4, v2}, Le/e/a/LocalPlaylists$Page$22;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/lang/String;)V

    move-object v3, v2

    const-string v2, "playlist"

    move-object/from16 v4, v16

    invoke-virtual/range {v0 .. v6}, Le/e/a/LocalPlaylists$Page;->catalogRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    :cond_e
    move-object/from16 v18, v1

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v19, v15

    move-object/from16 v1, v18

    goto/16 :goto_9

    :cond_f
    move-object/from16 v18, v2

    .line 214
    iget-object v2, v7, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_10

    const/4 v3, 0x1

    :cond_10
    add-int/lit8 v1, v1, 0x1

    move-object/from16 v2, v18

    goto/16 :goto_7

    :cond_11
    move v14, v9

    .line 212
    iget-object v3, v7, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, v0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    iget-object v1, v7, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_12
    add-int/lit8 v2, v2, 0x1

    move v9, v14

    goto/16 :goto_0
.end method

.method catalogMoveFinished97(Ljava/lang/Boolean;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/LocalePatch215;->isActivePlaylist(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_0
    return-void
.end method

.method catalogRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .registers 14

    .line 218
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v3, 0x8

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    iget-object v4, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/4 v5, 0x4

    invoke-static {v4, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    iget-object v6, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v6, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    iget-object v6, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v6, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v0, v2, v4, v3, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v2, Le/e/a/Ui110$Glyph;

    iget-object v3, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v4, "playlist"

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    iget-object v5, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    if-eqz v4, :cond_0

    invoke-static {v5}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v4

    goto :goto_0

    :cond_0
    invoke-static {v5}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v4

    :goto_0
    invoke-direct {v2, v3, p2, v4}, Le/e/a/Ui110$Glyph;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v3, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v4, 0x20

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    iget-object v5, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v5, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {p2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {p2}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object p2

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v3, 0x12

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {p2, v2, v3, v3, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v2, p3, v1}, Le/e/a/Ui110;->compact(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p3

    const/4 v1, 0x1

    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p3, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p3, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v2, 0xc

    invoke-static {p3, p4, v2}, Le/e/a/Ui110;->compact(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p3

    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object p4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    const p4, 0x3f333333    # 0.7f

    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setAlpha(F)V

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p4, -0x2

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p3, v3, p4, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string p3, "\u203a"

    const/16 p4, 0x18

    invoke-static {p2, p3, p4}, Le/e/a/Ui110;->compact(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p2

    const p3, 0x3f266666    # 0.65f

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setAlpha(F)V

    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 p2, 0x3a

    invoke-static {p0, p2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    new-instance p0, Le/e/a/LocalPlaylists$Page$9;

    invoke-direct {p0, p5}, Le/e/a/LocalPlaylists$Page$9;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    if-eqz p6, :cond_1

    new-instance p0, Le/e/a/LocalPlaylists$Page$10;

    invoke-direct {p0, p6}, Le/e/a/LocalPlaylists$Page$10;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    :cond_1
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p1}, Le/e/a/PanelUi;->divider(Landroid/widget/LinearLayout;)V

    invoke-static {v0, p5}, Le/e/a/CatalogReorder98;->tag(Landroid/view/View;Ljava/lang/Runnable;)V

    return-void
.end method

.method createItem(Z)V
    .registers 8

    .line 209
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSingleLine(Z)V

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    if-eqz p1, :cond_0

    const-string v3, "Folder name"

    const-string/jumbo v4, "\u8cc7\u6599\u593e\u540d\u7a31"

    const-string v5, "\u30d5\u30a9\u30eb\u30c0\u30fc\u540d"

    goto :goto_0

    :cond_0
    const-string v3, "Playlist name"

    const-string/jumbo v4, "\u64ad\u653e\u6e05\u55ae\u540d\u7a31"

    const-string v5, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u540d"

    :goto_0
    invoke-static {v2, v5, v3, v4}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    if-eqz p1, :cond_1

    const-string v3, "Create folder"

    const-string v4, "\u5efa\u7acb\u8cc7\u6599\u593e"

    const-string v5, "\u30d5\u30a9\u30eb\u30c0\u30fc\u4f5c\u6210"

    goto :goto_1

    :cond_1
    const-string v3, "Create playlist"

    const-string v4, "\u5efa\u7acb\u64ad\u653e\u6e05\u55ae"

    const-string v5, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u4f5c\u6210"

    :goto_1
    invoke-static {v2, v5, v3, v4}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "\u4f5c\u6210"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlaybackSession;->showForm(Landroid/app/AlertDialog;)V

    const/4 v2, -0x1

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    new-instance v3, Le/e/a/LocalPlaylists$Page$28;

    invoke-direct {v3, p0, v1, v0, p1}, Le/e/a/LocalPlaylists$Page$28;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/EditText;Landroid/app/AlertDialog;Z)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v2 .. v2}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    return-void
.end method

.method createMenu(Landroid/view/View;)V
    .registers 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 211
    iget-object v2, v0, Le/e/a/LocalPlaylists$Page;->createPopup:Landroid/widget/PopupWindow;

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v0, v0, Le/e/a/LocalPlaylists$Page;->createPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    return-void

    :cond_0
    iget-object v2, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v3

    const/16 v4, 0x8

    invoke-static {v2, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    const/4 v6, 0x4

    invoke-static {v2, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {v2, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-static {v2, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v3, v5, v7, v8, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-static {v2}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v5

    const/16 v6, 0xc

    invoke-static {v2, v5, v6}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v5, Landroid/widget/PopupWindow;

    const/16 v7, 0xc4

    invoke-static {v2, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    const/4 v9, -0x2

    const/4 v10, 0x1

    invoke-direct {v5, v3, v8, v9, v10}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    iput-object v5, v0, Le/e/a/LocalPlaylists$Page;->createPopup:Landroid/widget/PopupWindow;

    invoke-static {v2}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v8

    invoke-static {v2, v8, v6}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v8

    invoke-virtual {v5, v8}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v5, v10}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    const/4 v8, 0x0

    invoke-virtual {v5, v8}, Landroid/widget/PopupWindow;->setElevation(F)V

    iget-object v8, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v9, "Create playlist"

    const-string v11, "\u5efa\u7acb\u64ad\u653e\u6e05\u55ae"

    const-string v12, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u4f5c\u6210"

    invoke-static {v8, v12, v9, v11}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v11, "Create folder"

    const-string v12, "\u5efa\u7acb\u8cc7\u6599\u593e"

    const-string v13, "\u30d5\u30a9\u30eb\u30c0\u30fc\u4f5c\u6210"

    invoke-static {v9, v13, v11, v12}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    filled-new-array {v8, v9}, [Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    move v11, v9

    :goto_0
    const/16 v12, 0x10

    const/4 v13, 0x2

    if-lt v11, v13, :cond_1

    invoke-static {v2, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    const/high16 v6, 0x40000000    # 2.0f

    invoke-static {v0, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-virtual {v3, v0, v9}, Landroid/widget/LinearLayout;->measure(II)V

    new-array v0, v13, [I

    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v1, v6}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    invoke-static {v2, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    const/16 v8, 0x78

    invoke-static {v2, v8}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    aget v11, v0, v9

    iget v13, v6, Landroid/graphics/Rect;->left:I

    sub-int/2addr v11, v13

    invoke-static {v2, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    sub-int/2addr v11, v12

    invoke-static {v8, v11}, Ljava/lang/Math;->max(II)I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-virtual {v5, v7}, Landroid/widget/PopupWindow;->setWidth(I)V

    iget v8, v6, Landroid/graphics/Rect;->left:I

    invoke-static {v2, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    add-int/2addr v8, v11

    aget v9, v0, v9

    sub-int/2addr v9, v7

    invoke-static {v2, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    sub-int/2addr v9, v7

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v7

    iget v8, v6, Landroid/graphics/Rect;->top:I

    invoke-static {v2, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    add-int/2addr v8, v9

    aget v0, v0, v10

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v9

    add-int/2addr v0, v9

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v9

    sub-int/2addr v0, v9

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v3

    sub-int/2addr v6, v3

    invoke-static {v2, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    sub-int/2addr v6, v2

    invoke-static {v0, v6}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v8, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v2, 0x33

    invoke-virtual {v5, v1, v2, v7, v0}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    return-void

    :cond_1
    if-ne v11, v10, :cond_2

    move v13, v10

    goto :goto_1

    :cond_2
    move v13, v9

    :goto_1
    aget-object v14, v8, v11

    const/16 v15, 0xe

    invoke-static {v2, v14, v15}, Le/e/a/Ui110;->compact(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v14

    invoke-virtual {v14, v12}, Landroid/widget/TextView;->setGravity(I)V

    invoke-static {v2, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-static {v2, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-virtual {v14, v12, v9, v15, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v15, 0x30

    invoke-static {v2, v15}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v15

    const/4 v4, -0x1

    invoke-direct {v12, v4, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v14, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Le/e/a/LocalPlaylists$Page$3;

    invoke-direct {v4, v0, v5, v13}, Le/e/a/LocalPlaylists$Page$3;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/PopupWindow;Z)V

    invoke-virtual {v14, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v14 .. v14}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    add-int/lit8 v11, v11, 0x1

    const/16 v4, 0x8

    goto/16 :goto_0
.end method

.method delete()V
    .registers 6

    .line 230
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Remove selected videos?"

    const-string v3, "\u522a\u9664\u6240\u9078\u5f71\u7247\uff1f"

    const-string/jumbo v4, "\u9078\u629e\u3057\u305f\u52d5\u753b\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {v1, v4, v2, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-static {p0, v1}, Le/e/a/BulkVideoActions215;->playlistDeleteMessage(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Delete"

    const-string v3, "\u522a\u9664"

    const-string v4, "\u524a\u9664"

    invoke-static {v1, v4, v2, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/LocalPlaylists$Page$31;

    invoke-direct {v2, p0}, Le/e/a/LocalPlaylists$Page$31;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v1, "Cancel"

    const-string v2, "\u53d6\u6d88"

    const-string v3, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p0, v3, v1, v2}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method deleteFolder()V
    .registers 7

    .line 228
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Playlist"

    const-string/jumbo v3, "\u64ad\u653e\u6e05\u55ae"

    const-string v4, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8"

    invoke-static {v1, v4, v2, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :try_start_0
    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/LocalPlaylists;->read(Landroid/content/Context;)Le/e/a/LocalPlaylistData;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v3, 0x0

    :goto_0
    iget-object v4, v2, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_0

    iget-object v4, v2, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "id"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string v1, "name"

    invoke-virtual {v4, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_0
    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v3, Le/e/a/LocalPlaylists$Page$32;

    invoke-direct {v3, p0}, Le/e/a/LocalPlaylists$Page$32;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {v2, v0, v1, v3}, Le/e/a/LocalPlaylists;->confirmFolderDelete(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_2
    return-void
.end method

.method disable(Landroid/view/View;)V
    .registers 4

    const/4 v0, 0x0

    .line 232
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setLongClickable(Z)V

    instance-of v1, p1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    check-cast p1, Landroid/view/ViewGroup;

    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Le/e/a/LocalPlaylists$Page;->disable(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method editCatalog(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 12

    .line 219
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v3

    const-string v0, "\u524a\u9664"

    const/4 v1, 0x2

    const/4 v2, 0x1

    const-string v4, "\u540d\u524d\u3092\u5909\u66f4"

    const/4 v5, 0x0

    if-eqz p3, :cond_0

    new-array v1, v1, [Ljava/lang/String;

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v5

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v2

    move-object v5, v1

    goto :goto_0

    :cond_0
    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/String;

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v6, v5

    const-string/jumbo v4, "\u79fb\u52d5"

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v6, v2

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v6, v1

    move-object v5, v6

    :goto_0
    invoke-static {v3}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Le/e/a/LocalPlaylists$Page$8;

    move-object v2, p0

    move-object v7, p1

    move-object v4, p2

    move v6, p3

    invoke-direct/range {v1 .. v7}, Le/e/a/LocalPlaylists$Page$8;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;ZLjava/lang/String;)V

    invoke-static {v3, v5, v6}, Le/e/a/TabFolderNav214;->localMenuItems(Landroid/content/Context;[Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v2, v7, v4, v6}, Le/e/a/TabFolderNav214;->localMenuListener(Landroid/content/DialogInterface$OnClickListener;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v5, v1}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method installDrag(Landroid/widget/ListView;)V
    .registers 4

    const/4 v0, 0x1

    .line 166
    new-array v0, v0, [J

    .line 167
    new-instance v1, Le/e/a/LocalPlaylists$Page$43;

    invoke-direct {v1, p0, v0, p1}, Le/e/a/LocalPlaylists$Page$43;-><init>(Le/e/a/LocalPlaylists$Page;[JLandroid/widget/ListView;)V

    invoke-static {p1, v1}, Le/e/a/ReorderMotion98;->installVideo(Landroid/view/View;Landroid/view/View$OnDragListener;)V

    return-void
.end method

.method synthetic lambda$0$e-e-a-LocalPlaylists$Page(Landroid/view/View;)V
    .registers 2

    .line 85
    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void
.end method

.method synthetic lambda$1$e-e-a-LocalPlaylists$Page(Landroid/view/View;)V
    .registers 3

    invoke-static {p0}, Le/e/a/PlaylistTransfer100;->finish(Le/e/a/LocalPlaylists$Page;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 117
    :cond_0
    iget-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    xor-int/lit8 v0, p1, 0x1

    iput-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-nez p1, :cond_1

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    :cond_1
    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void
.end method

.method synthetic lambda$11$e-e-a-LocalPlaylists$Page(Landroid/app/AlertDialog;Ljava/lang/Boolean;)V
    .registers 5

    .line 0
    const/4 v0, -0x1

    .line 209
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_0
    return-void
.end method

.method synthetic lambda$12$e-e-a-LocalPlaylists$Page(Landroid/widget/PopupWindow;ZLandroid/view/View;)V
    .registers 4

    .line 211
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    invoke-virtual {p0, p2}, Le/e/a/LocalPlaylists$Page;->createItem(Z)V

    return-void
.end method

.method synthetic lambda$13$e-e-a-LocalPlaylists$Page()V
    .registers 2

    .line 213
    const-string v0, "@unfiled"

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void
.end method

.method synthetic lambda$14$e-e-a-LocalPlaylists$Page(Ljava/lang/String;)V
    .registers 2

    .line 213
    iput-object p1, p0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void
.end method

.method synthetic lambda$15$e-e-a-LocalPlaylists$Page(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 0
    const/4 v0, 0x1

    .line 213
    invoke-virtual {p0, p1, p2, v0}, Le/e/a/LocalPlaylists$Page;->editCatalog(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method synthetic lambda$16$e-e-a-LocalPlaylists$Page()V
    .registers 2

    .line 214
    const-string v0, ""

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void
.end method

.method synthetic lambda$17$e-e-a-LocalPlaylists$Page(Ljava/lang/String;)V
    .registers 2

    .line 215
    iput-object p1, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void
.end method

.method synthetic lambda$18$e-e-a-LocalPlaylists$Page(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 0
    const/4 v0, 0x0

    .line 215
    invoke-virtual {p0, p1, p2, v0}, Le/e/a/LocalPlaylists$Page;->editCatalog(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method synthetic lambda$19$e-e-a-LocalPlaylists$Page(Landroid/widget/Button;Landroid/view/View;)V
    .registers 3

    .line 216
    invoke-virtual {p0, p1}, Le/e/a/LocalPlaylists$Page;->createMenu(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$2$e-e-a-LocalPlaylists$Page([ZLandroid/widget/CheckBox;Landroid/widget/CompoundButton;Z)V
    .registers 6

    .line 0
    const/4 p3, 0x0

    .line 118
    aget-boolean v0, p1, p3

    if-nez v0, :cond_0

    iput-boolean p4, p0, Le/e/a/LocalPlaylists$Page;->continuous:Z

    if-eqz p4, :cond_0

    iget-boolean p4, p0, Le/e/a/LocalPlaylists$Page;->shuffle:Z

    if-eqz p4, :cond_0

    const/4 p4, 0x1

    aput-boolean p4, p1, p3

    iput-boolean p3, p0, Le/e/a/LocalPlaylists$Page;->shuffle:Z

    invoke-virtual {p2, p3}, Landroid/widget/CheckBox;->setChecked(Z)V

    aput-boolean p3, p1, p3

    :cond_0
    return-void
.end method

.method synthetic lambda$22$e-e-a-LocalPlaylists$Page(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;ZLjava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 13

    const/4 v0, 0x2

    if-nez p4, :cond_0

    const/4 v0, 0x4

    :cond_0
    sub-int v1, p7, v0

    if-ltz v1, :cond_2

    const/4 v2, 0x1

    if-gt v1, v2, :cond_2

    if-nez v1, :cond_1

    const/4 v2, -0x1

    :cond_1
    invoke-virtual {p0, p4, p5, v2}, Le/e/a/LocalPlaylists$Page;->moveCatalog97(ZLjava/lang/String;I)V

    return-void

    :cond_2
    if-nez p4, :cond_3

    const/4 v0, 0x1

    if-ne p7, v0, :cond_3

    invoke-static {p0, p5}, Le/e/a/PlaylistTransfer100;->moveCatalogMenu(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;)V

    return-void

    .line 219
    :cond_3
    const-string p6, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object v2, p2

    if-nez p7, :cond_4

    new-instance p2, Landroid/widget/EditText;

    invoke-direct {p2, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    aget-object p3, p3, v1

    invoke-virtual {p1, p3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-static {p6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p3, "\u4fdd\u5b58"

    invoke-static {p3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-static {p1}, Le/e/a/PlaybackSession;->showForm(Landroid/app/AlertDialog;)V

    const/4 p3, -0x1

    invoke-virtual {p1, p3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p6

    move p3, p4

    move-object p4, p5

    move-object p5, p1

    move-object p1, p0

    new-instance p0, Le/e/a/LocalPlaylists$Page$24;

    invoke-direct/range {p0 .. p5}, Le/e/a/LocalPlaylists$Page$24;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/EditText;ZLjava/lang/String;Landroid/app/AlertDialog;)V

    invoke-virtual {p6, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {p6 .. p6}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    return-void

    :cond_4
    move p2, p4

    move-object p4, p5

    if-nez p2, :cond_7

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/4 p5, 0x1

    if-ne p7, p5, :cond_6

    invoke-static {p2}, Le/e/a/LocalPlaylists;->read(Landroid/content/Context;)Le/e/a/LocalPlaylistData;

    move-result-object p6

    new-instance p7, Ljava/util/ArrayList;

    invoke-direct {p7}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string p2, ""

    invoke-interface {p7, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Unfiled"

    const-string/jumbo v3, "\u672a\u5206\u985e"

    const-string v4, "\u30d5\u30a9\u30eb\u30c0\u30fc\u672a\u5206\u985e"

    invoke-static {p2, v4, v2, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move p2, v1

    :goto_0
    iget-object v2, p6, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt p2, v2, :cond_5

    invoke-static {p1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    aget-object p2, p3, p5

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-array p2, v1, [Ljava/lang/String;

    invoke-interface {v0, p2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/CharSequence;

    new-instance p3, Le/e/a/LocalPlaylists$Page$25;

    invoke-direct {p3, p0, p4, p7}, Le/e/a/LocalPlaylists$Page$25;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/util/List;)V

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void

    :cond_5
    iget-object v2, p6, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v2, p2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v2, p6, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v2, p2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "name"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_6
    new-instance p1, Le/e/a/LocalPlaylists$Page$27;

    invoke-direct {p1, p0}, Le/e/a/LocalPlaylists$Page$27;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {p2, p4, v2, p1}, Le/e/a/LocalPlaylists;->confirmFolderDelete(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void

    :cond_7
    invoke-static {p1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u30d5\u30a9\u30eb\u30c0\u30fc\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string p3, "Playlists will be kept"

    const-string/jumbo p5, "\u64ad\u653e\u6e05\u55ae\u5c07\u88ab\u4fdd\u7559"

    const-string p7, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u306f\u4fdd\u6301\u3055\u308c\u307e\u3059"

    invoke-static {p2, p7, p3, p5}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-static {p6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u524a\u9664"

    invoke-static {p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance p3, Le/e/a/LocalPlaylists$Page$26;

    invoke-direct {p3, p0, p4}, Le/e/a/LocalPlaylists$Page$26;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;)V

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$23$e-e-a-LocalPlaylists$Page(Landroid/widget/EditText;ZLjava/lang/String;Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 7

    .line 219
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p5

    if-eqz p5, :cond_0

    return-void

    :cond_0
    iget-object p5, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v0, Le/e/a/LocalPlaylists$Page$15;

    invoke-direct {v0, p2, p3, p1}, Le/e/a/LocalPlaylists$Page$15;-><init>(ZLjava/lang/String;Ljava/lang/String;)V

    new-instance p1, Le/e/a/LocalPlaylists$Page$16;

    invoke-direct {p1, p0, p4}, Le/e/a/LocalPlaylists$Page$16;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/app/AlertDialog;)V

    invoke-static {p5, v0, p1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method synthetic lambda$25$e-e-a-LocalPlaylists$Page(Landroid/app/AlertDialog;Ljava/lang/Boolean;)V
    .registers 3

    .line 219
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_0
    return-void
.end method

.method synthetic lambda$26$e-e-a-LocalPlaylists$Page(Ljava/lang/String;Ljava/util/List;Landroid/content/DialogInterface;I)V
    .registers 6

    .line 219
    iget-object p3, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v0, Le/e/a/LocalPlaylists$Page$4;

    invoke-direct {v0, p1, p2, p4}, Le/e/a/LocalPlaylists$Page$4;-><init>(Ljava/lang/String;Ljava/util/List;I)V

    new-instance p1, Le/e/a/LocalPlaylists$Page$5;

    invoke-direct {p1, p0}, Le/e/a/LocalPlaylists$Page$5;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {p3, v0, p1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method synthetic lambda$28$e-e-a-LocalPlaylists$Page(Ljava/lang/Boolean;)V
    .registers 2

    .line 219
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_0
    return-void
.end method

.method synthetic lambda$29$e-e-a-LocalPlaylists$Page(Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 219
    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance p3, Le/e/a/LocalPlaylists$Page$29;

    invoke-direct {p3, p1}, Le/e/a/LocalPlaylists$Page$29;-><init>(Ljava/lang/String;)V

    new-instance p1, Le/e/a/LocalPlaylists$Page$30;

    invoke-direct {p1, p0}, Le/e/a/LocalPlaylists$Page$30;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {p2, p3, p1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method synthetic lambda$3$e-e-a-LocalPlaylists$Page([ZLandroid/widget/CheckBox;Landroid/widget/CompoundButton;Z)V
    .registers 6

    .line 0
    const/4 p3, 0x0

    .line 118
    aget-boolean v0, p1, p3

    if-nez v0, :cond_0

    iput-boolean p4, p0, Le/e/a/LocalPlaylists$Page;->shuffle:Z

    if-eqz p4, :cond_0

    iget-boolean p4, p0, Le/e/a/LocalPlaylists$Page;->continuous:Z

    if-eqz p4, :cond_0

    const/4 p4, 0x1

    aput-boolean p4, p1, p3

    iput-boolean p3, p0, Le/e/a/LocalPlaylists$Page;->continuous:Z

    invoke-virtual {p2, p3}, Landroid/widget/CheckBox;->setChecked(Z)V

    aput-boolean p3, p1, p3

    :cond_0
    return-void
.end method

.method synthetic lambda$31$e-e-a-LocalPlaylists$Page(Ljava/lang/Boolean;)V
    .registers 2

    .line 219
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_0
    return-void
.end method

.method synthetic lambda$34$e-e-a-LocalPlaylists$Page()V
    .registers 2

    .line 0
    const/4 v0, 0x0

    .line 222
    iput-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->selectionChanged()V

    return-void
.end method

.method synthetic lambda$35$e-e-a-LocalPlaylists$Page(Ljava/lang/String;)V
    .registers 5

    .line 226
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v2, Le/e/a/LocalPlaylists$Page$33;

    invoke-direct {v2, v0, p1}, Le/e/a/LocalPlaylists$Page$33;-><init>(Ljava/util/Set;Ljava/lang/String;)V

    new-instance p1, Le/e/a/LocalPlaylists$Page$34;

    invoke-direct {p1, p0}, Le/e/a/LocalPlaylists$Page$34;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {v1, v2, p1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method synthetic lambda$37$e-e-a-LocalPlaylists$Page(Ljava/lang/Boolean;)V
    .registers 2

    .line 226
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_0
    return-void
.end method

.method synthetic lambda$38$e-e-a-LocalPlaylists$Page()V
    .registers 2

    .line 0
    const/4 v0, 0x0

    .line 228
    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void
.end method

.method synthetic lambda$39$e-e-a-LocalPlaylists$Page(Landroid/content/DialogInterface;I)V
    .registers 4

    .line 230
    new-instance p1, Ljava/util/HashSet;

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v0, Le/e/a/LocalPlaylists$Page$41;

    invoke-direct {v0, p1}, Le/e/a/LocalPlaylists$Page$41;-><init>(Ljava/util/Set;)V

    new-instance p1, Le/e/a/LocalPlaylists$Page$42;

    invoke-direct {p1, p0}, Le/e/a/LocalPlaylists$Page$42;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {p2, v0, p1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method synthetic lambda$4$e-e-a-LocalPlaylists$Page(Lorg/json/JSONObject;Lorg/json/JSONObject;)I
    .registers 7

    .line 120
    iget p0, p0, Le/e/a/LocalPlaylists$Page;->sort:I

    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    const-string p0, "title"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p0

    return p0

    :cond_0
    const/4 v0, 0x1

    const-string v1, "date"

    if-ne p0, v0, :cond_1

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide p0

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0

    :cond_1
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide p0

    invoke-static {v2, v3, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0
.end method

.method synthetic lambda$41$e-e-a-LocalPlaylists$Page(Ljava/lang/Boolean;)V
    .registers 2

    .line 230
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_0
    return-void
.end method

.method synthetic lambda$5$e-e-a-LocalPlaylists$Page(Ljava/util/ArrayList;Ljava/util/Map;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 15

    .line 157
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-ge p5, p3, :cond_2

    invoke-virtual {p1, p5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    invoke-interface {p2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/json/JSONObject;

    iget-boolean p3, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    if-eqz p3, :cond_0

    const-string p1, "id"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/LocalPlaylists$Page;->toggle(Ljava/lang/String;)V

    return-void

    :cond_0
    iget-boolean p3, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-nez p3, :cond_2

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string p3, "url"

    invoke-virtual {p2, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string p3, "title"

    invoke-virtual {p2, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-boolean p2, p0, Le/e/a/LocalPlaylists$Page;->continuous:Z

    if-nez p2, :cond_1

    iget-boolean p2, p0, Le/e/a/LocalPlaylists$Page;->shuffle:Z

    if-nez p2, :cond_1

    const/4 p2, 0x0

    goto :goto_0

    :cond_1
    const/4 p2, 0x1

    :goto_0
    move v5, p2

    iget-boolean v6, p0, Le/e/a/LocalPlaylists$Page;->shuffle:Z

    move-object v3, p1

    move v4, p5

    invoke-static/range {v0 .. v6}, Le/e/a/PlaylistPlayback;->launchTap(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;IZZ)V

    :cond_2
    return-void
.end method

.method synthetic lambda$6$e-e-a-LocalPlaylists$Page([JLandroid/widget/ListView;Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 14

    .line 168
    invoke-virtual {p4}, Landroid/view/DragEvent;->getAction()I

    move-result p3

    .line 169
    const-string v0, "id"

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p3, v2, :cond_3

    .line 170
    iget-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    if-nez p1, :cond_2

    invoke-virtual {p4}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object p1

    instance-of p1, p1, Ljava/lang/String;

    if-eqz p1, :cond_2

    .line 171
    invoke-virtual {p4}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 172
    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-nez p2, :cond_1

    return v1

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/json/JSONObject;

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    return v2

    :cond_2
    return v1

    :cond_3
    const/4 v3, 0x2

    if-ne p3, v3, :cond_6

    .line 176
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    .line 177
    aget-wide v5, p1, v1

    sub-long v5, v3, v5

    const-wide/16 v7, 0x5a

    cmp-long p3, v5, v7

    if-lez p3, :cond_5

    .line 178
    invoke-virtual {p4}, Landroid/view/DragEvent;->getY()F

    move-result p3

    .line 179
    iget-object p4, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v0, 0x2c

    invoke-static {p4, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p4

    int-to-float p4, p4

    cmpg-float p4, p3, p4

    const/16 v5, 0x6e

    const/16 v6, 0x34

    if-gez p4, :cond_4

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {p0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    neg-int p0, p0

    invoke-virtual {p2, p0, v5}, Landroid/widget/ListView;->smoothScrollBy(II)V

    aput-wide v3, p1, v1

    goto :goto_0

    .line 180
    :cond_4
    invoke-virtual {p2}, Landroid/widget/ListView;->getHeight()I

    move-result p4

    iget-object v7, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v7, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    sub-int/2addr p4, v0

    int-to-float p4, p4

    cmpl-float p3, p3, p4

    if-lez p3, :cond_5

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {p0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {p2, p0, v5}, Landroid/widget/ListView;->smoothScrollBy(II)V

    aput-wide v3, p1, v1

    :cond_5
    :goto_0
    return v2

    :cond_6
    const/4 p1, 0x3

    if-ne p3, p1, :cond_f

    .line 185
    invoke-virtual {p4}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object p1

    instance-of p1, p1, Ljava/lang/String;

    if-eqz p1, :cond_7

    invoke-virtual {p4}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    goto :goto_1

    :cond_7
    const/4 p1, 0x0

    :goto_1
    move p3, v1

    .line 187
    :goto_2
    iget-object v3, p0, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, -0x1

    if-lt p3, v3, :cond_8

    move p3, v4

    goto :goto_3

    :cond_8
    iget-object v3, p0, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {v3, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    :goto_3
    if-ltz p3, :cond_d

    .line 188
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_d

    .line 189
    invoke-virtual {p4}, Landroid/view/DragEvent;->getX()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-virtual {p4}, Landroid/view/DragEvent;->getY()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static {p2, p1, v3}, Le/e/a/ReorderMotion98;->videoDropPosition(Landroid/widget/ListView;II)I

    move-result p1

    if-ne p1, v4, :cond_a

    .line 190
    invoke-virtual {p4}, Landroid/view/DragEvent;->getY()F

    move-result p1

    const/4 p2, 0x0

    cmpg-float p1, p1, p2

    if-ltz p1, :cond_9

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    add-int/lit8 v1, p1, -0x1

    :cond_9
    move p1, v1

    :cond_a
    if-ltz p1, :cond_c

    .line 191
    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    if-ge p1, p2, :cond_c

    if-eq p1, p3, :cond_c

    .line 192
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 193
    iget-object p4, p0, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :goto_4
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_b

    .line 194
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    invoke-virtual {p2, p1, p3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-static {p0, p2}, Le/e/a/PlaylistTransfer100;->reorder(Le/e/a/LocalPlaylists$Page;Ljava/util/List;)V

    return v2

    .line 193
    :cond_b
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_c
    return v2

    :cond_d
    return v1

    :cond_e
    add-int/lit8 p3, p3, 0x1

    goto/16 :goto_2

    :cond_f
    return v2
.end method

.method synthetic lambda$8$e-e-a-LocalPlaylists$Page(Ljava/lang/String;ILjava/lang/Boolean;)V
    .registers 5

    .line 0
    const/4 v0, 0x0

    .line 198
    iput-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    .line 199
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    if-eqz p3, :cond_0

    iget-object p3, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x3

    .line 200
    iput p1, p0, Le/e/a/LocalPlaylists$Page;->sort:I

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->saveSort()V

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    .line 201
    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->videoList:Landroid/widget/ListView;

    if-eqz p0, :cond_0

    add-int/lit8 p2, p2, -0x1

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/ListView;->setSelection(I)V

    :cond_0
    return-void
.end method

.method synthetic lambda$9$e-e-a-LocalPlaylists$Page(Landroid/widget/EditText;Landroid/app/AlertDialog;ZLandroid/view/View;)V
    .registers 7

    .line 209
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "\u540d\u524d\u3092\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    const/4 v0, -0x1

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v1, Le/e/a/LocalPlaylists$Page$11;

    invoke-direct {v1, p3, p4, p1}, Le/e/a/LocalPlaylists$Page$11;-><init>(ZLjava/lang/String;Ljava/lang/String;)V

    new-instance p1, Le/e/a/LocalPlaylists$Page$12;

    invoke-direct {p1, p0, p2}, Le/e/a/LocalPlaylists$Page$12;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/app/AlertDialog;)V

    invoke-static {v0, v1, p1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method moveCatalog97(ZLjava/lang/String;I)V
    .registers 7

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v1, Le/e/a/LocalPlaylists$Page$15;

    invoke-direct {v1, p1, p2, p3}, Le/e/a/LocalPlaylists$Page$15;-><init>(ZLjava/lang/String;I)V

    new-instance v2, Le/e/a/LocalPlaylists$Page$5;

    const/4 p1, 0x1

    invoke-direct {v2, p0, p1}, Le/e/a/LocalPlaylists$Page$5;-><init>(Le/e/a/LocalPlaylists$Page;Z)V

    invoke-static {v0, v1, v2}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method moveSelected()V
    .registers 2

    const/4 v0, 0x0

    invoke-static {p0, v0}, Le/e/a/PlaylistTransfer100;->selected(Le/e/a/LocalPlaylists$Page;Z)V

    return-void
.end method

.method render()V
    .registers 28

    move-object/from16 v1, p0

    invoke-static {v1}, Le/e/a/CatalogReorder98;->onRender(Le/e/a/LocalPlaylists$Page;)V

    .line 85
    const-string v0, "postedAt"

    const-string v2, "thumbnail"

    const-string v3, "posttime"

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->createPopup:Landroid/widget/PopupWindow;

    if-eqz v4, :cond_0

    invoke-virtual {v4}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_0
    :try_start_0
    iget-object v5, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v5}, Le/e/a/LocalPlaylists;->read(Landroid/content/Context;)Le/e/a/LocalPlaylistData;

    move-result-object v5

    invoke-static {v1, v5}, Le/e/a/PlaylistTransfer100;->preview(Le/e/a/LocalPlaylists$Page;Le/e/a/LocalPlaylistData;)Le/e/a/LocalPlaylistData;

    move-result-object v5
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1

    iget-object v6, v1, Le/e/a/LocalPlaylists$Page;->videoList:Landroid/widget/ListView;

    if-eqz v6, :cond_1

    iget-object v6, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-eqz v6, :cond_1

    iget-object v8, v1, Le/e/a/LocalPlaylists$Page;->sortFolder:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 86
    iget-object v6, v1, Le/e/a/LocalPlaylists$Page;->videoList:Landroid/widget/ListView;

    invoke-virtual {v6}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v6

    goto :goto_0

    :cond_1
    const/4 v6, -0x1

    :goto_0
    const/4 v8, 0x0

    if-ltz v6, :cond_2

    .line 87
    iget-object v9, v1, Le/e/a/LocalPlaylists$Page;->videoList:Landroid/widget/ListView;

    invoke-virtual {v9}, Landroid/widget/ListView;->getChildCount()I

    move-result v9

    if-lez v9, :cond_2

    iget-object v9, v1, Le/e/a/LocalPlaylists$Page;->videoList:Landroid/widget/ListView;

    invoke-virtual {v9, v8}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getTop()I

    move-result v9

    goto :goto_1

    :cond_2
    move v9, v8

    .line 88
    :goto_1
    iget-object v10, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v10}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/4 v10, 0x0

    iput-object v10, v1, Le/e/a/LocalPlaylists$Page;->display:Landroid/widget/BaseAdapter;

    iput-object v10, v1, Le/e/a/LocalPlaylists$Page;->videoList:Landroid/widget/ListView;

    iput-object v10, v1, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;

    iput-object v10, v1, Le/e/a/LocalPlaylists$Page;->count:Landroid/widget/TextView;

    .line 89
    iget-object v11, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-eqz v11, :cond_3

    invoke-virtual {v5, v11}, Le/e/a/LocalPlaylistData;->hasFolder(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_3

    iput-object v10, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    .line 90
    :cond_3
    iget-object v11, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    const-string v12, "id"

    const-string v13, ""

    const-string v14, "@unfiled"

    if-eqz v11, :cond_7

    .line 91
    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_4

    iput-object v14, v1, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    goto :goto_3

    :cond_4
    move v11, v8

    .line 92
    :goto_2
    iget-object v15, v5, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v15}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-ge v11, v15, :cond_8

    .line 93
    iget-object v15, v5, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v15, v11}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v15

    if-eqz v15, :cond_6

    .line 94
    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-virtual {v15, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 95
    const-string v4, "group"

    invoke-virtual {v15, v4, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 96
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_5

    move-object v14, v4

    :cond_5
    iput-object v14, v1, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    goto :goto_3

    :cond_6
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 100
    :cond_7
    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    if-eqz v4, :cond_8

    invoke-virtual {v14, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    invoke-virtual {v5, v4}, Le/e/a/LocalPlaylistData;->hasGroup(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_8

    iput-object v10, v1, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    .line 101
    :cond_8
    :goto_3
    invoke-virtual {v1}, Le/e/a/LocalPlaylists$Page;->saveLocation()V

    .line 102
    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-nez v4, :cond_9

    iput-object v10, v1, Le/e/a/LocalPlaylists$Page;->sortFolder:Ljava/lang/String;

    iput-boolean v8, v1, Le/e/a/LocalPlaylists$Page;->reordering:Z

    invoke-virtual {v1, v5}, Le/e/a/LocalPlaylists$Page;->catalog(Le/e/a/LocalPlaylistData;)V

    return-void

    .line 103
    :cond_9
    iget-object v7, v1, Le/e/a/LocalPlaylists$Page;->sortFolder:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v7, 0x3

    if-nez v4, :cond_b

    .line 104
    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    iput-object v4, v1, Le/e/a/LocalPlaylists$Page;->sortFolder:Ljava/lang/String;

    iput-boolean v8, v1, Le/e/a/LocalPlaylists$Page;->reordering:Z

    .line 105
    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v4}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v14, "nicoid_local_playlist_sort_"

    invoke-direct {v11, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v14, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v4, v11, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    iput v4, v1, Le/e/a/LocalPlaylists$Page;->sort:I

    if-ltz v4, :cond_a

    const/16 v11, 0xe

    if-le v4, v11, :cond_b

    .line 106
    :cond_a
    iput v8, v1, Le/e/a/LocalPlaylists$Page;->sort:I

    .line 108
    :cond_b
    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v11, "Unfiled videos"

    const-string/jumbo v14, "\u672a\u5206\u985e\u5f71\u7247"

    const-string v15, "\u30d5\u30a9\u30eb\u30c0\u30fc\u672a\u5206\u985e"

    invoke-static {v4, v15, v11, v14}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move v11, v8

    :goto_4
    iget-object v14, v5, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-lt v11, v14, :cond_1b

    invoke-virtual {v1, v4}, Le/e/a/LocalPlaylists$Page;->toolbar(Ljava/lang/String;)V

    .line 109
    new-instance v4, Landroid/widget/LinearLayout;

    iget-object v11, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v4, v11}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v11, 0x10

    invoke-virtual {v4, v11}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v11, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v12, 0x8

    invoke-static {v11, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    iget-object v14, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v14, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-virtual {v4, v11, v8, v14, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v11, Landroid/widget/CheckBox;

    iget-object v14, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v11, v14}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    new-instance v14, Landroid/widget/CheckBox;

    iget-object v15, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v14, v15}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iget-object v15, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v10, "Continuous play"

    const-string/jumbo v7, "\u9023\u7e8c\u64ad\u653e"

    const-string/jumbo v12, "\u9023\u7d9a\u518d\u751f"

    invoke-static {v15, v12, v10, v7}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v7}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    iget-object v7, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v10, "Shuffle play"

    const-string/jumbo v12, "\u96a8\u6a5f\u64ad\u653e"

    const-string v15, "\u30b7\u30e3\u30c3\u30d5\u30eb\u518d\u751f"

    invoke-static {v7, v15, v10, v12}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v14, v7}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v11}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    invoke-static {v14}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    iget-boolean v7, v1, Le/e/a/LocalPlaylists$Page;->continuous:Z

    invoke-virtual {v11, v7}, Landroid/widget/CheckBox;->setChecked(Z)V

    iget-boolean v7, v1, Le/e/a/LocalPlaylists$Page;->shuffle:Z

    invoke-virtual {v14, v7}, Landroid/widget/CheckBox;->setChecked(Z)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v10, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v12, 0x30

    invoke-static {v10, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-direct {v7, v8, v10, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v11, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v10, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v10, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-direct {v7, v8, v10, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v14, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    iget-object v7, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-boolean v10, v1, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-eqz v10, :cond_c

    const-string v10, "\u2713"

    goto :goto_5

    :cond_c
    const-string v10, "\u21c5"

    :goto_5
    const/16 v15, 0x18

    invoke-static {v7, v10, v15}, Le/e/a/Ui110;->compact(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v7

    const/16 v10, 0x11

    .line 111
    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v15, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v15}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v15

    invoke-virtual {v7, v15}, Landroid/widget/TextView;->setTextColor(I)V

    iget-boolean v10, v1, Le/e/a/LocalPlaylists$Page;->reordering:Z

    invoke-static {v7, v10}, Le/e/a/ReorderMotion98;->button(Landroid/widget/TextView;Z)V

    .line 112
    iget-object v15, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-boolean v10, v1, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-eqz v10, :cond_d

    const-string v18, "\u4e26\u3073\u66ff\u3048\u5b8c\u4e86"

    goto :goto_6

    :cond_d
    const-string/jumbo v18, "\u624b\u52d5\u3067\u4e26\u3073\u66ff\u3048"

    :goto_6
    move-object/from16 v8, v18

    if-eqz v10, :cond_e

    .line 113
    const-string v18, "Finish reordering"

    goto :goto_7

    :cond_e
    const-string v18, "Reorder manually"

    :goto_7
    move-object/from16 v12, v18

    if-eqz v10, :cond_f

    .line 114
    const-string v10, "\u5b8c\u6210\u6392\u5e8f"

    goto :goto_8

    :cond_f
    const-string/jumbo v10, "\u624b\u52d5\u6392\u5e8f"

    .line 112
    :goto_8
    invoke-static {v15, v8, v12, v10}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 115
    iget-object v8, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-boolean v10, v1, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-eqz v10, :cond_10

    invoke-static {v8}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v10

    const v12, 0xffffff

    and-int/2addr v10, v12

    const/high16 v12, 0x22000000

    or-int/2addr v10, v12

    goto :goto_9

    :cond_10
    const/4 v10, 0x0

    :goto_9
    const/16 v12, 0x8

    invoke-static {v8, v10, v12}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 116
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v10, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v12, 0x30

    invoke-static {v10, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    iget-object v15, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v15, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v8, v10, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 117
    new-instance v8, Le/e/a/LocalPlaylists$Page$36;

    invoke-direct {v8, v1}, Le/e/a/LocalPlaylists$Page$36;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v7 .. v7}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 118
    iget-object v7, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/4 v7, 0x1

    new-array v4, v7, [Z

    new-instance v8, Le/e/a/LocalPlaylists$Page$37;

    invoke-direct {v8, v1, v4, v14}, Le/e/a/LocalPlaylists$Page$37;-><init>(Le/e/a/LocalPlaylists$Page;[ZLandroid/widget/CheckBox;)V

    invoke-virtual {v11, v8}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    new-instance v8, Le/e/a/LocalPlaylists$Page$38;

    invoke-direct {v8, v1, v4, v11}, Le/e/a/LocalPlaylists$Page$38;-><init>(Le/e/a/LocalPlaylists$Page;[ZLandroid/widget/CheckBox;)V

    invoke-virtual {v14, v8}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 119
    new-instance v4, Landroid/widget/Spinner;

    iget-object v8, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v4, v8}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    new-instance v8, Landroid/widget/ArrayAdapter;

    iget-object v10, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    move/from16 v20, v6

    move/from16 v21, v9

    invoke-static {v10}, Le/e/a/PlaylistSort219;->labels(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v6

    const v7, 0x1090009

    invoke-direct {v8, v10, v7, v6}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    invoke-virtual {v4, v8}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    iget v6, v1, Le/e/a/LocalPlaylists$Page;->sort:I

    invoke-static {v6}, Le/e/a/PlaylistSort219;->localPosition(I)I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/widget/Spinner;->setSelection(I)V

    iget-object v6, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v12, 0x8

    invoke-static {v6, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    iget-object v7, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v7, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    const/4 v8, 0x0

    invoke-virtual {v4, v6, v8, v7, v8}, Landroid/widget/Spinner;->setPadding(IIII)V

    iget-object v6, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v8, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v9, 0x28

    invoke-static {v8, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    const/4 v9, -0x1

    invoke-direct {v7, v9, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v6, Le/e/a/LocalPlaylists$Page$1;

    invoke-direct {v6, v1}, Le/e/a/LocalPlaylists$Page$1;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-virtual {v4, v6}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    iget-boolean v6, v1, Le/e/a/LocalPlaylists$Page;->reordering:Z

    xor-int/lit8 v6, v6, 0x1

    invoke-virtual {v4, v6}, Landroid/widget/Spinner;->setEnabled(Z)V

    .line 120
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, v1, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    const/4 v8, 0x0

    :goto_a
    iget-object v4, v5, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    const-string v6, "owner"

    const-string v7, "title"

    if-lt v8, v4, :cond_19

    iget v4, v1, Le/e/a/LocalPlaylists$Page;->sort:I

    const/4 v5, 0x3

    if-eq v4, v5, :cond_11

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    iget v5, v1, Le/e/a/LocalPlaylists$Page;->sort:I

    invoke-static {v4, v5}, Le/e/a/PlaylistSort219;->sortLocal(Ljava/util/List;I)V

    .line 121
    :cond_11
    new-instance v4, Landroid/widget/ListView;

    iget-object v5, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v4, v5}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v4, v1, Le/e/a/LocalPlaylists$Page;->videoList:Landroid/widget/ListView;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Ljava/util/IdentityHashMap;

    invoke-direct {v8}, Ljava/util/IdentityHashMap;-><init>()V

    :try_start_1
    const-string v9, "e.e.a.x1"

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    const-string v10, "e.e.a.y0"

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    iget-object v11, v1, Le/e/a/LocalPlaylists$Page;->images:Ljava/lang/Object;

    if-nez v11, :cond_12

    const/4 v11, 0x1

    new-array v12, v11, [Ljava/lang/Class;

    const-class v11, Landroid/content/Context;

    const/16 v19, 0x0

    aput-object v11, v12, v19

    invoke-virtual {v10, v12}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v11

    iget-object v12, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    filled-new-array {v12}, [Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    iput-object v11, v1, Le/e/a/LocalPlaylists$Page;->images:Ljava/lang/Object;

    iget-object v11, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-string v12, "G"

    invoke-virtual {v11, v12}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    iget-object v12, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v14, v1, Le/e/a/LocalPlaylists$Page;->images:Ljava/lang/Object;

    invoke-virtual {v11, v12, v14}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_12
    iget-object v11, v1, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_b
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    const/4 v14, 0x2

    if-nez v12, :cond_13

    const-string v0, "e.e.a.b0"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/16 v19, 0x0

    aput-object v3, v2, v19

    const-class v3, Ljava/util/ArrayList;

    const/16 v18, 0x1

    aput-object v3, v2, v18

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v14

    const/16 v16, 0x3

    aput-object v10, v2, v16

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    iget-object v2, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v19, 0x0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v6, v1, Le/e/a/LocalPlaylists$Page;->images:Ljava/lang/Object;

    filled-new-array {v2, v5, v3, v6}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "l"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const-string v3, "e.e.a.b1"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const/4 v11, 0x1

    new-array v6, v11, [Ljava/lang/Class;

    const-class v7, Landroid/app/Activity;

    const/16 v19, 0x0

    aput-object v7, v6, v19

    invoke-virtual {v3, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    iget-object v6, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Le/e/a/LocalPlaylists$Page$2;

    invoke-direct {v2, v1, v0, v8, v5}, Le/e/a/LocalPlaylists$Page$2;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/BaseAdapter;Ljava/util/Map;Ljava/util/ArrayList;)V

    iput-object v2, v1, Le/e/a/LocalPlaylists$Page;->display:Landroid/widget/BaseAdapter;

    .line 157
    invoke-virtual {v4, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-static {v0, v1}, Le/e/a/LocalPlaylists;->registerAdapter(Ljava/lang/Object;Le/e/a/LocalPlaylists$Page;)V

    new-instance v0, Le/e/a/LocalPlaylists$Page$40;

    invoke-direct {v0, v1, v5, v8}, Le/e/a/LocalPlaylists$Page$40;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/util/ArrayList;Ljava/util/Map;)V

    invoke-virtual {v4, v0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    invoke-static/range {v4 .. v4}, Le/e/a/PressFeedback;->list(Landroid/widget/AbsListView;)V

    iget-boolean v0, v1, Le/e/a/LocalPlaylists$Page;->reordering:Z

    if-eqz v0, :cond_16

    invoke-virtual {v1, v4}, Le/e/a/LocalPlaylists$Page;->installDrag(Landroid/widget/ListView;)V

    invoke-static {v1}, Le/e/a/PlaylistTransfer100;->installVideoDrop(Le/e/a/LocalPlaylists$Page;)V

    goto/16 :goto_e

    .line 121
    :cond_13
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/json/JSONObject;

    const/4 v15, 0x0

    new-array v14, v15, [Ljava/lang/Class;

    const/4 v14, 0x0

    invoke-virtual {v9, v14}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v15

    invoke-virtual {v15, v14}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    const-string v14, "a"

    move-object/from16 v22, v10

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Class;

    const-class v17, Ljava/lang/String;

    const/16 v19, 0x0

    aput-object v17, v10, v19

    const-class v17, Ljava/lang/Object;

    const/16 v18, 0x1

    aput-object v17, v10, v18

    invoke-virtual {v9, v14, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    filled-new-array {v7, v14}, [Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v10, v15, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v14, "videourl"

    move-object/from16 v17, v11

    const-string v11, "url"

    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    filled-new-array {v14, v11}, [Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v10, v15, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    filled-new-array {v2, v11}, [Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v10, v15, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v11, "length"

    const-string v14, "videoinfo"

    filled-new-array {v11, v14, v3}, [Ljava/lang/String;

    move-result-object v11
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object/from16 v23, v2

    const/4 v14, 0x0

    :goto_c
    const-string v2, "date"

    move-object/from16 v24, v11

    const/4 v11, 0x3

    if-lt v14, v11, :cond_14

    :try_start_2
    new-instance v14, Landroid/text/SpannableString;

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v1

    const-string/jumbo v11, "\u767b\u9332"

    invoke-static {v1, v2, v11}, Le/e/a/VideoRows191;->date(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v14, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    filled-new-array {v3, v14}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v10, v15, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v12, v0, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v10, v15, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "b"

    invoke-virtual {v9, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const-string v2, "videoId"

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v15, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v1, "y"

    invoke-virtual {v9, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v12, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v15, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v5, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v8, v15, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v1, p0

    move-object/from16 v11, v17

    move-object/from16 v10, v22

    move-object/from16 v2, v23

    goto/16 :goto_b

    :cond_14
    aget-object v1, v24, v14

    new-instance v11, Landroid/text/SpannableString;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_15

    move-object/from16 v25, v0

    const-string v0, "yyyy/MM/dd HH:mm"

    move-object/from16 v26, v3

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_d

    :cond_15
    move-object/from16 v25, v0

    move-object/from16 v26, v3

    move-object v0, v13

    :goto_d
    invoke-virtual {v12, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v11, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    filled-new-array {v1, v11}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v10, v15, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v11, v24

    move-object/from16 v0, v25

    move-object/from16 v3, v26

    goto/16 :goto_c

    :catch_0
    move-exception v0

    .line 157
    const-string v1, "nicoid-playlist"

    const-string v2, "Unable to build video list"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object/from16 v1, p0

    .line 158
    :cond_16
    :goto_e
    iget-object v0, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v9, -0x1

    const/4 v15, 0x0

    invoke-direct {v2, v9, v15, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-static {v1, v0, v4, v2}, Le/e/a/LocalRefresh243;->add(Le/e/a/LocalPlaylists$Page;Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    if-ltz v20, :cond_17

    move/from16 v2, v20

    move/from16 v10, v21

    invoke-virtual {v4, v2, v10}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    :cond_17
    iget-object v0, v1, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "No videos"

    const-string/jumbo v3, "\u6c92\u6709\u5f71\u7247"

    const-string v4, "\u52d5\u753b\u306f\u3042\u308a\u307e\u305b\u3093"

    invoke-static {v0, v4, v2, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe

    invoke-static {v0, v2, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    const/16 v11, 0x11

    invoke-virtual {v0, v11}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v2, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_18
    invoke-virtual {v1}, Le/e/a/LocalPlaylists$Page;->selectionChanged()V

    return-void

    :cond_19
    move-object/from16 v25, v0

    move-object/from16 v23, v2

    move-object/from16 v26, v3

    move/from16 v2, v20

    move/from16 v10, v21

    .line 120
    iget-object v0, v5, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    const-string v12, "folder"

    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1a

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v7, v6}, Le/e/a/ContentFilter;->blocked(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1a

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1a
    add-int/lit8 v8, v8, 0x1

    move/from16 v20, v2

    move/from16 v21, v10

    move-object/from16 v2, v23

    move-object/from16 v0, v25

    move-object/from16 v3, v26

    goto/16 :goto_a

    :cond_1b
    move-object/from16 v25, v0

    move-object/from16 v23, v2

    move-object/from16 v26, v3

    move v2, v6

    move v15, v8

    move v10, v9

    move v8, v11

    .line 108
    iget-object v0, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    iget-object v3, v5, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v3, v8}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object v0, v5, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v3, "name"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v4, v0

    :cond_1c
    add-int/lit8 v11, v8, 0x1

    move v6, v2

    move v9, v10

    move v8, v15

    move-object/from16 v2, v23

    move-object/from16 v0, v25

    move-object/from16 v3, v26

    goto/16 :goto_4

    .line 85
    :catch_1
    iget-object v0, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v0, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object v2, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v3, "Unable to read playlists. Stored data has been retained."

    const-string/jumbo v4, "\u7121\u6cd5\u8b80\u53d6\u64ad\u653e\u6e05\u55ae\uff0c\u539f\u6709\u8cc7\u6599\u5df2\u4fdd\u7559"

    const-string v5, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u3092\u8aad\u307f\u8fbc\u3081\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u4fdd\u5b58\u6e08\u307f\u306e\u30c7\u30fc\u30bf\u306f\u4fdd\u6301\u3057\u3066\u3044\u307e\u3059"

    invoke-static {v2, v5, v3, v4}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xe

    invoke-static {v2, v3, v4}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Retry"

    const-string/jumbo v3, "\u91cd\u8a66"

    const-string v4, "\u518d\u8a66\u884c"

    invoke-static {v0, v4, v2, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    new-instance v2, Le/e/a/LocalPlaylists$Page$35;

    invoke-direct {v2, v1}, Le/e/a/LocalPlaylists$Page$35;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    iget-object v1, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method saveLocation()V
    .registers 4

    .line 77
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 78
    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    const-string v2, "nicoid_local_playlist_last_folder_v1"

    if-nez v1, :cond_0

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    :cond_0
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 79
    :goto_0
    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    const-string v2, "nicoid_local_playlist_last_group_v1"

    if-nez v1, :cond_1

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_1

    :cond_1
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 80
    :goto_1
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 81
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    .line 82
    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    .line 81
    const-string v2, "nicoid_playlist_folder"

    if-nez v0, :cond_2

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    return-void

    .line 82
    :cond_2
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-void
.end method

.method saveSort()V
    .registers 4

    .line 161
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-nez v0, :cond_0

    return-void

    .line 162
    :cond_0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 163
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "nicoid_local_playlist_sort_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget p0, p0, Le/e/a/LocalPlaylists$Page;->sort:I

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method selectionChanged()V
    .registers 4

    .line 221
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->videoList:Landroid/widget/ListView;

    if-eqz v0, :cond_3

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->display:Landroid/widget/BaseAdapter;

    if-eqz v0, :cond_3

    .line 222
    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    if-eqz v0, :cond_0

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;

    if-nez v1, :cond_0

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v1, Le/e/a/LocalPlaylists$Page$6;

    invoke-direct {v1, p0}, Le/e/a/LocalPlaylists$Page$6;-><init>(Le/e/a/LocalPlaylists$Page;)V

    new-instance v2, Le/e/a/LocalPlaylists$Page$7;

    invoke-direct {v2, p0}, Le/e/a/LocalPlaylists$Page$7;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {v0, v1, v2}, Le/e/a/SelectionUi191;->footer(Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;

    invoke-static {v0, p0}, Le/e/a/BulkMove211;->installLocal(Landroid/widget/LinearLayout;Ljava/lang/Object;)V

    invoke-static {v0, p0}, Le/e/a/PlaylistTransfer100;->copyButton(Landroid/widget/LinearLayout;Le/e/a/LocalPlaylists$Page;)V

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-static {v0, v1}, Le/e/a/BulkSelection;->countLabel(Landroid/content/Context;I)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->count:Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->videoList:Landroid/widget/ListView;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v2

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    goto :goto_0

    :cond_0
    if-nez v0, :cond_1

    .line 223
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_1

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->count:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->count:Landroid/widget/TextView;

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 224
    :cond_1
    :goto_0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->count:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-static {v0, v1}, Le/e/a/SelectionUi191;->count(Landroid/widget/TextView;I)V

    :cond_2
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-static {v0, v1}, Le/e/a/SelectionUi191;->enabled(Landroid/widget/LinearLayout;I)V

    invoke-static {v0, v1}, Le/e/a/BulkMove211;->refresh(Landroid/widget/LinearLayout;I)V

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->display:Landroid/widget/BaseAdapter;

    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    :cond_3
    return-void
.end method

.method toggle(Ljava/lang/String;)V
    .registers 3

    .line 229
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_0
    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->selectionChanged()V

    return-void
.end method

.method toolbar(Ljava/lang/String;)V
    .registers 9

    invoke-static {p0, p1}, Le/e/a/TabFolderNav214;->localToolbar(Ljava/lang/Object;Ljava/lang/String;)V

    .line 84
    :try_start_0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v1, "O"

    invoke-static {v0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "b"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/CharSequence;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string v1, "c"

    new-array v2, v3, [Ljava/lang/Class;

    aput-object v5, v2, v6

    invoke-virtual {p1, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8"

    const-string v3, "Playlists"

    const-string/jumbo v4, "\u64ad\u653e\u6e05\u55ae"

    invoke-static {v1, v2, v3, v4}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    return-void
.end method

.method videoCount(Le/e/a/LocalPlaylistData;Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    const/4 v0, 0x0

    move v1, v0

    .line 217
    :goto_0
    iget-object v2, p1, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v0, v2, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string p2, "Videos: "

    const-string v0, "\u5f71\u7247 "

    const-string v2, "\u52d5\u753b "

    invoke-static {p0, v2, p2, v0}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    iget-object v2, p1, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "folder"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    add-int/lit8 v1, v1, 0x1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
