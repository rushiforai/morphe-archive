.class public final synthetic Le/e/a/CacheControl110$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;ZLjava/lang/Runnable;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CacheControl110$$ExternalSyntheticLambda0;->f$0:Landroid/app/Activity;

    iput-boolean p2, p0, Le/e/a/CacheControl110$$ExternalSyntheticLambda0;->f$1:Z

    iput-object p3, p0, Le/e/a/CacheControl110$$ExternalSyntheticLambda0;->f$2:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/CacheControl110$$ExternalSyntheticLambda0;->f$0:Landroid/app/Activity;

    iget-boolean v1, p0, Le/e/a/CacheControl110$$ExternalSyntheticLambda0;->f$1:Z

    iget-object v2, p0, Le/e/a/CacheControl110$$ExternalSyntheticLambda0;->f$2:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2}, Le/e/a/CacheControl110;->lambda$7(Landroid/app/Activity;ZLjava/lang/Runnable;)V

    return-void
.end method
