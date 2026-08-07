.class public Ll/mm6$a;
.super Lcom/tantanapp/common/data/orm/Filter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mm6;->r0()Lcom/tantanapp/common/data/orm/Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/orm/Filter<",
        "Lcom/p1/mobile/putong/core/data/Conversation;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/mm6;


# direct methods
.method public constructor <init>(Ll/mm6;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mm6$a;->a:Ll/mm6;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/Filter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public emit()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 0

    .line 1
    sget-object p0, Lcom/tantanapp/common/data/orm/SqlSegment;->TRUE:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 2
    .line 3
    return-object p0
.end method

.method public emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 0

    .line 1
    sget-object p0, Lcom/tantanapp/common/data/orm/SqlSegment;->TRUE:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic filter(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mm6$a;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
