.class public final synthetic Le/e/a/ListActions$Hold$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/ListActions$Hold;

.field public final synthetic f$1:Landroid/view/View;

.field public final synthetic f$2:Landroid/widget/AdapterView;


# direct methods
.method public synthetic constructor <init>(Le/e/a/ListActions$Hold;Landroid/view/View;Landroid/widget/AdapterView;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ListActions$Hold$$ExternalSyntheticLambda1;->f$0:Le/e/a/ListActions$Hold;

    iput-object p2, p0, Le/e/a/ListActions$Hold$$ExternalSyntheticLambda1;->f$1:Landroid/view/View;

    iput-object p3, p0, Le/e/a/ListActions$Hold$$ExternalSyntheticLambda1;->f$2:Landroid/widget/AdapterView;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/ListActions$Hold$$ExternalSyntheticLambda1;->f$0:Le/e/a/ListActions$Hold;

    iget-object v1, p0, Le/e/a/ListActions$Hold$$ExternalSyntheticLambda1;->f$1:Landroid/view/View;

    iget-object v2, p0, Le/e/a/ListActions$Hold$$ExternalSyntheticLambda1;->f$2:Landroid/widget/AdapterView;

    invoke-virtual {v0, v1, v2}, Le/e/a/ListActions$Hold;->lambda$1$e-e-a-ListActions$Hold(Landroid/view/View;Landroid/widget/AdapterView;)V

    return-void
.end method
