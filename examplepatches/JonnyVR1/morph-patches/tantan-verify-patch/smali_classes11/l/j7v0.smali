.class public final synthetic Ll/j7v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/hpr;

.field public final synthetic b:Ll/hpr;


# direct methods
.method public synthetic constructor <init>(Ll/hpr;Ll/hpr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/j7v0;->a:Ll/hpr;

    .line 5
    .line 6
    iput-object p2, p0, Ll/j7v0;->b:Ll/hpr;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j7v0;->a:Ll/hpr;

    .line 2
    .line 3
    new-instance v1, Ll/p8v0;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lorg/json/JSONObject;

    .line 10
    .line 11
    iget-object p0, p0, Ll/j7v0;->b:Ll/hpr;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/s4t0;

    .line 18
    .line 19
    invoke-direct {v1, v0, p0}, Ll/p8v0;-><init>(Lorg/json/JSONObject;Ll/s4t0;)V

    .line 20
    .line 21
    .line 22
    return-object v1
.end method
