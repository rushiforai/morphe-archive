.class public final synthetic Ll/a0b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a0b0;->a:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a0b0;->a:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Ljava/util/Map;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendGreetView;->T(Lcom/p1/mobile/putong/data/User;Ljava/util/Map;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
