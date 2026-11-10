.class public final Landroidx/fragment/app/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/H;
.implements Landroidx/lifecycle/q;
.implements LL/g;


# instance fields
.field public final a:Le/i;

.field public final b:Landroid/os/Handler;

.field public final c:Landroidx/fragment/app/p;

.field public final synthetic d:Le/i;


# direct methods
.method public constructor <init>(Le/i;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/fragment/app/f;->d:Le/i;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Landroidx/fragment/app/p;

    invoke-direct {v1}, Landroidx/fragment/app/p;-><init>()V

    iput-object v1, p0, Landroidx/fragment/app/f;->c:Landroidx/fragment/app/p;

    iput-object p1, p0, Landroidx/fragment/app/f;->a:Le/i;

    iput-object v0, p0, Landroidx/fragment/app/f;->b:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public final a()LL/e;
    .locals 1

    iget-object v0, p0, Landroidx/fragment/app/f;->d:Le/i;

    iget-object v0, v0, Landroidx/activity/l;->e:LL/f;

    iget-object v0, v0, LL/f;->c:Ljava/lang/Object;

    check-cast v0, LL/e;

    return-object v0
.end method

.method public final b()Landroidx/lifecycle/G;
    .locals 1

    iget-object v0, p0, Landroidx/fragment/app/f;->d:Le/i;

    invoke-virtual {v0}, Landroidx/activity/l;->b()Landroidx/lifecycle/G;

    move-result-object v0

    return-object v0
.end method

.method public final c()Landroidx/lifecycle/s;
    .locals 1

    iget-object v0, p0, Landroidx/fragment/app/f;->d:Le/i;

    iget-object v0, v0, Le/i;->s:Landroidx/lifecycle/s;

    return-object v0
.end method
