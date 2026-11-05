.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda20;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Ljava/util/Set;

.field public final synthetic f$2:Le/e/a/Ranking190$Manager;

.field public final synthetic f$3:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/util/Set;Le/e/a/Ranking190$Manager;Landroid/widget/LinearLayout;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda20;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda20;->f$1:Ljava/util/Set;

    iput-object p3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda20;->f$2:Le/e/a/Ranking190$Manager;

    iput-object p4, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda20;->f$3:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda20;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda20;->f$1:Ljava/util/Set;

    iget-object v2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda20;->f$2:Le/e/a/Ranking190$Manager;

    iget-object v3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda20;->f$3:Landroid/widget/LinearLayout;

    move-object v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Le/e/a/Ranking190;->lambda$21(Landroid/app/Activity;Ljava/util/Set;Le/e/a/Ranking190$Manager;Landroid/widget/LinearLayout;Landroid/content/DialogInterface;I)V

    return-void
.end method
