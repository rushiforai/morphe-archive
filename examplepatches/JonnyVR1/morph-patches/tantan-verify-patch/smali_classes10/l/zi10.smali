.class public final synthetic Ll/zi10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cj10;


# direct methods
.method public synthetic constructor <init>(Ll/cj10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zi10;->a:Ll/cj10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zi10;->a:Ll/cj10;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage;

    invoke-static {p0, p1}, Ll/cj10;->N3(Ll/cj10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage;)V

    return-void
.end method
