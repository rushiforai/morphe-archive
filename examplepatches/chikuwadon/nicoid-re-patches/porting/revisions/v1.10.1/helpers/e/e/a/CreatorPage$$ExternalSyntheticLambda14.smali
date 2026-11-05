.class public final synthetic Le/e/a/CreatorPage$$ExternalSyntheticLambda14;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/LinearLayout;

.field public final synthetic f$1:Landroid/widget/LinearLayout;

.field public final synthetic f$2:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda14;->f$0:Landroid/widget/LinearLayout;

    iput-object p2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda14;->f$1:Landroid/widget/LinearLayout;

    iput-object p3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda14;->f$2:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda14;->f$0:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda14;->f$1:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda14;->f$2:Lorg/json/JSONObject;

    invoke-static {v0, v1, v2, p1}, Le/e/a/CreatorPage;->lambda$34(Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Lorg/json/JSONObject;Landroid/view/View;)Z

    move-result p1

    return p1
.end method
