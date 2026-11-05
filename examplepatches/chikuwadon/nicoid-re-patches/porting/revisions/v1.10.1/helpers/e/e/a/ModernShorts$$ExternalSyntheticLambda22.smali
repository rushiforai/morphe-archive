.class public final synthetic Le/e/a/ModernShorts$$ExternalSyntheticLambda22;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic f$0:Le/e/a/ModernShorts$State;

.field public final synthetic f$1:Landroid/app/Activity;

.field public final synthetic f$2:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Le/e/a/ModernShorts$State;Landroid/app/Activity;Landroid/view/View;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda22;->f$0:Le/e/a/ModernShorts$State;

    iput-object p2, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda22;->f$1:Landroid/app/Activity;

    iput-object p3, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda22;->f$2:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda22;->f$0:Le/e/a/ModernShorts$State;

    iget-object v1, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda22;->f$1:Landroid/app/Activity;

    iget-object v2, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda22;->f$2:Landroid/view/View;

    invoke-static {v0, v1, v2}, Le/e/a/ModernShorts;->lambda$22(Le/e/a/ModernShorts$State;Landroid/app/Activity;Landroid/view/View;)V

    return-void
.end method
