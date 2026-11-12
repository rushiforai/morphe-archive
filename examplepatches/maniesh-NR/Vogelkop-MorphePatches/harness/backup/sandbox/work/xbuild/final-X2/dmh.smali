.class public final Ldmh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljva;

.field public final b:Ljava/util/Map;

.field public final c:J


# direct methods
.method public constructor <init>(Ljva;Ljava/util/Map;J)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldmh;->a:Ljva;

    iput-object p2, p0, Ldmh;->b:Ljava/util/Map;

    iput-wide p3, p0, Ldmh;->c:J

    return-void
.end method
