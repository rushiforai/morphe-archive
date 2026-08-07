.class public Ll/qtk$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qtk;->a1(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Ll/pej0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/l4g0;

.field public final synthetic b:Ll/x20;


# direct methods
.method public constructor <init>(Ll/l4g0;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qtk$a;->a:Ll/l4g0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qtk$a;->b:Ll/x20;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/qtk$a;->a:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/qtk$a;->b:Ll/x20;

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
    iget-object p0, p0, Ll/qtk$a;->b:Ll/x20;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/x20;->call()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
