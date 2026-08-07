.class final Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$load$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->s(Ljava/lang/String;Z)Lrx/c;
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
        "Lrx/c<",
        "+",
        "Lkotlin/Unit;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0010\u0007\u001a*\u0012\u000e\u0008\u0001\u0012\n \u0001*\u0004\u0018\u00010\u00040\u0004 \u0001*\u0014\u0012\u000e\u0008\u0001\u0012\n \u0001*\u0004\u0018\u00010\u00040\u0004\u0018\u00010\u00030\u00032\u000e\u0010\u0002\u001a\n \u0001*\u0004\u0018\u00010\u00000\u0000H\n\u00a2\u0006\u0004\u0008\u0005\u0010\u0006"
    }
    d2 = {
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
        "kotlin.jvm.PlatformType",
        "it",
        "Lrx/c;",
        "",
        "invoke",
        "(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)Lrx/c;",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$load$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$load$2;

    invoke-direct {v0}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$load$2;-><init>()V

    sput-object v0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$load$2;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$load$2;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$load$2;->invoke(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final invoke(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
            ")",
            "Lrx/c<",
            "+",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .line 8
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
