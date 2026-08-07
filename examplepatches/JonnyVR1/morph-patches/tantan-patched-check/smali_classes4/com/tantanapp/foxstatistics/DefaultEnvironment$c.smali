.class public Lcom/tantanapp/foxstatistics/DefaultEnvironment$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/foxstatistics/DefaultEnvironment;->h(Ll/ek2;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ek2;

.field public final synthetic b:Lcom/tantanapp/foxstatistics/DefaultEnvironment;


# direct methods
.method public constructor <init>(Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ll/ek2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$c;->b:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$c;->a:Ll/ek2;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$c;->b:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$c;->a:Ll/ek2;

    .line 8
    .line 9
    invoke-static {p0}, Ll/zek0;->a(Ll/ek2;)Ljava/util/HashMap;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {v0, p0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
