.class public Ll/nm80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hqq;


# instance fields
.field public final a:Ll/o3a;

.field public final b:Landroid/app/Activity;

.field public final c:Lcom/p1/mobile/putong/app/web/WebViewX;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/p1/mobile/putong/app/web/WebViewX;)V
    .locals 1
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/app/web/WebViewX;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/o3a;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/o3a;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/nm80;->a:Ll/o3a;

    .line 10
    .line 11
    iput-object p1, p0, Ll/nm80;->b:Landroid/app/Activity;

    .line 12
    .line 13
    iput-object p2, p0, Ll/nm80;->c:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/nm80;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/nm80;->a:Ll/o3a;

    .line 9
    .line 10
    iget-object p0, p0, Ll/nm80;->c:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 11
    .line 12
    invoke-virtual {v0, p0, p1}, Ll/o3a;->c(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public varargs b(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/nm80;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/nm80;->a:Ll/o3a;

    .line 9
    .line 10
    iget-object p0, p0, Ll/nm80;->c:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 11
    .line 12
    invoke-virtual {v0, p0, p1, p2}, Ll/o3a;->e(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;[Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nm80;->b:Landroid/app/Activity;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
