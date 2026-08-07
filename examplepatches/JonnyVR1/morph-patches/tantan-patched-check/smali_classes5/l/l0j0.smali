.class public final synthetic Ll/l0j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ljava/lang/ClassLoader;

.field public final synthetic b:Ljava/io/File;

.field public final synthetic c:Lcom/tantanapp/sharedlibrary/loader/a;

.field public final synthetic d:[Ljava/lang/Throwable;

.field public final synthetic e:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/ClassLoader;Ljava/io/File;Lcom/tantanapp/sharedlibrary/loader/a;[Ljava/lang/Throwable;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l0j0;->a:Ljava/lang/ClassLoader;

    iput-object p2, p0, Ll/l0j0;->b:Ljava/io/File;

    iput-object p3, p0, Ll/l0j0;->c:Lcom/tantanapp/sharedlibrary/loader/a;

    iput-object p4, p0, Ll/l0j0;->d:[Ljava/lang/Throwable;

    iput-object p5, p0, Ll/l0j0;->e:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l0j0;->a:Ljava/lang/ClassLoader;

    iget-object v1, p0, Ll/l0j0;->b:Ljava/io/File;

    iget-object v2, p0, Ll/l0j0;->c:Lcom/tantanapp/sharedlibrary/loader/a;

    iget-object v3, p0, Ll/l0j0;->d:[Ljava/lang/Throwable;

    iget-object p0, p0, Ll/l0j0;->e:Ljava/util/concurrent/CountDownLatch;

    invoke-static {v0, v1, v2, v3, p0}, Ll/o0j0;->a(Ljava/lang/ClassLoader;Ljava/io/File;Lcom/tantanapp/sharedlibrary/loader/a;[Ljava/lang/Throwable;Ljava/util/concurrent/CountDownLatch;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
