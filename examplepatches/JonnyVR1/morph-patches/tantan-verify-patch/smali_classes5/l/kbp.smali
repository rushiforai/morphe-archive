.class public final synthetic Ll/kbp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lkotlin/jvm/internal/Ref$BooleanRef;

.field public final synthetic b:Ll/fbp$c;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/internal/Ref$BooleanRef;Ll/fbp$c;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kbp;->a:Lkotlin/jvm/internal/Ref$BooleanRef;

    iput-object p2, p0, Ll/kbp;->b:Ll/fbp$c;

    iput-object p3, p0, Ll/kbp;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kbp;->a:Lkotlin/jvm/internal/Ref$BooleanRef;

    iget-object v1, p0, Ll/kbp;->b:Ll/fbp$c;

    iget-object p0, p0, Ll/kbp;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Ll/fbp$c;->y(Lkotlin/jvm/internal/Ref$BooleanRef;Ll/fbp$c;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
