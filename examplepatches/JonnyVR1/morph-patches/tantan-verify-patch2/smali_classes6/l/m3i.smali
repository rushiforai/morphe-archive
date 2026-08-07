.class public final synthetic Ll/m3i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;

.field public final synthetic b:Ll/c2i;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;Ll/c2i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m3i;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;

    iput-object p2, p0, Ll/m3i;->b:Ll/c2i;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m3i;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;

    iget-object p0, p0, Ll/m3i;->b:Ll/c2i;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->G(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;Ll/c2i;Landroid/view/View;)V

    return-void
.end method
