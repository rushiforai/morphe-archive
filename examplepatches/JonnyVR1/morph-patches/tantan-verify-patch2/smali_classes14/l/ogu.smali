.class public final synthetic Ll/ogu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qgu;


# direct methods
.method public synthetic constructor <init>(Ll/qgu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ogu;->a:Ll/qgu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ogu;->a:Ll/qgu;

    check-cast p1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatAnchorCallResult;

    invoke-static {p0, p1}, Ll/qgu;->X2(Ll/qgu;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatAnchorCallResult;)V

    return-void
.end method
