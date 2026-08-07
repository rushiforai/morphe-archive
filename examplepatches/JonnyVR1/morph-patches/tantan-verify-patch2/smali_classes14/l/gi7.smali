.class public final synthetic Ll/gi7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/JoinCondition;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/JoinCondition;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gi7;->a:Lcom/p1/mobile/putong/core/data/JoinCondition;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gi7;->a:Lcom/p1/mobile/putong/core/data/JoinCondition;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/e;->B5(Lcom/p1/mobile/putong/core/data/JoinCondition;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method
