.class public final synthetic Le/e/a/ModernShorts$$ExternalSyntheticLambda23;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/ModernShorts$Home;

.field public final synthetic f$1:Landroid/app/Activity;

.field public final synthetic f$2:Le/e/a/ModernShorts$State;


# direct methods
.method public synthetic constructor <init>(Le/e/a/ModernShorts$Home;Landroid/app/Activity;Le/e/a/ModernShorts$State;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda23;->f$0:Le/e/a/ModernShorts$Home;

    iput-object p2, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda23;->f$1:Landroid/app/Activity;

    iput-object p3, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda23;->f$2:Le/e/a/ModernShorts$State;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda23;->f$0:Le/e/a/ModernShorts$Home;

    iget-object v1, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda23;->f$1:Landroid/app/Activity;

    iget-object v2, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda23;->f$2:Le/e/a/ModernShorts$State;

    invoke-static {v0, v1, v2, p1}, Le/e/a/ModernShorts;->lambda$bootstrap$4(Le/e/a/ModernShorts$Home;Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/view/View;)V

    return-void
.end method
