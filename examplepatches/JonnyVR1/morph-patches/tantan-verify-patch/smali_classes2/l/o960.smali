.class public final synthetic Ll/o960;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o960;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    iput-object p2, p0, Ll/o960;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o960;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    iget-object p0, p0, Ll/o960;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    invoke-static {v0, p0, p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->b(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Landroid/view/View;)V

    return-void
.end method
