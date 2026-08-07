.class public final synthetic Ll/wb60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wb60;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    iput-object p2, p0, Ll/wb60;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wb60;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    iget-object p0, p0, Ll/wb60;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {v0, p0, p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->b(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
