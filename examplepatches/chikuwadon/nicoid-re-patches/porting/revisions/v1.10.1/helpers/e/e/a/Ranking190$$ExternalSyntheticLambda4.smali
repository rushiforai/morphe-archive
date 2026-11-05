.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnDragListener;


# instance fields
.field public final synthetic f$0:Le/e/a/Ranking190$Manager;

.field public final synthetic f$1:Landroid/widget/LinearLayout;

.field public final synthetic f$2:Landroid/widget/ScrollView;

.field public final synthetic f$3:Landroid/app/Activity;

.field public final synthetic f$4:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Le/e/a/Ranking190$Manager;Landroid/widget/LinearLayout;Landroid/widget/ScrollView;Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda4;->f$0:Le/e/a/Ranking190$Manager;

    iput-object p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda4;->f$1:Landroid/widget/LinearLayout;

    iput-object p3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda4;->f$2:Landroid/widget/ScrollView;

    iput-object p4, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda4;->f$3:Landroid/app/Activity;

    iput-object p5, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda4;->f$4:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final onDrag(Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 10

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda4;->f$0:Le/e/a/Ranking190$Manager;

    iget-object v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda4;->f$1:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda4;->f$2:Landroid/widget/ScrollView;

    iget-object v3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda4;->f$3:Landroid/app/Activity;

    iget-object v4, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda4;->f$4:Landroid/widget/LinearLayout;

    move-object v5, p1

    move-object v6, p2

    invoke-static/range {v0 .. v6}, Le/e/a/Ranking190;->lambda$28(Le/e/a/Ranking190$Manager;Landroid/widget/LinearLayout;Landroid/widget/ScrollView;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/view/View;Landroid/view/DragEvent;)Z

    move-result p1

    return p1
.end method
