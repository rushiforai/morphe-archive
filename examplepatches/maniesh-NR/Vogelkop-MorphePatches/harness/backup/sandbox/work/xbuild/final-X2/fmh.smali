.class public final Lfmh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/ref/WeakReference;

.field public final b:Ljava/util/Map;

.field public final c:J


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;Ljava/util/Map;J)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfmh;->a:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lfmh;->b:Ljava/util/Map;

    iput-wide p3, p0, Lfmh;->c:J

    return-void
.end method
