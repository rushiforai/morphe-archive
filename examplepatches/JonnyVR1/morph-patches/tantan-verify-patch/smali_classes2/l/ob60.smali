.class public final synthetic Ll/ob60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

.field public final synthetic c:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

.field public final synthetic d:Z

.field public final synthetic e:Ll/dc60;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;ZLl/dc60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ob60;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    iput-object p2, p0, Ll/ob60;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    iput-object p3, p0, Ll/ob60;->c:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    iput-boolean p4, p0, Ll/ob60;->d:Z

    iput-object p5, p0, Ll/ob60;->e:Ll/dc60;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ob60;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;

    iget-object v1, p0, Ll/ob60;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    iget-object v2, p0, Ll/ob60;->c:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    iget-boolean v3, p0, Ll/ob60;->d:Z

    iget-object p0, p0, Ll/ob60;->e:Ll/dc60;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->g(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;ZLl/dc60;)V

    return-void
.end method
