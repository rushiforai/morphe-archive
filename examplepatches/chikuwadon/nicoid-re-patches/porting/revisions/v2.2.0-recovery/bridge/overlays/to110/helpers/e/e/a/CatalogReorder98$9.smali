.class public final synthetic Le/e/a/CatalogReorder98$9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/LocalPlaylists$Edit;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/CatalogReorder98;"
    method = "lambda$save$13"
    proto = "(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/LinkedHashMap;Le/e/a/LocalPlaylistData;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/util/ArrayList;

.field public final synthetic f$1:Ljava/util/ArrayList;

.field public final synthetic f$2:Ljava/util/ArrayList;

.field public final synthetic f$3:Ljava/util/ArrayList;

.field public final synthetic f$4:Ljava/lang/String;

.field public final synthetic f$5:Ljava/util/LinkedHashMap;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/LinkedHashMap;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CatalogReorder98$9;->f$0:Ljava/util/ArrayList;

    iput-object p2, p0, Le/e/a/CatalogReorder98$9;->f$1:Ljava/util/ArrayList;

    iput-object p3, p0, Le/e/a/CatalogReorder98$9;->f$2:Ljava/util/ArrayList;

    iput-object p4, p0, Le/e/a/CatalogReorder98$9;->f$3:Ljava/util/ArrayList;

    iput-object p5, p0, Le/e/a/CatalogReorder98$9;->f$4:Ljava/lang/String;

    iput-object p6, p0, Le/e/a/CatalogReorder98$9;->f$5:Ljava/util/LinkedHashMap;

    return-void
.end method


# virtual methods
.method public final apply(Le/e/a/LocalPlaylistData;)V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/CatalogReorder98$9;->f$0:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/CatalogReorder98$9;->f$1:Ljava/util/ArrayList;

    iget-object v2, p0, Le/e/a/CatalogReorder98$9;->f$2:Ljava/util/ArrayList;

    iget-object v3, p0, Le/e/a/CatalogReorder98$9;->f$3:Ljava/util/ArrayList;

    iget-object v4, p0, Le/e/a/CatalogReorder98$9;->f$4:Ljava/lang/String;

    iget-object v5, p0, Le/e/a/CatalogReorder98$9;->f$5:Ljava/util/LinkedHashMap;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Le/e/a/CatalogReorder98;->lambda$save$13(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/LinkedHashMap;Le/e/a/LocalPlaylistData;)V

    return-void
.end method
