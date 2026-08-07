.class public final synthetic Ll/v4u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v4u;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;

    iput-boolean p2, p0, Ll/v4u;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v4u;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;

    iget-boolean p0, p0, Ll/v4u;->b:Z

    check-cast p1, Ll/p5u;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->v(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;ZLl/p5u;)V

    return-void
.end method
