.class public Ll/snc0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/snc0;->j(Landroid/view/View;Ljava/util/List;ZLcom/p1/mobile/android/app/Act;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/pn50;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/pn50;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/snc0$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Ll/snc0$b;->b:Ll/pn50;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onDismiss()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/snc0$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Ll/qzz;->n1:Ll/iwl;

    .line 12
    .line 13
    iget-object p0, p0, Ll/snc0$b;->b:Ll/pn50;

    .line 14
    .line 15
    invoke-interface {v0, p0}, Ll/iwl;->B(Ll/pn50;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
