.class public final synthetic Ll/ub60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/dc60;

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;


# direct methods
.method public synthetic constructor <init>(Ll/dc60;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ub60;->a:Ll/dc60;

    iput-object p2, p0, Ll/ub60;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ub60;->a:Ll/dc60;

    iget-object p0, p0, Ll/ub60;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    invoke-static {v0, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->q(Ll/dc60;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
