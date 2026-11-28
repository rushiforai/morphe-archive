.class public final Le/e/a/CatalogReorder98;
.super Ljava/lang/Object;
.source "CatalogReorder98.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CatalogReorder98$Item;
    }
.end annotation


# instance fields
.field dropZone:Landroid/widget/TextView;

.field editing:Z

.field final fab:Landroid/view/View;

.field final head:Landroid/widget/LinearLayout;

.field hovered:Landroid/view/View;

.field final key:Ljava/lang/String;

.field final mode:Landroid/widget/ImageButton;

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

.field order:I

.field final original:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final owner:Ljava/lang/String;

.field final page:Le/e/a/LocalPlaylists$Page;

.field final pref:Landroid/content/SharedPreferences;

.field final rows:Landroid/widget/LinearLayout;

.field saving:Z

.field final scroll:Landroid/widget/ScrollView;

.field selecting:Z

.field final selection:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field selectionBar:Landroid/widget/LinearLayout;

.field final shown:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final snapshot:Le/e/a/LocalPlaylistData;

.field final sort:Landroid/widget/Spinner;

.field final status:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/LinearLayout;Landroid/widget/ScrollView;Landroid/view/View;Le/e/a/LocalPlaylistData;)V
    .registers 12

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/CatalogReorder98;->original:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Le/e/a/CatalogReorder98;->moves:Ljava/util/LinkedHashMap;

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Le/e/a/CatalogReorder98;->selection:Ljava/util/LinkedHashSet;

    .line 14
    iput-object p5, p0, Le/e/a/CatalogReorder98;->snapshot:Le/e/a/LocalPlaylistData;

    iput-object p1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iput-object p2, p0, Le/e/a/CatalogReorder98;->rows:Landroid/widget/LinearLayout;

    iput-object p3, p0, Le/e/a/CatalogReorder98;->scroll:Landroid/widget/ScrollView;

    iput-object p4, p0, Le/e/a/CatalogReorder98;->fab:Landroid/view/View;

    iget-object p2, p1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object p3, p1, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/CatalogReorder98;->owner:Ljava/lang/String;

    invoke-static {p2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p3

    iput-object p3, p0, Le/e/a/CatalogReorder98;->pref:Landroid/content/SharedPreferences;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "local_catalog_sort98_"

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    iget-object p4, p0, Le/e/a/CatalogReorder98;->owner:Ljava/lang/String;

    if-nez p4, :cond_0

    const-string p4, "root"

    goto :goto_0

    :cond_0
    iget-object p4, p0, Le/e/a/CatalogReorder98;->owner:Ljava/lang/String;

    :goto_0
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Le/e/a/CatalogReorder98;->key:Ljava/lang/String;

    iget-object p3, p0, Le/e/a/CatalogReorder98;->pref:Landroid/content/SharedPreferences;

    iget-object p4, p0, Le/e/a/CatalogReorder98;->key:Ljava/lang/String;

    const/4 p5, 0x0

    invoke-interface {p3, p4, p5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p3

    const/4 p4, 0x2

    invoke-static {p4, p3}, Ljava/lang/Math;->min(II)I

    move-result p3

    invoke-static {p5, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    iput p3, p0, Le/e/a/CatalogReorder98;->order:I

    .line 15
    :goto_1
    iget-object p3, p0, Le/e/a/CatalogReorder98;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {p3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p3

    const/4 v0, 0x1

    if-lez p3, :cond_1

    iget-object p3, p0, Le/e/a/CatalogReorder98;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {p3, p5}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p3

    iget-object v1, p0, Le/e/a/CatalogReorder98;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Le/e/a/CatalogReorder98;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v2, p3}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    iget-object v2, p0, Le/e/a/CatalogReorder98;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p3, p0, Le/e/a/CatalogReorder98;->original:Ljava/util/ArrayList;

    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    iget-object p3, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/CatalogReorder98;->original:Ljava/util/ArrayList;

    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->layout()V

    .line 16
    new-instance p3, Landroid/widget/LinearLayout;

    invoke-direct {p3, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p3, p0, Le/e/a/CatalogReorder98;->head:Landroid/widget/LinearLayout;

    iget-object p3, p0, Le/e/a/CatalogReorder98;->head:Landroid/widget/LinearLayout;

    const/16 v1, 0x10

    invoke-virtual {p3, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object p3, p0, Le/e/a/CatalogReorder98;->head:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-static {p2, v1}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {p3, v2, p5, p5, p5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance p3, Landroid/widget/Spinner;

    invoke-direct {p3, p2}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    iput-object p3, p0, Le/e/a/CatalogReorder98;->sort:Landroid/widget/Spinner;

    const-string p3, "Custom order"

    const-string/jumbo v2, "\u81ea\u8a02\u9806\u5e8f"

    const-string v3, "\u30ab\u30b9\u30bf\u30e0\u9806"

    invoke-static {p2, v3, p3, v2}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const-string v2, "Name (ascending)"

    const-string v3, "\u540d\u7a31\uff08\u5347\u51aa\uff09"

    const-string v4, "\u540d\u524d\u9806\uff08\u6607\u9806\uff09"

    invoke-static {p2, v4, v2, v3}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Name (descending)"

    const-string v4, "\u540d\u7a31\uff08\u964d\u51aa\uff09"

    const-string v5, "\u540d\u524d\u9806\uff08\u964d\u9806\uff09"

    invoke-static {p2, v5, v3, v4}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    aput-object p3, v4, p5

    aput-object v2, v4, v0

    aput-object v3, v4, p4

    new-instance p3, Landroid/widget/ArrayAdapter;

    const p4, 0x1090008

    invoke-direct {p3, p2, p4, v4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const p4, 0x1090009

    invoke-virtual {p3, p4}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    iget-object p4, p0, Le/e/a/CatalogReorder98;->sort:Landroid/widget/Spinner;

    invoke-virtual {p4, p3}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    iget-object p3, p0, Le/e/a/CatalogReorder98;->sort:Landroid/widget/Spinner;

    iget p4, p0, Le/e/a/CatalogReorder98;->order:I

    invoke-virtual {p3, p4}, Landroid/widget/Spinner;->setSelection(I)V

    iget-object p3, p0, Le/e/a/CatalogReorder98;->head:Landroid/widget/LinearLayout;

    iget-object p4, p0, Le/e/a/CatalogReorder98;->sort:Landroid/widget/Spinner;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v3, 0x30

    invoke-static {p2, v3}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result v4

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v2, p5, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p3, p4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p3, Landroid/widget/TextView;

    invoke-direct {p3, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object p3, p0, Le/e/a/CatalogReorder98;->status:Landroid/widget/TextView;

    iget-object p3, p0, Le/e/a/CatalogReorder98;->status:Landroid/widget/TextView;

    const-string p4, "Reordering"

    const-string/jumbo v2, "\u6392\u5e8f\u4e2d"

    const-string v4, "\u4e26\u3073\u66ff\u3048\u4e2d"

    invoke-static {p2, v4, p4, v2}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p3, p0, Le/e/a/CatalogReorder98;->status:Landroid/widget/TextView;

    invoke-static {p2}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result p4

    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p3, p0, Le/e/a/CatalogReorder98;->status:Landroid/widget/TextView;

    const/high16 p4, 0x41800000    # 16.0f

    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object p3, p0, Le/e/a/CatalogReorder98;->status:Landroid/widget/TextView;

    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p3, p0, Le/e/a/CatalogReorder98;->head:Landroid/widget/LinearLayout;

    iget-object p4, p0, Le/e/a/CatalogReorder98;->status:Landroid/widget/TextView;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, p5, v2, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p3, p4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p3, Landroid/widget/ImageButton;

    invoke-direct {p3, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    iput-object p3, p0, Le/e/a/CatalogReorder98;->mode:Landroid/widget/ImageButton;

    iget-object p3, p0, Le/e/a/CatalogReorder98;->mode:Landroid/widget/ImageButton;

    invoke-virtual {p3, p5}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    iget-object p3, p0, Le/e/a/CatalogReorder98;->mode:Landroid/widget/ImageButton;

    invoke-static {p2, p5}, Le/e/a/ReorderMotion98;->glyph(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p4

    invoke-virtual {p3, p4}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p3, p0, Le/e/a/CatalogReorder98;->mode:Landroid/widget/ImageButton;

    sget-object p4, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p3, p4}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    iget-object p3, p0, Le/e/a/CatalogReorder98;->mode:Landroid/widget/ImageButton;

    const-string p4, "Reorder manually"

    const-string/jumbo p5, "\u624b\u52d5\u6392\u5e8f"

    const-string/jumbo v1, "\u624b\u52d5\u3067\u4e26\u3073\u66ff\u3048"

    invoke-static {p2, v1, p4, p5}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p3, p0, Le/e/a/CatalogReorder98;->head:Landroid/widget/LinearLayout;

    iget-object p4, p0, Le/e/a/CatalogReorder98;->mode:Landroid/widget/ImageButton;

    new-instance p5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p2, v3}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-static {p2, v3}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result p2

    invoke-direct {p5, v1, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p3, p4, p5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p2, p0, Le/e/a/CatalogReorder98;->mode:Landroid/widget/ImageButton;

    invoke-static {p2}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    iget-object p2, p1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object p3, p0, Le/e/a/CatalogReorder98;->head:Landroid/widget/LinearLayout;

    iget-object p1, p1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p1

    sub-int/2addr p1, v0

    new-instance p4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p5, -0x1

    invoke-direct {p4, p5, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p3, p1, p4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 17
    iget-object p1, p0, Le/e/a/CatalogReorder98;->sort:Landroid/widget/Spinner;

    new-instance p2, Le/e/a/CatalogReorder98$1;

    invoke-direct {p2, p0}, Le/e/a/CatalogReorder98$1;-><init>(Le/e/a/CatalogReorder98;)V

    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    iget-object p1, p0, Le/e/a/CatalogReorder98;->mode:Landroid/widget/ImageButton;

    new-instance p2, Le/e/a/CatalogReorder98$8;

    invoke-direct {p2, p0}, Le/e/a/CatalogReorder98$8;-><init>(Le/e/a/CatalogReorder98;)V

    invoke-virtual {p1, p2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->applySort()V

    return-void
.end method

.method static attach(Le/e/a/LocalPlaylists$Page;Le/e/a/LocalPlaylistData;)V
    .registers 13

    .line 11
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->catalog98:Le/e/a/CatalogReorder98;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    iput-boolean v2, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    iput-object v1, p0, Le/e/a/LocalPlaylists$Page;->catalog98:Le/e/a/CatalogReorder98;

    :cond_0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object v3, p0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v3, v0, Landroid/widget/FrameLayout;

    if-eqz v3, :cond_3

    invoke-static {v0}, Le/e/a/CatalogReorder98;->find(Landroid/view/View;)Landroid/widget/ScrollView;

    move-result-object v8

    if-eqz v8, :cond_3

    invoke-virtual {v8}, Landroid/widget/ScrollView;->getChildCount()I

    move-result v3

    if-ne v3, v4, :cond_3

    invoke-virtual {v8, v2}, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v3, v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_3

    invoke-virtual {v8, v2}, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Landroid/widget/LinearLayout;

    :goto_0
    invoke-virtual {v7}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_1

    add-int/lit8 v3, v2, 0x1

    invoke-virtual {v7}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v5

    if-ge v3, v5, :cond_3

    invoke-virtual {v7, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Le/e/a/CatalogReorder98$Item;

    if-eqz v3, :cond_3

    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    :cond_1
    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v2

    if-le v2, v4, :cond_2

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v1

    sub-int/2addr v1, v4

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    :cond_2
    move-object v9, v1

    new-instance v5, Le/e/a/CatalogReorder98;

    move-object v6, p0

    move-object v10, p1

    invoke-direct/range {v5 .. v10}, Le/e/a/CatalogReorder98;-><init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/LinearLayout;Landroid/widget/ScrollView;Landroid/view/View;Le/e/a/LocalPlaylistData;)V

    iput-object v5, v6, Le/e/a/LocalPlaylists$Page;->catalog98:Le/e/a/CatalogReorder98;

    :cond_3
    return-void
.end method

.method static back(Le/e/a/LocalPlaylists$Page;)Z
    .registers 8

    .line 13
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->catalog98:Le/e/a/CatalogReorder98;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-boolean v2, v0, Le/e/a/CatalogReorder98;->selecting:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    iget-object p0, v0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return v3

    :cond_0
    iget-boolean v2, v0, Le/e/a/CatalogReorder98;->editing:Z

    if-nez v2, :cond_2

    :cond_1
    return v1

    :cond_2
    iget-boolean v2, v0, Le/e/a/CatalogReorder98;->saving:Z

    if-eqz v2, :cond_3

    return v3

    :cond_3
    invoke-virtual {v0}, Le/e/a/CatalogReorder98;->changed()Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual {v0, v1}, Le/e/a/CatalogReorder98;->exit(Z)V

    return v3

    :cond_4
    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v4, "Discard changes to the order?"

    const-string/jumbo v5, "\u8981\u6368\u68c4\u6392\u5e8f\u8b8a\u66f4\u55ce\uff1f"

    const-string v6, "\u4e26\u3073\u66ff\u3048\u3092\u4fdd\u5b58\u305b\u305a\u306b\u7d42\u4e86\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {v2, v6, v4, v5}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v4, "Cancel"

    const-string v5, "\u53d6\u6d88"

    const-string v6, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v2, v6, v4, v5}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Discard"

    const-string/jumbo v4, "\u6368\u68c4"

    const-string/jumbo v5, "\u7834\u68c4"

    invoke-static {p0, v5, v2, v4}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance v2, Le/e/a/CatalogReorder98$12;

    invoke-direct {v2, v0}, Le/e/a/CatalogReorder98$12;-><init>(Le/e/a/CatalogReorder98;)V

    invoke-virtual {v1, p0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return v3
.end method

.method static canMoveInto(II)Z
    .registers 3

    .line 37
    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    if-ne p1, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static commitCatalog(Lorg/json/JSONArray;Lorg/json/JSONArray;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/Map;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Lorg/json/JSONArray;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {p7}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 45
    invoke-interface {p7}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    .line 46
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p0, p2, p3, v2}, Le/e/a/CatalogReorder98;->validateOrder(Lorg/json/JSONArray;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    :cond_0
    invoke-static {p1, p4, v0, p6}, Le/e/a/CatalogReorder98;->validateOrder(Lorg/json/JSONArray;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    .line 47
    invoke-interface {p7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {p4, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {p5, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {p0, v3}, Le/e/a/PlaylistTransfer100;->dest(Lorg/json/JSONArray;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    new-instance p0, Lorg/json/JSONException;

    const-string p1, "Invalid folder transfer"

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 49
    :cond_2
    invoke-static {p0, p2, p3, v2}, Le/e/a/CatalogReorder98;->reorder(Lorg/json/JSONArray;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    invoke-static {p1, p4, v0, p6}, Le/e/a/CatalogReorder98;->reorder(Lorg/json/JSONArray;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    .line 50
    const/4 p0, 0x0

    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-ge p0, p2, :cond_4

    invoke-virtual {p1, p0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p2

    const-string p3, "id"

    invoke-virtual {p2, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p7, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    if-eqz p3, :cond_3

    const-string p4, "group"

    invoke-virtual {p2, p4, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_3
    add-int/lit8 p0, p0, 0x1

    goto :goto_1

    .line 51
    :cond_4
    return-void
.end method

.method static find(Landroid/view/View;)Landroid/widget/ScrollView;
    .registers 3

    .line 9
    instance-of v0, p0, Landroid/widget/ScrollView;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/widget/ScrollView;

    return-object p0

    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/CatalogReorder98;->find(Landroid/view/View;)Landroid/widget/ScrollView;

    move-result-object v1

    if-eqz v1, :cond_1

    return-object v1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method static finish(Le/e/a/LocalPlaylists$Page;)Z
    .registers 2

    .line 12
    iget-object p0, p0, Le/e/a/LocalPlaylists$Page;->catalog98:Le/e/a/CatalogReorder98;

    if-eqz p0, :cond_1

    iget-boolean v0, p0, Le/e/a/CatalogReorder98;->editing:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Le/e/a/CatalogReorder98;->saving:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->save()V

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method static folderMiddle(FI)Z
    .registers 3

    .line 28
    if-lez p1, :cond_0

    int-to-float p1, p1

    const/high16 v0, 0x3e800000    # 0.25f

    mul-float v0, v0, p1

    cmpl-float v0, p0, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f400000    # 0.75f

    mul-float p1, p1, v0

    cmpg-float p0, p0, p1

    if-gtz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;
    .registers 1

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/CatalogReorder98$Item;

    return-object p0
.end method

.method static synthetic lambda$addSelectionButton$12(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 34
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$back$0(Le/e/a/CatalogReorder98;Landroid/content/DialogInterface;I)V
    .registers 3

    .line 13
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Le/e/a/CatalogReorder98;->exit(Z)V

    return-void
.end method

.method static synthetic lambda$save$13(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/LinkedHashMap;Le/e/a/LocalPlaylistData;)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 41
    iget-object v0, p6, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    iget-object v1, p6, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-static/range {v0 .. v7}, Le/e/a/CatalogReorder98;->commitCatalog(Lorg/json/JSONArray;Lorg/json/JSONArray;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method static synthetic lambda$toggleSelection$7(Landroid/widget/CheckBox;Landroid/view/View;)V
    .registers 2

    .line 33
    invoke-virtual {p0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setChecked(Z)V

    return-void
.end method

.method static onRender(Le/e/a/LocalPlaylists$Page;)V
    .registers 2

    .line 10
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->catalog98:Le/e/a/CatalogReorder98;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->catalog98:Le/e/a/CatalogReorder98;

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->reordering:Z

    :cond_0
    return-void
.end method

.method static reorder(Lorg/json/JSONArray;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 57
    invoke-interface {p1, p2}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_5

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_5

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_2

    invoke-virtual {p0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz p3, :cond_0

    const-string v6, "group"

    const-string v7, ""

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    goto :goto_1

    :cond_0
    const-string v6, "id"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_1

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    new-instance p0, Lorg/json/JSONException;

    const-string p1, "Duplicate ID"

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    :goto_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge v3, p1, :cond_3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    invoke-interface {v0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_3
    return-void

    :cond_4
    new-instance p0, Lorg/json/JSONException;

    const-string p1, "Catalog changed"

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_5
    new-instance p0, Lorg/json/JSONException;

    const-string p1, "Invalid reorder"

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw p0

    :goto_4
    goto :goto_3
.end method

.method static row(Landroid/view/View;)Landroid/view/View;
    .registers 2

    .line 18
    check-cast p0, Landroid/widget/LinearLayout;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static tag(Landroid/view/View;Ljava/lang/Runnable;)V
    .registers 6

    .line 8
    instance-of v0, p1, Le/e/a/LocalPlaylists$Page$17;

    const/4 v1, 0x1

    const-string v2, ""

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    const/4 p1, 0x3

    goto :goto_0

    :cond_0
    instance-of v0, p1, Le/e/a/LocalPlaylists$Page$18;

    if-eqz v0, :cond_1

    check-cast p1, Le/e/a/LocalPlaylists$Page$18;

    iget-object v2, p1, Le/e/a/LocalPlaylists$Page$18;->f$1:Ljava/lang/String;

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    instance-of v0, p1, Le/e/a/LocalPlaylists$Page$21;

    if-eqz v0, :cond_2

    check-cast p1, Le/e/a/LocalPlaylists$Page$21;

    iget-object v2, p1, Le/e/a/LocalPlaylists$Page$21;->f$1:Ljava/lang/String;

    const/4 p1, 0x2

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    move-object v0, p0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Le/e/a/CatalogReorder98$Item;

    invoke-direct {v1, v2, v0, p1}, Le/e/a/CatalogReorder98$Item;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-void
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 7
    invoke-static {p0, p1, p2, p3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static validateOrder(Lorg/json/JSONArray;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 53
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_4

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_4

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 54
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    if-eqz p3, :cond_0

    const-string v4, "group"

    const-string v5, ""

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    new-instance p0, Lorg/json/JSONException;

    const-string p1, "Duplicate ID"

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 55
    return-void

    .line 54
    :cond_3
    new-instance p0, Lorg/json/JSONException;

    const-string p1, "Catalog changed"

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 53
    :cond_4
    new-instance p0, Lorg/json/JSONException;

    const-string p1, "Invalid reorder"

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p0

    :goto_3
    goto :goto_2
.end method


# virtual methods
.method addSelectionButton(Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 7

    .line 34
    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v1, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 p1, 0x41400000    # 12.0f

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextSize(F)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumWidth(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    new-instance v1, Le/e/a/CatalogReorder98$0;

    invoke-direct {v1, p2}, Le/e/a/CatalogReorder98$0;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Le/e/a/CatalogReorder98;->selectionBar:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v2, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v2, v2, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v3, 0x30

    invoke-static {v2, v3}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v1, p1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method applySort()V
    .registers 8

    .line 20
    iget-object v0, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/CatalogReorder98;->original:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget v0, p0, Le/e/a/CatalogReorder98;->order:I

    if-eqz v0, :cond_4

    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object v0

    const/4 v1, 0x1

    :goto_0
    const/4 v2, 0x2

    if-gt v1, v2, :cond_4

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v3, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-static {v4}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object v5

    iget v5, v5, Le/e/a/CatalogReorder98$Item;->kind:I

    if-ne v5, v1, :cond_0

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    new-instance v3, Le/e/a/CatalogReorder98$11;

    invoke-direct {v3, p0, v0}, Le/e/a/CatalogReorder98$11;-><init>(Le/e/a/CatalogReorder98;Ljava/text/Collator;)V

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_2
    iget-object v5, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v3, v5, :cond_3

    iget-object v5, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    invoke-static {v5}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object v5

    iget v5, v5, Le/e/a/CatalogReorder98$Item;->kind:I

    if-ne v5, v1, :cond_2

    iget-object v5, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    add-int/lit8 v6, v4, 0x1

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-virtual {v5, v3, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move v4, v6

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->layout()V

    return-void
.end method

.method changed()Z
    .registers 3

    .line 39
    iget-object v0, p0, Le/e/a/CatalogReorder98;->moves:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/CatalogReorder98;->original:Ljava/util/ArrayList;

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

.method clearHover()V
    .registers 3

    .line 38
    iget-object v0, p0, Le/e/a/CatalogReorder98;->hovered:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/CatalogReorder98;->hovered:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/CatalogReorder98;->hovered:Landroid/view/View;

    :cond_0
    return-void
.end method

.method currentGroup()Ljava/lang/String;
    .registers 3

    .line 30
    iget-object v0, p0, Le/e/a/CatalogReorder98;->owner:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v0, "@unfiled"

    iget-object v1, p0, Le/e/a/CatalogReorder98;->owner:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/CatalogReorder98;->owner:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method enter()V
    .registers 13

    .line 21
    iget-object v0, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v0, v0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-nez v0, :cond_5

    iget-object v0, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-boolean v0, v0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    if-nez v0, :cond_5

    iget-boolean v0, p0, Le/e/a/CatalogReorder98;->selecting:Z

    if-nez v0, :cond_5

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CatalogReorder98;->editing:Z

    iget-object v1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iput-boolean v0, v1, Le/e/a/LocalPlaylists$Page;->reordering:Z

    const/4 v1, 0x0

    iput v1, p0, Le/e/a/CatalogReorder98;->order:I

    iget-object v2, p0, Le/e/a/CatalogReorder98;->sort:Landroid/widget/Spinner;

    invoke-virtual {v2, v1}, Landroid/widget/Spinner;->setSelection(I)V

    iget-object v2, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    iget-object v2, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    iget-object v3, p0, Le/e/a/CatalogReorder98;->original:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->layout()V

    iget-object v2, p0, Le/e/a/CatalogReorder98;->sort:Landroid/widget/Spinner;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setVisibility(I)V

    iget-object v2, p0, Le/e/a/CatalogReorder98;->status:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v2, p0, Le/e/a/CatalogReorder98;->mode:Landroid/widget/ImageButton;

    iget-object v4, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v4, v4, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v4, v0}, Le/e/a/ReorderMotion98;->glyph(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, p0, Le/e/a/CatalogReorder98;->mode:Landroid/widget/ImageButton;

    iget-object v4, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v4, v4, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v5, "Finish reordering"

    const-string v6, "\u5b8c\u6210\u6392\u5e8f"

    const-string v7, "\u4e26\u3073\u66ff\u3048\u5b8c\u4e86"

    invoke-static {v4, v7, v5, v6}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Le/e/a/CatalogReorder98;->fab:Landroid/view/View;

    if-eqz v2, :cond_0

    iget-object v2, p0, Le/e/a/CatalogReorder98;->fab:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 22
    :cond_0
    iget-object v2, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-static {v4}, Le/e/a/CatalogReorder98;->row(Landroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    invoke-virtual {v5, v1}, Landroid/widget/LinearLayout;->setClickable(Z)V

    invoke-virtual {v5, v1}, Landroid/widget/LinearLayout;->setLongClickable(Z)V

    invoke-static {v4}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object v6

    iget v7, v6, Le/e/a/CatalogReorder98$Item;->kind:I

    const/4 v8, 0x3

    if-eqz v7, :cond_2

    iget v7, v6, Le/e/a/CatalogReorder98$Item;->kind:I

    if-eq v7, v8, :cond_2

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v7

    sub-int/2addr v7, v0

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, v3}, Landroid/view/View;->setVisibility(I)V

    new-instance v7, Landroid/widget/ImageButton;

    iget-object v8, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v8, v8, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v7, v8}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    iget-object v8, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v8, v8, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/4 v9, 0x2

    invoke-static {v8, v9}, Le/e/a/ReorderMotion98;->glyph(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    sget-object v8, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v7, v8}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-virtual {v7, v1}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    iget-object v8, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v8, v8, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v9, "Reorder"

    const-string/jumbo v10, "\u6392\u5e8f"

    const-string v11, "\u4e26\u3073\u66ff\u3048"

    invoke-static {v8, v11, v9, v10}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v9, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v9, v9, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v10, 0x30

    invoke-static {v9, v10}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result v9

    iget-object v11, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v11, v11, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v11, v10}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-direct {v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Le/e/a/CatalogReorder98$13;

    invoke-direct {v5, p0, v6, v4, v7}, Le/e/a/CatalogReorder98$13;-><init>(Le/e/a/CatalogReorder98;Le/e/a/CatalogReorder98$Item;Landroid/view/View;Landroid/widget/ImageButton;)V

    invoke-virtual {v7, v5}, Landroid/widget/ImageButton;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance v5, Le/e/a/CatalogReorder98$14;

    invoke-direct {v5, p0, v6, v4}, Le/e/a/CatalogReorder98$14;-><init>(Le/e/a/CatalogReorder98;Le/e/a/CatalogReorder98$Item;Landroid/view/View;)V

    invoke-static {v4, v5}, Le/e/a/ReorderMotion98;->install(Landroid/view/View;Landroid/view/View$OnDragListener;)V

    .line 25
    goto/16 :goto_0

    .line 22
    :cond_2
    iget v5, v6, Le/e/a/CatalogReorder98$Item;->kind:I

    if-ne v5, v8, :cond_1

    invoke-virtual {p0, v4}, Le/e/a/CatalogReorder98;->installUnfiled(Landroid/view/View;)V

    goto/16 :goto_0

    .line 26
    :cond_3
    iget-object v1, p0, Le/e/a/CatalogReorder98;->owner:Ljava/lang/String;

    if-eqz v1, :cond_4

    const-string v1, "@unfiled"

    iget-object v2, p0, Le/e/a/CatalogReorder98;->owner:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v1, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v2, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v2, v2, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v3, "Move to parent"

    const-string/jumbo v4, "\u79fb\u52d5\u81f3\u4e0a\u4e00\u5c64"

    const-string v5, "\u4e0a\u306e\u968e\u5c64\u3078\u79fb\u52d5"

    invoke-static {v2, v5, v3, v4}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Le/e/a/PlaylistTransfer100;->zone(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, p0, Le/e/a/CatalogReorder98;->dropZone:Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v1, v1, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/CatalogReorder98;->dropZone:Landroid/widget/TextView;

    iget-object v3, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v3, v3, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object v4, p0, Le/e/a/CatalogReorder98;->head:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v3

    add-int/2addr v3, v0

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v4, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v4, v4, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v5, 0x34

    invoke-static {v4, v5}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result v4

    const/4 v5, -0x1

    invoke-direct {v0, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le/e/a/CatalogReorder98;->dropZone:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Le/e/a/CatalogReorder98;->installUnfiled(Landroid/view/View;)V

    .line 27
    :cond_4
    return-void

    .line 21
    :cond_5
    return-void
.end method

.method exit(Z)V
    .registers 4

    .line 39
    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->clearHover()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/CatalogReorder98;->editing:Z

    iget-object v1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iput-boolean v0, v1, Le/e/a/LocalPlaylists$Page;->reordering:Z

    iget-object v1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iput-boolean v0, v1, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Le/e/a/CatalogReorder98;->pref:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object v1, p0, Le/e/a/CatalogReorder98;->key:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_0
    iget-object p1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    invoke-virtual {p1}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void
.end method

.method ids(Ljava/util/List;I)Ljava/util/ArrayList;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;I)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-static {v1}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object v2

    iget v2, v2, Le/e/a/CatalogReorder98$Item;->kind:I

    if-ne v2, p2, :cond_0

    invoke-static {v1}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object v1

    iget-object v1, v1, Le/e/a/CatalogReorder98$Item;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method installUnfiled(Landroid/view/View;)V
    .registers 3

    .line 32
    new-instance v0, Le/e/a/CatalogReorder98$15;

    invoke-direct {v0, p0}, Le/e/a/CatalogReorder98$15;-><init>(Le/e/a/CatalogReorder98;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    return-void
.end method

.method synthetic lambda$applySort$2$e-e-a-CatalogReorder98(Ljava/text/Collator;Landroid/view/View;Landroid/view/View;)I
    .registers 6

    .line 20
    iget v0, p0, Le/e/a/CatalogReorder98;->order:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-static {p2}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object p2

    iget-object p2, p2, Le/e/a/CatalogReorder98$Item;->name:Ljava/lang/String;

    invoke-static {p3}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object p3

    iget-object p3, p3, Le/e/a/CatalogReorder98$Item;->name:Ljava/lang/String;

    invoke-virtual {p1, p2, p3}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    goto :goto_0

    :cond_0
    invoke-static {p3}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object p3

    iget-object p3, p3, Le/e/a/CatalogReorder98$Item;->name:Ljava/lang/String;

    invoke-static {p2}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object p2

    iget-object p2, p2, Le/e/a/CatalogReorder98$Item;->name:Ljava/lang/String;

    invoke-virtual {p1, p3, p2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    :goto_0
    return p1
.end method

.method synthetic lambda$enter$3$e-e-a-CatalogReorder98(Le/e/a/CatalogReorder98$Item;Landroid/view/View;Landroid/widget/ImageButton;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 9

    .line 22
    invoke-virtual {p5}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p4

    const/4 p5, 0x1

    if-nez p4, :cond_1

    iget-boolean p4, p0, Le/e/a/CatalogReorder98;->saving:Z

    if-nez p4, :cond_1

    const-string p4, "nicoid-catalog"

    iget-object p1, p1, Le/e/a/CatalogReorder98$Item;->id:Ljava/lang/String;

    invoke-static {p4, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    invoke-static {p2}, Le/e/a/ReorderMotion98;->shadow(Landroid/view/View;)Landroid/view/View$DragShadowBuilder;

    move-result-object p4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    invoke-virtual {p3, p1, p4, p2, v2}, Landroid/widget/ImageButton;->startDragAndDrop(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    goto :goto_0

    :cond_0
    invoke-virtual {p3, p1, p4, p2, v2}, Landroid/widget/ImageButton;->startDrag(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    :cond_1
    :goto_0
    return p5
.end method

.method synthetic lambda$enter$4$e-e-a-CatalogReorder98(Le/e/a/CatalogReorder98$Item;Landroid/view/View;Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 13

    .line 22
    invoke-virtual {p4}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {p4}, Landroid/view/DragEvent;->getAction()I

    move-result v0

    const/4 v1, 0x4

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->clearHover()V

    return v2

    :cond_0
    instance-of v0, p3, Landroid/view/View;

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    iget-object v0, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    iget-boolean v0, p0, Le/e/a/CatalogReorder98;->saving:Z

    if-nez v0, :cond_e

    check-cast p3, Landroid/view/View;

    invoke-static {p3}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object v0

    iget v0, v0, Le/e/a/CatalogReorder98$Item;->kind:I

    iget v3, p1, Le/e/a/CatalogReorder98$Item;->kind:I

    invoke-static {v0, v3}, Le/e/a/CatalogReorder98;->canMoveInto(II)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p4}, Landroid/view/DragEvent;->getY()F

    move-result v0

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v3

    invoke-static {v0, v3}, Le/e/a/CatalogReorder98;->folderMiddle(FI)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    invoke-static {p3}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object v3

    iget v3, v3, Le/e/a/CatalogReorder98$Item;->kind:I

    iget v4, p1, Le/e/a/CatalogReorder98$Item;->kind:I

    if-eq v3, v4, :cond_2

    invoke-static {p3}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object v3

    iget v3, v3, Le/e/a/CatalogReorder98$Item;->kind:I

    iget v4, p1, Le/e/a/CatalogReorder98$Item;->kind:I

    invoke-static {v3, v4}, Le/e/a/CatalogReorder98;->canMoveInto(II)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 23
    :cond_2
    invoke-virtual {p4}, Landroid/view/DragEvent;->getAction()I

    move-result v3

    const/4 v4, 0x6

    if-ne v3, v4, :cond_4

    iget-object p1, p0, Le/e/a/CatalogReorder98;->hovered:Landroid/view/View;

    if-ne p1, p2, :cond_3

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->clearHover()V

    :cond_3
    return v2

    .line 24
    :cond_4
    const/4 v3, 0x5

    const/4 v4, 0x2

    if-eqz v0, :cond_6

    invoke-virtual {p4}, Landroid/view/DragEvent;->getAction()I

    move-result v5

    if-eq v5, v3, :cond_5

    invoke-virtual {p4}, Landroid/view/DragEvent;->getAction()I

    move-result v5

    if-ne v5, v4, :cond_6

    :cond_5
    iget-object v3, p0, Le/e/a/CatalogReorder98;->hovered:Landroid/view/View;

    if-eq v3, p2, :cond_8

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->clearHover()V

    iput-object p2, p0, Le/e/a/CatalogReorder98;->hovered:Landroid/view/View;

    iget-object v3, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v3, v3, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v3

    const v5, 0xffffff

    and-int/2addr v3, v5

    const/high16 v5, 0x44000000    # 512.0f

    or-int/2addr v3, v5

    invoke-virtual {p2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-static {p3}, Le/e/a/ReorderMotion98;->folderHover(Landroid/view/View;)V

    goto :goto_1

    .line 25
    :cond_6
    if-nez v0, :cond_8

    invoke-virtual {p4}, Landroid/view/DragEvent;->getAction()I

    move-result v5

    if-eq v5, v3, :cond_7

    invoke-virtual {p4}, Landroid/view/DragEvent;->getAction()I

    move-result v3

    if-ne v3, v4, :cond_8

    :cond_7
    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->clearHover()V

    :cond_8
    :goto_1
    invoke-virtual {p4}, Landroid/view/DragEvent;->getAction()I

    move-result v3

    if-ne v3, v4, :cond_a

    new-array v3, v4, [I

    new-array v4, v4, [I

    invoke-virtual {p2, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    iget-object v5, p0, Le/e/a/CatalogReorder98;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v5, v4}, Landroid/widget/ScrollView;->getLocationOnScreen([I)V

    aget v3, v3, v2

    int-to-float v3, v3

    invoke-virtual {p4}, Landroid/view/DragEvent;->getY()F

    move-result v5

    add-float/2addr v3, v5

    aget v4, v4, v2

    int-to-float v4, v4

    sub-float/2addr v3, v4

    iget-object v4, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v4, v4, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v5, 0x30

    invoke-static {v4, v5}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result v4

    int-to-float v5, v4

    const/high16 v6, 0x40000000    # 2.0f

    cmpg-float v7, v3, v5

    if-gez v7, :cond_9

    iget-object v4, p0, Le/e/a/CatalogReorder98;->scroll:Landroid/widget/ScrollView;

    sub-float/2addr v5, v3

    div-float/2addr v5, v6

    float-to-int v3, v5

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    neg-int v3, v3

    :goto_2
    invoke-virtual {v4, v1, v3}, Landroid/widget/ScrollView;->smoothScrollBy(II)V

    goto :goto_3

    :cond_9
    iget-object v7, p0, Le/e/a/CatalogReorder98;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v7}, Landroid/widget/ScrollView;->getHeight()I

    move-result v7

    sub-int/2addr v7, v4

    int-to-float v4, v7

    cmpl-float v4, v3, v4

    if-lez v4, :cond_a

    iget-object v4, p0, Le/e/a/CatalogReorder98;->scroll:Landroid/widget/ScrollView;

    iget-object v7, p0, Le/e/a/CatalogReorder98;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v7}, Landroid/widget/ScrollView;->getHeight()I

    move-result v7

    int-to-float v7, v7

    sub-float/2addr v3, v7

    add-float/2addr v3, v5

    div-float/2addr v3, v6

    float-to-int v3, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    goto :goto_2

    :cond_a
    :goto_3
    invoke-virtual {p4}, Landroid/view/DragEvent;->getAction()I

    move-result p4

    const/4 v3, 0x3

    if-ne p4, v3, :cond_d

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->clearHover()V

    if-eqz v0, :cond_b

    iget-object p1, p1, Le/e/a/CatalogReorder98$Item;->id:Ljava/lang/String;

    invoke-virtual {p0, p3, p1}, Le/e/a/CatalogReorder98;->stage(Landroid/view/View;Ljava/lang/String;)V

    return v2

    :cond_b
    invoke-static {p3}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object p4

    iget p4, p4, Le/e/a/CatalogReorder98$Item;->kind:I

    iget p1, p1, Le/e/a/CatalogReorder98$Item;->kind:I

    if-eq p4, p1, :cond_c

    return v1

    :cond_c
    iget-object p1, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    iget-object p4, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {p4, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p2

    if-eq p1, p2, :cond_d

    iget-object p4, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {p4, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget-object p1, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {p1, p2, p3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-object p1, p0, Le/e/a/CatalogReorder98;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {p1, p3}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    iget-object p1, p0, Le/e/a/CatalogReorder98;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {p1, p3, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    :cond_d
    return v2

    .line 22
    :cond_e
    return v1
.end method

.method synthetic lambda$installUnfiled$5$e-e-a-CatalogReorder98(Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 7

    .line 32
    invoke-virtual {p2}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Landroid/view/View;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    iget-object v1, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object v1

    iget v1, v1, Le/e/a/CatalogReorder98$Item;->kind:I

    const/4 v3, 0x2

    if-ne v1, v3, :cond_3

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->currentGroup()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    iget-boolean v1, p0, Le/e/a/CatalogReorder98;->saving:Z

    if-nez v1, :cond_3

    invoke-virtual {p2}, Landroid/view/DragEvent;->getAction()I

    move-result p2

    const/4 v1, 0x5

    if-ne p2, v1, :cond_0

    iget-object p2, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object p2, p2, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {p2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p2

    const v1, 0xffffff

    and-int/2addr p2, v1

    const/high16 v1, 0x44000000    # 512.0f

    or-int/2addr p2, v1

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-static {v0}, Le/e/a/ReorderMotion98;->folderHover(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x6

    if-eq p2, v1, :cond_1

    const/4 v1, 0x4

    if-eq p2, v1, :cond_1

    const/4 v1, 0x3

    if-ne p2, v1, :cond_2

    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    const-string p1, ""

    invoke-virtual {p0, v0, p1}, Le/e/a/CatalogReorder98;->stage(Landroid/view/View;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_3
    return v2
.end method

.method synthetic lambda$new$1$e-e-a-CatalogReorder98(Landroid/view/View;)V
    .registers 2

    .line 17
    iget-boolean p1, p0, Le/e/a/CatalogReorder98;->editing:Z

    if-nez p1, :cond_0

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->enter()V

    goto :goto_0

    :cond_0
    iget-boolean p1, p0, Le/e/a/CatalogReorder98;->saving:Z

    if-nez p1, :cond_1

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->save()V

    :cond_1
    :goto_0
    return-void
.end method

.method synthetic lambda$save$14$e-e-a-CatalogReorder98(Ljava/lang/Boolean;)V
    .registers 7

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/CatalogReorder98;->saving:Z

    iget-object v1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iput-boolean v0, v1, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    iget-object v1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v1, v1, Le/e/a/LocalPlaylists$Page;->catalog98:Le/e/a/CatalogReorder98;

    if-ne v1, p0, :cond_1

    iget-object v1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v1, v1, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-nez v1, :cond_1

    iget-object v1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v1, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/LocalePatch215;->isActivePlaylist(Landroid/app/Activity;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    invoke-virtual {p0, v1}, Le/e/a/CatalogReorder98;->exit(Z)V

    iget-object p1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    invoke-static {p1}, Le/e/a/PlaylistTransfer100;->refreshOthers(Le/e/a/LocalPlaylists$Page;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Le/e/a/CatalogReorder98;->mode:Landroid/widget/ImageButton;

    invoke-virtual {p1, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    iget-object p1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object p1, p1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v1, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v2, "Could not save the order"

    const-string/jumbo v3, "\u7121\u6cd5\u5132\u5b58\u6392\u5e8f"

    const-string v4, "\u4e26\u3073\u66ff\u3048\u3092\u4fdd\u5b58\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {v1, v4, v2, v3}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_1
    :goto_0
    return-void
.end method

.method synthetic lambda$toggleSelection$10$e-e-a-CatalogReorder98()V
    .registers 6

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    iget-object v3, p0, Le/e/a/CatalogReorder98;->selection:Ljava/util/LinkedHashSet;

    invoke-static {v2}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object v4

    iget-object v4, v4, Le/e/a/CatalogReorder98$Item;->id:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/LinkedHashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-static {v2}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object v2

    iget-object v2, v2, Le/e/a/CatalogReorder98$Item;->id:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    iget-object v1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->currentGroup()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v0, v2}, Le/e/a/PlaylistTransfer100;->catalogMove(Le/e/a/LocalPlaylists$Page;Ljava/util/List;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$toggleSelection$11$e-e-a-CatalogReorder98()V
    .registers 2

    .line 33
    iget-object v0, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    invoke-virtual {v0}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void
.end method

.method synthetic lambda$toggleSelection$6$e-e-a-CatalogReorder98(Le/e/a/CatalogReorder98$Item;Landroid/widget/CompoundButton;Z)V
    .registers 4

    .line 33
    iget-object p2, p0, Le/e/a/CatalogReorder98;->selection:Ljava/util/LinkedHashSet;

    iget-object p1, p1, Le/e/a/CatalogReorder98$Item;->id:Ljava/lang/String;

    if-eqz p3, :cond_0

    invoke-virtual {p2, p1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-virtual {p2, p1}, Ljava/util/LinkedHashSet;->remove(Ljava/lang/Object;)Z

    :goto_0
    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->selectionCount()V

    return-void
.end method

.method synthetic lambda$toggleSelection$8$e-e-a-CatalogReorder98()V
    .registers 2

    .line 33
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Le/e/a/CatalogReorder98;->selectAll(Z)V

    return-void
.end method

.method synthetic lambda$toggleSelection$9$e-e-a-CatalogReorder98()V
    .registers 2

    .line 33
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le/e/a/CatalogReorder98;->selectAll(Z)V

    return-void
.end method

.method layout()V
    .registers 7

    .line 19
    iget-object v0, p0, Le/e/a/CatalogReorder98;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v0, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    iget-object v2, p0, Le/e/a/CatalogReorder98;->rows:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method save()V
    .registers 10

    .line 41
    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->changed()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    invoke-virtual {p0, v1}, Le/e/a/CatalogReorder98;->exit(Z)V

    return-void

    :cond_0
    iput-boolean v1, p0, Le/e/a/CatalogReorder98;->saving:Z

    iget-object v0, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iput-boolean v1, v0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    iget-object v0, p0, Le/e/a/CatalogReorder98;->mode:Landroid/widget/ImageButton;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/CatalogReorder98;->original:Ljava/util/ArrayList;

    invoke-virtual {p0, v0, v1}, Le/e/a/CatalogReorder98;->ids(Ljava/util/List;I)Ljava/util/ArrayList;

    move-result-object v3

    iget-object v0, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {p0, v0, v1}, Le/e/a/CatalogReorder98;->ids(Ljava/util/List;I)Ljava/util/ArrayList;

    move-result-object v4

    iget-object v0, p0, Le/e/a/CatalogReorder98;->original:Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Le/e/a/CatalogReorder98;->ids(Ljava/util/List;I)Ljava/util/ArrayList;

    move-result-object v5

    iget-object v0, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {p0, v0, v1}, Le/e/a/CatalogReorder98;->ids(Ljava/util/List;I)Ljava/util/ArrayList;

    move-result-object v6

    iget-object v0, p0, Le/e/a/CatalogReorder98;->owner:Ljava/lang/String;

    if-eqz v0, :cond_1

    const-string v0, "@unfiled"

    iget-object v1, p0, Le/e/a/CatalogReorder98;->owner:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Le/e/a/CatalogReorder98;->owner:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string v0, ""

    :goto_0
    move-object v7, v0

    new-instance v8, Ljava/util/LinkedHashMap;

    iget-object v0, p0, Le/e/a/CatalogReorder98;->moves:Ljava/util/LinkedHashMap;

    invoke-direct {v8, v0}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    iget-object v0, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v0, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    new-instance v2, Le/e/a/CatalogReorder98$9;

    invoke-direct/range {v2 .. v8}, Le/e/a/CatalogReorder98$9;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/LinkedHashMap;)V

    new-instance v1, Le/e/a/CatalogReorder98$10;

    invoke-direct {v1, p0}, Le/e/a/CatalogReorder98$10;-><init>(Le/e/a/CatalogReorder98;)V

    invoke-static {v0, v2, v1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method selectAll(Z)V
    .registers 5

    .line 35
    iget-object v0, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-static {v1}, Le/e/a/CatalogReorder98;->row(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Landroid/widget/CheckBox;

    if-eqz v2, :cond_0

    check-cast v1, Landroid/widget/CheckBox;

    invoke-virtual {v1, p1}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method selectionCount()V
    .registers 7

    .line 36
    iget-object v0, p0, Le/e/a/CatalogReorder98;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v2, v2, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v3, "Selected: "

    const-string v4, "\u5df2\u9078\u53d6\uff1a"

    const-string/jumbo v5, "\u9078\u629e\u4e2d: "

    invoke-static {v2, v5, v3, v4}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Le/e/a/CatalogReorder98;->selection:Ljava/util/LinkedHashSet;

    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method stage(Landroid/view/View;Ljava/lang/String;)V
    .registers 5

    .line 29
    iget-object v0, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object v0

    iget v0, v0, Le/e/a/CatalogReorder98$Item;->kind:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->currentGroup()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/CatalogReorder98;->moves:Ljava/util/LinkedHashMap;

    invoke-static {p1}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object v1

    iget-object v1, v1, Le/e/a/CatalogReorder98$Item;->id:Ljava/lang/String;

    invoke-virtual {v0, v1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object p2, p0, Le/e/a/CatalogReorder98;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->updateCounts()V

    :cond_0
    return-void
.end method

.method toggleSelection()V
    .registers 12

    .line 33
    iget-boolean v0, p0, Le/e/a/CatalogReorder98;->editing:Z

    if-nez v0, :cond_4

    iget-boolean v0, p0, Le/e/a/CatalogReorder98;->saving:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-boolean v0, v0, Le/e/a/LocalPlaylists$Page;->reorderSaving:Z

    if-nez v0, :cond_4

    iget-boolean v0, p0, Le/e/a/CatalogReorder98;->selecting:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    invoke-virtual {v0}, Le/e/a/LocalPlaylists$Page;->render()V

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CatalogReorder98;->selecting:Z

    iget-object v1, p0, Le/e/a/CatalogReorder98;->sort:Landroid/widget/Spinner;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setVisibility(I)V

    iget-object v1, p0, Le/e/a/CatalogReorder98;->status:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v1, p0, Le/e/a/CatalogReorder98;->mode:Landroid/widget/ImageButton;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v1, p0, Le/e/a/CatalogReorder98;->fab:Landroid/view/View;

    if-eqz v1, :cond_1

    iget-object v1, p0, Le/e/a/CatalogReorder98;->fab:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    iget-object v1, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, -0x2

    if-eqz v4, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-static {v4}, Le/e/a/CatalogReorder98;->row(Landroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/LinearLayout;

    invoke-virtual {v6, v3}, Landroid/widget/LinearLayout;->setLongClickable(Z)V

    invoke-static {v4}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object v4

    iget v7, v4, Le/e/a/CatalogReorder98$Item;->kind:I

    const/4 v8, 0x2

    if-eq v7, v8, :cond_2

    invoke-virtual {v6, v3}, Landroid/widget/LinearLayout;->setClickable(Z)V

    goto :goto_0

    :cond_2
    invoke-virtual {v6}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v7

    sub-int/2addr v7, v0

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, v2}, Landroid/view/View;->setVisibility(I)V

    new-instance v7, Landroid/widget/CheckBox;

    iget-object v8, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v8, v8, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v7, v8}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v9, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v9, v9, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const/16 v10, 0x30

    invoke-static {v9, v10}, Le/e/a/ReorderMotion98;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v8, v9, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Le/e/a/CatalogReorder98$2;

    invoke-direct {v5, p0, v4}, Le/e/a/CatalogReorder98$2;-><init>(Le/e/a/CatalogReorder98;Le/e/a/CatalogReorder98$Item;)V

    invoke-virtual {v7, v5}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    new-instance v4, Le/e/a/CatalogReorder98$3;

    invoke-direct {v4, v7}, Le/e/a/CatalogReorder98$3;-><init>(Landroid/widget/CheckBox;)V

    invoke-virtual {v6, v4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    :cond_3
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v1, v1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le/e/a/CatalogReorder98;->selectionBar:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v0, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v1, "Select all"

    const-string v2, "\u5168\u9078"

    const-string v3, "\u5168\u9078\u629e"

    invoke-static {v0, v3, v1, v2}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Le/e/a/CatalogReorder98$4;

    invoke-direct {v1, p0}, Le/e/a/CatalogReorder98$4;-><init>(Le/e/a/CatalogReorder98;)V

    invoke-virtual {p0, v0, v1}, Le/e/a/CatalogReorder98;->addSelectionButton(Ljava/lang/String;Ljava/lang/Runnable;)V

    iget-object v0, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v0, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v1, "Clear"

    const-string v2, "\u5168\u89e3\u9664"

    invoke-static {v0, v2, v1, v2}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Le/e/a/CatalogReorder98$5;

    invoke-direct {v1, p0}, Le/e/a/CatalogReorder98$5;-><init>(Le/e/a/CatalogReorder98;)V

    invoke-virtual {p0, v0, v1}, Le/e/a/CatalogReorder98;->addSelectionButton(Ljava/lang/String;Ljava/lang/Runnable;)V

    iget-object v0, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v0, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v1, "Move"

    const-string/jumbo v2, "\u79fb\u52d5"

    invoke-static {v0, v2, v1, v2}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Le/e/a/CatalogReorder98$6;

    invoke-direct {v1, p0}, Le/e/a/CatalogReorder98$6;-><init>(Le/e/a/CatalogReorder98;)V

    invoke-virtual {p0, v0, v1}, Le/e/a/CatalogReorder98;->addSelectionButton(Ljava/lang/String;Ljava/lang/Runnable;)V

    iget-object v0, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v0, v0, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v1, "Done"

    const-string v2, "\u5b8c\u6210"

    const-string v3, "\u5b8c\u4e86"

    invoke-static {v0, v3, v1, v2}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Le/e/a/CatalogReorder98$7;

    invoke-direct {v1, p0}, Le/e/a/CatalogReorder98$7;-><init>(Le/e/a/CatalogReorder98;)V

    invoke-virtual {p0, v0, v1}, Le/e/a/CatalogReorder98;->addSelectionButton(Ljava/lang/String;Ljava/lang/Runnable;)V

    iget-object v0, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v0, v0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/CatalogReorder98;->selectionBar:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Le/e/a/CatalogReorder98;->selectionCount()V

    :cond_4
    return-void
.end method

.method updateCounts()V
    .registers 12

    .line 31
    iget-object v0, p0, Le/e/a/CatalogReorder98;->shown:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-static {v1}, Le/e/a/CatalogReorder98;->item(Landroid/view/View;)Le/e/a/CatalogReorder98$Item;

    move-result-object v2

    iget v3, v2, Le/e/a/CatalogReorder98$Item;->kind:I

    const/4 v4, 0x3

    const/4 v5, 0x1

    if-eq v3, v5, :cond_0

    iget v3, v2, Le/e/a/CatalogReorder98$Item;->kind:I

    if-eq v3, v4, :cond_0

    goto :goto_0

    :cond_0
    iget v3, v2, Le/e/a/CatalogReorder98$Item;->kind:I

    const-string v6, ""

    if-ne v3, v4, :cond_1

    move-object v2, v6

    goto :goto_1

    :cond_1
    iget-object v2, v2, Le/e/a/CatalogReorder98$Item;->id:Ljava/lang/String;

    :goto_1
    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_2
    iget-object v7, p0, Le/e/a/CatalogReorder98;->snapshot:Le/e/a/LocalPlaylistData;

    iget-object v7, v7, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v3, v7, :cond_4

    iget-object v7, p0, Le/e/a/CatalogReorder98;->snapshot:Le/e/a/LocalPlaylistData;

    iget-object v7, v7, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v7, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    if-eqz v7, :cond_3

    iget-object v8, p0, Le/e/a/CatalogReorder98;->moves:Ljava/util/LinkedHashMap;

    const-string v9, "id"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    iget-object v8, p0, Le/e/a/CatalogReorder98;->moves:Ljava/util/LinkedHashMap;

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    goto :goto_3

    :cond_2
    const-string v8, "group"

    invoke-virtual {v7, v8, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :goto_3
    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    add-int/lit8 v4, v4, 0x1

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_4
    invoke-static {v1}, Le/e/a/CatalogReorder98;->row(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Le/e/a/CatalogReorder98;->page:Le/e/a/LocalPlaylists$Page;

    iget-object v3, v3, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    const-string v5, "Playlists: "

    const-string/jumbo v6, "\u64ad\u653e\u6e05\u55ae "

    const-string v7, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8 "

    invoke-static {v3, v7, v5, v6}, Le/e/a/CatalogReorder98;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    :cond_5
    return-void
.end method
