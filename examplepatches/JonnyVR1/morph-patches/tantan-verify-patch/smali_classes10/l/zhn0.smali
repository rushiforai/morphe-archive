.class public final synthetic Ll/zhn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ain0;

.field public final synthetic b:Lcom/tantan/live/eventbus/LiveEventBus;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/ain0;Lcom/tantan/live/eventbus/LiveEventBus;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zhn0;->a:Ll/ain0;

    iput-object p2, p0, Ll/zhn0;->b:Lcom/tantan/live/eventbus/LiveEventBus;

    iput p3, p0, Ll/zhn0;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zhn0;->a:Ll/ain0;

    iget-object v1, p0, Ll/zhn0;->b:Lcom/tantan/live/eventbus/LiveEventBus;

    iget p0, p0, Ll/zhn0;->c:I

    invoke-static {v0, v1, p0}, Ll/ain0;->a(Ll/ain0;Lcom/tantan/live/eventbus/LiveEventBus;I)V

    return-void
.end method
