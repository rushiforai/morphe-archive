.class public final synthetic Ll/mb60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    invoke-static {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->m(Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
