.class public final synthetic Ll/wgk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wgk0;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    iput-object p2, p0, Ll/wgk0;->b:Lcom/p1/mobile/putong/data/User;

    iput p3, p0, Ll/wgk0;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wgk0;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    iget-object v1, p0, Ll/wgk0;->b:Lcom/p1/mobile/putong/data/User;

    iget p0, p0, Ll/wgk0;->c:I

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->m1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;Lcom/p1/mobile/putong/data/User;I)V

    return-void
.end method
