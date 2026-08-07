.class public final synthetic Ll/k7v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/hpr;

.field public final synthetic b:Ll/hpr;

.field public final synthetic c:Ll/hpr;


# direct methods
.method public synthetic constructor <init>(Ll/hpr;Ll/hpr;Ll/hpr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/k7v0;->a:Ll/hpr;

    .line 5
    .line 6
    iput-object p2, p0, Ll/k7v0;->b:Ll/hpr;

    .line 7
    .line 8
    iput-object p3, p0, Ll/k7v0;->c:Ll/hpr;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/k7v0;->a:Ll/hpr;

    .line 2
    .line 3
    new-instance v1, Ll/t7v0;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/h8v0;

    .line 10
    .line 11
    iget-object v2, p0, Ll/k7v0;->b:Ll/hpr;

    .line 12
    .line 13
    invoke-interface {v2}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lorg/json/JSONObject;

    .line 18
    .line 19
    iget-object p0, p0, Ll/k7v0;->c:Ll/hpr;

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ll/s4t0;

    .line 26
    .line 27
    invoke-direct {v1, v0, v2, p0}, Ll/t7v0;-><init>(Ll/h8v0;Lorg/json/JSONObject;Ll/s4t0;)V

    .line 28
    .line 29
    .line 30
    return-object v1
.end method
