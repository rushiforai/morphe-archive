.class public final synthetic Ll/ycy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/idy;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/idy;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ycy;->a:Ll/idy;

    iput-object p2, p0, Ll/ycy;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ycy;->a:Ll/idy;

    iget-object p0, p0, Ll/ycy;->b:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-static {v0, p0, p1, p2}, Ll/idy;->o0(Ll/idy;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;I)V

    return-void
.end method
