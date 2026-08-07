.class public final synthetic Ll/hsv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/Collection;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Collection;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hsv;->a:Ljava/util/Collection;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hsv;->a:Ljava/util/Collection;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    invoke-static {p0, p1}, Ll/isv;->a(Ljava/util/Collection;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
