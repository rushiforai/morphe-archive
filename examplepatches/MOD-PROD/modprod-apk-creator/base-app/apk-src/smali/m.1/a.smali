.class public final Lm/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Lm/a;

.field public static final c:Lm/a;


# instance fields
.field public final a:Ljava/util/concurrent/CancellationException;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    sget-boolean v0, Lm/g;->d:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sput-object v1, Lm/a;->c:Lm/a;

    sput-object v1, Lm/a;->b:Lm/a;

    return-void

    :cond_0
    new-instance v0, Lm/a;

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1}, Lm/a;-><init>(ZLjava/util/concurrent/CancellationException;)V

    sput-object v0, Lm/a;->c:Lm/a;

    new-instance v0, Lm/a;

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lm/a;-><init>(ZLjava/util/concurrent/CancellationException;)V

    sput-object v0, Lm/a;->b:Lm/a;

    return-void
.end method

.method public constructor <init>(ZLjava/util/concurrent/CancellationException;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lm/a;->a:Ljava/util/concurrent/CancellationException;

    return-void
.end method
