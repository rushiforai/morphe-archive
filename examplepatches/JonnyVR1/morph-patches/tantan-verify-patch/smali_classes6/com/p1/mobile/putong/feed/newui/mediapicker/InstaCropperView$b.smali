.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$b;
.super Ll/rsw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->U()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic g:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;Landroid/content/Context;Landroid/net/Uri;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3, p4, p5}, Ll/rsw;-><init>(Landroid/content/Context;Landroid/net/Uri;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->j(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/rsw;->c()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->l(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/rsw;->b()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->k(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;I)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->u(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->x:Ll/x20;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->x:Ll/x20;

    .line 42
    .line 43
    invoke-interface {p1}, Ll/x20;->call()V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->x:Ll/x20;

    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$b;->f(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
