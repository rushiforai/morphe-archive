.class public final synthetic Le/e/a/PlayerButtons193$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnDragListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/LinearLayout;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Ljava/util/List;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Landroid/widget/LinearLayout;

.field public final synthetic f$5:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Landroid/widget/LinearLayout;[Ljava/lang/Runnable;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda6;->f$0:Landroid/widget/LinearLayout;

    iput-object p2, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda6;->f$1:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda6;->f$2:Ljava/util/List;

    iput-object p4, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda6;->f$3:Ljava/lang/String;

    iput-object p5, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda6;->f$4:Landroid/widget/LinearLayout;

    iput-object p6, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda6;->f$5:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onDrag(Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 11

    .line 0
    iget-object v0, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda6;->f$0:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda6;->f$1:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda6;->f$2:Ljava/util/List;

    iget-object v3, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda6;->f$3:Ljava/lang/String;

    iget-object v4, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda6;->f$4:Landroid/widget/LinearLayout;

    iget-object v5, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda6;->f$5:[Ljava/lang/Runnable;

    move-object v6, p1

    move-object v7, p2

    invoke-static/range {v0 .. v7}, Le/e/a/PlayerButtons193;->lambda$3(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Landroid/widget/LinearLayout;[Ljava/lang/Runnable;Landroid/view/View;Landroid/view/DragEvent;)Z

    move-result p1

    return p1
.end method
