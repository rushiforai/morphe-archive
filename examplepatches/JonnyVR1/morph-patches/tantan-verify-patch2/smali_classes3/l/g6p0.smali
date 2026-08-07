.class public final synthetic Ll/g6p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/i6p0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/i6p0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g6p0;->a:Ll/i6p0;

    iput-object p2, p0, Ll/g6p0;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g6p0;->a:Ll/i6p0;

    iget-object p0, p0, Ll/g6p0;->b:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Lcom/p1/mobile/putong/data/Followship;

    invoke-static {v0, p0, p1}, Ll/i6p0;->r4(Ll/i6p0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method
