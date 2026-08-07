.class public final synthetic Ll/l4o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y8o;

.field public final synthetic b:Ll/m4o;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;


# direct methods
.method public synthetic constructor <init>(Ll/y8o;Ll/m4o;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l4o;->a:Ll/y8o;

    iput-object p2, p0, Ll/l4o;->b:Ll/m4o;

    iput-object p3, p0, Ll/l4o;->c:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l4o;->a:Ll/y8o;

    iget-object v1, p0, Ll/l4o;->b:Ll/m4o;

    iget-object p0, p0, Ll/l4o;->c:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    invoke-static {v0, v1, p0, p1}, Ll/m4o;->a(Ll/y8o;Ll/m4o;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Landroid/view/View;)V

    return-void
.end method
