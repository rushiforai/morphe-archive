.class public Ll/d7h0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final b:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final c:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/d7h0$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/d7h0$b;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/d7h0;->a:Ll/a7h0;

    .line 7
    .line 8
    new-instance v0, Ll/d7h0$c;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/d7h0$c;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/d7h0;->b:Ll/a7h0;

    .line 14
    .line 15
    new-instance v0, Ll/d7h0$d;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/d7h0$d;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Ll/d7h0;->c:Ll/a7h0;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/Object;)Ll/a7h0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Ll/a7h0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/d7h0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/d7h0$a;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
