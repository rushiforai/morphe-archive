.class public final synthetic Ll/zb60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;


# direct methods
.method public synthetic constructor <init>(ZLcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/zb60;->a:Z

    iput-object p2, p0, Ll/zb60;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/zb60;->a:Z

    iget-object p0, p0, Ll/zb60;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    invoke-static {v0, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->e(ZLcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)V

    return-void
.end method
