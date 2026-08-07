.class public abstract Ll/do5;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/do5$b;
    }
.end annotation


# static fields
.field public static final a:Ll/do5;

.field public static final b:Ll/do5;

.field public static final c:Ll/do5;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/do5$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/do5$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/do5;->a:Ll/do5;

    .line 7
    .line 8
    new-instance v0, Ll/do5$b;

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-direct {v0, v1}, Ll/do5$b;-><init>(I)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/do5;->b:Ll/do5;

    .line 15
    .line 16
    new-instance v0, Ll/do5$b;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-direct {v0, v1}, Ll/do5$b;-><init>(I)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Ll/do5;->c:Ll/do5;

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/do5$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/do5;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a()Ll/do5;
    .locals 1

    .line 1
    sget-object v0, Ll/do5;->b:Ll/do5;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic b()Ll/do5;
    .locals 1

    .line 1
    sget-object v0, Ll/do5;->c:Ll/do5;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic c()Ll/do5;
    .locals 1

    .line 1
    sget-object v0, Ll/do5;->a:Ll/do5;

    .line 2
    .line 3
    return-object v0
.end method

.method public static k()Ll/do5;
    .locals 1

    .line 1
    sget-object v0, Ll/do5;->a:Ll/do5;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public abstract d(II)Ll/do5;
.end method

.method public abstract e(JJ)Ll/do5;
.end method

.method public abstract f(Ljava/lang/Comparable;Ljava/lang/Comparable;)Ll/do5;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Comparable<",
            "*>;",
            "Ljava/lang/Comparable<",
            "*>;)",
            "Ll/do5;"
        }
    .end annotation
.end method

.method public abstract g(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Ll/do5;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;",
            "Ljava/util/Comparator<",
            "TT;>;)",
            "Ll/do5;"
        }
    .end annotation
.end method

.method public abstract h(ZZ)Ll/do5;
.end method

.method public abstract i(ZZ)Ll/do5;
.end method

.method public abstract j()I
.end method
