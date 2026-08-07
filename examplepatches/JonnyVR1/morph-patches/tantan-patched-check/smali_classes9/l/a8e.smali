.class public Ll/a8e;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/uyk;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/uyk<",
            "Ll/ck2;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/uyk;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-direct {v0, v1}, Ll/uyk;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/a8e;->a:Ll/uyk;

    .line 8
    .line 9
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

.method public static a()V
    .locals 1

    .line 1
    sget-object v0, Ll/a8e;->a:Ll/uyk;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/uyk;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static b(Ll/mtl;)Ll/ck2;
    .locals 2

    .line 1
    sget-object v0, Ll/a8e;->a:Ll/uyk;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/mtl;->type()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/uyk;->b(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/ck2;

    .line 12
    .line 13
    invoke-interface {p0, v0}, Ll/mtl;->a(Ll/ck2;)Ll/ck2;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static c(Ll/ck2;)V
    .locals 2

    .line 1
    sget-object v0, Ll/a8e;->a:Ll/uyk;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ck2;->M3()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1, p0}, Ll/uyk;->d(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method
