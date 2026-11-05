.class public final synthetic Le/e/a/LocalPlaylists$$ExternalSyntheticLambda29;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic f$0:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda29;->f$0:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda29;->f$0:Ljava/lang/Runnable;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p1}, Le/e/a/LocalPlaylists;->lambda$5(Ljava/lang/Runnable;Ljava/lang/Boolean;)V

    return-void
.end method
