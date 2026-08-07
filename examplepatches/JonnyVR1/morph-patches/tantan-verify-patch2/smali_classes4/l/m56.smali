.class public final synthetic Ll/m56;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/g56;

.field public final synthetic b:Ll/vg60;


# direct methods
.method public synthetic constructor <init>(Ll/g56;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m56;->a:Ll/g56;

    iput-object p2, p0, Ll/m56;->b:Ll/vg60;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m56;->a:Ll/g56;

    iget-object p0, p0, Ll/m56;->b:Ll/vg60;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchHeadLayout;->e(Ll/g56;Ll/vg60;Landroid/view/View;)V

    return-void
.end method
