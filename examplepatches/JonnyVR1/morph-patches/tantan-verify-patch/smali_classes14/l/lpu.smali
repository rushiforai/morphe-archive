.class public final synthetic Ll/lpu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/spu;


# direct methods
.method public synthetic constructor <init>(Ll/spu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lpu;->a:Ll/spu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lpu;->a:Ll/spu;

    check-cast p1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatToast;

    invoke-static {p0, p1}, Ll/spu;->S2(Ll/spu;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatToast;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
