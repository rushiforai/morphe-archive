.class public Ll/wgx$n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wgx;->E(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/wgx;


# direct methods
.method public constructor <init>(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/wgx$n;->b:Ll/wgx;

    .line 2
    .line 3
    iput-object p2, p0, Ll/wgx$n;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(IILandroid/content/Intent;)Z
    .locals 3

    .line 1
    const/16 v0, 0x70

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p1, v0, :cond_1

    .line 5
    .line 6
    const/16 p1, 0x64

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    if-ne p2, p1, :cond_0

    .line 10
    .line 11
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const-string p1, "input"

    .line 18
    .line 19
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object p2, p0, Ll/wgx$n;->a:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    iget-object p3, p0, Ll/wgx$n;->b:Ll/wgx;

    .line 26
    .line 27
    invoke-static {p3}, Ll/wgx;->e(Ll/wgx;)Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-static {p2, p3, p1, v0, v2}, Ll/d810;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLjava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/wgx$n;->b:Ll/wgx;

    .line 36
    .line 37
    invoke-static {p1, v1}, Ll/wgx;->o(Ll/wgx;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/wgx$n;->b:Ll/wgx;

    .line 41
    .line 42
    iget-object p0, p0, Ll/wgx$n;->a:Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    invoke-virtual {p1, p0, v0}, Ll/wgx;->a(Lcom/p1/mobile/android/app/Act;Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object p1, p0, Ll/wgx$n;->b:Ll/wgx;

    .line 49
    .line 50
    invoke-static {p1, v1}, Ll/wgx;->o(Ll/wgx;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/wgx$n;->b:Ll/wgx;

    .line 54
    .line 55
    iget-object p0, p0, Ll/wgx$n;->a:Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    invoke-static {p1, p0}, Ll/wgx;->t(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    return v0

    .line 61
    :cond_1
    return v1
.end method
