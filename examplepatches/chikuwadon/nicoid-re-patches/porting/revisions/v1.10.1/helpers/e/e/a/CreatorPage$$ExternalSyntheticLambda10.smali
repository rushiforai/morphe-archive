.class public final synthetic Le/e/a/CreatorPage$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/LinearLayout;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda10;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda10;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda10;->f$2:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda10;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda10;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda10;->f$2:Landroid/widget/LinearLayout;

    invoke-static {v0, v1, v2, p1}, Le/e/a/CreatorPage;->lambda$5(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/LinearLayout;Landroid/view/View;)V

    return-void
.end method
