.class public final synthetic Ll/lo8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lo8;->a:Ljava/lang/Runnable;

    iput-boolean p2, p0, Ll/lo8;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lo8;->a:Ljava/lang/Runnable;

    iget-boolean p0, p0, Ll/lo8;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->M0(Ljava/lang/Runnable;Z)V

    return-void
.end method
