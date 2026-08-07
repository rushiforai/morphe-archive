.class public Ll/sm$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sm;->l0(Lcom/p1/mobile/android/app/Act;ZZZLl/x20;Ll/x20;Ll/y20;)Ll/pej0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/l4g0;


# direct methods
.method public constructor <init>(Ll/l4g0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/sm$d;->a:Ll/l4g0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    const-string p1, "e_other_signin_cancel"

    .line 2
    .line 3
    const-string v0, "p_other_signin_popup"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/sm$d;->a:Ll/l4g0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
