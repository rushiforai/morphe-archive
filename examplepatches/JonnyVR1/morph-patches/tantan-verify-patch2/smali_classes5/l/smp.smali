.class public final synthetic Ll/smp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tmp$a;

.field public final synthetic b:Landroid/widget/ScrollView;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;


# direct methods
.method public synthetic constructor <init>(Ll/tmp$a;Landroid/widget/ScrollView;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/smp;->a:Ll/tmp$a;

    iput-object p2, p0, Ll/smp;->b:Landroid/widget/ScrollView;

    iput-object p3, p0, Ll/smp;->c:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/smp;->a:Ll/tmp$a;

    iget-object v1, p0, Ll/smp;->b:Landroid/widget/ScrollView;

    iget-object p0, p0, Ll/smp;->c:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    invoke-static {v0, v1, p0}, Ll/tmp$a;->a(Ll/tmp$a;Landroid/widget/ScrollView;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    return-void
.end method
