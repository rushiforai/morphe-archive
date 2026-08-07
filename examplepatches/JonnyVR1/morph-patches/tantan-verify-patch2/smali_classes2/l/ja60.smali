.class public final synthetic Ll/ja60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ja60;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    iput-object p2, p0, Ll/ja60;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ja60;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    iget-object p0, p0, Ll/ja60;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;

    invoke-static {v0, p0, p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->b(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Landroid/view/View;)V

    return-void
.end method
