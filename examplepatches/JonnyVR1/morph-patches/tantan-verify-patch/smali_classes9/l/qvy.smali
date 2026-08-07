.class public final synthetic Ll/qvy;
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
    new-instance p0, Ll/bkj0;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    check-cast p2, Ll/pf60;

    check-cast p3, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-direct {p0, p1, p2, p3}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0
.end method
