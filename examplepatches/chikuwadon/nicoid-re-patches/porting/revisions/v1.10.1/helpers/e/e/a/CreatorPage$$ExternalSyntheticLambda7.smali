.class public final synthetic Le/e/a/CreatorPage$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/NetworkTask;

.field public final synthetic f$1:Landroid/widget/LinearLayout;

.field public final synthetic f$2:Landroid/app/Activity;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda7;->f$0:Le/e/a/NetworkTask;

    iput-object p2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda7;->f$1:Landroid/widget/LinearLayout;

    iput-object p3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda7;->f$2:Landroid/app/Activity;

    iput-object p4, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda7;->f$3:Ljava/lang/String;

    iput-object p5, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda7;->f$4:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda7;->f$0:Le/e/a/NetworkTask;

    iget-object v1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda7;->f$1:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda7;->f$2:Landroid/app/Activity;

    iget-object v3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda7;->f$3:Ljava/lang/String;

    iget-object v4, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda7;->f$4:Ljava/lang/String;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Le/e/a/CreatorPage;->lambda$21(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
