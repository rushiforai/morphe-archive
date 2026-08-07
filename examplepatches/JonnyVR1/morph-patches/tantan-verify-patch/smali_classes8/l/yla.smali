.class public final synthetic Ll/yla;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bma;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Sticker;


# direct methods
.method public synthetic constructor <init>(Ll/bma;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yla;->a:Ll/bma;

    iput-object p2, p0, Ll/yla;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yla;->a:Ll/bma;

    iget-object p0, p0, Ll/yla;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/bma;->l0(Ll/bma;Lcom/p1/mobile/putong/core/data/Sticker;Ll/uxj0;)V

    return-void
.end method
