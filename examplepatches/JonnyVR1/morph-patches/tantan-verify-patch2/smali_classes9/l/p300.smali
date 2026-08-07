.class public final synthetic Ll/p300;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/f400;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/f400;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p300;->a:Ll/f400;

    iput-object p2, p0, Ll/p300;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p300;->a:Ll/f400;

    iget-object p0, p0, Ll/p300;->b:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/f400;->j0(Ll/f400;Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V

    return-void
.end method
