.class public Lcom/p1/mobile/android/app/Act$n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/l4g0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/l4g0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Act$n;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/android/app/Act$n;->a:Ll/l4g0;

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
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act$n;->a:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$n;->a:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
