.class final Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$lazyInit$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;-><init>(Lcom/tantanapp/sharedlibrary/loader/a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
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
.field final synthetic this$0:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;


# direct methods
.method public constructor <init>(Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;)V
    .locals 0

    iput-object p1, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$lazyInit$2;->this$0:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 80
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$lazyInit$2;->invoke()V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke()V
    .locals 4

    .line 1
    const-string v0, "config="

    .line 2
    .line 3
    const-string v1, "start lazyInit"

    .line 4
    .line 5
    invoke-static {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$lazyInit$2;->this$0:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 9
    .line 10
    :try_start_0
    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 11
    .line 12
    new-instance v2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->l()Lcom/tantanapp/sharedlibrary/loader/a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 32
    .line 33
    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception v0

    .line 38
    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 39
    .line 40
    invoke-static {v0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    :goto_0
    sget-object v0, Ll/wp80;->INSTANCE:Ll/wp80;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/wp80;->a()V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$lazyInit$2;->this$0:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->l()Lcom/tantanapp/sharedlibrary/loader/a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/a;->c()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    new-instance v2, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$lazyInit$2$2;

    .line 63
    .line 64
    iget-object v3, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$lazyInit$2;->this$0:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 65
    .line 66
    invoke-direct {v2, v3}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$lazyInit$2$2;-><init>(Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;)V

    .line 67
    .line 68
    .line 69
    new-instance v3, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$lazyInit$2$3;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$lazyInit$2;->this$0:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 72
    .line 73
    invoke-direct {v3, p0}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$lazyInit$2$3;-><init>(Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1, v2, v3}, Ll/wp80;->b(Landroid/content/Context;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
