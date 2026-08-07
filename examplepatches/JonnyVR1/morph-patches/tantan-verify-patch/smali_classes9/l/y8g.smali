.class public final synthetic Ll/y8g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/d9g;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;


# direct methods
.method public synthetic constructor <init>(Ll/d9g;Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y8g;->a:Ll/d9g;

    iput-object p2, p0, Ll/y8g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y8g;->a:Ll/d9g;

    iget-object p0, p0, Ll/y8g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    check-cast p1, Ll/a8g;

    invoke-static {v0, p0, p1}, Ll/d9g;->X3(Ll/d9g;Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;Ll/a8g;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
