.class public final synthetic Ll/dqu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y6s0;


# instance fields
.field public final synthetic a:Ll/wit0;


# direct methods
.method public synthetic constructor <init>(Ll/wit0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dqu0;->a:Ll/wit0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final U(Ll/x6s0;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iget-boolean p1, p1, Ll/x6s0;->j:Z

    .line 8
    .line 9
    if-eq v1, p1, :cond_0

    .line 10
    .line 11
    const-string p1, "0"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p1, "1"

    .line 15
    .line 16
    :goto_0
    const-string v1, "isVisible"

    .line 17
    .line 18
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/dqu0;->a:Ll/wit0;

    .line 22
    .line 23
    const-string p1, "onAdVisibilityChanged"

    .line 24
    .line 25
    invoke-interface {p0, p1, v0}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
