.class public final synthetic Ll/kn8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VText;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/messages/b;


# direct methods
.method public synthetic constructor <init>(Lv/VText;Lcom/p1/mobile/putong/core/newui/messages/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kn8;->a:Lv/VText;

    iput-object p2, p0, Ll/kn8;->b:Lcom/p1/mobile/putong/core/newui/messages/b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kn8;->a:Lv/VText;

    iget-object p0, p0, Ll/kn8;->b:Lcom/p1/mobile/putong/core/newui/messages/b;

    check-cast p1, Ll/vg60;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->L(Lv/VText;Lcom/p1/mobile/putong/core/newui/messages/b;Ll/vg60;)V

    return-void
.end method
