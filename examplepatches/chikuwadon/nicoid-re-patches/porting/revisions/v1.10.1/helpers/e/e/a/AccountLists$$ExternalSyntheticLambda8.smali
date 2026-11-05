.class public final synthetic Le/e/a/AccountLists$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Ljava/util/ArrayList;

.field public final synthetic f$2:Landroid/widget/ArrayAdapter;

.field public final synthetic f$3:Landroid/widget/Spinner;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/util/ArrayList;Landroid/widget/ArrayAdapter;Landroid/widget/Spinner;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda8;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda8;->f$1:Ljava/util/ArrayList;

    iput-object p3, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda8;->f$2:Landroid/widget/ArrayAdapter;

    iput-object p4, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda8;->f$3:Landroid/widget/Spinner;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda8;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda8;->f$1:Ljava/util/ArrayList;

    iget-object v2, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda8;->f$2:Landroid/widget/ArrayAdapter;

    iget-object v3, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda8;->f$3:Landroid/widget/Spinner;

    invoke-static {v0, v1, v2, v3, p1}, Le/e/a/AccountLists;->lambda$2(Landroid/app/Activity;Ljava/util/ArrayList;Landroid/widget/ArrayAdapter;Landroid/widget/Spinner;Landroid/view/View;)V

    return-void
.end method
