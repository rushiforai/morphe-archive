.class public final synthetic Le/e/a/LocalPlaylists$$ExternalSyntheticLambda38;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/EditText;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Landroid/app/AlertDialog;

.field public final synthetic f$3:Landroid/content/Context;

.field public final synthetic f$4:Ljava/util/function/Consumer;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Landroid/content/Context;Landroid/app/AlertDialog;Landroid/content/Context;Ljava/util/function/Consumer;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda38;->f$0:Landroid/widget/EditText;

    iput-object p2, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda38;->f$1:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda38;->f$2:Landroid/app/AlertDialog;

    iput-object p4, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda38;->f$3:Landroid/content/Context;

    iput-object p5, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda38;->f$4:Ljava/util/function/Consumer;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda38;->f$0:Landroid/widget/EditText;

    iget-object v1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda38;->f$1:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda38;->f$2:Landroid/app/AlertDialog;

    iget-object v3, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda38;->f$3:Landroid/content/Context;

    iget-object v4, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda38;->f$4:Ljava/util/function/Consumer;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Le/e/a/LocalPlaylists;->lambda$6(Landroid/widget/EditText;Landroid/content/Context;Landroid/app/AlertDialog;Landroid/content/Context;Ljava/util/function/Consumer;Landroid/view/View;)V

    return-void
.end method
