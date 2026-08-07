.class final Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$load$1;
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
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\n \u0002*\u0004\u0018\u00010\u00010\u00012\u000e\u0010\u0003\u001a\n \u0002*\u0004\u0018\u00010\u00040\u0004H\n\u00a2\u0006\u0004\u0008\u0005\u0010\u0006"
    }
    d2 = {
        "<anonymous>",
        "",
        "kotlin.jvm.PlatformType",
        "it",
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
        "invoke",
        "(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)Ljava/lang/Boolean;"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$load$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$load$1;

    invoke-direct {v0}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$load$1;-><init>()V

    sput-object v0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$load$1;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$load$1;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 10
    check-cast p1, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    invoke-virtual {p0, p1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$load$1;->invoke(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
