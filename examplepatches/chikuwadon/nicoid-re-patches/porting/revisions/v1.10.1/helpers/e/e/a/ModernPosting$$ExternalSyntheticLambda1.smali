.class public final synthetic Le/e/a/ModernPosting$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/String;Landroid/app/Activity;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda1;->f$2:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/ModernPosting$$ExternalSyntheticLambda1;->f$2:Landroid/app/Activity;

    invoke-static {v0, v1, v2}, Le/e/a/ModernPosting;->lambda$3(Ljava/lang/Object;Ljava/lang/String;Landroid/app/Activity;)V

    return-void
.end method
