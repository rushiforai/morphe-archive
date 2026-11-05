.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda35;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnDragListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/ScrollView;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Landroid/widget/LinearLayout;

.field public final synthetic f$3:Ljava/util/ArrayList;

.field public final synthetic f$4:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/ScrollView;Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/util/ArrayList;[Ljava/lang/Runnable;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda35;->f$0:Landroid/widget/ScrollView;

    iput-object p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda35;->f$1:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda35;->f$2:Landroid/widget/LinearLayout;

    iput-object p4, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda35;->f$3:Ljava/util/ArrayList;

    iput-object p5, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda35;->f$4:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onDrag(Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 10

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda35;->f$0:Landroid/widget/ScrollView;

    iget-object v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda35;->f$1:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda35;->f$2:Landroid/widget/LinearLayout;

    iget-object v3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda35;->f$3:Ljava/util/ArrayList;

    iget-object v4, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda35;->f$4:[Ljava/lang/Runnable;

    move-object v5, p1

    move-object v6, p2

    invoke-static/range {v0 .. v6}, Le/e/a/Ranking190;->lambda$9(Landroid/widget/ScrollView;Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/util/ArrayList;[Ljava/lang/Runnable;Landroid/view/View;Landroid/view/DragEvent;)Z

    move-result p1

    return p1
.end method
