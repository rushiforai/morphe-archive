.class public final synthetic Le/e/a/SearchRange$$ExternalSyntheticLambda24;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:[J

.field public final synthetic f$1:[I

.field public final synthetic f$2:[I

.field public final synthetic f$3:Landroid/content/Context;

.field public final synthetic f$4:Landroid/widget/Button;


# direct methods
.method public synthetic constructor <init>([J[I[ILandroid/content/Context;Landroid/widget/Button;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda24;->f$0:[J

    iput-object p2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda24;->f$1:[I

    iput-object p3, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda24;->f$2:[I

    iput-object p4, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda24;->f$3:Landroid/content/Context;

    iput-object p5, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda24;->f$4:Landroid/widget/Button;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 10

    .line 0
    iget-object v0, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda24;->f$0:[J

    iget-object v1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda24;->f$1:[I

    iget-object v2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda24;->f$2:[I

    iget-object v3, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda24;->f$3:Landroid/content/Context;

    iget-object v4, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda24;->f$4:Landroid/widget/Button;

    move-object v5, p1

    move v6, p2

    invoke-static/range {v0 .. v6}, Le/e/a/SearchRange;->lambda$10([J[I[ILandroid/content/Context;Landroid/widget/Button;Landroid/content/DialogInterface;I)V

    return-void
.end method
