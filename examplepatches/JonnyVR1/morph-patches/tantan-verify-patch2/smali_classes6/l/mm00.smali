.class public final synthetic Ll/mm00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zm00;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentMessage;


# direct methods
.method public synthetic constructor <init>(Ll/zm00;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mm00;->a:Ll/zm00;

    iput-object p2, p0, Ll/mm00;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mm00;->a:Ll/zm00;

    iget-object p0, p0, Ll/mm00;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/zm00;->i0(Ll/zm00;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V

    return-void
.end method
