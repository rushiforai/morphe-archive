.class public final Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0008\r\u0008\u0002\u0018\u00002\u00020\u0001BK\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0004\u00120\u0010\u000c\u001a,\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u0008\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\t\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u000b0\u0006\u00a2\u0006\u0004\u0008\r\u0010\u000eR\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010\u0010\u001a\u0004\u0008\u0011\u0010\u0012R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0013\u0010\u0014\u001a\u0004\u0008\u0013\u0010\u0015RA\u0010\u000c\u001a,\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u0008\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\t\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u000b0\u00068\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0011\u0010\u0016\u001a\u0004\u0008\u000f\u0010\u0017\u00a8\u0006\u0018"
    }
    d2 = {
        "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;",
        "",
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;",
        "step",
        "",
        "retryCount",
        "Lkotlin/Function3;",
        "Lcom/tantanapp/sharedlibrary/loader/a;",
        "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
        "",
        "",
        "Ll/q5d0;",
        "action",
        "<init>",
        "(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;ILkotlin/jvm/functions/Function3;)V",
        "a",
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;",
        "c",
        "()Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;",
        "b",
        "I",
        "()I",
        "Lkotlin/jvm/functions/Function3;",
        "()Lkotlin/jvm/functions/Function3;",
        "loader_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:I

.field public final c:Lkotlin/jvm/functions/Function3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function3<",
            "Lcom/tantanapp/sharedlibrary/loader/a;",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/q5d0<",
            "*>;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;ILkotlin/jvm/functions/Function3;)V
    .locals 0
    .param p1    # Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;",
            "I",
            "Lkotlin/jvm/functions/Function3<",
            "-",
            "Lcom/tantanapp/sharedlibrary/loader/a;",
            "-",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
            "-",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;+",
            "Ll/q5d0<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;->a:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 11
    .line 12
    iput p2, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;->b:I

    .line 13
    .line 14
    iput-object p3, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;->c:Lkotlin/jvm/functions/Function3;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a()Lkotlin/jvm/functions/Function3;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function3<",
            "Lcom/tantanapp/sharedlibrary/loader/a;",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/q5d0<",
            "*>;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;->c:Lkotlin/jvm/functions/Function3;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final c()Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;->a:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 2
    .line 3
    return-object p0
.end method
