.class public final synthetic Le/e/a/ModernShorts$$ExternalSyntheticLambda26;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Le/e/a/ModernShorts$State;

.field public final synthetic f$2:Le/e/a/ModernShorts$Home;

.field public final synthetic f$3:Z


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Z)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda26;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda26;->f$1:Le/e/a/ModernShorts$State;

    iput-object p3, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda26;->f$2:Le/e/a/ModernShorts$Home;

    iput-boolean p4, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda26;->f$3:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda26;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda26;->f$1:Le/e/a/ModernShorts$State;

    iget-object v2, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda26;->f$2:Le/e/a/ModernShorts$Home;

    iget-boolean v3, p0, Le/e/a/ModernShorts$$ExternalSyntheticLambda26;->f$3:Z

    invoke-static {v0, v1, v2, v3}, Le/e/a/ModernShorts;->lambda$loadFeed$8(Landroid/app/Activity;Le/e/a/ModernShorts$State;Le/e/a/ModernShorts$Home;Z)V

    return-void
.end method
