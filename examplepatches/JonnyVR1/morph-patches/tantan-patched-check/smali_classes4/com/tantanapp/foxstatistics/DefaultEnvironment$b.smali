.class public Lcom/tantanapp/foxstatistics/DefaultEnvironment$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/foxstatistics/DefaultEnvironment;->f(Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Lcom/tantanapp/foxstatistics/DefaultEnvironment;


# direct methods
.method public constructor <init>(Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$b;->c:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$b;->b:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$b;->c:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$b;->a:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$b;->b:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method
