.class public final synthetic Le/e/a/CreatorPage$$ExternalSyntheticLambda15;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/NetworkTask;

.field public final synthetic f$1:Landroid/app/Activity;

.field public final synthetic f$2:Landroid/widget/LinearLayout;

.field public final synthetic f$3:Landroid/widget/Button;

.field public final synthetic f$4:Lorg/json/JSONArray;

.field public final synthetic f$5:I


# direct methods
.method public synthetic constructor <init>(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONArray;I)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda15;->f$0:Le/e/a/NetworkTask;

    iput-object p2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda15;->f$1:Landroid/app/Activity;

    iput-object p3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda15;->f$2:Landroid/widget/LinearLayout;

    iput-object p4, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda15;->f$3:Landroid/widget/Button;

    iput-object p5, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda15;->f$4:Lorg/json/JSONArray;

    iput p6, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda15;->f$5:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    .line 0
    iget-object v0, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda15;->f$0:Le/e/a/NetworkTask;

    iget-object v1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda15;->f$1:Landroid/app/Activity;

    iget-object v2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda15;->f$2:Landroid/widget/LinearLayout;

    iget-object v3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda15;->f$3:Landroid/widget/Button;

    iget-object v4, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda15;->f$4:Lorg/json/JSONArray;

    iget v5, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda15;->f$5:I

    invoke-static/range {v0 .. v5}, Le/e/a/CreatorPage;->lambda$24(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONArray;I)V

    return-void
.end method
