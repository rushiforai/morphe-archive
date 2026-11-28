.class Le/e/a/CatalogReorder98$1;
.super Ljava/lang/Object;
.source "CatalogReorder98.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CatalogReorder98;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/LinearLayout;Landroid/widget/ScrollView;Landroid/view/View;Le/e/a/LocalPlaylistData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/CatalogReorder98;


# direct methods
.method constructor <init>(Le/e/a/CatalogReorder98;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 17
    iput-object p1, p0, Le/e/a/CatalogReorder98$1;->this$0:Le/e/a/CatalogReorder98;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 17
    iget-object p1, p0, Le/e/a/CatalogReorder98$1;->this$0:Le/e/a/CatalogReorder98;

    iget-boolean p1, p1, Le/e/a/CatalogReorder98;->editing:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Le/e/a/CatalogReorder98$1;->this$0:Le/e/a/CatalogReorder98;

    iget p1, p1, Le/e/a/CatalogReorder98;->order:I

    if-eq p3, p1, :cond_0

    iget-object p1, p0, Le/e/a/CatalogReorder98$1;->this$0:Le/e/a/CatalogReorder98;

    iput p3, p1, Le/e/a/CatalogReorder98;->order:I

    iget-object p1, p0, Le/e/a/CatalogReorder98$1;->this$0:Le/e/a/CatalogReorder98;

    iget-object p1, p1, Le/e/a/CatalogReorder98;->pref:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object p2, p0, Le/e/a/CatalogReorder98$1;->this$0:Le/e/a/CatalogReorder98;

    iget-object p2, p2, Le/e/a/CatalogReorder98;->key:Ljava/lang/String;

    iget-object p3, p0, Le/e/a/CatalogReorder98$1;->this$0:Le/e/a/CatalogReorder98;

    iget p3, p3, Le/e/a/CatalogReorder98;->order:I

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p1, p0, Le/e/a/CatalogReorder98$1;->this$0:Le/e/a/CatalogReorder98;

    invoke-virtual {p1}, Le/e/a/CatalogReorder98;->applySort()V

    :cond_0
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    .line 17
    return-void
.end method
