.class public final synthetic Ll/jud0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/scj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    check-cast p2, Lcom/p1/mobile/putong/data/Counter;

    check-cast p3, Ll/uxj0;

    invoke-static {p1, p2, p3}, Ll/lud0;->k(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Counter;Ll/uxj0;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
