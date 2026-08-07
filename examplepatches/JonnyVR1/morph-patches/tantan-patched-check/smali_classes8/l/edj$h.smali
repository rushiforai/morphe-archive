.class public final Ll/edj$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/edj;->g(Ll/xcj;)Ll/zcj;
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
.field public final synthetic a:Ll/xcj;


# direct methods
.method public constructor <init>(Ll/xcj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/edj$h;->a:Ll/xcj;

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
    .locals 11
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
    const/16 v1, 0x8

    .line 3
    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v2, p0, Ll/edj$h;->a:Ll/xcj;

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    aget-object v3, p1, p0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    aget-object v4, p1, p0

    .line 13
    .line 14
    const/4 p0, 0x2

    .line 15
    aget-object v5, p1, p0

    .line 16
    .line 17
    const/4 p0, 0x3

    .line 18
    aget-object v6, p1, p0

    .line 19
    .line 20
    const/4 p0, 0x4

    .line 21
    aget-object v7, p1, p0

    .line 22
    .line 23
    const/4 p0, 0x5

    .line 24
    aget-object v8, p1, p0

    .line 25
    .line 26
    const/4 p0, 0x6

    .line 27
    aget-object v9, p1, p0

    .line 28
    .line 29
    const/4 p0, 0x7

    .line 30
    aget-object v10, p1, p0

    .line 31
    .line 32
    invoke-interface/range {v2 .. v10}, Ll/xcj;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_0
    const-string p0, "Func8 expecting 8 arguments."

    .line 38
    .line 39
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    return-object p0
.end method
