.class Le/e/a/Review181$4;
.super Ljava/lang/Object;
.source "Review181.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/Review181;->bindLike(Landroid/widget/FrameLayout;Lorg/json/JSONObject;Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field shown:Ljava/lang/Boolean;

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$bridge:Landroid/widget/Button;

.field private final synthetic val$data:Landroid/os/Bundle;

.field private final synthetic val$icon:Landroid/widget/ImageButton;


# direct methods
.method constructor <init>(Landroid/os/Bundle;Landroid/widget/ImageButton;Landroid/app/Activity;Landroid/widget/Button;)V
    .registers 5

    .line 122
    iput-object p1, p0, Le/e/a/Review181$4;->val$data:Landroid/os/Bundle;

    iput-object p2, p0, Le/e/a/Review181$4;->val$icon:Landroid/widget/ImageButton;

    iput-object p3, p0, Le/e/a/Review181$4;->val$a:Landroid/app/Activity;

    iput-object p4, p0, Le/e/a/Review181$4;->val$bridge:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .registers 6

    .line 122
    iget-object v0, p0, Le/e/a/Review181$4;->val$data:Landroid/os/Bundle;

    const-string v1, "nicoid_liked"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iget-object v1, p0, Le/e/a/Review181$4;->shown:Ljava/lang/Boolean;

    if-eqz v1, :cond_14

    iget-object v1, p0, Le/e/a/Review181$4;->shown:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v1, v0, :cond_4e

    :cond_14
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Le/e/a/Review181$4;->shown:Ljava/lang/Boolean;

    iget-object v1, p0, Le/e/a/Review181$4;->val$icon:Landroid/widget/ImageButton;

    new-instance v2, Le/e/a/Review181$Heart;

    if-eqz v0, :cond_27

    iget-object v3, p0, Le/e/a/Review181$4;->val$a:Landroid/app/Activity;

    invoke-static {v3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v3

    goto :goto_28

    :cond_27
    const/4 v3, -0x1

    :goto_28
    invoke-direct {v2, v3, v0}, Le/e/a/Review181$Heart;-><init>(IZ)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Le/e/a/Review181$4;->val$icon:Landroid/widget/ImageButton;

    iget-object v2, p0, Le/e/a/Review181$4;->val$a:Landroid/app/Activity;

    if-eqz v0, :cond_37

    const-string v3, "\u3044\u3044\u306d\u6e08\u307f"

    goto :goto_39

    :cond_37
    const-string v3, "\u3044\u3044\u306d"

    :goto_39
    if-eqz v0, :cond_3e

    const-string v4, "Liked"

    goto :goto_40

    :cond_3e
    const-string v4, "Like"

    :goto_40
    if-eqz v0, :cond_45

    const-string v0, "\u5df2\u559c\u6b61"

    goto :goto_47

    :cond_45
    const-string v0, "\u559c\u6b61"

    :goto_47
    invoke-static {v2, v3, v4, v0}, Le/e/a/Review181;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_4e
    iget-object v0, p0, Le/e/a/Review181$4;->val$icon:Landroid/widget/ImageButton;

    iget-object v1, p0, Le/e/a/Review181$4;->val$bridge:Landroid/widget/Button;

    invoke-virtual {v1}, Landroid/widget/Button;->isEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    const/4 v0, 0x1

    return v0
.end method
