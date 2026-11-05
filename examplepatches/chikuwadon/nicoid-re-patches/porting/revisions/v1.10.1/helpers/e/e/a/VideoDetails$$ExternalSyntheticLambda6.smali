.class public final synthetic Le/e/a/VideoDetails$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Ljava/lang/reflect/Method;

.field public final synthetic f$1:Le/e/a/VideoDetails$LikeIcon;

.field public final synthetic f$2:Landroid/os/Bundle;

.field public final synthetic f$3:Landroid/widget/LinearLayout;

.field public final synthetic f$4:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/reflect/Method;Le/e/a/VideoDetails$LikeIcon;Landroid/os/Bundle;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$0:Ljava/lang/reflect/Method;

    iput-object p2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$1:Le/e/a/VideoDetails$LikeIcon;

    iput-object p3, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$2:Landroid/os/Bundle;

    iput-object p4, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$3:Landroid/widget/LinearLayout;

    iput-object p5, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$4:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$0:Ljava/lang/reflect/Method;

    iget-object v1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$1:Le/e/a/VideoDetails$LikeIcon;

    iget-object v2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$2:Landroid/os/Bundle;

    iget-object v3, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$3:Landroid/widget/LinearLayout;

    iget-object v4, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;->f$4:Lorg/json/JSONObject;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Le/e/a/VideoDetails;->lambda$10(Ljava/lang/reflect/Method;Le/e/a/VideoDetails$LikeIcon;Landroid/os/Bundle;Landroid/widget/LinearLayout;Lorg/json/JSONObject;Landroid/view/View;)V

    return-void
.end method
