.class public Ll/s20;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/s20$c;,
        Ll/s20$a;,
        Ll/s20$b;
    }
.end annotation


# static fields
.field public static a:Ll/l01;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/l01<",
            "Ljava/lang/String;",
            "Ll/s20$c;",
            ">;"
        }
    .end annotation
.end field

.field public static b:Ll/l01;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/l01<",
            "Ljava/lang/String;",
            "Ll/pcj<",
            "Ll/s20$a;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/l01;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/s20;->a:Ll/l01;

    .line 7
    .line 8
    new-instance v0, Ll/l01;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/s20;->b:Ll/l01;

    .line 14
    .line 15
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

.method public static bridge synthetic a()Ll/l01;
    .locals 1

    .line 1
    sget-object v0, Ll/s20;->a:Ll/l01;

    return-object v0
.end method

.method public static b(Ljava/lang/String;)Ll/s20$a;
    .locals 2

    .line 1
    sget-object v0, Ll/s20;->a:Ll/l01;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/s20$c;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    sget-object v1, Ll/s20;->b:Ll/l01;

    .line 14
    .line 15
    iget-object p0, p0, Ll/s20$c;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, p0}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ll/pcj;

    .line 22
    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_1
    invoke-interface {p0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ll/s20$a;

    .line 31
    .line 32
    return-object p0
.end method
