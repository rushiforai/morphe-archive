.class public final synthetic Ll/ima;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fma$d;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Sticker;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/fma$d;Lcom/p1/mobile/putong/core/data/Sticker;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ima;->a:Ll/fma$d;

    iput-object p2, p0, Ll/ima;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    iput p3, p0, Ll/ima;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ima;->a:Ll/fma$d;

    iget-object v1, p0, Ll/ima;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    iget p0, p0, Ll/ima;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/fma$d;->G(Ll/fma$d;Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V

    return-void
.end method
