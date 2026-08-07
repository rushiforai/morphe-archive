.class public final synthetic Ll/k4j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/q4j0;


# direct methods
.method public synthetic constructor <init>(Ll/q4j0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k4j0;->a:Ll/q4j0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k4j0;->a:Ll/q4j0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;

    invoke-virtual {p0, p1}, Ll/q4j0;->b4(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;)V

    return-void
.end method
