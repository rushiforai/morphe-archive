.class public final synthetic Le/e/a/FilterEditor110$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/widget/Button;

.field public final synthetic f$1:[I

.field public final synthetic f$2:Landroid/content/Context;

.field public final synthetic f$3:Landroid/widget/Button;

.field public final synthetic f$4:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/Button;[ILandroid/content/Context;Landroid/widget/Button;Landroid/widget/EditText;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda1;->f$0:Landroid/widget/Button;

    iput-object p2, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda1;->f$1:[I

    iput-object p3, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda1;->f$2:Landroid/content/Context;

    iput-object p4, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda1;->f$3:Landroid/widget/Button;

    iput-object p5, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda1;->f$4:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda1;->f$0:Landroid/widget/Button;

    iget-object v1, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda1;->f$1:[I

    iget-object v2, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda1;->f$2:Landroid/content/Context;

    iget-object v3, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda1;->f$3:Landroid/widget/Button;

    iget-object v4, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda1;->f$4:Landroid/widget/EditText;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/FilterEditor110;->lambda$1(Landroid/widget/Button;[ILandroid/content/Context;Landroid/widget/Button;Landroid/widget/EditText;)V

    return-void
.end method
