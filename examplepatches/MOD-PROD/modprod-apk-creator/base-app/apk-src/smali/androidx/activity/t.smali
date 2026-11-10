.class public final Landroidx/activity/t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/activity/c;


# instance fields
.field public final a:Landroidx/fragment/app/k;

.field public final synthetic b:Landroidx/activity/v;


# direct methods
.method public constructor <init>(Landroidx/activity/v;Landroidx/fragment/app/k;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "onBackPressedCallback"

    invoke-static {p2, v0}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Landroidx/activity/t;->b:Landroidx/activity/v;

    iput-object p2, p0, Landroidx/activity/t;->a:Landroidx/fragment/app/k;

    return-void
.end method


# virtual methods
.method public final cancel()V
    .locals 4

    iget-object v0, p0, Landroidx/activity/t;->b:Landroidx/activity/v;

    iget-object v1, v0, Landroidx/activity/v;->b:LV/a;

    iget-object v2, p0, Landroidx/activity/t;->a:Landroidx/fragment/app/k;

    invoke-virtual {v1, v2}, LV/a;->remove(Ljava/lang/Object;)Z

    iget-object v1, v0, Landroidx/activity/v;->c:Landroidx/fragment/app/k;

    invoke-static {v1, v2}, Lb0/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v3, v0, Landroidx/activity/v;->c:Landroidx/fragment/app/k;

    :cond_0
    iget-object v0, v2, Landroidx/fragment/app/k;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, v2, Landroidx/fragment/app/k;->c:Landroidx/activity/u;

    if-eqz v0, :cond_1

    invoke-interface {v0}, La0/a;->a()Ljava/lang/Object;

    :cond_1
    iput-object v3, v2, Landroidx/fragment/app/k;->c:Landroidx/activity/u;

    return-void
.end method
