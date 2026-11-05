.class public final synthetic Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/MultiTabs227$Host;

.field public final synthetic f$1:Landroid/widget/HorizontalScrollView;

.field public final synthetic f$2:Z


# direct methods
.method public synthetic constructor <init>(Le/e/a/MultiTabs227$Host;Landroid/widget/HorizontalScrollView;Z)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda11;->f$0:Le/e/a/MultiTabs227$Host;

    iput-object p2, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda11;->f$1:Landroid/widget/HorizontalScrollView;

    iput-boolean p3, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda11;->f$2:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda11;->f$0:Le/e/a/MultiTabs227$Host;

    iget-object v1, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda11;->f$1:Landroid/widget/HorizontalScrollView;

    iget-boolean v2, p0, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda11;->f$2:Z

    invoke-virtual {v0, v1, v2}, Le/e/a/MultiTabs227$Host;->lambda$3$e-e-a-MultiTabs227$Host(Landroid/widget/HorizontalScrollView;Z)V

    return-void
.end method
