.class public final synthetic Le/e/a/PlayerButtons193$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/util/List;

.field public final synthetic f$1:Ljava/util/Set;

.field public final synthetic f$2:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ljava/util/Set;[Ljava/lang/Runnable;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda2;->f$0:Ljava/util/List;

    iput-object p2, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda2;->f$1:Ljava/util/Set;

    iput-object p3, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda2;->f$2:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda2;->f$0:Ljava/util/List;

    iget-object v1, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda2;->f$1:Ljava/util/Set;

    iget-object v2, p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda2;->f$2:[Ljava/lang/Runnable;

    invoke-static {v0, v1, v2}, Le/e/a/PlayerButtons193;->lambda$4(Ljava/util/List;Ljava/util/Set;[Ljava/lang/Runnable;)V

    return-void
.end method
