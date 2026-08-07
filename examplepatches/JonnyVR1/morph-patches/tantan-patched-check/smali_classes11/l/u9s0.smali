.class public final synthetic Ll/u9s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/s70;

.field public final synthetic d:I

.field public final synthetic e:Ll/bx0$a;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;Ll/s70;ILl/bx0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/u9s0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/u9s0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/u9s0;->c:Ll/s70;

    .line 9
    .line 10
    iput p4, p0, Ll/u9s0;->d:I

    .line 11
    .line 12
    iput-object p5, p0, Ll/u9s0;->e:Ll/bx0$a;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v1, p0, Ll/u9s0;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget v4, p0, Ll/u9s0;->d:I

    .line 4
    .line 5
    iget-object v2, p0, Ll/u9s0;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, p0, Ll/u9s0;->c:Ll/s70;

    .line 8
    .line 9
    iget-object v5, p0, Ll/u9s0;->e:Ll/bx0$a;

    .line 10
    .line 11
    move-object p0, v0

    .line 12
    :try_start_0
    new-instance v0, Ll/bbs0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/s70;->a()Ll/xxu0;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-direct/range {v0 .. v5}, Ll/bbs0;-><init>(Landroid/content/Context;Ljava/lang/String;Ll/xxu0;ILl/bx0$a;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ll/bbs0;->a()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception v0

    .line 26
    move-object p0, v0

    .line 27
    invoke-static {v1}, Ll/w2t0;->c(Landroid/content/Context;)Ll/y2t0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "AppOpenAd.load"

    .line 32
    .line 33
    invoke-interface {v0, p0, v1}, Ll/y2t0;->b(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
