.class public final synthetic Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda50;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/LocalPlaylists$Page;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:[Ljava/lang/String;

.field public final synthetic f$4:Z

.field public final synthetic f$5:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Le/e/a/LocalPlaylists$Page;Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;ZLjava/lang/String;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda50;->f$0:Le/e/a/LocalPlaylists$Page;

    iput-object p2, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda50;->f$1:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda50;->f$2:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda50;->f$3:[Ljava/lang/String;

    iput-boolean p5, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda50;->f$4:Z

    iput-object p6, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda50;->f$5:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 11

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda50;->f$0:Le/e/a/LocalPlaylists$Page;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda50;->f$1:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda50;->f$2:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda50;->f$3:[Ljava/lang/String;

    iget-boolean v4, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda50;->f$4:Z

    iget-object v5, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda50;->f$5:Ljava/lang/String;

    move-object v6, p1

    move v7, p2

    invoke-virtual/range {v0 .. v7}, Le/e/a/LocalPlaylists$Page;->lambda$18$e-e-a-LocalPlaylists$Page(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;ZLjava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method
