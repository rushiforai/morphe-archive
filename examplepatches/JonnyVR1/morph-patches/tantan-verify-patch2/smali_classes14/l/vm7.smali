.class public final synthetic Ll/vm7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

.field public final synthetic b:[Ll/pf60;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vm7;->a:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    iput-object p2, p0, Ll/vm7;->b:[Ll/pf60;

    iput-object p3, p0, Ll/vm7;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vm7;->a:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    iget-object v1, p0, Ll/vm7;->b:[Ll/pf60;

    iget-object p0, p0, Ll/vm7;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/cn7;->j3(Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ljava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
