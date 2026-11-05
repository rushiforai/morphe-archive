.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda30;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/Ranking190$Manager;

.field public final synthetic f$1:Landroid/app/Activity;

.field public final synthetic f$2:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Le/e/a/Ranking190$Manager;Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda30;->f$0:Le/e/a/Ranking190$Manager;

    iput-object p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda30;->f$1:Landroid/app/Activity;

    iput-object p3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda30;->f$2:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda30;->f$0:Le/e/a/Ranking190$Manager;

    iget-object v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda30;->f$1:Landroid/app/Activity;

    iget-object v2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda30;->f$2:Landroid/widget/LinearLayout;

    invoke-static {v0, v1, v2, p1}, Le/e/a/Ranking190;->lambda$12(Le/e/a/Ranking190$Manager;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method
