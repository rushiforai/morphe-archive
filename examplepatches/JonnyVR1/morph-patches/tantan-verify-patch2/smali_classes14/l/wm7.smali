.class public final synthetic Ll/wm7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cn7;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

.field public final synthetic d:[Ll/pf60;

.field public final synthetic e:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/cn7;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wm7;->a:Ll/cn7;

    iput-object p2, p0, Ll/wm7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/wm7;->c:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    iput-object p4, p0, Ll/wm7;->d:[Ll/pf60;

    iput-object p5, p0, Ll/wm7;->e:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/wm7;->a:Ll/cn7;

    iget-object v1, p0, Ll/wm7;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/wm7;->c:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    iget-object v3, p0, Ll/wm7;->d:[Ll/pf60;

    iget-object v4, p0, Ll/wm7;->e:Ll/y20;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v5}, Ll/cn7;->a3(Ll/cn7;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;[Ll/pf60;Ll/y20;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
