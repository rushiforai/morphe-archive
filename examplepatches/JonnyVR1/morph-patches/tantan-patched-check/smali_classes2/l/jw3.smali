.class public final synthetic Ll/jw3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/clevertap/android/sdk/CleverTapAPI;


# direct methods
.method public synthetic constructor <init>(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;ZLcom/clevertap/android/sdk/CleverTapAPI;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jw3;->a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    iput-boolean p2, p0, Ll/jw3;->b:Z

    iput-object p3, p0, Ll/jw3;->c:Lcom/clevertap/android/sdk/CleverTapAPI;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jw3;->a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    iget-boolean v1, p0, Ll/jw3;->b:Z

    iget-object p0, p0, Ll/jw3;->c:Lcom/clevertap/android/sdk/CleverTapAPI;

    invoke-static {v0, v1, p0}, Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;->X3(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;ZLcom/clevertap/android/sdk/CleverTapAPI;)V

    return-void
.end method
