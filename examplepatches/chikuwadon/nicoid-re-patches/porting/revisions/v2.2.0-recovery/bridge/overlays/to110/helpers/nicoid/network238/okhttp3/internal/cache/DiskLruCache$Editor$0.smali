.class public final synthetic Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;"
    method = "newSink$lambda$0$0"
    proto = "(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;Ljava/io/IOException;)Lnicoid/network238/kotlin/Unit;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

.field public final synthetic f$1:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor$0;->f$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor$0;->f$1:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor$0;->f$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor$0;->f$1:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    check-cast p1, Ljava/io/IOException;

    invoke-static {v0, v1, p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->$r8$lambda$A4Vm2KUtMTjVaHywVLE7iXxpmms(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;Ljava/io/IOException;)Lnicoid/network238/kotlin/Unit;

    move-result-object p1

    return-object p1
.end method
