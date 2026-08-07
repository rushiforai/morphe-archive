.class final Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$1$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->v(Ljava/lang/String;Z)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "",
        "loadEvent",
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $business:Ljava/lang/String;

.field final synthetic $failureAsError:Z

.field final synthetic $module:Ljava/lang/String;

.field final synthetic $subscriber:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-",
            "Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZLl/gcg0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ll/gcg0<",
            "-",
            "Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$1$1;->$business:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$1$1;->$module:Ljava/lang/String;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$1$1;->$failureAsError:Z

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$1$1;->$subscriber:Ll/gcg0;

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 67
    check-cast p1, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    invoke-virtual {p0, p1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$1$1;->invoke(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V
    .locals 2
    .param p1    # Lcom/tantanapp/sharedlibrary/loader/LoadEvent;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "business="

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$1$1;->$business:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", module="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$1$1;->$module:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ": "

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-boolean v0, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$1$1;->$failureAsError:Z

    .line 42
    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->d()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$1$1;->$subscriber:Ll/gcg0;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->e()Ljava/lang/Throwable;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$1$1;->$subscriber:Ll/gcg0;

    .line 62
    .line 63
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
