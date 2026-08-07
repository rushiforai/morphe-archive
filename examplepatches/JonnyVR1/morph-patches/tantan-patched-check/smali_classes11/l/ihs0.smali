.class public final Ll/ihs0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ljava/util/Map;

.field public final b:Ll/khs0;


# direct methods
.method public constructor <init>(Ll/khs0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ihs0;->b:Ll/khs0;

    .line 5
    .line 6
    new-instance p1, Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/ihs0;->a:Ljava/util/Map;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a()Ll/khs0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ihs0;->b:Ll/khs0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Ljava/lang/String;Ll/hhs0;)V
    .locals 0
    .param p2    # Ll/hhs0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/ihs0;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ihs0;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Ll/hhs0;

    .line 8
    .line 9
    filled-new-array {p1}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Ll/ihs0;->b:Ll/khs0;

    .line 16
    .line 17
    invoke-virtual {v1, p2, p3, p4, v0}, Ll/khs0;->e(Ll/hhs0;J[Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ll/ihs0;->a:Ljava/util/Map;

    .line 21
    .line 22
    new-instance p2, Ll/hhs0;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-direct {p2, p3, p4, v0, v0}, Ll/hhs0;-><init>(JLjava/lang/String;Ll/hhs0;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    return-void
.end method
