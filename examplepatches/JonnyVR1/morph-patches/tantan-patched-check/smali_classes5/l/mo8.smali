.class public final synthetic Ll/mo8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/mo8;->a:Z

    iput-object p2, p0, Ll/mo8;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/mo8;->a:Z

    iget-object p0, p0, Ll/mo8;->b:Ljava/lang/Runnable;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->N0(ZLjava/lang/Runnable;)V

    return-void
.end method
