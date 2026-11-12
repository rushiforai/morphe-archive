.class public final Land;
.super Lk73;
.source "SourceFile"


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:Llmd;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lvnd;Ljava/lang/String;Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;)V
    .registers 5

    invoke-direct {p0, p1, p2, p4}, Lk73;-><init>(Ljava/lang/String;Lvnd;Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;)V

    new-instance p1, Llmd;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Llmd;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Land;->h:Llmd;

    iput-object p3, p0, Land;->g:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final q(Landroidx/fragment/app/w;)Landroidx/fragment/app/i;
    .registers 7

    const-string v0, "androidx.mediarouter:MediaRouteControllerDialogFragment"

    invoke-virtual {p1, v0}, Landroidx/fragment/app/w;->F(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_a

    const/4 p0, 0x0

    return-object p0

    :cond_a
    new-instance v1, Lzmd;

    iget-object v2, p0, Land;->h:Llmd;

    invoke-direct {v1, p0, v2}, Lzmd;-><init>(Land;Llmd;)V

    iget-object v3, p0, Lk73;->d:Ljava/lang/Object;

    check-cast v3, Ldod;

    iget-object p0, p0, Lk73;->c:Ljava/lang/Object;

    check-cast p0, Lvnd;

    const/4 v4, 0x0

    invoke-virtual {v3, p0, v2, v4}, Ldod;->a(Lvnd;Lwnd;I)V

    invoke-virtual {v1, p1, v0}, Landroidx/fragment/app/i;->show(Landroidx/fragment/app/w;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroidx/fragment/app/w;->D()V

    return-object v1
.end method
