.class public final synthetic Ll/iv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeFooterFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeFooterFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iv3;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeFooterFragment;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iv3;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeFooterFragment;

    invoke-static {p0, p1, p2}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeFooterFragment;->D4(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeFooterFragment;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
