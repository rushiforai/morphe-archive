.class public final synthetic Ll/ts40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ws40;


# direct methods
.method public synthetic constructor <init>(Ll/ws40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ts40;->a:Ll/ws40;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ts40;->a:Ll/ws40;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    invoke-static {p0, p1}, Ll/ws40;->L3(Ll/ws40;Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
