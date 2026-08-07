.class public Lcom/tantanapp/foxstatistics/DefaultEnvironment$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/foxstatistics/DefaultEnvironment;->i()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;


# direct methods
.method public constructor <init>(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$f;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$f;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/i4g0;->e()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Ll/cu2;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "chrg"

    .line 16
    .line 17
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$f;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {}, Ll/i4g0;->e()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Ll/cu2;->a(Landroid/content/Context;)F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "btry"

    .line 39
    .line 40
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    return-void
.end method
