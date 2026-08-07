.class public final synthetic Ll/cv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/svm;

    check-cast p2, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-static {p1, p2}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppHtmlInterstitialFragment;->O4(Ll/svm;Landroid/view/ViewGroup$MarginLayoutParams;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
