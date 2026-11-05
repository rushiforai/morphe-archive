.class public final synthetic Le/e/a/CreatorPage$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/LinearLayout;

.field public final synthetic f$1:Landroid/widget/Button;

.field public final synthetic f$2:Landroid/app/Activity;

.field public final synthetic f$3:I


# direct methods
.method public synthetic constructor <init>(Landroid/widget/LinearLayout;Landroid/widget/Button;Landroid/app/Activity;I)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda12;->f$0:Landroid/widget/LinearLayout;

    iput-object p2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda12;->f$1:Landroid/widget/Button;

    iput-object p3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda12;->f$2:Landroid/app/Activity;

    iput p4, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda12;->f$3:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda12;->f$0:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda12;->f$1:Landroid/widget/Button;

    iget-object v2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda12;->f$2:Landroid/app/Activity;

    iget v3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda12;->f$3:I

    invoke-static {v0, v1, v2, v3, p1}, Le/e/a/CreatorPage;->lambda$29(Landroid/widget/LinearLayout;Landroid/widget/Button;Landroid/app/Activity;ILandroid/view/View;)V

    return-void
.end method
