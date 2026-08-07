.class public final synthetic Ll/s96;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/app/PutongAct;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/s96;->a:Z

    iput-object p2, p0, Ll/s96;->b:Lcom/p1/mobile/putong/app/PutongAct;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/s96;->a:Z

    iget-object p0, p0, Ll/s96;->b:Lcom/p1/mobile/putong/app/PutongAct;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemGoogleAdView;->a(ZLcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)V

    return-void
.end method
