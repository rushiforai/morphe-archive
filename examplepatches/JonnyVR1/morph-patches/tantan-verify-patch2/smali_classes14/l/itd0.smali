.class public Ll/itd0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final b:Ll/itd0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/itd0<",
            "Ll/fk3;",
            ">;"
        }
    .end annotation
.end field

.field public static final c:Ll/itd0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/itd0<",
            "Ll/gm3;",
            ">;"
        }
    .end annotation
.end field

.field public static final d:Ll/itd0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/itd0<",
            "Ll/bk3;",
            ">;"
        }
    .end annotation
.end field

.field public static final e:Ll/itd0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/itd0<",
            "Ll/fm3;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/itd0;

    .line 2
    .line 3
    const-string v1, "base_func"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/itd0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/itd0;->b:Ll/itd0;

    .line 9
    .line 10
    new-instance v0, Ll/itd0;

    .line 11
    .line 12
    const-string v1, "square"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/itd0;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/itd0;->c:Ll/itd0;

    .line 18
    .line 19
    new-instance v0, Ll/itd0;

    .line 20
    .line 21
    const-string v1, "sp_base_func"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ll/itd0;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Ll/itd0;->d:Ll/itd0;

    .line 27
    .line 28
    new-instance v0, Ll/itd0;

    .line 29
    .line 30
    const-string v1, "sp_square"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Ll/itd0;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Ll/itd0;->e:Ll/itd0;

    .line 36
    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/itd0;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/itd0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
