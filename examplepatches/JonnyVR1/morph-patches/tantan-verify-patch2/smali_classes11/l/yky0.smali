.class public final Ll/yky0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zhs0;


# instance fields
.field public final synthetic a:Ll/bis0;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/internal/util/b;Ll/bis0;Landroid/content/Context;Landroid/net/Uri;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/yky0;->a:Ll/bis0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/yky0;->b:Landroid/content/Context;

    .line 4
    .line 5
    iput-object p4, p0, Ll/yky0;->c:Landroid/net/Uri;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final zza()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yky0;->a:Ll/bis0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/bis0;->a()Ll/yzb;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/vzb$a;

    .line 8
    .line 9
    invoke-direct {v1, v0}, Ll/vzb$a;-><init>(Ll/yzb;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1}, Ll/vzb$a;->a()Ll/vzb;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, v0, Ll/vzb;->a:Landroid/content/Intent;

    .line 17
    .line 18
    iget-object v2, p0, Ll/yky0;->b:Landroid/content/Context;

    .line 19
    .line 20
    invoke-static {v2}, Ll/lqx0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/yky0;->b:Landroid/content/Context;

    .line 28
    .line 29
    iget-object v2, p0, Ll/yky0;->c:Landroid/net/Uri;

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Ll/vzb;->a(Landroid/content/Context;Landroid/net/Uri;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/yky0;->b:Landroid/content/Context;

    .line 35
    .line 36
    iget-object p0, p0, Ll/yky0;->a:Ll/bis0;

    .line 37
    .line 38
    check-cast v0, Landroid/app/Activity;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/bis0;->f(Landroid/app/Activity;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
