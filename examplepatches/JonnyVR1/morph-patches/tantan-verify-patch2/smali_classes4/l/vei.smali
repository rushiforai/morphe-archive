.class public final synthetic Ll/vei;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

.field public final synthetic b:Ll/uei;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/uei;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    iput-object p2, p0, Ll/vei;->b:Ll/uei;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    iget-object p0, p0, Ll/vei;->b:Ll/uei;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVipGuideCardView;->b(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/uei;Landroid/view/View;)V

    return-void
.end method
