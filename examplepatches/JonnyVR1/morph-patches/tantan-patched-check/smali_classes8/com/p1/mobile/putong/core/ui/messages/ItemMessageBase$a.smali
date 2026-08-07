.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->I(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/clz;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;Ll/clz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase$a;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase$a;->a:Ll/clz;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase$a;->a:Ll/clz;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase$a;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/clz;->C3(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
