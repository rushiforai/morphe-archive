.class public final synthetic Ll/ao8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Landroid/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Landroid/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ao8;->a:Ll/y20;

    iput-object p2, p0, Ll/ao8;->b:Landroid/app/Dialog;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ao8;->a:Ll/y20;

    iget-object p0, p0, Ll/ao8;->b:Landroid/app/Dialog;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->D(Ll/y20;Landroid/app/Dialog;Ljava/lang/String;)V

    return-void
.end method
