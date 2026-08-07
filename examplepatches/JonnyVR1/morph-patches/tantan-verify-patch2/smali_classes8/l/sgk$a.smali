.class public Ll/sgk$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/b$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sgk;->G(Landroid/view/View;Lcom/p1/mobile/putong/core/data/ChatGroupMember;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

.field public final synthetic b:Ll/sgk;


# direct methods
.method public constructor <init>(Ll/sgk;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/sgk$a;->b:Ll/sgk;

    .line 2
    .line 3
    iput-object p2, p0, Ll/sgk$a;->a:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sgk$a;->a:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sgk$a;->b:Ll/sgk;

    .line 2
    .line 3
    invoke-static {p0}, Ll/sgk;->F(Ll/sgk;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
