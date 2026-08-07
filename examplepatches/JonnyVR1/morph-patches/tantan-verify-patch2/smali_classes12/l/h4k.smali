.class public final Ll/h4k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g4k;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/h4k$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u0000 \u00142\u00020\u0001:\u0001\u0007B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0017\u0010\t\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\t\u0010\u0008J)\u0010\u000f\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\n2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0017\u0010\u0012\u001a\u00020\u00062\u0006\u0010\u0011\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u0015"
    }
    d2 = {
        "Ll/h4k;",
        "Ll/g4k;",
        "<init>",
        "()V",
        "Ll/g4k$a;",
        "subscriber",
        "",
        "a",
        "(Ll/g4k$a;)V",
        "b",
        "",
        "eventName",
        "dsts",
        "Lorg/json/JSONObject;",
        "msg",
        "c",
        "(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V",
        "event",
        "d",
        "(Ljava/lang/String;)V",
        "Companion",
        "MKBusiness_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Ll/h4k$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/h4k$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/h4k$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/h4k;->Companion:Ll/h4k$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/g4k$a;)V
    .locals 2
    .param p1    # Ll/g4k$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;->b()Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance v0, Ll/hcg0;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ll/hcg0;-><init>(Ll/g4k$a;)V

    .line 11
    .line 12
    .line 13
    const-string v1, "mk"

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;->d(Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$a;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v0, "register---"

    .line 21
    .line 22
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "GlobalEventAdapterImp"

    .line 33
    .line 34
    invoke-static {p1, p0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public b(Ll/g4k$a;)V
    .locals 2
    .param p1    # Ll/g4k$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;->b()Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance v0, Ll/hcg0;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ll/hcg0;-><init>(Ll/g4k$a;)V

    .line 11
    .line 12
    .line 13
    const-string v1, "mk"

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;->f(Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$a;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v0, "unregister---"

    .line 21
    .line 22
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "GlobalEventAdapterImp"

    .line 33
    .line 34
    invoke-static {p1, p0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public c(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lorg/json/JSONObject;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    new-instance p0, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v0, "mk"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;->k(Ljava/lang/String;)Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "|"

    .line 19
    .line 20
    filled-new-array {v0}, [Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const/4 v5, 0x6

    .line 25
    const/4 v6, 0x0

    .line 26
    const/4 v3, 0x0

    .line 27
    const/4 v4, 0x0

    .line 28
    move-object v1, p2

    .line 29
    invoke-static/range {v1 .. v6}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[Ljava/lang/String;ZIILjava/lang/Object;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p0, p2}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;->c(Ljava/util/List;)Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    if-eqz p3, :cond_0

    .line 38
    .line 39
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p0, p2}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;->i(Ljava/lang/String;)Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;

    .line 44
    .line 45
    .line 46
    :cond_0
    invoke-static {}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;->b()Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p2, p0}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;->e(Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;)V

    .line 51
    .line 52
    .line 53
    new-instance p0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string p2, "sendEvent---"

    .line 56
    .line 57
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p1, "---"

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string p1, "GlobalEventAdapterImp"

    .line 82
    .line 83
    invoke-static {p1, p0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;->b()Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance v0, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;->e(Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v0, "sendEvent---"

    .line 19
    .line 20
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "GlobalEventAdapterImp"

    .line 31
    .line 32
    invoke-static {p1, p0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
