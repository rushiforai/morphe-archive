.class public final synthetic Ll/p7v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/q7v;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/q7v;Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p7v;->a:Ll/q7v;

    iput-object p2, p0, Ll/p7v;->b:Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;

    iput p3, p0, Ll/p7v;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p7v;->a:Ll/q7v;

    iget-object v1, p0, Ll/p7v;->b:Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;

    iget p0, p0, Ll/p7v;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/q7v;->e0(Ll/q7v;Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;ILandroid/view/View;)V

    return-void
.end method
