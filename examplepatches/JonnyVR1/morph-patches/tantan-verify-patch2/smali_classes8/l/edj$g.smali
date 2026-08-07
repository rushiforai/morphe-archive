.class public final Ll/edj$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/edj;->f(Ll/wcj;)Ll/zcj;
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
.field public final synthetic a:Ll/wcj;


# direct methods
.method public constructor <init>(Ll/wcj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/edj$g;->a:Ll/wcj;

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
    .locals 10
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
    const/4 v1, 0x7

    .line 3
    if-ne v0, v1, :cond_0

    .line 4
    .line 5
    iget-object v2, p0, Ll/edj$g;->a:Ll/wcj;

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    aget-object v3, p1, p0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    aget-object v4, p1, p0

    .line 12
    .line 13
    const/4 p0, 0x2

    .line 14
    aget-object v5, p1, p0

    .line 15
    .line 16
    const/4 p0, 0x3

    .line 17
    aget-object v6, p1, p0

    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    aget-object v7, p1, p0

    .line 21
    .line 22
    const/4 p0, 0x5

    .line 23
    aget-object v8, p1, p0

    .line 24
    .line 25
    const/4 p0, 0x6

    .line 26
    aget-object v9, p1, p0

    .line 27
    .line 28
    invoke-interface/range {v2 .. v9}, Ll/wcj;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_0
    const-string p0, "Func7 expecting 7 arguments."

    .line 34
    .line 35
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method
