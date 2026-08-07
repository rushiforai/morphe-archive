.class public final Ll/bfr0;
.super Ll/war0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-direct {p0, v0}, Ll/war0;-><init>(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    const/4 p1, 0x4

    .line 6
    invoke-direct {p0, p1}, Ll/war0;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;)Ll/bfr0;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/war0;->a(Ljava/lang/Object;)Ll/war0;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public final c(Ljava/util/Iterator;)Ll/bfr0;
    .locals 1

    .line 1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-super {p0, v0}, Ll/war0;->a(Ljava/lang/Object;)Ll/war0;

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-object p0
.end method
