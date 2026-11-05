.class public final synthetic Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda64;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/LocalPlaylists$Page;

.field public final synthetic f$1:Landroid/widget/EditText;

.field public final synthetic f$2:Z

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/EditText;ZLjava/lang/String;Landroid/app/AlertDialog;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda64;->f$0:Le/e/a/LocalPlaylists$Page;

    iput-object p2, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda64;->f$1:Landroid/widget/EditText;

    iput-boolean p3, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda64;->f$2:Z

    iput-object p4, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda64;->f$3:Ljava/lang/String;

    iput-object p5, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda64;->f$4:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda64;->f$0:Le/e/a/LocalPlaylists$Page;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda64;->f$1:Landroid/widget/EditText;

    iget-boolean v2, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda64;->f$2:Z

    iget-object v3, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda64;->f$3:Ljava/lang/String;

    iget-object v4, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda64;->f$4:Landroid/app/AlertDialog;

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Le/e/a/LocalPlaylists$Page;->lambda$19$e-e-a-LocalPlaylists$Page(Landroid/widget/EditText;ZLjava/lang/String;Landroid/app/AlertDialog;Landroid/view/View;)V

    return-void
.end method
