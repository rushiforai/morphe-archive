.class public final synthetic Ll/qhj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/whj;


# direct methods
.method public synthetic constructor <init>(Ll/whj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qhj;->a:Ll/whj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qhj;->a:Ll/whj;

    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;

    invoke-static {p0, p1}, Ll/whj;->R3(Ll/whj;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
