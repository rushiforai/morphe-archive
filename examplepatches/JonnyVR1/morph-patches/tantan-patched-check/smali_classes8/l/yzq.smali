.class public final synthetic Ll/yzq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yzq;->a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

    iput p2, p0, Ll/yzq;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yzq;->a:Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;

    iget p0, p0, Ll/yzq;->b:I

    check-cast p1, Lcom/p1/mobile/putong/core/data/Sticker;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;->s(Lcom/p1/mobile/putong/core/ui/messages/Keyboard$b;ILcom/p1/mobile/putong/core/data/Sticker;)V

    return-void
.end method
