.class public final synthetic Le/e/a/VideoDetails$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/LinearLayout;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda2;->f$0:Landroid/widget/LinearLayout;

    iput-object p2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda2;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda2;->f$0:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda2;->f$1:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Le/e/a/VideoDetails;->lambda$3(Landroid/widget/LinearLayout;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
