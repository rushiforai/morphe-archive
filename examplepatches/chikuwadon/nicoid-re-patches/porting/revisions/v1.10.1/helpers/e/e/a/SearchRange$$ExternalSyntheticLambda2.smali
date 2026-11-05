.class public final synthetic Le/e/a/SearchRange$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:[J

.field public final synthetic f$2:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;[JLjava/lang/Runnable;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda2;->f$0:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda2;->f$1:[J

    iput-object p3, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda2;->f$2:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda2;->f$0:Landroid/content/Context;

    iget-object v1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda2;->f$1:[J

    iget-object v2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda2;->f$2:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2}, Le/e/a/SearchRange;->lambda$5(Landroid/content/Context;[JLjava/lang/Runnable;)V

    return-void
.end method
