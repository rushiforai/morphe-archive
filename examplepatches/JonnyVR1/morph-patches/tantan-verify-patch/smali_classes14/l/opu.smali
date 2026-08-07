.class public final synthetic Ll/opu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/spu;


# direct methods
.method public synthetic constructor <init>(Ll/spu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/opu;->a:Ll/spu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/opu;->a:Ll/spu;

    check-cast p1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;

    invoke-static {p0, p1}, Ll/spu;->U2(Ll/spu;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;)V

    return-void
.end method
