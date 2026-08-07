.class public final synthetic Ll/jn8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/messages/b$a;


# instance fields
.field public final synthetic a:Ljava/util/Set;

.field public final synthetic b:Lv/VButton;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Set;Lv/VButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jn8;->a:Ljava/util/Set;

    iput-object p2, p0, Ll/jn8;->b:Lv/VButton;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/Set;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jn8;->a:Ljava/util/Set;

    iget-object p0, p0, Ll/jn8;->b:Lv/VButton;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->C(Ljava/util/Set;Lv/VButton;Ljava/util/Set;)V

    return-void
.end method
