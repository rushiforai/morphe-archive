.class public final synthetic Le/e/a/FilterEditor110$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:[Ljava/lang/String;

.field public final synthetic f$1:[I

.field public final synthetic f$2:Landroid/widget/EditText;

.field public final synthetic f$3:I

.field public final synthetic f$4:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>([Ljava/lang/String;[ILandroid/widget/EditText;ILjava/lang/Runnable;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda2;->f$0:[Ljava/lang/String;

    iput-object p2, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda2;->f$1:[I

    iput-object p3, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda2;->f$2:Landroid/widget/EditText;

    iput p4, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda2;->f$3:I

    iput-object p5, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda2;->f$4:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda2;->f$0:[Ljava/lang/String;

    iget-object v1, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda2;->f$1:[I

    iget-object v2, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda2;->f$2:Landroid/widget/EditText;

    iget v3, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda2;->f$3:I

    iget-object v4, p0, Le/e/a/FilterEditor110$$ExternalSyntheticLambda2;->f$4:Ljava/lang/Runnable;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Le/e/a/FilterEditor110;->lambda$2([Ljava/lang/String;[ILandroid/widget/EditText;ILjava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
