.class public Ll/w0r$i$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/w0r$i;->w(Landroid/view/View;Ljava/lang/String;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Sticker;

.field public final synthetic c:Ll/w0r$i;


# direct methods
.method public constructor <init>(Ll/w0r$i;Landroid/view/View;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/w0r$i$a;->c:Ll/w0r$i;

    .line 2
    .line 3
    iput-object p2, p0, Ll/w0r$i$a;->a:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Ll/w0r$i$a;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 1
    iget-object p1, p0, Ll/w0r$i$a;->c:Ll/w0r$i;

    .line 2
    .line 3
    iget-object v0, p0, Ll/w0r$i$a;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/w0r$i$a;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    .line 10
    .line 11
    invoke-static {p1, v0, v1}, Ll/w0r$i;->s(Ll/w0r$i;Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Sticker;)Landroid/widget/PopupWindow;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/w0r$i$a;->c:Ll/w0r$i;

    .line 16
    .line 17
    iget-object p0, p0, Ll/w0r$i$a;->a:Landroid/view/View;

    .line 18
    .line 19
    invoke-static {v0, p1, p0}, Ll/w0r$i;->t(Ll/w0r$i;Landroid/widget/PopupWindow;Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0
.end method
