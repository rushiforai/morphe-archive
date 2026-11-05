.class public final synthetic Le/e/a/Review181$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Landroid/widget/EditText;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Review181$$ExternalSyntheticLambda7;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/Review181$$ExternalSyntheticLambda7;->f$1:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/Review181$$ExternalSyntheticLambda7;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/Review181$$ExternalSyntheticLambda7;->f$1:Landroid/widget/EditText;

    invoke-static {v0, v1, p1, p2}, Le/e/a/Review181;->lambda$7(Landroid/app/Activity;Landroid/widget/EditText;Landroid/content/DialogInterface;I)V

    return-void
.end method
