.class public final synthetic Ll/wcj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cdj0;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentMessage;


# direct methods
.method public synthetic constructor <init>(Ll/cdj0;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wcj0;->a:Ll/cdj0;

    iput-object p2, p0, Ll/wcj0;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wcj0;->a:Ll/cdj0;

    iget-object p0, p0, Ll/wcj0;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/cdj0;->e0(Ll/cdj0;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/uxj0;)V

    return-void
.end method
