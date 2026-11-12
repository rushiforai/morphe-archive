.class public final Ldv6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final f:Ljava/util/logging/Logger;


# instance fields
.field public final a:Lx77;

.field public final b:Ljava/util/concurrent/Executor;

.field public final c:Lpxd;

.field public final d:Lydi;

.field public final e:Lydi;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Ls5m;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Ldv6;->f:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Lpxd;Lx77;Lydi;Lydi;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldv6;->b:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Ldv6;->c:Lpxd;

    iput-object p3, p0, Ldv6;->a:Lx77;

    iput-object p4, p0, Ldv6;->d:Lydi;

    iput-object p5, p0, Ldv6;->e:Lydi;

    return-void
.end method
