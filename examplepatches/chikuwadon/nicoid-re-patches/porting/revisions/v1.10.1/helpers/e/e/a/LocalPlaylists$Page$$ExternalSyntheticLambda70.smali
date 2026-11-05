.class public final synthetic Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda70;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/LocalPlaylists$Page;

.field public final synthetic f$1:Landroid/widget/EditText;

.field public final synthetic f$2:Landroid/app/AlertDialog;

.field public final synthetic f$3:Z


# direct methods
.method public synthetic constructor <init>(Le/e/a/LocalPlaylists$Page;Landroid/widget/EditText;Landroid/app/AlertDialog;Z)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda70;->f$0:Le/e/a/LocalPlaylists$Page;

    iput-object p2, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda70;->f$1:Landroid/widget/EditText;

    iput-object p3, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda70;->f$2:Landroid/app/AlertDialog;

    iput-boolean p4, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda70;->f$3:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda70;->f$0:Le/e/a/LocalPlaylists$Page;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda70;->f$1:Landroid/widget/EditText;

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda70;->f$2:Landroid/app/AlertDialog;

    iget-boolean v3, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda70;->f$3:Z

    invoke-virtual {v0, v1, v2, v3, p1}, Le/e/a/LocalPlaylists$Page;->lambda$5$e-e-a-LocalPlaylists$Page(Landroid/widget/EditText;Landroid/app/AlertDialog;ZLandroid/view/View;)V

    return-void
.end method
