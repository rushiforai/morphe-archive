.class public final synthetic Ll/esz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tvz;

.field public final synthetic b:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;


# direct methods
.method public synthetic constructor <init>(Ll/tvz;Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/esz;->a:Ll/tvz;

    iput-object p2, p0, Ll/esz;->b:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/esz;->a:Ll/tvz;

    iget-object p0, p0, Ll/esz;->b:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    invoke-static {v0, p0}, Ll/tvz;->D9(Ll/tvz;Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;)V

    return-void
.end method
