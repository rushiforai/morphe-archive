.class public final synthetic Ll/zg40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/y20;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zg40;->a:Ll/y20;

    iput-boolean p2, p0, Ll/zg40;->b:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zg40;->a:Ll/y20;

    iget-boolean p0, p0, Ll/zg40;->b:Z

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/NewQuickChatAudioHeaderUserView;->l0(Ll/y20;ZLandroid/view/View;)V

    return-void
.end method
