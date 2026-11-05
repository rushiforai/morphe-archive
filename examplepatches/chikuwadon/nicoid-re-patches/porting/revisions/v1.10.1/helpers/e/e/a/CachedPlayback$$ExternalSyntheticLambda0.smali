.class public final synthetic Le/e/a/CachedPlayback$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Landroid/content/Context;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CachedPlayback$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/CachedPlayback$$ExternalSyntheticLambda0;->f$1:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/CachedPlayback$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/CachedPlayback$$ExternalSyntheticLambda0;->f$1:Landroid/content/Context;

    invoke-static {v0, v1}, Le/e/a/CachedPlayback;->lambda$3(Ljava/lang/Object;Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
