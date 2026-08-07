.class public final Ll/edj$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/edj;->c(Ll/tcj;)Ll/zcj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/zcj<",
        "TR;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/tcj;


# direct methods
.method public constructor <init>(Ll/tcj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/edj$d;->a:Ll/tcj;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")TR;"
        }
    .end annotation

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x4

    .line 3
    if-ne v0, v1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/edj$d;->a:Ll/tcj;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    aget-object v0, p1, v0

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    aget-object v1, p1, v1

    .line 12
    .line 13
    const/4 v2, 0x2

    .line 14
    aget-object v2, p1, v2

    .line 15
    .line 16
    const/4 v3, 0x3

    .line 17
    aget-object p1, p1, v3

    .line 18
    .line 19
    invoke-interface {p0, v0, v1, v2, p1}, Ll/tcj;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    const-string p0, "Func4 expecting 4 arguments."

    .line 25
    .line 26
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method
