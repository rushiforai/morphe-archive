.class public final synthetic Ll/tv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHeaderFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHeaderFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tv3;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHeaderFragment;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tv3;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHeaderFragment;

    invoke-static {p0, p1, p2}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHeaderFragment;->C4(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHeaderFragment;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
