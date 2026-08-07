.class public final synthetic Ll/iw3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/uhi;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

.field public final synthetic b:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

.field public final synthetic c:Lcom/clevertap/android/sdk/CleverTapAPI;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;Lcom/clevertap/android/sdk/CleverTapAPI;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iw3;->a:Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    iput-object p2, p0, Ll/iw3;->b:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    iput-object p3, p0, Ll/iw3;->c:Lcom/clevertap/android/sdk/CleverTapAPI;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iw3;->a:Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    iget-object v1, p0, Ll/iw3;->b:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    iget-object p0, p0, Ll/iw3;->c:Lcom/clevertap/android/sdk/CleverTapAPI;

    invoke-static {v0, v1, p0, p1}, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;->W3(Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;Lcom/clevertap/android/sdk/CleverTapAPI;Z)V

    return-void
.end method
