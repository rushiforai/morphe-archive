.class public final synthetic Ll/nv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/customviews/CloseImageView;

.field public final synthetic b:Landroid/widget/RelativeLayout;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/customviews/CloseImageView;Landroid/widget/RelativeLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nv3;->a:Lcom/clevertap/android/sdk/customviews/CloseImageView;

    iput-object p2, p0, Ll/nv3;->b:Landroid/widget/RelativeLayout;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nv3;->a:Lcom/clevertap/android/sdk/customviews/CloseImageView;

    iget-object p0, p0, Ll/nv3;->b:Landroid/widget/RelativeLayout;

    invoke-static {v0, p0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;->b(Lcom/clevertap/android/sdk/customviews/CloseImageView;Landroid/widget/RelativeLayout;)V

    return-void
.end method
