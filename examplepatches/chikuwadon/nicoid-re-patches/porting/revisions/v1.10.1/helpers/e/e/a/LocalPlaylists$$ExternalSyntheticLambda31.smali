.class public final synthetic Le/e/a/LocalPlaylists$$ExternalSyntheticLambda31;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic f$0:Landroid/app/AlertDialog;

.field public final synthetic f$1:Ljava/util/function/Consumer;

.field public final synthetic f$2:[Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/app/AlertDialog;Ljava/util/function/Consumer;[Ljava/lang/String;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda31;->f$0:Landroid/app/AlertDialog;

    iput-object p2, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda31;->f$1:Ljava/util/function/Consumer;

    iput-object p3, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda31;->f$2:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda31;->f$0:Landroid/app/AlertDialog;

    iget-object v1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda31;->f$1:Ljava/util/function/Consumer;

    iget-object v2, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda31;->f$2:[Ljava/lang/String;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, v2, p1}, Le/e/a/LocalPlaylists;->lambda$8(Landroid/app/AlertDialog;Ljava/util/function/Consumer;[Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method
