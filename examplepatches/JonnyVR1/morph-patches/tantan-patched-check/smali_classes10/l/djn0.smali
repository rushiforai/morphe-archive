.class public final synthetic Ll/djn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jjn0;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ll/jjn0;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/djn0;->a:Ll/jjn0;

    iput-object p2, p0, Ll/djn0;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/djn0;->a:Ll/jjn0;

    iget-object p0, p0, Ll/djn0;->b:Ljava/util/ArrayList;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;

    invoke-static {v0, p0, p1}, Ll/jjn0;->I(Ll/jjn0;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;)V

    return-void
.end method
