.class public final synthetic Ll/yg40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/z20;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/z20;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yg40;->a:Ll/z20;

    iput-boolean p2, p0, Ll/yg40;->b:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yg40;->a:Ll/z20;

    iget-boolean p0, p0, Ll/yg40;->b:Z

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/NewQuickChatAudioHeaderUserView;->k0(Ll/z20;ZLandroid/view/View;)V

    return-void
.end method
