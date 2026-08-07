.class public final synthetic Ll/myp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qyp;

.field public final synthetic b:Lcom/p1/mobile/putong/data/JailedGroupChat;

.field public final synthetic c:Lv/VText;


# direct methods
.method public synthetic constructor <init>(Ll/qyp;Lcom/p1/mobile/putong/data/JailedGroupChat;Lv/VText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/myp;->a:Ll/qyp;

    iput-object p2, p0, Ll/myp;->b:Lcom/p1/mobile/putong/data/JailedGroupChat;

    iput-object p3, p0, Ll/myp;->c:Lv/VText;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/myp;->a:Ll/qyp;

    iget-object v1, p0, Ll/myp;->b:Lcom/p1/mobile/putong/data/JailedGroupChat;

    iget-object p0, p0, Ll/myp;->c:Lv/VText;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, p0, p1}, Ll/qyp;->g(Ll/qyp;Lcom/p1/mobile/putong/data/JailedGroupChat;Lv/VText;Ljava/lang/Long;)V

    return-void
.end method
