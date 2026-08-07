.class public final synthetic Ll/gn8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/app/PutongAct;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gn8;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/gn8;->b:Lcom/p1/mobile/putong/app/PutongAct;

    iput-object p3, p0, Ll/gn8;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/gn8;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/gn8;->b:Lcom/p1/mobile/putong/app/PutongAct;

    iget-object v2, p0, Ll/gn8;->c:Ljava/lang/String;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->y0(Ljava/lang/String;Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method
