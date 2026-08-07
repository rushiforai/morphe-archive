.class public final synthetic Ll/z4u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;

.field public final synthetic b:Ll/p5u;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ll/p5u;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z4u;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;

    iput-object p2, p0, Ll/z4u;->b:Ll/p5u;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z4u;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;

    iget-object p0, p0, Ll/z4u;->b:Ll/p5u;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->y(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ll/p5u;Ljava/lang/Long;)V

    return-void
.end method
