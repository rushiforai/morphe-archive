.class public final synthetic Ll/hma;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Ll/fma$d;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Sticker;


# direct methods
.method public synthetic constructor <init>(Ll/fma$d;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hma;->a:Ll/fma$d;

    iput-object p2, p0, Ll/hma;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hma;->a:Ll/fma$d;

    iget-object p0, p0, Ll/hma;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    invoke-static {v0, p0, p1}, Ll/fma$d;->F(Ll/fma$d;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
