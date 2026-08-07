.class public final synthetic Ll/n5u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n5u;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;

    iput-object p2, p0, Ll/n5u;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n5u;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;

    iget-object p0, p0, Ll/n5u;->b:Ljava/util/List;

    check-cast p1, Ll/p5u;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->m(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;Ljava/util/List;Ll/p5u;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
