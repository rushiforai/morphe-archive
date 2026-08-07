.class public final synthetic Ll/i86;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthMesInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i86;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/i86;->b:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i86;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/i86;->b:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthMesInfo;Landroid/view/View;)V

    return-void
.end method
