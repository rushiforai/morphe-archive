.class public final synthetic Ll/vm8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vm8;->a:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vm8;->a:Lcom/p1/mobile/putong/data/Media;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->a0(Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
