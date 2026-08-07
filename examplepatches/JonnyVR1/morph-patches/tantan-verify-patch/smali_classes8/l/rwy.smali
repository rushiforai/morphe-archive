.class public final synthetic Ll/rwy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/wwy;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Sticker;

.field public final synthetic c:Lv/VText;


# direct methods
.method public synthetic constructor <init>(Ll/wwy;Lcom/p1/mobile/putong/core/data/Sticker;Lv/VText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rwy;->a:Ll/wwy;

    iput-object p2, p0, Ll/rwy;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    iput-object p3, p0, Ll/rwy;->c:Lv/VText;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rwy;->a:Ll/wwy;

    iget-object v1, p0, Ll/rwy;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    iget-object p0, p0, Ll/rwy;->c:Lv/VText;

    invoke-static {v0, v1, p0, p1}, Ll/wwy;->N(Ll/wwy;Lcom/p1/mobile/putong/core/data/Sticker;Lv/VText;Landroid/view/View;)V

    return-void
.end method
