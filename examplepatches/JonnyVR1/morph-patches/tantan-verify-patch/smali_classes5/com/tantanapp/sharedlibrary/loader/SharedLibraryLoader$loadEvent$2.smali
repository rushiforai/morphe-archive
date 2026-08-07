.class final Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$2;
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
        "\u0000\u0010\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\u00020\u00012\u000e\u0010\u0002\u001a\n \u0004*\u0004\u0018\u00010\u00030\u0003H\n\u00a2\u0006\u0002\u0008\u0005"
    }
    d2 = {
        "<anonymous>",
        "",
        "it",
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
        "kotlin.jvm.PlatformType",
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

.field final synthetic $module:Ljava/lang/String;

.field final synthetic $state:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;

.field final synthetic this$0:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;


# direct methods
.method public constructor <init>(Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;Ljava/lang/String;Ljava/lang/String;Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;)V
    .locals 0

    iput-object p1, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$2;->this$0:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    iput-object p2, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$2;->$business:Ljava/lang/String;

    iput-object p3, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$2;->$module:Ljava/lang/String;

    iput-object p4, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$2;->$state:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 75
    check-cast p1, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    invoke-virtual {p0, p1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$2;->invoke(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$2;->this$0:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$2;->$business:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$2;->$module:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->e()Ljava/lang/Throwable;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-static {v0, v1, v2, v3}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->h(Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$2;->$state:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;->d(Z)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object v0, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$2;->$state:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;->a()Lrx/subjects/a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->d()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_4

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_3

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    return-void

    .line 57
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$2;->$state:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;->a()Lrx/subjects/a;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    if-eqz p1, :cond_5

    .line 64
    .line 65
    invoke-virtual {p1}, Lrx/subjects/a;->onCompleted()V

    .line 66
    .line 67
    .line 68
    :cond_5
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$loadEvent$2;->$state:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;

    .line 69
    .line 70
    const/4 p1, 0x0

    .line 71
    invoke-virtual {p0, p1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$b;->c(Lrx/subjects/a;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method
