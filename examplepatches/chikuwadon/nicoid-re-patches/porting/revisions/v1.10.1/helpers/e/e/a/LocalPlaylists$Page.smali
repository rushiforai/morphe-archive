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

.field continuous:Z

.field count:Landroid/widget/TextView;

.field countModel:Le/e/a/LocalPlaylistData;

.field createPopup:Landroid/widget/PopupWindow;

.field display:Landroid/widget/BaseAdapter;

.field folder:Ljava/lang/String;

.field folderCounts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field footer:Landroid/widget/LinearLayout;

.field group:Ljava/lang/String;

.field images:Ljava/lang/Object;

.field renderedData:Le/e/a/LocalPlaylistData;

.field renderedKey:Ljava/lang/String;

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
    .registers 5

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    .line 66
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Le/e/a/LocalPlaylists$Page;->folderCounts:Ljava/util/Map;

    .line 36
    iput-object p1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "nicoid_playlist_folder"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_33

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_33
    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-static {p1}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object p1

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-static {p1}, Le/e/a/TabViewport110;->fill(Landroid/view/View;)V

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-static {p1}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$16(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 67
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$17(Ljava/lang/Runnable;Landroid/view/View;)Z
    .registers 2

    .line 67
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$20(ZLjava/lang/String;Ljava/lang/String;Le/e/a/LocalPlaylistData;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 68
    if-eqz p0, :cond_5

    iget-object p0, p3, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    goto :goto_7

    :cond_5
    iget-object p0, p3, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    :goto_7
    const/4 p3, 0x0

    :goto_8
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lt p3, v0, :cond_f

    return-void

    :cond_f
    invoke-virtual {p0, p3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-virtual {p0, p3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "name"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_28
    add-int/lit8 p3, p3, 0x1

    goto :goto_8
.end method

.method static synthetic lambda$23(Ljava/lang/String;Ljava/util/List;ILe/e/a/LocalPlaylistData;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 68
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p3, p0, p1}, Le/e/a/LocalPlaylistData;->movePlaylist(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$26(Ljava/lang/String;Le/e/a/LocalPlaylistData;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 68
    invoke-virtual {p1, p0}, Le/e/a/LocalPlaylistData;->removeGroup(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$34(Ljava/util/Set;Ljava/lang/String;Le/e/a/LocalPlaylistData;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 75
    invoke-virtual {p2, p0, p1}, Le/e/a/LocalPlaylistData;->move(Ljava/util/Set;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$38(Ljava/util/Set;Le/e/a/LocalPlaylistData;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 79
    invoke-virtual {p1, p0}, Le/e/a/LocalPlaylistData;->delete(Ljava/util/Set;)V

    return-void
.end method

.method static synthetic lambda$6(ZLjava/lang/String;Ljava/lang/String;Le/e/a/LocalPlaylistData;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 58
    if-eqz p0, :cond_6

    invoke-virtual {p3, p1}, Le/e/a/LocalPlaylistData;->group(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_17

    :cond_6
    invoke-virtual {p3, p1}, Le/e/a/LocalPlaylistData;->folder(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p2, :cond_17

    const-string p1, "@unfiled"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_17

    invoke-virtual {p3, p0, p2}, Le/e/a/LocalPlaylistData;->movePlaylist(Ljava/lang/String;Ljava/lang/String;)V

    :cond_17
    :goto_17
    return-void
.end method


# virtual methods
.method button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 4

    .line 80
    invoke-static {p1, p2, p3}, Le/e/a/BulkSelection;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method catalog(Le/e/a/LocalPlaylistData;)V
    .registers 26

    .line 61
    move-object/from16 v7, p0

    move-object/from16 v8, p1

    iget-object v0, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v1, "Playlists"

    const-string v2, "\u64ad\u653e\u6e05\u55ae"

    const-string v3, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u4e00\u89a7"

    invoke-static {v0, v3, v1, v2}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, v7, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    const-string v9, "@unfiled"

    if-eqz v1, :cond_29

    iget-object v1, v7, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_29

    iget-object v1, v7, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    invoke-virtual {v8, v1}, Le/e/a/LocalPlaylistData;->hasGroup(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_29

    const/4 v1, 0x0

    iput-object v1, v7, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    :cond_29
    const/4 v10, 0x0

    move v1, v10

    :goto_2b
    iget-object v2, v8, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    const-string v11, "name"

    const-string v12, "id"

    if-lt v1, v2, :cond_2fe

    invoke-virtual {v7, v0}, Le/e/a/LocalPlaylists$Page;->toolbar(Ljava/lang/String;)V

    new-instance v13, Landroid/widget/FrameLayout;

    iget-object v0, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v13, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/widget/ScrollView;

    iget-object v1, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v14, 0x1

    invoke-virtual {v0, v14}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    iget-object v1, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v15

    iget-object v1, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v2, 0xc

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    iget-object v3, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v3, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    iget-object v3, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v4, 0x58

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v15, v1, v10, v2, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual {v0, v15}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, -0x1

    invoke-direct {v1, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v13, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    iget-object v0, v7, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    const-string v5, "folder"

    const-string v4, "group"

    if-nez v0, :cond_1a8

    move v0, v10

    move v1, v0

    :goto_81
    iget-object v2, v8, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v0, v2, :cond_183

    move v0, v10

    move v2, v0

    :goto_8b
    iget-object v3, v8, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v0, v3, :cond_15e

    if-lez v1, :cond_97

    move v0, v14

    goto :goto_98

    :cond_97
    move v0, v10

    :goto_98
    add-int/2addr v2, v0

    iget-object v0, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v1, "Unfiled"

    const-string v3, "\u672a\u5206\u985e"

    const-string v6, "\u30d5\u30a9\u30eb\u30c0\u30fc\u672a\u5206\u985e"

    invoke-static {v0, v6, v1, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v6, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8 "

    const-string v14, "Playlists: "

    const-string v10, "\u64ad\u653e\u6e05\u55ae "

    invoke-static {v1, v6, v14, v10}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    new-instance v2, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda55;

    invoke-direct {v2, v7}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda55;-><init>(Le/e/a/LocalPlaylists$Page;)V

    const/16 v20, 0x0

    const-string v21, "folder"

    move-object/from16 v0, p0

    move-object v1, v15

    move-object/from16 v22, v2

    move-object/from16 v2, v21

    move-object/from16 v23, v4

    move-object/from16 v4, v19

    move-object/from16 v19, v13

    move-object v13, v5

    move-object/from16 v5, v22

    move-object/from16 v21, v9

    move-object v9, v6

    move-object/from16 v6, v20

    invoke-virtual/range {v0 .. v6}, Le/e/a/LocalPlaylists$Page;->catalogRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    const/4 v6, 0x0

    :goto_e4
    iget-object v0, v8, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lt v6, v0, :cond_f0

    move-object/from16 v6, v23

    goto/16 :goto_1ae

    :cond_f0
    iget-object v0, v8, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_100
    iget-object v2, v8, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v0, v2, :cond_141

    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v2, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v2, v9, v14, v10}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v2, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda56;

    invoke-direct {v2, v7, v3}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda56;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;)V

    new-instance v1, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda57;

    invoke-direct {v1, v7, v3, v4}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda57;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "folder"

    move-object/from16 v0, p0

    move-object/from16 v16, v1

    move-object v1, v15

    move-object/from16 v20, v2

    move-object v2, v3

    move-object v3, v4

    move-object v4, v5

    move-object/from16 v5, v20

    move/from16 v20, v6

    move-object/from16 v6, v16

    invoke-virtual/range {v0 .. v6}, Le/e/a/LocalPlaylists$Page;->catalogRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    add-int/lit8 v6, v20, 0x1

    goto :goto_e4

    :cond_141
    move/from16 v20, v6

    iget-object v2, v8, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    move-object/from16 v6, v23

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_157

    add-int/lit8 v1, v1, 0x1

    :cond_157
    add-int/lit8 v0, v0, 0x1

    move-object/from16 v23, v6

    move/from16 v6, v20

    goto :goto_100

    :cond_15e
    move-object v6, v4

    move-object/from16 v21, v9

    move-object/from16 v19, v13

    move-object v13, v5

    iget-object v3, v8, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_176

    add-int/lit8 v2, v2, 0x1

    :cond_176
    add-int/lit8 v0, v0, 0x1

    move-object v4, v6

    move-object v5, v13

    move-object/from16 v13, v19

    move-object/from16 v9, v21

    const/4 v6, -0x1

    const/4 v10, 0x0

    const/4 v14, 0x1

    goto/16 :goto_8b

    :cond_183
    move-object v6, v4

    move-object/from16 v21, v9

    move-object/from16 v19, v13

    move-object v13, v5

    iget-object v2, v8, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_19b

    add-int/lit8 v1, v1, 0x1

    :cond_19b
    add-int/lit8 v0, v0, 0x1

    move-object v4, v6

    move-object v5, v13

    move-object/from16 v13, v19

    move-object/from16 v9, v21

    const/4 v6, -0x1

    const/4 v10, 0x0

    const/4 v14, 0x1

    goto/16 :goto_81

    :cond_1a8
    move-object v6, v4

    move-object/from16 v21, v9

    move-object/from16 v19, v13

    move-object v13, v5

    .line 63
    :goto_1ae
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_1b0
    iget-object v2, v8, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v0, v2, :cond_2db

    iget-object v0, v7, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    move-object/from16 v9, v21

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v10, ""

    if-eqz v0, :cond_1e7

    if-eqz v1, :cond_1e7

    iget-object v0, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v1, "Unfiled videos"

    const-string v2, "\u672a\u5206\u985e\u5f71\u7247"

    const-string v3, "\u672a\u5206\u985e\u306e\u52d5\u753b"

    invoke-static {v0, v3, v1, v2}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v8, v10}, Le/e/a/LocalPlaylists$Page;->videoCount(Le/e/a/LocalPlaylistData;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda58;

    invoke-direct {v5, v7}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda58;-><init>(Le/e/a/LocalPlaylists$Page;)V

    const/4 v13, 0x0

    const-string v2, "playlist"

    move-object/from16 v0, p0

    move-object v1, v15

    move-object v14, v6

    move-object v6, v13

    invoke-virtual/range {v0 .. v6}, Le/e/a/LocalPlaylists$Page;->catalogRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    goto :goto_1e8

    :cond_1e7
    move-object v14, v6

    .line 64
    :goto_1e8
    const/4 v13, 0x0

    :goto_1e9
    iget-object v0, v8, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lt v13, v0, :cond_279

    .line 65
    iget-object v0, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v1, "+"

    invoke-static {v0, v1}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    const/high16 v1, 0x41f00000    # 30.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    invoke-static {v0}, Le/e/a/Ui110;->circle(Landroid/view/View;)V

    iget-object v1, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v2, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v2

    const/16 v3, 0x64

    invoke-static {v1, v2, v3}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_221

    iget-object v1, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v1

    goto :goto_224

    :cond_221
    const v1, -0xefeeec

    :goto_224
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    iget-object v1, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Create"

    const-string v3, "\u5efa\u7acb"

    const-string v4, "\u65b0\u898f\u4f5c\u6210"

    invoke-static {v1, v4, v2, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v2, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v3, 0x38

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    iget-object v4, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v4, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const v4, 0x800055

    invoke-direct {v1, v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    iget-object v2, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v3, 0x14

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    iget-object v4, v7, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v4, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v6, 0x0

    invoke-virtual {v1, v6, v6, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    move-object/from16 v5, v19

    invoke-virtual {v5, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda61;

    invoke-direct {v1, v7, v0}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda61;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/Button;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, v7, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v4, -0x1

    invoke-direct {v1, v4, v6, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v5, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    .line 64
    :cond_279
    move-object/from16 v5, v19

    const/4 v4, -0x1

    const/4 v6, 0x0

    iget-object v0, v8, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    iget-object v1, v7, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    if-eqz v1, :cond_293

    iget-object v1, v7, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    invoke-virtual {v9, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_290

    goto :goto_293

    :cond_290
    iget-object v1, v7, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    goto :goto_294

    :cond_293
    :goto_293
    move-object v1, v10

    :goto_294
    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2a5

    move/from16 v20, v4

    move-object/from16 v16, v5

    move/from16 v19, v6

    goto :goto_2d5

    :cond_2a5
    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v8, v1}, Le/e/a/LocalPlaylists$Page;->videoCount(Le/e/a/LocalPlaylistData;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    new-instance v2, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda59;

    invoke-direct {v2, v7, v1}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda59;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;)V

    new-instance v0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda60;

    invoke-direct {v0, v7, v1, v3}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda60;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/lang/String;)V

    const-string v17, "playlist"

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    move-object v1, v15

    move-object/from16 v19, v2

    move-object/from16 v2, v17

    move/from16 v20, v4

    move-object/from16 v4, v16

    move-object/from16 v16, v5

    move-object/from16 v5, v19

    move/from16 v19, v6

    move-object/from16 v6, v18

    invoke-virtual/range {v0 .. v6}, Le/e/a/LocalPlaylists$Page;->catalogRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    :goto_2d5
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v19, v16

    goto/16 :goto_1e9

    .line 63
    :cond_2db
    move-object v14, v6

    move-object/from16 v16, v19

    move-object/from16 v9, v21

    const/16 v19, 0x0

    const/16 v20, -0x1

    iget-object v2, v8, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2f5

    const/4 v1, 0x1

    :cond_2f5
    add-int/lit8 v0, v0, 0x1

    move-object/from16 v21, v9

    move-object v6, v14

    move-object/from16 v19, v16

    goto/16 :goto_1b0

    .line 61
    :cond_2fe
    move/from16 v19, v10

    iget-object v2, v8, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, v7, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31c

    iget-object v0, v8, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_31c
    add-int/lit8 v1, v1, 0x1

    move/from16 v10, v19

    goto/16 :goto_2b
.end method

.method catalogRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .registers 14

    .line 67
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

    if-eqz v4, :cond_3d

    iget-object v4, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v4}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v4

    goto :goto_43

    :cond_3d
    iget-object v4, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v4}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v4

    :goto_43
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

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 p3, 0x3a

    invoke-static {p2, p3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p2

    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    new-instance p2, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda51;

    invoke-direct {p2, p5}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda51;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz p6, :cond_d4

    new-instance p2, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda52;

    invoke-direct {p2, p6}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda52;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    :cond_d4
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p1}, Le/e/a/PanelUi;->divider(Landroid/widget/LinearLayout;)V

    return-void
.end method

.method createItem(Z)V
    .registers 8

    .line 58
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSingleLine(Z)V

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    if-eqz p1, :cond_1a

    const-string v3, "Folder name"

    const-string v4, "\u8cc7\u6599\u593e\u540d\u7a31"

    const-string v5, "\u30d5\u30a9\u30eb\u30c0\u30fc\u540d"

    goto :goto_20

    :cond_1a
    const-string v3, "Playlist name"

    const-string v4, "\u64ad\u653e\u6e05\u55ae\u540d\u7a31"

    const-string v5, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u540d"

    :goto_20
    invoke-static {v2, v5, v3, v4}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    if-eqz p1, :cond_36

    const-string v3, "Create folder"

    const-string v4, "\u5efa\u7acb\u8cc7\u6599\u593e"

    const-string v5, "\u30d5\u30a9\u30eb\u30c0\u30fc\u4f5c\u6210"

    goto :goto_3c

    :cond_36
    const-string v3, "Create playlist"

    const-string v4, "\u5efa\u7acb\u64ad\u653e\u6e05\u55ae"

    const-string v5, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u4f5c\u6210"

    :goto_3c
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

    new-instance v3, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda70;

    invoke-direct {v3, p0, v1, v0, p1}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda70;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/EditText;Landroid/app/AlertDialog;Z)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method createMenu(Landroid/view/View;)V
    .registers 18

    .line 60
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Le/e/a/LocalPlaylists$Page;->createPopup:Landroid/widget/PopupWindow;

    if-eqz v2, :cond_16

    iget-object v2, v0, Le/e/a/LocalPlaylists$Page;->createPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v2}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_16

    iget-object v1, v0, Le/e/a/LocalPlaylists$Page;->createPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->dismiss()V

    return-void

    :cond_16
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

    :goto_82
    const/16 v12, 0x10

    const/4 v13, 0x2

    if-lt v11, v13, :cond_104

    invoke-static {v2, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    const/high16 v8, 0x40000000    # 2.0f

    invoke-static {v6, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    invoke-static {v9, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    invoke-virtual {v3, v6, v8}, Landroid/widget/LinearLayout;->measure(II)V

    new-array v6, v13, [I

    invoke-virtual {v1, v6}, Landroid/view/View;->getLocationOnScreen([I)V

    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v1, v8}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    invoke-static {v2, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    const/16 v11, 0x78

    invoke-static {v2, v11}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    aget v13, v6, v9

    iget v14, v8, Landroid/graphics/Rect;->left:I

    sub-int/2addr v13, v14

    invoke-static {v2, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    sub-int/2addr v13, v12

    invoke-static {v11, v13}, Ljava/lang/Math;->max(II)I

    move-result v11

    invoke-static {v7, v11}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-virtual {v5, v7}, Landroid/widget/PopupWindow;->setWidth(I)V

    iget v11, v8, Landroid/graphics/Rect;->left:I

    invoke-static {v2, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    add-int/2addr v11, v12

    aget v9, v6, v9

    sub-int/2addr v9, v7

    invoke-static {v2, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    sub-int/2addr v9, v7

    invoke-static {v11, v9}, Ljava/lang/Math;->max(II)I

    move-result v7

    iget v9, v8, Landroid/graphics/Rect;->top:I

    invoke-static {v2, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    add-int/2addr v9, v11

    aget v6, v6, v10

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v10

    add-int/2addr v6, v10

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v10

    sub-int/2addr v6, v10

    iget v8, v8, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v3

    sub-int/2addr v8, v3

    invoke-static {v2, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    sub-int/2addr v8, v2

    invoke-static {v6, v8}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v9, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    const/16 v3, 0x33

    invoke-virtual {v5, v1, v3, v7, v2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    return-void

    :cond_104
    if-ne v11, v10, :cond_108

    move v13, v10

    goto :goto_109

    :cond_108
    move v13, v9

    :goto_109
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

    new-instance v4, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda43;

    invoke-direct {v4, v0, v5, v13}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda43;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/PopupWindow;Z)V

    invoke-virtual {v14, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v11, v11, 0x1

    const/16 v4, 0x8

    goto/16 :goto_82
.end method

.method delete()V
    .registers 6

    .line 79
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    :cond_9
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Remove selected videos?"

    const-string v3, "\u522a\u9664\u6240\u9078\u5f71\u7247\uff1f"

    const-string v4, "\u9078\u629e\u3057\u305f\u52d5\u753b\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {v1, v4, v2, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Delete"

    const-string v3, "\u522a\u9664"

    const-string v4, "\u524a\u9664"

    invoke-static {v1, v4, v2, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda71;

    invoke-direct {v2, p0}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda71;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Cancel"

    const-string v3, "\u53d6\u6d88"

    const-string v4, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v1, v4, v2, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method deleteFolder()V
    .registers 7

    .line 77
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-eqz v0, :cond_55

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_55

    :cond_d
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Playlist"

    const-string v3, "\u64ad\u653e\u6e05\u55ae"

    const-string v4, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8"

    invoke-static {v1, v4, v2, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :try_start_1b
    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/LocalPlaylists;->read(Landroid/content/Context;)Le/e/a/LocalPlaylistData;

    move-result-object v2
    :try_end_21
    .catch Ljava/lang/IllegalStateException; {:try_start_1b .. :try_end_21} :catch_51

    const/4 v3, 0x0

    :goto_22
    iget-object v4, v2, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v3, v4, :cond_2b

    goto :goto_43

    :cond_2b
    iget-object v4, v2, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "id"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4e

    const-string v1, "name"

    invoke-virtual {v4, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_43
    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v3, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda72;

    invoke-direct {v3, p0}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda72;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {v2, v0, v1, v3}, Le/e/a/LocalPlaylists;->confirmFolderDelete(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void

    :cond_4e
    add-int/lit8 v3, v3, 0x1

    goto :goto_22

    :catch_51
    move-exception v0

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_55
    :goto_55
    return-void
.end method

.method disable(Landroid/view/View;)V
    .registers 4

    .line 81
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setLongClickable(Z)V

    instance-of v1, p1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_1e

    check-cast p1, Landroid/view/ViewGroup;

    :goto_d
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_14

    goto :goto_1e

    :cond_14
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Le/e/a/LocalPlaylists$Page;->disable(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_1e
    :goto_1e
    return-void
.end method

.method editCatalog(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 14

    .line 68
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v3

    const-string v0, "\u524a\u9664"

    const-string v1, "\u540d\u524d\u3092\u5909\u66f4"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz p3, :cond_19

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v1, v0}, [Ljava/lang/String;

    move-result-object v0

    goto :goto_27

    :cond_19
    const-string v2, "\u79fb\u52d5"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v1, v2, v0}, [Ljava/lang/String;

    move-result-object v0

    :goto_27
    invoke-static {v3}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    new-instance v9, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda50;

    move-object v1, v9

    move-object v2, p0

    move-object v4, p2

    move-object v5, v0

    move v6, p3

    move-object v7, p1

    invoke-direct/range {v1 .. v7}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda50;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;ZLjava/lang/String;)V

    invoke-virtual {v8, v0, v9}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$0$e-e-a-LocalPlaylists$Page(Landroid/view/View;)V
    .registers 2

    .line 38
    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void
.end method

.method synthetic lambda$1$e-e-a-LocalPlaylists$Page([ZLandroid/widget/CheckBox;Landroid/widget/CompoundButton;Z)V
    .registers 6

    .line 40
    const/4 p3, 0x0

    aget-boolean v0, p1, p3

    if-eqz v0, :cond_6

    return-void

    :cond_6
    iput-boolean p4, p0, Le/e/a/LocalPlaylists$Page;->continuous:Z

    if-eqz p4, :cond_18

    iget-boolean p4, p0, Le/e/a/LocalPlaylists$Page;->shuffle:Z

    if-eqz p4, :cond_18

    const/4 p4, 0x1

    aput-boolean p4, p1, p3

    iput-boolean p3, p0, Le/e/a/LocalPlaylists$Page;->shuffle:Z

    invoke-virtual {p2, p3}, Landroid/widget/CheckBox;->setChecked(Z)V

    aput-boolean p3, p1, p3

    :cond_18
    return-void
.end method

.method synthetic lambda$10$e-e-a-LocalPlaylists$Page(Ljava/lang/String;)V
    .registers 2

    .line 62
    iput-object p1, p0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void
.end method

.method synthetic lambda$11$e-e-a-LocalPlaylists$Page(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 62
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Le/e/a/LocalPlaylists$Page;->editCatalog(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method synthetic lambda$12$e-e-a-LocalPlaylists$Page()V
    .registers 2

    .line 63
    const-string v0, ""

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void
.end method

.method synthetic lambda$13$e-e-a-LocalPlaylists$Page(Ljava/lang/String;)V
    .registers 2

    .line 64
    iput-object p1, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void
.end method

.method synthetic lambda$14$e-e-a-LocalPlaylists$Page(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 64
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Le/e/a/LocalPlaylists$Page;->editCatalog(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method synthetic lambda$15$e-e-a-LocalPlaylists$Page(Landroid/widget/Button;Landroid/view/View;)V
    .registers 3

    .line 65
    invoke-virtual {p0, p1}, Le/e/a/LocalPlaylists$Page;->createMenu(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$18$e-e-a-LocalPlaylists$Page(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;ZLjava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 16

    .line 68
    const-string p6, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-nez p7, :cond_48

    new-instance v4, Landroid/widget/EditText;

    invoke-direct {v4, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    aget-object p2, p3, v1

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-static {p6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u4fdd\u5b58"

    invoke-static {p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v7

    invoke-static {v7}, Le/e/a/PlaybackSession;->showForm(Landroid/app/AlertDialog;)V

    const/4 p1, -0x1

    invoke-virtual {v7, p1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p1

    new-instance p2, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda64;

    move-object v2, p2

    move-object v3, p0

    move v5, p4

    move-object v6, p5

    invoke-direct/range {v2 .. v7}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda64;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/EditText;ZLjava/lang/String;Landroid/app/AlertDialog;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_100

    :cond_48
    if-nez p4, :cond_b7

    const/4 v2, 0x1

    if-ne p7, v2, :cond_b7

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {p2}, Le/e/a/LocalPlaylists;->read(Landroid/content/Context;)Le/e/a/LocalPlaylistData;

    move-result-object p7

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const-string p2, ""

    invoke-interface {v3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string p4, "Unfiled"

    const-string p6, "\u672a\u5206\u985e"

    const-string v0, "\u30d5\u30a9\u30eb\u30c0\u30fc\u672a\u5206\u985e"

    invoke-static {p2, v0, p4, p6}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v4, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move p2, v1

    :goto_72
    iget-object p4, p7, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {p4}, Lorg/json/JSONArray;->length()I

    move-result p4

    if-lt p2, p4, :cond_96

    invoke-static {p1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    aget-object p2, p3, v2

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-array p2, v1, [Ljava/lang/String;

    invoke-interface {v4, p2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/CharSequence;

    new-instance p3, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda65;

    invoke-direct {p3, p0, p5, v3}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda65;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/util/List;)V

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    goto :goto_ee

    :cond_96
    iget-object p4, p7, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {p4, p2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object p4

    const-string p6, "id"

    invoke-virtual {p4, p6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-interface {v3, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p4, p7, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {p4, p2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object p4

    const-string p6, "name"

    invoke-virtual {p4, p6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-interface {v4, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 p2, p2, 0x1

    goto :goto_72

    :cond_b7
    if-eqz p4, :cond_f6

    invoke-static {p1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u30d5\u30a9\u30eb\u30c0\u30fc\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string p3, "Playlists will be kept"

    const-string p4, "\u64ad\u653e\u6e05\u55ae\u5c07\u88ab\u4fdd\u7559"

    const-string p7, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u306f\u4fdd\u6301\u3055\u308c\u307e\u3059"

    invoke-static {p2, p7, p3, p4}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

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

    new-instance p3, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda66;

    invoke-direct {p3, p0, p5}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda66;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;)V

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    :goto_ee
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    goto :goto_100

    :cond_f6
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance p3, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda67;

    invoke-direct {p3, p0}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda67;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {p1, p5, p2, p3}, Le/e/a/LocalPlaylists;->confirmFolderDelete(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    :goto_100
    return-void
.end method

.method synthetic lambda$19$e-e-a-LocalPlaylists$Page(Landroid/widget/EditText;ZLjava/lang/String;Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 7

    .line 68
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p5

    if-eqz p5, :cond_13

    return-void

    :cond_13
    iget-object p5, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda68;

    invoke-direct {v0, p2, p3, p1}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda68;-><init>(ZLjava/lang/String;Ljava/lang/String;)V

    new-instance p1, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda69;

    invoke-direct {p1, p0, p4}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda69;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/app/AlertDialog;)V

    invoke-static {p5, v0, p1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method synthetic lambda$2$e-e-a-LocalPlaylists$Page([ZLandroid/widget/CheckBox;Landroid/widget/CompoundButton;Z)V
    .registers 6

    .line 40
    const/4 p3, 0x0

    aget-boolean v0, p1, p3

    if-eqz v0, :cond_6

    return-void

    :cond_6
    iput-boolean p4, p0, Le/e/a/LocalPlaylists$Page;->shuffle:Z

    if-eqz p4, :cond_18

    iget-boolean p4, p0, Le/e/a/LocalPlaylists$Page;->continuous:Z

    if-eqz p4, :cond_18

    const/4 p4, 0x1

    aput-boolean p4, p1, p3

    iput-boolean p3, p0, Le/e/a/LocalPlaylists$Page;->continuous:Z

    invoke-virtual {p2, p3}, Landroid/widget/CheckBox;->setChecked(Z)V

    aput-boolean p3, p1, p3

    :cond_18
    return-void
.end method

.method synthetic lambda$21$e-e-a-LocalPlaylists$Page(Landroid/app/AlertDialog;Ljava/lang/Boolean;)V
    .registers 3

    .line 68
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_c

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_c
    return-void
.end method

.method synthetic lambda$22$e-e-a-LocalPlaylists$Page(Ljava/lang/String;Ljava/util/List;Landroid/content/DialogInterface;I)V
    .registers 6

    .line 68
    iget-object p3, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda48;

    invoke-direct {v0, p1, p2, p4}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda48;-><init>(Ljava/lang/String;Ljava/util/List;I)V

    new-instance p1, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda49;

    invoke-direct {p1, p0}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda49;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {p3, v0, p1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method synthetic lambda$24$e-e-a-LocalPlaylists$Page(Ljava/lang/Boolean;)V
    .registers 2

    .line 68
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_9

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_9
    return-void
.end method

.method synthetic lambda$25$e-e-a-LocalPlaylists$Page(Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 68
    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance p3, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda62;

    invoke-direct {p3, p1}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda62;-><init>(Ljava/lang/String;)V

    new-instance p1, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda63;

    invoke-direct {p1, p0}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda63;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {p2, p3, p1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method synthetic lambda$27$e-e-a-LocalPlaylists$Page(Ljava/lang/Boolean;)V
    .registers 2

    .line 68
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_9

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_9
    return-void
.end method

.method synthetic lambda$3$e-e-a-LocalPlaylists$Page(Lorg/json/JSONObject;Lorg/json/JSONObject;)I
    .registers 6

    .line 42
    iget v0, p0, Le/e/a/LocalPlaylists$Page;->sort:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_14

    const-string v0, "title"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    goto :goto_30

    :cond_14
    iget v0, p0, Le/e/a/LocalPlaylists$Page;->sort:I

    const/4 v1, 0x1

    const-string v2, "date"

    if-ne v0, v1, :cond_24

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide p1

    goto :goto_2c

    :cond_24
    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide p1

    :goto_2c
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Long;->compare(JJ)I

    move-result p1

    :goto_30
    return p1
.end method

.method synthetic lambda$30$e-e-a-LocalPlaylists$Page()V
    .registers 2

    .line 71
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->selectionChanged()V

    return-void
.end method

.method synthetic lambda$31$e-e-a-LocalPlaylists$Page()V
    .registers 5

    .line 71
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_10

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->selectionChanged()V

    return-void

    :cond_10
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    const-string v3, "id"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_6
.end method

.method synthetic lambda$32$e-e-a-LocalPlaylists$Page()V
    .registers 2

    .line 71
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->selectionChanged()V

    return-void
.end method

.method synthetic lambda$33$e-e-a-LocalPlaylists$Page(Ljava/lang/String;)V
    .registers 5

    .line 75
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v2, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda38;

    invoke-direct {v2, v0, p1}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda38;-><init>(Ljava/util/Set;Ljava/lang/String;)V

    new-instance p1, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda39;

    invoke-direct {p1, p0}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda39;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {v1, v2, p1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method synthetic lambda$35$e-e-a-LocalPlaylists$Page(Ljava/lang/Boolean;)V
    .registers 2

    .line 75
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_11

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_11
    return-void
.end method

.method synthetic lambda$36$e-e-a-LocalPlaylists$Page()V
    .registers 2

    .line 77
    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void
.end method

.method synthetic lambda$37$e-e-a-LocalPlaylists$Page(Landroid/content/DialogInterface;I)V
    .registers 4

    .line 79
    new-instance p1, Ljava/util/HashSet;

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iget-object p2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda53;

    invoke-direct {v0, p1}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda53;-><init>(Ljava/util/Set;)V

    new-instance p1, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda54;

    invoke-direct {p1, p0}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda54;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {p2, v0, p1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method synthetic lambda$39$e-e-a-LocalPlaylists$Page(Ljava/lang/Boolean;)V
    .registers 2

    .line 79
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_11

    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_11
    return-void
.end method

.method synthetic lambda$4$e-e-a-LocalPlaylists$Page(Ljava/util/ArrayList;Ljava/util/Map;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 15

    .line 55
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-lt p5, p3, :cond_7

    return-void

    :cond_7
    invoke-virtual {p1, p5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    invoke-interface {p2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/json/JSONObject;

    iget-boolean p3, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    if-eqz p3, :cond_1f

    const-string p1, "id"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/LocalPlaylists$Page;->toggle(Ljava/lang/String;)V

    goto :goto_40

    :cond_1f
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string p3, "url"

    invoke-virtual {p2, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string p3, "title"

    invoke-virtual {p2, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-boolean p2, p0, Le/e/a/LocalPlaylists$Page;->continuous:Z

    if-nez p2, :cond_37

    iget-boolean p2, p0, Le/e/a/LocalPlaylists$Page;->shuffle:Z

    if-nez p2, :cond_37

    const/4 p2, 0x0

    goto :goto_38

    :cond_37
    const/4 p2, 0x1

    :goto_38
    move v5, p2

    iget-boolean v6, p0, Le/e/a/LocalPlaylists$Page;->shuffle:Z

    move-object v3, p1

    move v4, p5

    invoke-static/range {v0 .. v6}, Le/e/a/PlaylistPlayback;->launchTap(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;IZZ)V

    :goto_40
    return-void
.end method

.method synthetic lambda$5$e-e-a-LocalPlaylists$Page(Landroid/widget/EditText;Landroid/app/AlertDialog;ZLandroid/view/View;)V
    .registers 7

    .line 58
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1c

    const-string p2, "\u540d\u524d\u3092\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_1c
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    const/4 v0, -0x1

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v1, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda40;

    invoke-direct {v1, p3, p4, p1}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda40;-><init>(ZLjava/lang/String;Ljava/lang/String;)V

    new-instance p1, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda41;

    invoke-direct {p1, p0, p2}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda41;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/app/AlertDialog;)V

    invoke-static {v0, v1, p1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method synthetic lambda$7$e-e-a-LocalPlaylists$Page(Landroid/app/AlertDialog;Ljava/lang/Boolean;)V
    .registers 5

    .line 58
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_15

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_15
    return-void
.end method

.method synthetic lambda$8$e-e-a-LocalPlaylists$Page(Landroid/widget/PopupWindow;ZLandroid/view/View;)V
    .registers 4

    .line 60
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    invoke-virtual {p0, p2}, Le/e/a/LocalPlaylists$Page;->createItem(Z)V

    return-void
.end method

.method synthetic lambda$9$e-e-a-LocalPlaylists$Page()V
    .registers 2

    .line 62
    const-string v0, "@unfiled"

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void
.end method

.method moveSelected()V
    .registers 4

    .line 75
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    :cond_9
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    new-instance v2, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda42;

    invoke-direct {v2, p0}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda42;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {v0, v1, v2}, Le/e/a/LocalPlaylists;->choose(Landroid/content/Context;Ljava/lang/String;Ljava/util/function/Consumer;)V

    return-void
.end method

.method render()V
    .registers 27

    .line 38
    move-object/from16 v1, p0

    const-string v0, "postedAt"

    const-string v2, "thumbnail"

    const-string v3, "posttime"

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->createPopup:Landroid/widget/PopupWindow;

    if-eqz v4, :cond_11

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->createPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v4}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_11
    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    const-string v5, "nicoid_playlist_folder"

    if-nez v4, :cond_21

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    goto :goto_2c

    :cond_21
    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    iget-object v6, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :goto_2c
    :try_start_2c
    iget-object v5, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v5}, Le/e/a/LocalPlaylists;->read(Landroid/content/Context;)Le/e/a/LocalPlaylistData;

    move-result-object v5
    :try_end_32
    .catch Ljava/lang/IllegalStateException; {:try_start_2c .. :try_end_32} :catch_4cd

    new-instance v6, Ljava/lang/StringBuilder;

    iget-object v7, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, v1, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v8, v1, Le/e/a/LocalPlaylists$Page;->sort:I

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v8, v1, Le/e/a/LocalPlaylists$Page;->selecting:Z

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v8, v1, Le/e/a/LocalPlaylists$Page;->continuous:Z

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v8, v1, Le/e/a/LocalPlaylists$Page;->shuffle:Z

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {v8}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Configuration;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v7}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, v1, Le/e/a/LocalPlaylists$Page;->renderedData:Le/e/a/LocalPlaylistData;

    if-ne v7, v5, :cond_b2

    iget-object v7, v1, Le/e/a/LocalPlaylists$Page;->renderedKey:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_b2

    iget-object v7, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v7}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v7

    if-lez v7, :cond_b2

    return-void

    :cond_b2
    iput-object v5, v1, Le/e/a/LocalPlaylists$Page;->renderedData:Le/e/a/LocalPlaylistData;

    iput-object v6, v1, Le/e/a/LocalPlaylists$Page;->renderedKey:Ljava/lang/String;

    iget-object v6, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v6}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/4 v6, 0x0

    iput-object v6, v1, Le/e/a/LocalPlaylists$Page;->display:Landroid/widget/BaseAdapter;

    iput-object v6, v1, Le/e/a/LocalPlaylists$Page;->videoList:Landroid/widget/ListView;

    iput-object v6, v1, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;

    iput-object v6, v1, Le/e/a/LocalPlaylists$Page;->count:Landroid/widget/TextView;

    iget-object v7, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-eqz v7, :cond_d2

    iget-object v7, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-virtual {v5, v7}, Le/e/a/LocalPlaylistData;->hasFolder(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_d2

    iput-object v6, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    :cond_d2
    iget-object v6, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-nez v6, :cond_da

    invoke-virtual {v1, v5}, Le/e/a/LocalPlaylists$Page;->catalog(Le/e/a/LocalPlaylistData;)V

    return-void

    .line 39
    :cond_da
    iget-object v6, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v7, "Unfiled videos"

    const-string v8, "\u672a\u5206\u985e\u5f71\u7247"

    const-string v9, "\u30d5\u30a9\u30eb\u30c0\u30fc\u672a\u5206\u985e"

    invoke-static {v6, v9, v7, v8}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    move v8, v7

    :goto_e8
    iget-object v9, v5, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-lt v8, v9, :cond_49c

    invoke-virtual {v1, v6}, Le/e/a/LocalPlaylists$Page;->toolbar(Ljava/lang/String;)V

    .line 40
    new-instance v6, Landroid/widget/LinearLayout;

    iget-object v8, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v6, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v8, 0x10

    invoke-virtual {v6, v8}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v8, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v9, 0x8

    invoke-static {v8, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    iget-object v10, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v10, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-virtual {v6, v8, v7, v10, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v8, Landroid/widget/CheckBox;

    iget-object v10, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v8, v10}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    new-instance v10, Landroid/widget/CheckBox;

    iget-object v11, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v10, v11}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iget-object v11, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v12, "Continuous play"

    const-string v13, "\u9023\u7e8c\u64ad\u653e"

    const-string v14, "\u9023\u7d9a\u518d\u751f"

    invoke-static {v11, v14, v12, v13}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    iget-object v11, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v12, "Shuffle play"

    const-string v13, "\u96a8\u6a5f\u64ad\u653e"

    const-string v14, "\u30b7\u30e3\u30c3\u30d5\u30eb\u518d\u751f"

    invoke-static {v11, v14, v12, v13}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v8}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    invoke-static {v10}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    iget-boolean v11, v1, Le/e/a/LocalPlaylists$Page;->continuous:Z

    invoke-virtual {v8, v11}, Landroid/widget/CheckBox;->setChecked(Z)V

    iget-boolean v11, v1, Le/e/a/LocalPlaylists$Page;->shuffle:Z

    invoke-virtual {v10, v11}, Landroid/widget/CheckBox;->setChecked(Z)V

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v12, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v13, 0x30

    invoke-static {v12, v13}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    const/high16 v14, 0x3f800000    # 1.0f

    invoke-direct {v11, v7, v12, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v6, v8, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v12, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v12, v13}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v11, v7, v12, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v6, v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v11, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v11, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/4 v11, 0x1

    new-array v6, v11, [Z

    new-instance v12, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda74;

    invoke-direct {v12, v1, v6, v10}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda74;-><init>(Le/e/a/LocalPlaylists$Page;[ZLandroid/widget/CheckBox;)V

    invoke-virtual {v8, v12}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    new-instance v12, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda75;

    invoke-direct {v12, v1, v6, v8}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda75;-><init>(Le/e/a/LocalPlaylists$Page;[ZLandroid/widget/CheckBox;)V

    invoke-virtual {v10, v12}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 41
    new-instance v6, Landroid/widget/Spinner;

    iget-object v8, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v6, v8}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    new-instance v8, Landroid/widget/ArrayAdapter;

    iget-object v10, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v12, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v13, "Newest first"

    const-string v15, "\u7531\u65b0\u5230\u820a"

    const-string v4, "\u65b0\u3057\u3044\u9806"

    invoke-static {v12, v4, v13, v15}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v12, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v13, "Oldest first"

    const-string v15, "\u7531\u820a\u5230\u65b0"

    const-string v14, "\u53e4\u3044\u9806"

    invoke-static {v12, v14, v13, v15}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iget-object v13, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v14, "Title"

    const-string v15, "\u6a19\u984c\u9806"

    const-string v11, "\u30bf\u30a4\u30c8\u30eb\u9806"

    invoke-static {v13, v11, v14, v15}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    filled-new-array {v4, v12, v11}, [Ljava/lang/String;

    move-result-object v4

    const v11, 0x1090009

    invoke-direct {v8, v10, v11, v4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    invoke-virtual {v6, v8}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    iget v4, v1, Le/e/a/LocalPlaylists$Page;->sort:I

    invoke-virtual {v6, v4}, Landroid/widget/Spinner;->setSelection(I)V

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v4, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    iget-object v8, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v8, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v6, v4, v7, v8, v7}, Landroid/widget/Spinner;->setPadding(IIII)V

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v9, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v10, 0x28

    invoke-static {v9, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    const/4 v10, -0x1

    invoke-direct {v8, v10, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Le/e/a/LocalPlaylists$Page$1;

    invoke-direct {v4, v1}, Le/e/a/LocalPlaylists$Page$1;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-virtual {v6, v4}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 42
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, v1, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    move v4, v7

    :goto_1f7
    iget-object v6, v5, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v6

    const-string v8, "owner"

    const-string v9, "title"

    if-lt v4, v6, :cond_45a

    iget-object v4, v1, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    new-instance v5, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda76;

    invoke-direct {v5, v1}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda76;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {v4, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 43
    new-instance v4, Landroid/widget/ListView;

    iget-object v5, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v4, v5}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v4, v1, Le/e/a/LocalPlaylists$Page;->videoList:Landroid/widget/ListView;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    new-instance v6, Ljava/util/IdentityHashMap;

    invoke-direct {v6}, Ljava/util/IdentityHashMap;-><init>()V

    :try_start_220
    const-string v11, "e.e.a.x1"

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    const-string v12, "e.e.a.y0"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    iget-object v13, v1, Le/e/a/LocalPlaylists$Page;->images:Ljava/lang/Object;

    if-nez v13, :cond_25b

    const/4 v13, 0x1

    new-array v14, v13, [Ljava/lang/Class;

    const-class v13, Landroid/content/Context;

    aput-object v13, v14, v7

    invoke-virtual {v12, v14}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v13

    const/4 v14, 0x1

    new-array v15, v14, [Ljava/lang/Object;

    iget-object v14, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    aput-object v14, v15, v7

    invoke-virtual {v13, v15}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    iput-object v13, v1, Le/e/a/LocalPlaylists$Page;->images:Ljava/lang/Object;

    iget-object v13, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v13

    const-string v14, "G"

    invoke-virtual {v13, v14}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v13

    iget-object v14, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v15, v1, Le/e/a/LocalPlaylists$Page;->images:Ljava/lang/Object;

    invoke-virtual {v13, v14, v15}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_25b
    iget-object v13, v1, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_261
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    const/4 v15, 0x3

    const/4 v10, 0x2

    if-nez v14, :cond_2e2

    const-string v0, "e.e.a.b0"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v2, 0x4

    new-array v3, v2, [Ljava/lang/Class;

    const-class v8, Landroid/content/Context;

    aput-object v8, v3, v7

    const-class v8, Ljava/util/ArrayList;

    const/4 v9, 0x1

    aput-object v8, v3, v9

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v3, v10

    aput-object v12, v3, v15

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    aput-object v3, v2, v7

    const/4 v3, 0x1

    aput-object v5, v2, v3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v10

    iget-object v3, v1, Le/e/a/LocalPlaylists$Page;->images:Ljava/lang/Object;

    aput-object v3, v2, v15

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

    const/4 v8, 0x1

    new-array v9, v8, [Ljava/lang/Class;

    const-class v8, Landroid/app/Activity;

    aput-object v8, v9, v7

    invoke-virtual {v3, v9}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    iget-object v9, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    aput-object v9, v8, v7

    invoke-virtual {v3, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Le/e/a/LocalPlaylists$Page$2;

    invoke-direct {v2, v1, v0, v6, v5}, Le/e/a/LocalPlaylists$Page$2;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/BaseAdapter;Ljava/util/Map;Ljava/util/ArrayList;)V

    iput-object v2, v1, Le/e/a/LocalPlaylists$Page;->display:Landroid/widget/BaseAdapter;

    .line 55
    iget-object v2, v1, Le/e/a/LocalPlaylists$Page;->display:Landroid/widget/BaseAdapter;

    invoke-virtual {v4, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-static {v0, v1}, Le/e/a/LocalPlaylists;->registerAdapter(Ljava/lang/Object;Le/e/a/LocalPlaylists$Page;)V

    new-instance v0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda77;

    invoke-direct {v0, v1, v5, v6}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda77;-><init>(Le/e/a/LocalPlaylists$Page;Ljava/util/ArrayList;Ljava/util/Map;)V

    invoke-virtual {v4, v0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    move-object/from16 v17, v4

    goto/16 :goto_420

    .line 43
    :cond_2e2
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/json/JSONObject;

    new-array v15, v7, [Ljava/lang/Class;

    invoke-virtual {v11, v15}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v15

    new-array v10, v7, [Ljava/lang/Object;

    invoke-virtual {v15, v10}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    const-string v15, "a"

    move-object/from16 v19, v12

    const/4 v7, 0x2

    new-array v12, v7, [Ljava/lang/Class;

    const-class v7, Ljava/lang/String;

    const/16 v18, 0x0

    aput-object v7, v12, v18

    const-class v7, Ljava/lang/Object;

    const/16 v16, 0x1

    aput-object v7, v12, v16

    invoke-virtual {v11, v15, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    const/4 v12, 0x2

    new-array v15, v12, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v9, v15, v12

    invoke-virtual {v14, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const/16 v16, 0x1

    aput-object v12, v15, v16

    invoke-virtual {v7, v10, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v12, 0x2

    new-array v15, v12, [Ljava/lang/Object;

    const-string v12, "videourl"

    const/16 v18, 0x0

    aput-object v12, v15, v18

    const-string v12, "url"

    invoke-virtual {v14, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const/16 v16, 0x1

    aput-object v12, v15, v16

    invoke-virtual {v7, v10, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v12, 0x2

    new-array v15, v12, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v2, v15, v12

    invoke-virtual {v14, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const/16 v16, 0x1

    aput-object v12, v15, v16

    invoke-virtual {v7, v10, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v12, 0x3

    new-array v15, v12, [Ljava/lang/String;

    const-string v12, "length"

    const/16 v18, 0x0

    aput-object v12, v15, v18

    const-string v12, "videoinfo"

    const/16 v16, 0x1

    aput-object v12, v15, v16

    const/4 v12, 0x2

    aput-object v3, v15, v12
    :try_end_355
    .catch Ljava/lang/Exception; {:try_start_220 .. :try_end_355} :catch_416

    const/4 v12, 0x0

    :goto_356
    move-object/from16 v20, v2

    const-string v2, ""

    move-object/from16 v21, v13

    const-string v13, "date"

    move-object/from16 v22, v9

    const/4 v9, 0x3

    if-lt v12, v9, :cond_3c4

    const/4 v9, 0x2

    :try_start_364
    new-array v12, v9, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v3, v12, v9

    new-instance v9, Landroid/text/SpannableString;
    :try_end_36b
    .catch Ljava/lang/Exception; {:try_start_364 .. :try_end_36b} :catch_416

    move-object/from16 v23, v3

    move-object/from16 v17, v4

    :try_start_36f
    invoke-virtual {v14, v13}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v3

    const-string v13, "\u767b\u9332"

    invoke-static {v3, v4, v13}, Le/e/a/VideoRows191;->date(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v9, v3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    const/4 v3, 0x1

    aput-object v9, v12, v3

    invoke-virtual {v7, v10, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-virtual {v14, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v3, v4

    invoke-virtual {v7, v10, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "b"

    invoke-virtual {v11, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const-string v3, "videoId"

    invoke-virtual {v14, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v10, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v2, "y"

    invoke-virtual {v11, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v14, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v10, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v6, v10, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v4, v17

    move-object/from16 v12, v19

    move-object/from16 v2, v20

    move-object/from16 v13, v21

    move-object/from16 v9, v22

    move-object/from16 v3, v23

    const/4 v7, 0x0

    const/4 v10, -0x1

    goto/16 :goto_261

    :cond_3c4
    move-object/from16 v23, v3

    move-object/from16 v17, v4

    aget-object v3, v15, v12

    const/4 v4, 0x2

    new-array v9, v4, [Ljava/lang/Object;

    const/16 v18, 0x0

    aput-object v3, v9, v18

    new-instance v4, Landroid/text/SpannableString;

    move-object/from16 v24, v0

    move-object/from16 v0, v23

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_3f0

    const-string v2, "yyyy/MM/dd HH:mm"

    move-object/from16 v23, v5

    move-object/from16 v25, v6

    invoke-virtual {v14, v13}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v5

    invoke-static {v2, v5, v6}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_3f4

    :cond_3f0
    move-object/from16 v23, v5

    move-object/from16 v25, v6

    :goto_3f4
    invoke-virtual {v14, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    const/4 v2, 0x1

    aput-object v4, v9, v2

    invoke-virtual {v7, v10, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_401
    .catch Ljava/lang/Exception; {:try_start_36f .. :try_end_401} :catch_414

    add-int/lit8 v12, v12, 0x1

    move-object v3, v0

    move-object/from16 v4, v17

    move-object/from16 v2, v20

    move-object/from16 v13, v21

    move-object/from16 v9, v22

    move-object/from16 v5, v23

    move-object/from16 v0, v24

    move-object/from16 v6, v25

    goto/16 :goto_356

    .line 55
    :catch_414
    move-exception v0

    goto :goto_419

    :catch_416
    move-exception v0

    move-object/from16 v17, v4

    :goto_419
    const-string v2, "nicoid-playlist"

    const-string v3, "Unable to build video list"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 56
    :goto_420
    iget-object v0, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    invoke-direct {v2, v3, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    move-object/from16 v3, v17

    invoke-virtual {v0, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, v1, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_456

    iget-object v0, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v2, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v3, "No videos"

    const-string v4, "\u6c92\u6709\u5f71\u7247"

    const-string v5, "\u52d5\u753b\u306f\u3042\u308a\u307e\u305b\u3093"

    invoke-static {v2, v5, v3, v4}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe

    invoke-static {v0, v2, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    const/16 v2, 0x11

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v2, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_456
    invoke-virtual/range {p0 .. p0}, Le/e/a/LocalPlaylists$Page;->selectionChanged()V

    .line 57
    return-void

    .line 42
    :cond_45a
    move-object/from16 v24, v0

    move-object/from16 v20, v2

    move-object v0, v3

    move-object/from16 v22, v9

    move v3, v10

    const/4 v2, 0x1

    move v9, v7

    const/high16 v7, 0x3f800000    # 1.0f

    iget-object v6, v5, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v6, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    iget-object v10, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    const-string v11, "folder"

    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_491

    iget-object v10, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    move-object/from16 v11, v22

    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v10, v11, v8}, Le/e/a/ContentFilter;->blocked(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_491

    iget-object v8, v1, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {v8, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_491
    add-int/lit8 v4, v4, 0x1

    move v10, v3

    move v7, v9

    move-object/from16 v2, v20

    move-object v3, v0

    move-object/from16 v0, v24

    goto/16 :goto_1f7

    .line 39
    :cond_49c
    move-object/from16 v24, v0

    move-object/from16 v20, v2

    move-object v0, v3

    move v9, v7

    iget-object v2, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    iget-object v3, v5, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v3, v8}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "id"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4c3

    iget-object v2, v5, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v2, v8}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "name"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object v6, v2

    :cond_4c3
    add-int/lit8 v8, v8, 0x1

    move-object v3, v0

    move v7, v9

    move-object/from16 v2, v20

    move-object/from16 v0, v24

    goto/16 :goto_e8

    .line 38
    :catch_4cd
    move-exception v0

    iget-object v0, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v0, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object v2, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v3, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v4, "Unable to read playlists. Stored data has been retained."

    const-string v5, "\u7121\u6cd5\u8b80\u53d6\u64ad\u653e\u6e05\u55ae\uff0c\u539f\u6709\u8cc7\u6599\u5df2\u4fdd\u7559"

    const-string v6, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u3092\u8aad\u307f\u8fbc\u3081\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u4fdd\u5b58\u6e08\u307f\u306e\u30c7\u30fc\u30bf\u306f\u4fdd\u6301\u3057\u3066\u3044\u307e\u3059"

    invoke-static {v3, v6, v4, v5}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xe

    invoke-static {v2, v3, v4}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v2, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v3, "Retry"

    const-string v4, "\u91cd\u8a66"

    const-string v5, "\u518d\u8a66\u884c"

    invoke-static {v2, v5, v3, v4}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    new-instance v2, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda73;

    invoke-direct {v2, v1}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda73;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method selectionChanged()V
    .registers 5

    .line 70
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->videoList:Landroid/widget/ListView;

    if-eqz v0, :cond_a8

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->display:Landroid/widget/BaseAdapter;

    if-nez v0, :cond_a

    goto/16 :goto_a8

    .line 71
    :cond_a
    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    if-eqz v0, :cond_5c

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;

    if-nez v0, :cond_5c

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v1, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda44;

    invoke-direct {v1, p0}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda44;-><init>(Le/e/a/LocalPlaylists$Page;)V

    new-instance v2, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda45;

    invoke-direct {v2, p0}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda45;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {v0, v1, v2}, Le/e/a/SelectionUi191;->footer(Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-static {v0, v1}, Le/e/a/BulkSelection;->countLabel(Landroid/content/Context;I)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->count:Landroid/widget/TextView;

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->count:Landroid/widget/TextView;

    new-instance v2, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda46;

    invoke-direct {v2, p0}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda46;-><init>(Le/e/a/LocalPlaylists$Page;)V

    new-instance v3, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda47;

    invoke-direct {v3, p0}, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda47;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {v1, v2, v3}, Le/e/a/SelectionUi191;->header(Landroid/widget/TextView;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    move-result-object v1

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object v3, p0, Le/e/a/LocalPlaylists$Page;->videoList:Landroid/widget/ListView;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    goto :goto_81

    .line 72
    :cond_5c
    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    if-nez v0, :cond_81

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_81

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->count:Landroid/widget/TextView;

    invoke-static {v1}, Le/e/a/SelectionUi191;->headerView(Landroid/widget/TextView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->count:Landroid/widget/TextView;

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    goto :goto_82

    :cond_81
    :goto_81
    nop

    .line 73
    :goto_82
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->count:Landroid/widget/TextView;

    if-eqz v0, :cond_97

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->count:Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v0, v1, v2}, Le/e/a/SelectionUi191;->selection(Landroid/widget/TextView;II)V

    :cond_97
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-static {v0, v1}, Le/e/a/SelectionUi191;->enabled(Landroid/widget/LinearLayout;I)V

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->display:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 74
    return-void

    .line 70
    :cond_a8
    :goto_a8
    return-void
.end method

.method toggle(Ljava/lang/String;)V
    .registers 3

    .line 78
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_d
    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->selectionChanged()V

    return-void
.end method

.method toolbar(Ljava/lang/String;)V
    .registers 9

    .line 37
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

    const-class v4, Ljava/lang/CharSequence;

    aput-object v4, v2, v6

    invoke-virtual {p1, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v1, v3, [Ljava/lang/Object;

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-nez v2, :cond_39

    const/4 v2, 0x0

    goto :goto_45

    :cond_39
    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v3, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8"

    const-string v4, "Playlists"

    const-string v5, "\u64ad\u653e\u6e05\u55ae"

    invoke-static {v2, v3, v4, v5}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_45
    aput-object v2, v1, v6

    invoke-virtual {p1, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4a} :catch_4b

    goto :goto_4c

    :catch_4b
    move-exception p1

    :goto_4c
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->invalidateOptionsMenu()V

    return-void
.end method

.method videoCount(Le/e/a/LocalPlaylistData;Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .line 66
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->countModel:Le/e/a/LocalPlaylistData;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    if-eq v0, p1, :cond_3f

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->folderCounts:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    :goto_e
    iget-object v0, p1, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lt v1, v0, :cond_19

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page;->countModel:Le/e/a/LocalPlaylistData;

    goto :goto_3f

    :cond_19
    iget-object v0, p1, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v3, "folder"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v3, p0, Le/e/a/LocalPlaylists$Page;->folderCounts:Ljava/util/Map;

    iget-object v4, p0, Le/e/a/LocalPlaylists$Page;->folderCounts:Ljava/util/Map;

    invoke-interface {v4, v0, v2}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    :cond_3f
    :goto_3f
    iget-object p1, p0, Le/e/a/LocalPlaylists$Page;->folderCounts:Ljava/util/Map;

    invoke-interface {p1, p2, v2}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    new-instance p2, Ljava/lang/StringBuilder;

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v1, "Videos: "

    const-string v2, "\u5f71\u7247 "

    const-string v3, "\u52d5\u753b "

    invoke-static {v0, v3, v1, v2}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
