.class public Ll/of7$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/of7;->E(Lcom/p1/mobile/android/app/Act;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/l4g0;

.field public final synthetic b:Ll/kcg0;

.field public final synthetic c:Ll/of7;


# direct methods
.method public constructor <init>(Ll/of7;Ll/l4g0;Ll/kcg0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/of7$c;->c:Ll/of7;

    .line 2
    .line 3
    iput-object p2, p0, Ll/of7$c;->a:Ll/l4g0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/of7$c;->b:Ll/kcg0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/of7$c;->a:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/of7$c;->b:Ll/kcg0;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/of7$c;->b:Ll/kcg0;

    .line 15
    .line 16
    invoke-interface {p1}, Ll/kcg0;->isUnsubscribed()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/of7$c;->b:Ll/kcg0;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method
