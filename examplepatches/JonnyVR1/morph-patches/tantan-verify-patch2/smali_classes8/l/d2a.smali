.class public final synthetic Ll/d2a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/e2a$a;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Sticker;


# direct methods
.method public synthetic constructor <init>(Ll/e2a$a;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d2a;->a:Ll/e2a$a;

    iput-object p2, p0, Ll/d2a;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d2a;->a:Ll/e2a$a;

    iget-object p0, p0, Ll/d2a;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    invoke-static {v0, p0, p1}, Ll/e2a$a;->s(Ll/e2a$a;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/view/View;)V

    return-void
.end method
