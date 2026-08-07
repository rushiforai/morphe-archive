.class public final synthetic Ll/gp8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/z20;

.field public final synthetic b:Ljava/lang/StringBuilder;


# direct methods
.method public synthetic constructor <init>(Ll/z20;Ljava/lang/StringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gp8;->a:Ll/z20;

    iput-object p2, p0, Ll/gp8;->b:Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gp8;->a:Ll/z20;

    iget-object p0, p0, Ll/gp8;->b:Ljava/lang/StringBuilder;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->s0(Ll/z20;Ljava/lang/StringBuilder;Ljava/lang/Throwable;)V

    return-void
.end method
