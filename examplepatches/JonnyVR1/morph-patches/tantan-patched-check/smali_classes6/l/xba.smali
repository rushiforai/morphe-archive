.class public final synthetic Ll/xba;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xba;->a:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xba;->a:Ljava/util/Map;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;

    invoke-static {p0, p1}, Ll/jka;->q1(Ljava/util/Map;Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;)V

    return-void
.end method
