.class public final Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment;->u4(Landroid/widget/RelativeLayout;Lcom/clevertap/android/sdk/customviews/CloseImageView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "com/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment$a",
        "Ljava/lang/Runnable;",
        "",
        "run",
        "()V",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic a:Lcom/clevertap/android/sdk/customviews/CloseImageView;

.field final synthetic b:Landroid/widget/RelativeLayout;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/customviews/CloseImageView;Landroid/widget/RelativeLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment$a;->a:Lcom/clevertap/android/sdk/customviews/CloseImageView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment$a;->b:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment$a;->a:Lcom/clevertap/android/sdk/customviews/CloseImageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    div-int/lit8 v0, v0, 0x2

    .line 8
    .line 9
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment$a;->a:Lcom/clevertap/android/sdk/customviews/CloseImageView;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment$a;->b:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    sub-int/2addr v2, v0

    .line 18
    int-to-float v2, v2

    .line 19
    invoke-virtual {v1, v2}, Landroid/view/View;->setX(F)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment$a;->a:Lcom/clevertap/android/sdk/customviews/CloseImageView;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment$a;->b:Landroid/widget/RelativeLayout;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    sub-int/2addr p0, v0

    .line 31
    int-to-float p0, p0

    .line 32
    invoke-virtual {v1, p0}, Landroid/view/View;->setY(F)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
