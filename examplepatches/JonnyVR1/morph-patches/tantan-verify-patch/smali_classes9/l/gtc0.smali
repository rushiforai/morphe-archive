.class public final synthetic Ll/gtc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ltc0;


# direct methods
.method public synthetic constructor <init>(Ll/ltc0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gtc0;->a:Ll/ltc0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gtc0;->a:Ll/ltc0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/RedPacket;

    invoke-static {p0, p1}, Ll/ltc0;->m0(Ll/ltc0;Lcom/p1/mobile/putong/core/data/RedPacket;)V

    return-void
.end method
