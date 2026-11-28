.class public final synthetic Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;"
    method = "newJournalWriter$lambda$0"
    proto = "(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Ljava/io/IOException;)Lnicoid/network238/kotlin/Unit;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$0;->f$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$0;->f$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    check-cast p1, Ljava/io/IOException;

    invoke-static {v0, p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->newJournalWriter$lambda$0(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Ljava/io/IOException;)Lnicoid/network238/kotlin/Unit;

    move-result-object p1

    return-object p1
.end method
