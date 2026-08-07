.class public final Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kzc0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->j(Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;Ll/dc60;)Ll/i3y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0007*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\'\u0010\u000e\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0017\u0010\u0010\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0017\u0010\u0012\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0011\u00a8\u0006\u0013"
    }
    d2 = {
        "com/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$c",
        "Ll/kzc0;",
        "Ll/fc60;",
        "wrapper",
        "",
        "a",
        "(Ll/fc60;)V",
        "d",
        "()V",
        "",
        "isPlaying",
        "isMuted",
        "",
        "positionMs",
        "e",
        "(ZZJ)V",
        "c",
        "(Z)V",
        "b",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic a:Ll/dc60;

.field final synthetic b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;


# direct methods
.method public constructor <init>(Ll/dc60;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$c;->a:Ll/dc60;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$c;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/fc60;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$c;->a:Ll/dc60;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/dc60;->v(Ll/fc60;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$c;->a:Ll/dc60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dc60;->q(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$c;->a:Ll/dc60;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/dc60;->u(Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$c;->a:Ll/dc60;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->h()Ll/m960;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-interface {v0}, Ll/m960;->g()V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {v0}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->h()Ll/m960;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-interface {v0}, Ll/m960;->b()V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$c;->b:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->getOnPlayStateChanged()Lkotlin/jvm/functions/Function1;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    :cond_2
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$c;->a:Ll/dc60;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/dc60;->v(Ll/fc60;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public e(ZZJ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$c;->a:Ll/dc60;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/dc60;->u(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$c;->a:Ll/dc60;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ll/dc60;->q(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$c;->a:Ll/dc60;

    .line 12
    .line 13
    invoke-virtual {p0, p3, p4}, Ll/dc60;->t(J)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
