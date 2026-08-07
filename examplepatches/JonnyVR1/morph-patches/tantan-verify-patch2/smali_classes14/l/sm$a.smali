.class public Ll/sm$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sm;->i0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Ll/l4g0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ll/l4g0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/sm$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Ll/sm$a;->b:Ljava/lang/Runnable;

    .line 4
    .line 5
    iput-object p3, p0, Ll/sm$a;->c:Ll/l4g0;

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
    .locals 1

    .line 1
    iget-object p1, p0, Ll/sm$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v0, p0, Ll/sm$a;->b:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/sm$a;->c:Ll/l4g0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
