.class public final synthetic Ll/mx9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    check-cast p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->R0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)I

    move-result p0

    return p0
.end method
