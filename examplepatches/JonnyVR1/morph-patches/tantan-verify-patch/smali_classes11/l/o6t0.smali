.class public final synthetic Ll/o6t0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/s70;

.field public final synthetic d:Ll/w8d0;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;Ll/s70;Ll/w8d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/o6t0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/o6t0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/o6t0;->c:Ll/s70;

    .line 9
    .line 10
    iput-object p4, p0, Ll/o6t0;->d:Ll/w8d0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/o6t0;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Ll/o6t0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/o6t0;->c:Ll/s70;

    .line 6
    .line 7
    iget-object p0, p0, Ll/o6t0;->d:Ll/w8d0;

    .line 8
    .line 9
    :try_start_0
    new-instance v3, Ll/u7t0;

    .line 10
    .line 11
    invoke-direct {v3, v0, v1}, Ll/u7t0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2}, Ll/s70;->a()Ll/xxu0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v3, v1, p0}, Ll/u7t0;->e(Ll/xxu0;Ll/w8d0;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    move-exception p0

    .line 23
    invoke-static {v0}, Ll/w2t0;->c(Landroid/content/Context;)Ll/y2t0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "RewardedAd.load"

    .line 28
    .line 29
    invoke-interface {v0, p0, v1}, Ll/y2t0;->b(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
