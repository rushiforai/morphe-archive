.class public Ll/ipq0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ipq0$b;,
        Ll/ipq0$a;
    }
.end annotation


# instance fields
.field public a:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/ipq0$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/ipq0;->a:Lrx/subjects/b;

    .line 9
    .line 10
    return-void
.end method

.method public synthetic constructor <init>(Ll/jpq0;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ll/ipq0;-><init>()V

    return-void
.end method

.method public static a()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/ipq0$b;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/ipq0$a;->a()Ll/ipq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/ipq0;->a:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static b(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ll/bn5;->C3(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static c(ILandroid/net/Uri;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ipq0$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/ipq0$b;-><init>(ILandroid/net/Uri;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/ipq0$a;->a()Ll/ipq0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p0, p0, Ll/ipq0;->a:Lrx/subjects/b;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    new-instance p0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string p1, "ZhiMaAuthBus post value "

    .line 18
    .line 19
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ll/ipq0$b;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "[putong-common][zhimaauth]"

    .line 34
    .line 35
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
