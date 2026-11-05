.class public final synthetic Le/e/a/LocalPlaylists$$ExternalSyntheticLambda35;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda35;->f$0:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda35;->f$0:Landroid/content/Context;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p1}, Le/e/a/LocalPlaylists;->lambda$11(Landroid/content/Context;Ljava/lang/Boolean;)V

    return-void
.end method
