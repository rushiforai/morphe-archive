.class public final Ll12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr12;


# instance fields
.field public final synthetic a:Lpjn;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lp12;

.field public final synthetic d:Lorg/chromium/content_public/browser/WebContents;


# direct methods
.method public constructor <init>(Lpjn;Ljava/lang/String;Lp12;Lorg/chromium/content_public/browser/WebContents;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll12;->a:Lpjn;

    iput-object p2, p0, Ll12;->b:Ljava/lang/String;

    iput-object p3, p0, Ll12;->c:Lp12;

    iput-object p4, p0, Ll12;->d:Lorg/chromium/content_public/browser/WebContents;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 7

    iget-object v0, p0, Ll12;->c:Lp12;

    iget-object v0, v0, Lp12;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Ll12;->d:Lorg/chromium/content_public/browser/WebContents;

    invoke-interface {v1}, Lorg/chromium/content_public/browser/WebContents;->m()Z

    move-result v1

    new-instance v2, Lab;

    const/16 v3, 0xe

    invoke-direct {v2, p0, v3}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-static {}, Lcqp;->i0()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "User-Agent: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    iget-object p0, p0, Ll12;->b:Ljava/lang/String;

    invoke-static {p0, v3, v4}, Lcom/opera/android/browser/SimpleUrlLoader;->a(Ljava/lang/String;Ljava/lang/String;Lyun;)Lcom/opera/android/browser/SimpleUrlLoader;

    move-result-object p0

    new-instance v3, Leb;

    const/4 v4, 0x2

    invoke-direct {v3, v0, v2, v4}, Leb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lwa;

    const/4 v4, 0x4

    invoke-direct {v0, v2, v4}, Lwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1, v3, v0}, Lcom/opera/android/browser/SimpleUrlLoader;->b(ZLorg/chromium/base/Callback;Lorg/chromium/base/Callback;)V

    return-void
.end method

.method public final b()V
    .registers 7

    iget-object v0, p0, Ll12;->c:Lp12;

    iget-object v1, v0, Lp12;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object v2, p0, Ll12;->d:Lorg/chromium/content_public/browser/WebContents;

    invoke-interface {v2}, Lorg/chromium/content_public/browser/WebContents;->m()Z

    move-result v2

    new-instance v3, Lsu;

    const/4 v4, 0x6

    iget-object v5, p0, Ll12;->a:Lpjn;

    invoke-direct {v3, p0, v0, v5, v4}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {}, Lcqp;->i0()Ljava/lang/String;

    move-result-object v0

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "User-Agent: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v4, 0x0

    iget-object p0, p0, Ll12;->b:Ljava/lang/String;

    invoke-static {p0, v0, v4}, Lcom/opera/android/browser/SimpleUrlLoader;->a(Ljava/lang/String;Ljava/lang/String;Lyun;)Lcom/opera/android/browser/SimpleUrlLoader;

    move-result-object p0

    new-instance v0, Leb;

    const/4 v4, 0x2

    invoke-direct {v0, v1, v3, v4}, Leb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lwa;

    const/4 v4, 0x4

    invoke-direct {v1, v3, v4}, Lwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v2, v0, v1}, Lcom/opera/android/browser/SimpleUrlLoader;->b(ZLorg/chromium/base/Callback;Lorg/chromium/base/Callback;)V

    return-void
.end method

.method public final c()V
    .registers 3

    iget-object v0, p0, Ll12;->a:Lpjn;

    iget-object v0, v0, Lpjn;->b:Ljava/lang/Object;

    check-cast v0, Lu02;

    iget-object v0, v0, Lu02;->o:Ljava/lang/Object;

    check-cast v0, Lzz1;

    if-eqz v0, :cond_14

    sget v1, Lzz1;->m:I

    const/4 v1, 0x0

    iget-object p0, p0, Ll12;->b:Ljava/lang/String;

    invoke-virtual {v0, p0, v1}, Lzz1;->d(Ljava/lang/String;Z)V

    :cond_14
    return-void
.end method

.method public final d()V
    .registers 7

    iget-object v0, p0, Ll12;->c:Lp12;

    iget-object v0, v0, Lp12;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Ll12;->d:Lorg/chromium/content_public/browser/WebContents;

    invoke-interface {v1}, Lorg/chromium/content_public/browser/WebContents;->m()Z

    move-result v1

    new-instance v2, Lwx;

    const/16 v3, 0x8

    iget-object v4, p0, Ll12;->a:Lpjn;

    invoke-direct {v2, v4, v0, v3}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {}, Lcqp;->i0()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "User-Agent: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    iget-object p0, p0, Ll12;->b:Ljava/lang/String;

    invoke-static {p0, v3, v4}, Lcom/opera/android/browser/SimpleUrlLoader;->a(Ljava/lang/String;Ljava/lang/String;Lyun;)Lcom/opera/android/browser/SimpleUrlLoader;

    move-result-object p0

    new-instance v3, Leb;

    const/4 v4, 0x2

    invoke-direct {v3, v0, v2, v4}, Leb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lwa;

    const/4 v4, 0x4

    invoke-direct {v0, v2, v4}, Lwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1, v3, v0}, Lcom/opera/android/browser/SimpleUrlLoader;->b(ZLorg/chromium/base/Callback;Lorg/chromium/base/Callback;)V

    return-void
.end method

.method public final e()V
    .registers 7

    iget-object v0, p0, Ll12;->c:Lp12;

    iget-object v0, v0, Lp12;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Ll12;->d:Lorg/chromium/content_public/browser/WebContents;

    invoke-interface {v1}, Lorg/chromium/content_public/browser/WebContents;->m()Z

    move-result v1

    new-instance v2, Lk12;

    const/4 v3, 0x0

    iget-object v4, p0, Ll12;->a:Lpjn;

    invoke-direct {v2, v4, v3}, Lk12;-><init>(Lpjn;B)V

    invoke-static {}, Lcqp;->i0()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "User-Agent: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    iget-object p0, p0, Ll12;->b:Ljava/lang/String;

    invoke-static {p0, v3, v4}, Lcom/opera/android/browser/SimpleUrlLoader;->a(Ljava/lang/String;Ljava/lang/String;Lyun;)Lcom/opera/android/browser/SimpleUrlLoader;

    move-result-object p0

    new-instance v3, Leb;

    const/4 v4, 0x2

    invoke-direct {v3, v0, v2, v4}, Leb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lwa;

    const/4 v4, 0x4

    invoke-direct {v0, v2, v4}, Lwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1, v3, v0}, Lcom/opera/android/browser/SimpleUrlLoader;->b(ZLorg/chromium/base/Callback;Lorg/chromium/base/Callback;)V

    return-void
.end method

.method public final f()V
    .registers 3

    iget-object v0, p0, Ll12;->d:Lorg/chromium/content_public/browser/WebContents;

    const-string v1, ""

    iget-object p0, p0, Ll12;->b:Ljava/lang/String;

    invoke-static {v0, p0, v1}, LJ/N;->M8vd_RmR(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
