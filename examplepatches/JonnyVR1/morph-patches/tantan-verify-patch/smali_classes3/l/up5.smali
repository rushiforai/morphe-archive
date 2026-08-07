.class public final synthetic Ll/up5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Lkotlin/jvm/internal/Ref$FloatRef;

.field public final synthetic b:Lkotlin/jvm/internal/Ref$FloatRef;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/compliment/a;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/internal/Ref$FloatRef;Lkotlin/jvm/internal/Ref$FloatRef;Lcom/p1/mobile/putong/core/ui/compliment/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/up5;->a:Lkotlin/jvm/internal/Ref$FloatRef;

    iput-object p2, p0, Ll/up5;->b:Lkotlin/jvm/internal/Ref$FloatRef;

    iput-object p3, p0, Ll/up5;->c:Lcom/p1/mobile/putong/core/ui/compliment/a;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/up5;->a:Lkotlin/jvm/internal/Ref$FloatRef;

    iget-object v1, p0, Ll/up5;->b:Lkotlin/jvm/internal/Ref$FloatRef;

    iget-object p0, p0, Ll/up5;->c:Lcom/p1/mobile/putong/core/ui/compliment/a;

    invoke-static {v0, v1, p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/compliment/a;->n0(Lkotlin/jvm/internal/Ref$FloatRef;Lkotlin/jvm/internal/Ref$FloatRef;Lcom/p1/mobile/putong/core/ui/compliment/a;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
