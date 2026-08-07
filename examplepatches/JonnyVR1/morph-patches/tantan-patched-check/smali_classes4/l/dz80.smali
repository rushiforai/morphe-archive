.class public final synthetic Ll/dz80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/customized/result/a;

.field public final synthetic b:Ll/yna$a;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/customized/result/a;Ll/yna$a;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dz80;->a:Lcom/p1/mobile/putong/core/newui/customized/result/a;

    iput-object p2, p0, Ll/dz80;->b:Ll/yna$a;

    iput p3, p0, Ll/dz80;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dz80;->a:Lcom/p1/mobile/putong/core/newui/customized/result/a;

    iget-object v1, p0, Ll/dz80;->b:Ll/yna$a;

    iget p0, p0, Ll/dz80;->c:I

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/customized/result/a;->E(Lcom/p1/mobile/putong/core/newui/customized/result/a;Ll/yna$a;ILandroid/view/View;)V

    return-void
.end method
