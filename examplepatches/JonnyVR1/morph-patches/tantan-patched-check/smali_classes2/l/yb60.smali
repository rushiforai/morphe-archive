.class public final synthetic Ll/yb60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yb60;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    iput-boolean p2, p0, Ll/yb60;->b:Z

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yb60;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    iget-boolean p0, p0, Ll/yb60;->b:Z

    invoke-static {v0, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->a(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
