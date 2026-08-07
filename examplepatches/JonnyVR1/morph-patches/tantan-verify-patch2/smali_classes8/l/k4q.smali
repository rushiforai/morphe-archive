.class public final synthetic Ll/k4q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/CommonTipBox;

.field public final synthetic b:Ljava/util/HashMap;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/CommonTipBox;Ljava/util/HashMap;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k4q;->a:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    iput-object p2, p0, Ll/k4q;->b:Ljava/util/HashMap;

    iput-object p3, p0, Ll/k4q;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k4q;->a:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    iget-object v1, p0, Ll/k4q;->b:Ljava/util/HashMap;

    iget-object p0, p0, Ll/k4q;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBoxV2;->P(Lcom/p1/mobile/putong/core/data/CommonTipBox;Ljava/util/HashMap;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
