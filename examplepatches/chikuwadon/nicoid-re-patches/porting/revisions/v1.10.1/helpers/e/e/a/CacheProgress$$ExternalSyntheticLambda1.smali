.class public final synthetic Le/e/a/CacheProgress$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Ljava/lang/Object;

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/Object;I)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CacheProgress$$ExternalSyntheticLambda1;->f$0:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/CacheProgress$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    iput p3, p0, Le/e/a/CacheProgress$$ExternalSyntheticLambda1;->f$2:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/CacheProgress$$ExternalSyntheticLambda1;->f$0:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/CacheProgress$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    iget v2, p0, Le/e/a/CacheProgress$$ExternalSyntheticLambda1;->f$2:I

    invoke-static {v0, v1, v2}, Le/e/a/CacheProgress;->lambda$0(Ljava/lang/String;Ljava/lang/Object;I)V

    return-void
.end method
