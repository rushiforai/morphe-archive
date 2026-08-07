.class public final enum Lrx/internal/util/InternalObservableUtils;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/util/InternalObservableUtils$d;,
        Lrx/internal/util/InternalObservableUtils$b;,
        Lrx/internal/util/InternalObservableUtils$n;,
        Lrx/internal/util/InternalObservableUtils$l;,
        Lrx/internal/util/InternalObservableUtils$k;,
        Lrx/internal/util/InternalObservableUtils$m;,
        Lrx/internal/util/InternalObservableUtils$f;,
        Lrx/internal/util/InternalObservableUtils$o;,
        Lrx/internal/util/InternalObservableUtils$q;,
        Lrx/internal/util/InternalObservableUtils$p;,
        Lrx/internal/util/InternalObservableUtils$j;,
        Lrx/internal/util/InternalObservableUtils$e;,
        Lrx/internal/util/InternalObservableUtils$c;,
        Lrx/internal/util/InternalObservableUtils$r;,
        Lrx/internal/util/InternalObservableUtils$g;,
        Lrx/internal/util/InternalObservableUtils$i;,
        Lrx/internal/util/InternalObservableUtils$h;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lrx/internal/util/InternalObservableUtils;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lrx/internal/util/InternalObservableUtils;

.field public static final COUNTER:Lrx/internal/util/InternalObservableUtils$h;

.field static final ERROR_EXTRACTOR:Lrx/internal/util/InternalObservableUtils$f;

.field public static final ERROR_NOT_IMPLEMENTED:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public static final IS_EMPTY:Lrx/c$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c$c<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final LONG_COUNTER:Lrx/internal/util/InternalObservableUtils$i;

.field public static final OBJECT_EQUALS:Lrx/internal/util/InternalObservableUtils$g;

.field static final RETURNS_VOID:Lrx/internal/util/InternalObservableUtils$p;

.field public static final TO_ARRAY:Lrx/internal/util/InternalObservableUtils$r;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lrx/internal/util/InternalObservableUtils;

    .line 3
    .line 4
    sput-object v0, Lrx/internal/util/InternalObservableUtils;->$VALUES:[Lrx/internal/util/InternalObservableUtils;

    .line 5
    .line 6
    new-instance v0, Lrx/internal/util/InternalObservableUtils$i;

    .line 7
    .line 8
    invoke-direct {v0}, Lrx/internal/util/InternalObservableUtils$i;-><init>()V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lrx/internal/util/InternalObservableUtils;->LONG_COUNTER:Lrx/internal/util/InternalObservableUtils$i;

    .line 12
    .line 13
    new-instance v0, Lrx/internal/util/InternalObservableUtils$g;

    .line 14
    .line 15
    invoke-direct {v0}, Lrx/internal/util/InternalObservableUtils$g;-><init>()V

    .line 16
    .line 17
    .line 18
    sput-object v0, Lrx/internal/util/InternalObservableUtils;->OBJECT_EQUALS:Lrx/internal/util/InternalObservableUtils$g;

    .line 19
    .line 20
    new-instance v0, Lrx/internal/util/InternalObservableUtils$r;

    .line 21
    .line 22
    invoke-direct {v0}, Lrx/internal/util/InternalObservableUtils$r;-><init>()V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lrx/internal/util/InternalObservableUtils;->TO_ARRAY:Lrx/internal/util/InternalObservableUtils$r;

    .line 26
    .line 27
    new-instance v0, Lrx/internal/util/InternalObservableUtils$p;

    .line 28
    .line 29
    invoke-direct {v0}, Lrx/internal/util/InternalObservableUtils$p;-><init>()V

    .line 30
    .line 31
    .line 32
    sput-object v0, Lrx/internal/util/InternalObservableUtils;->RETURNS_VOID:Lrx/internal/util/InternalObservableUtils$p;

    .line 33
    .line 34
    new-instance v0, Lrx/internal/util/InternalObservableUtils$h;

    .line 35
    .line 36
    invoke-direct {v0}, Lrx/internal/util/InternalObservableUtils$h;-><init>()V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lrx/internal/util/InternalObservableUtils;->COUNTER:Lrx/internal/util/InternalObservableUtils$h;

    .line 40
    .line 41
    new-instance v0, Lrx/internal/util/InternalObservableUtils$f;

    .line 42
    .line 43
    invoke-direct {v0}, Lrx/internal/util/InternalObservableUtils$f;-><init>()V

    .line 44
    .line 45
    .line 46
    sput-object v0, Lrx/internal/util/InternalObservableUtils;->ERROR_EXTRACTOR:Lrx/internal/util/InternalObservableUtils$f;

    .line 47
    .line 48
    new-instance v0, Lrx/internal/util/InternalObservableUtils$d;

    .line 49
    .line 50
    invoke-direct {v0}, Lrx/internal/util/InternalObservableUtils$d;-><init>()V

    .line 51
    .line 52
    .line 53
    sput-object v0, Lrx/internal/util/InternalObservableUtils;->ERROR_NOT_IMPLEMENTED:Ll/y20;

    .line 54
    .line 55
    new-instance v0, Ll/v260;

    .line 56
    .line 57
    invoke-static {}, Lrx/internal/util/UtilityFunctions;->a()Ll/qcj;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const/4 v2, 0x1

    .line 62
    invoke-direct {v0, v1, v2}, Ll/v260;-><init>(Ll/qcj;Z)V

    .line 63
    .line 64
    .line 65
    sput-object v0, Lrx/internal/util/InternalObservableUtils;->IS_EMPTY:Lrx/c$c;

    .line 66
    .line 67
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static createCollectorCaller(Ll/z20;)Ll/rcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/z20<",
            "TR;-TT;>;)",
            "Ll/rcj<",
            "TR;TT;TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/util/InternalObservableUtils$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/internal/util/InternalObservableUtils$b;-><init>(Ll/z20;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static final createRepeatDematerializer(Ll/qcj;)Ll/qcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "+",
            "Ljava/lang/Void;",
            ">;+",
            "Lrx/c<",
            "*>;>;)",
            "Ll/qcj<",
            "Lrx/c<",
            "+",
            "Lrx/Notification<",
            "*>;>;",
            "Lrx/c<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/util/InternalObservableUtils$j;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/internal/util/InternalObservableUtils$j;-><init>(Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static createReplaySelectorAndObserveOn(Ll/qcj;Ll/f2e0;)Ll/qcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "TT;>;+",
            "Lrx/c<",
            "TR;>;>;",
            "Ll/f2e0;",
            ")",
            "Ll/qcj<",
            "Lrx/c<",
            "TT;>;",
            "Lrx/c<",
            "TR;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/util/InternalObservableUtils$q;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lrx/internal/util/InternalObservableUtils$q;-><init>(Ll/qcj;Ll/f2e0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static createReplaySupplier(Lrx/c;)Ll/pcj;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Ll/pcj<",
            "Ll/ax5<",
            "TT;>;>;"
        }
    .end annotation

    .line 15
    new-instance v0, Lrx/internal/util/InternalObservableUtils$m;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lrx/internal/util/InternalObservableUtils$m;-><init>(Lrx/c;Lrx/internal/util/InternalObservableUtils$a;)V

    return-object v0
.end method

.method public static createReplaySupplier(Lrx/c;I)Ll/pcj;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;I)",
            "Ll/pcj<",
            "Ll/ax5<",
            "TT;>;>;"
        }
    .end annotation

    .line 13
    new-instance v0, Lrx/internal/util/InternalObservableUtils$k;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lrx/internal/util/InternalObservableUtils$k;-><init>(Lrx/c;ILrx/internal/util/InternalObservableUtils$a;)V

    return-object v0
.end method

.method public static createReplaySupplier(Lrx/c;IJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Ll/pcj;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;IJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Ll/pcj<",
            "Ll/ax5<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/util/InternalObservableUtils$n;

    .line 2
    .line 3
    const/4 v7, 0x0

    .line 4
    move-object v1, p0

    .line 5
    move v2, p1

    .line 6
    move-wide v3, p2

    .line 7
    move-object v5, p4

    .line 8
    move-object v6, p5

    .line 9
    invoke-direct/range {v0 .. v7}, Lrx/internal/util/InternalObservableUtils$n;-><init>(Lrx/c;IJLjava/util/concurrent/TimeUnit;Ll/f2e0;Lrx/internal/util/InternalObservableUtils$a;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static createReplaySupplier(Lrx/c;JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Ll/pcj;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Ll/pcj<",
            "Ll/ax5<",
            "TT;>;>;"
        }
    .end annotation

    .line 14
    new-instance v0, Lrx/internal/util/InternalObservableUtils$l;

    const/4 v6, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lrx/internal/util/InternalObservableUtils$l;-><init>(Lrx/c;JLjava/util/concurrent/TimeUnit;Ll/f2e0;Lrx/internal/util/InternalObservableUtils$a;)V

    return-object v0
.end method

.method public static final createRetryDematerializer(Ll/qcj;)Ll/qcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "+",
            "Ljava/lang/Throwable;",
            ">;+",
            "Lrx/c<",
            "*>;>;)",
            "Ll/qcj<",
            "Lrx/c<",
            "+",
            "Lrx/Notification<",
            "*>;>;",
            "Lrx/c<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/util/InternalObservableUtils$o;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/internal/util/InternalObservableUtils$o;-><init>(Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static equalsWith(Ljava/lang/Object;)Ll/qcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ll/qcj<",
            "Ljava/lang/Object;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/util/InternalObservableUtils$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/internal/util/InternalObservableUtils$c;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static isInstanceOf(Ljava/lang/Class;)Ll/qcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ll/qcj<",
            "Ljava/lang/Object;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/util/InternalObservableUtils$e;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/internal/util/InternalObservableUtils$e;-><init>(Ljava/lang/Class;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lrx/internal/util/InternalObservableUtils;
    .locals 1

    .line 1
    const-class v0, Lrx/internal/util/InternalObservableUtils;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lrx/internal/util/InternalObservableUtils;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lrx/internal/util/InternalObservableUtils;
    .locals 1

    .line 1
    sget-object v0, Lrx/internal/util/InternalObservableUtils;->$VALUES:[Lrx/internal/util/InternalObservableUtils;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lrx/internal/util/InternalObservableUtils;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lrx/internal/util/InternalObservableUtils;

    .line 8
    .line 9
    return-object v0
.end method
