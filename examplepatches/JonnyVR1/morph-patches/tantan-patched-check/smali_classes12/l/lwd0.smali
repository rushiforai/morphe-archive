.class public Ll/lwd0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static b:Ll/lwd0;


# instance fields
.field a:Ll/iwd0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/lwd0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/lwd0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/lwd0;->b:Ll/lwd0;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/iwd0;

    .line 5
    .line 6
    new-instance v1, Ll/jwd0;

    .line 7
    .line 8
    new-instance v2, Ll/lwd0$a;

    .line 9
    .line 10
    invoke-direct {v2, p0}, Ll/lwd0$a;-><init>(Ll/lwd0;)V

    .line 11
    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-direct {v1, v3, v2}, Ll/jwd0;-><init>(ZLl/h5m;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {v0, v1}, Ll/iwd0;-><init>(Ll/jwd0;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/lwd0;->a:Ll/iwd0;

    .line 21
    .line 22
    return-void
.end method

.method public static b()Ll/lwd0;
    .locals 1

    .line 1
    sget-object v0, Ll/lwd0;->b:Ll/lwd0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lwd0;->a:Ll/iwd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/iwd0;->e(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lwd0;->a:Ll/iwd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/iwd0;->f(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
