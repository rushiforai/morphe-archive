.class public final synthetic Ll/s7q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s7q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;

    iput p2, p0, Ll/s7q;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s7q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;

    iget p0, p0, Ll/s7q;->b:I

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;->y(Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$a;ILandroid/view/View;)V

    return-void
.end method
