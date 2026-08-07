.class Ll/ajw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ajw;-><init>(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ajw;


# direct methods
.method public constructor <init>(Ll/ajw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ajw$a;->a:Ll/ajw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ajw$a;->a:Ll/ajw;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ajw;->a(Ll/ajw;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/ajw$a;->a:Ll/ajw;

    .line 10
    .line 11
    invoke-static {v0}, Ll/ajw;->b(Ll/ajw;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/ajw$a;->a:Ll/ajw;

    .line 18
    .line 19
    invoke-static {v0}, Ll/ajw;->a(Ll/ajw;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-static {v0, v1}, Ll/ajw;->d(Ll/ajw;I)I

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/ajw$a;->a:Ll/ajw;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-static {v0, v1}, Ll/ajw;->c(Ll/ajw;Z)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v0, p0, Ll/ajw$a;->a:Ll/ajw;

    .line 37
    .line 38
    invoke-static {v0}, Ll/ajw;->e(Ll/ajw;)Ll/ajw$b;

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/ajw$a;->a:Ll/ajw;

    .line 42
    .line 43
    invoke-static {p0}, Ll/ajw;->f(Ll/ajw;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method
