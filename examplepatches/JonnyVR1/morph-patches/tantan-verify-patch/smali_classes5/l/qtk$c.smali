.class public Ll/qtk$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k0f0$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qtk;->a1(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Ll/pej0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/pej0;


# direct methods
.method public constructor <init>(Ljava/util/List;Ll/pej0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qtk$c;->a:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qtk$c;->b:Ll/pej0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/qtk$c;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/ShareItemBean;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/ShareItemBean;->getAction()Ll/x20;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Ll/x20;->call()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/qtk$c;->b:Ll/pej0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
