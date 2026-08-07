.class public final synthetic Ll/hl2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/il2;

.field public final synthetic b:Ll/bkg;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/il2;Ll/bkg;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hl2;->a:Ll/il2;

    iput-object p2, p0, Ll/hl2;->b:Ll/bkg;

    iput p3, p0, Ll/hl2;->c:I

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hl2;->a:Ll/il2;

    iget-object v1, p0, Ll/hl2;->b:Ll/bkg;

    iget p0, p0, Ll/hl2;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/il2;->i(Ll/il2;Ll/bkg;ILandroid/content/DialogInterface;)V

    return-void
.end method
