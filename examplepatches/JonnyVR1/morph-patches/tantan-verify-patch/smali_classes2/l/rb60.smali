.class public final synthetic Ll/rb60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;

.field public final synthetic c:Ll/dc60;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Ll/dc60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rb60;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    iput-object p2, p0, Ll/rb60;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;

    iput-object p3, p0, Ll/rb60;->c:Ll/dc60;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rb60;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    iget-object v1, p0, Ll/rb60;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;

    iget-object p0, p0, Ll/rb60;->c:Ll/dc60;

    invoke-static {v0, v1, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->i(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Ll/dc60;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
