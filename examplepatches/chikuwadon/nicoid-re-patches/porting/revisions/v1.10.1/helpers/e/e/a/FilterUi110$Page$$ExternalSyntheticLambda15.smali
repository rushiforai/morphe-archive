.class public final synthetic Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda15;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic f$0:Le/e/a/FilterUi110$Page;

.field public final synthetic f$1:Landroid/preference/PreferenceActivity;


# direct methods
.method public synthetic constructor <init>(Le/e/a/FilterUi110$Page;Landroid/preference/PreferenceActivity;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda15;->f$0:Le/e/a/FilterUi110$Page;

    iput-object p2, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda15;->f$1:Landroid/preference/PreferenceActivity;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda15;->f$0:Le/e/a/FilterUi110$Page;

    iget-object v1, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda15;->f$1:Landroid/preference/PreferenceActivity;

    invoke-virtual {v0, v1, p1}, Le/e/a/FilterUi110$Page;->lambda$10$e-e-a-FilterUi110$Page(Landroid/preference/PreferenceActivity;Landroid/content/DialogInterface;)V

    return-void
.end method
