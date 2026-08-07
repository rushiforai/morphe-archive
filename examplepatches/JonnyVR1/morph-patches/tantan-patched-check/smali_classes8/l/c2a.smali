.class public final synthetic Ll/c2a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/e2a$a;

.field public final synthetic b:Lv/VCheckBox;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Sticker;

.field public final synthetic d:Lv/VText;


# direct methods
.method public synthetic constructor <init>(Ll/e2a$a;Lv/VCheckBox;Lcom/p1/mobile/putong/core/data/Sticker;Lv/VText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c2a;->a:Ll/e2a$a;

    iput-object p2, p0, Ll/c2a;->b:Lv/VCheckBox;

    iput-object p3, p0, Ll/c2a;->c:Lcom/p1/mobile/putong/core/data/Sticker;

    iput-object p4, p0, Ll/c2a;->d:Lv/VText;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c2a;->a:Ll/e2a$a;

    iget-object v1, p0, Ll/c2a;->b:Lv/VCheckBox;

    iget-object v2, p0, Ll/c2a;->c:Lcom/p1/mobile/putong/core/data/Sticker;

    iget-object p0, p0, Ll/c2a;->d:Lv/VText;

    invoke-static {v0, v1, v2, p0, p1}, Ll/e2a$a;->p(Ll/e2a$a;Lv/VCheckBox;Lcom/p1/mobile/putong/core/data/Sticker;Lv/VText;Landroid/view/View;)V

    return-void
.end method
