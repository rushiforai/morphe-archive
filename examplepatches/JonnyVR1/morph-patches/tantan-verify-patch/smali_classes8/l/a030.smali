.class public final synthetic Ll/a030;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b030;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;


# direct methods
.method public synthetic constructor <init>(Ll/b030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a030;->a:Ll/b030;

    iput-object p2, p0, Ll/a030;->b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a030;->a:Ll/b030;

    iget-object p0, p0, Ll/a030;->b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/b030;->e(Ll/b030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/uxj0;)V

    return-void
.end method
