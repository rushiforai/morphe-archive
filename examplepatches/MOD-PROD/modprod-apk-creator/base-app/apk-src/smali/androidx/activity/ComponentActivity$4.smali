.class Landroidx/activity/ComponentActivity$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/o;


# instance fields
.field public final synthetic a:Le/i;


# direct methods
.method public constructor <init>(Le/i;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/activity/ComponentActivity$4;->a:Le/i;

    return-void
.end method


# virtual methods
.method public final b(Landroidx/lifecycle/q;Landroidx/lifecycle/k;)V
    .locals 0

    iget-object p1, p0, Landroidx/activity/ComponentActivity$4;->a:Le/i;

    iget-object p2, p1, Landroidx/activity/l;->f:Landroidx/lifecycle/G;

    if-nez p2, :cond_1

    invoke-virtual {p1}, Landroid/app/Activity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/activity/j;

    if-eqz p2, :cond_0

    iget-object p2, p2, Landroidx/activity/j;->a:Landroidx/lifecycle/G;

    iput-object p2, p1, Landroidx/activity/l;->f:Landroidx/lifecycle/G;

    :cond_0
    iget-object p2, p1, Landroidx/activity/l;->f:Landroidx/lifecycle/G;

    if-nez p2, :cond_1

    new-instance p2, Landroidx/lifecycle/G;

    invoke-direct {p2}, Landroidx/lifecycle/G;-><init>()V

    iput-object p2, p1, Landroidx/activity/l;->f:Landroidx/lifecycle/G;

    :cond_1
    iget-object p1, p1, Landroidx/activity/l;->d:Landroidx/lifecycle/s;

    invoke-virtual {p1, p0}, Landroidx/lifecycle/s;->f(Landroidx/lifecycle/p;)V

    return-void
.end method
