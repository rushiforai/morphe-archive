.class public final synthetic Ll/hcw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pdw;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/pdw;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hcw;->a:Ll/pdw;

    iput-object p2, p0, Ll/hcw;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/hcw;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hcw;->a:Ll/pdw;

    iget-object v1, p0, Ll/hcw;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/hcw;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCompleteLayout;->a(Ll/pdw;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
