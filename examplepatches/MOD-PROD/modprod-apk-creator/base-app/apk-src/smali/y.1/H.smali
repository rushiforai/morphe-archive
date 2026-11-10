.class public final Ly/H;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/OnReceiveContentListener;


# instance fields
.field public final a:Ly/q;


# direct methods
.method public constructor <init>(Ly/q;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly/H;->a:Ly/q;

    return-void
.end method


# virtual methods
.method public final onReceiveContent(Landroid/view/View;Landroid/view/ContentInfo;)Landroid/view/ContentInfo;
    .locals 2

    new-instance v0, Ly/g;

    new-instance v1, LC/j;

    invoke-direct {v1, p2}, LC/j;-><init>(Landroid/view/ContentInfo;)V

    invoke-direct {v0, v1}, Ly/g;-><init>(Ly/f;)V

    iget-object v1, p0, Ly/H;->a:Ly/q;

    check-cast v1, LD/u;

    invoke-virtual {v1, p1, v0}, LD/u;->a(Landroid/view/View;Ly/g;)Ly/g;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    if-ne p1, v0, :cond_1

    return-object p2

    :cond_1
    iget-object p1, p1, Ly/g;->a:Ly/f;

    invoke-interface {p1}, Ly/f;->s()Landroid/view/ContentInfo;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Ly/c;->e(Ljava/lang/Object;)Landroid/view/ContentInfo;

    move-result-object p1

    return-object p1
.end method
