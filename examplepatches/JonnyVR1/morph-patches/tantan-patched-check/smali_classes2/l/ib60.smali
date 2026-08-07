.class public final synthetic Ll/ib60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ib60;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    iput-object p2, p0, Ll/ib60;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ib60;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    iget-object p0, p0, Ll/ib60;->b:Landroid/view/View;

    invoke-static {v0, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->a(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Landroid/view/View;)V

    return-void
.end method
