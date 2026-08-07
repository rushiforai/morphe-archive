.class public final Ll/b6x0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ll/b6x0;

.field public static final c:Ll/a6x0;


# instance fields
.field public final a:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/b6x0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/b6x0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/b6x0;->b:Ll/b6x0;

    .line 7
    .line 8
    new-instance v0, Ll/a6x0;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {v0, v1}, Ll/a6x0;-><init>(Ll/z5x0;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/b6x0;->c:Ll/a6x0;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/b6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 10
    .line 11
    return-void
.end method

.method public static a()Ll/b6x0;
    .locals 1

    .line 1
    sget-object v0, Ll/b6x0;->b:Ll/b6x0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final b()Ll/pax0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/pax0;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Ll/b6x0;->c:Ll/a6x0;

    .line 12
    .line 13
    :cond_0
    return-object p0
.end method
