.class public final synthetic Le/e/a/LocalPlaylists$$ExternalSyntheticLambda33;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda33;->f$0:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda33;->f$0:Landroid/app/Activity;

    check-cast p1, Ljava/util/Map$Entry;

    invoke-static {v0, p1}, Le/e/a/LocalPlaylists;->lambda$12(Landroid/app/Activity;Ljava/util/Map$Entry;)Z

    move-result p1

    return p1
.end method
