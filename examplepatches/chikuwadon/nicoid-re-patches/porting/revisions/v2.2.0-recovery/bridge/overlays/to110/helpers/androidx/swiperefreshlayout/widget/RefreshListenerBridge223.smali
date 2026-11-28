.class public final Landroidx/swiperefreshlayout/widget/RefreshListenerBridge223;
.super Ljava/lang/Object;

# interfaces
.implements Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$h;


# instance fields
.field private final listener:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;


# direct methods
.method public constructor <init>(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/swiperefreshlayout/widget/RefreshListenerBridge223;->listener:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/RefreshListenerBridge223;->listener:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;

    invoke-interface {v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;->onRefresh()V

    return-void
.end method
