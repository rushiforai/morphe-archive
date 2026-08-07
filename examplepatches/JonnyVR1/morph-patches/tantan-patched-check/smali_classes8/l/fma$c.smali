.class public Ll/fma$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$m;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fma;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/widget/ImageView;

.field public final synthetic b:Ll/fma;


# direct methods
.method public constructor <init>(Ll/fma;Landroid/widget/ImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/fma$c;->b:Ll/fma;

    .line 2
    .line 3
    iput-object p2, p0, Ll/fma$c;->a:Landroid/widget/ImageView;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Ll/fma$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fma$c;->d(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Z
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    iput v1, v0, Landroid/os/Message;->what:I

    .line 7
    .line 8
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 9
    .line 10
    iget-object p1, p0, Ll/fma$c;->b:Ll/fma;

    .line 11
    .line 12
    iget-object p1, p1, Ll/fma;->k:Landroid/os/Handler;

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/fma$c;->b:Ll/fma;

    .line 18
    .line 19
    iget-object p0, p0, Ll/fma;->k:Landroid/os/Handler;

    .line 20
    .line 21
    const-wide/16 v2, 0x1f4

    .line 22
    .line 23
    invoke-virtual {p0, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 24
    .line 25
    .line 26
    return v1
.end method

.method public b(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fma$c;->b:Ll/fma;

    .line 2
    .line 3
    iget-object v0, v0, Ll/fma;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/fma$c;->b:Ll/fma;

    .line 9
    .line 10
    iget-object v0, v0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/fma$c;->b:Ll/fma;

    .line 16
    .line 17
    iget-object v0, v0, Ll/fma;->h:Ll/bma;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ll/bma;->G0(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/fma$c;->a:Landroid/widget/ImageView;

    .line 23
    .line 24
    new-instance v0, Ll/gma;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/gma;-><init>(Ll/fma$c;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public final synthetic d(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/fma$c;->b:Ll/fma;

    .line 2
    .line 3
    iget-object p1, p1, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/fma$c;->b:Ll/fma;

    .line 9
    .line 10
    iget-object p1, p1, Ll/fma;->d:Landroidx/appcompat/widget/SearchView;

    .line 11
    .line 12
    const-string v0, ""

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p1, v0, v1}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/fma$c;->b:Ll/fma;

    .line 19
    .line 20
    iget-object p1, p1, Ll/fma;->j:Ll/fma$d;

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Ll/fma$d;->U(Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/fma$c;->b:Ll/fma;

    .line 26
    .line 27
    iget-object p1, p1, Ll/fma;->h:Ll/bma;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/bma;->r0()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iget-object p0, p0, Ll/fma$c;->b:Ll/fma;

    .line 38
    .line 39
    if-nez p1, :cond_0

    .line 40
    .line 41
    iget-object p1, p0, Ll/fma;->j:Ll/fma$d;

    .line 42
    .line 43
    iget-object p0, p0, Ll/fma;->h:Ll/bma;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/bma;->r0()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Ll/fma$d;->T(Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    iget-object p0, p0, Ll/fma;->h:Ll/bma;

    .line 54
    .line 55
    invoke-virtual {p0, v1}, Ll/bma;->F0(Z)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
