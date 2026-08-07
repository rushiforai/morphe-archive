.class public final synthetic Ll/z3f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ljava/io/File;

.field public final synthetic b:Ljava/io/File;

.field public final synthetic c:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;Ljava/io/File;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z3f0;->a:Ljava/io/File;

    iput-object p2, p0, Ll/z3f0;->b:Ljava/io/File;

    iput-object p3, p0, Ll/z3f0;->c:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z3f0;->a:Ljava/io/File;

    iget-object v1, p0, Ll/z3f0;->b:Ljava/io/File;

    iget-object p0, p0, Ll/z3f0;->c:Lkotlin/jvm/functions/Function1;

    check-cast p1, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    check-cast p2, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1, p2}, Ll/b4f0$a;->c(Ljava/io/File;Ljava/io/File;Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V

    return-void
.end method
