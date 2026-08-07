.class public final synthetic Ll/t0u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/z0u0;

.field public final synthetic b:Ll/hpr;

.field public final synthetic c:Ll/hpr;

.field public final synthetic d:Ll/hpr;


# direct methods
.method public synthetic constructor <init>(Ll/z0u0;Ll/hpr;Ll/hpr;Ll/hpr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/t0u0;->a:Ll/z0u0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/t0u0;->b:Ll/hpr;

    .line 7
    .line 8
    iput-object p3, p0, Ll/t0u0;->c:Ll/hpr;

    .line 9
    .line 10
    iput-object p4, p0, Ll/t0u0;->d:Ll/hpr;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t0u0;->a:Ll/z0u0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/t0u0;->b:Ll/hpr;

    .line 4
    .line 5
    iget-object v2, p0, Ll/t0u0;->c:Ll/hpr;

    .line 6
    .line 7
    iget-object p0, p0, Ll/t0u0;->d:Ll/hpr;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, p0}, Ll/z0u0;->g(Ll/hpr;Ll/hpr;Ll/hpr;)Ll/hpr;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
