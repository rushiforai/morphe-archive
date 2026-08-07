.class public final synthetic Ll/u05;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/t05$b;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatPartnerText;


# direct methods
.method public synthetic constructor <init>(Ll/t05$b;Lcom/p1/mobile/putong/core/data/ChatPartnerText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u05;->a:Ll/t05$b;

    iput-object p2, p0, Ll/u05;->b:Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u05;->a:Ll/t05$b;

    iget-object p0, p0, Ll/u05;->b:Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    invoke-static {v0, p0, p1}, Ll/t05$b;->E(Ll/t05$b;Lcom/p1/mobile/putong/core/data/ChatPartnerText;Landroid/view/View;)V

    return-void
.end method
