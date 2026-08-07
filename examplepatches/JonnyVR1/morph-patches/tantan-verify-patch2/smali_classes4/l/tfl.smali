.class public final synthetic Ll/tfl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pl50;


# instance fields
.field public final synthetic a:Ll/tel;


# direct methods
.method public synthetic constructor <init>(Ll/tel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tfl;->a:Ll/tel;

    return-void
.end method


# virtual methods
.method public final a(Ll/xql;Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tfl;->a:Ll/tel;

    invoke-virtual {p0, p1, p2, p3}, Ll/tel;->y2(Ll/xql;Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    move-result-object p0

    return-object p0
.end method
