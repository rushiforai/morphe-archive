.class public final synthetic Ll/bl2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/il2;


# direct methods
.method public synthetic constructor <init>(Ll/il2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bl2;->a:Ll/il2;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bl2;->a:Ll/il2;

    invoke-static {p0, p1}, Ll/il2;->a(Ll/il2;Landroid/content/DialogInterface;)V

    return-void
.end method
