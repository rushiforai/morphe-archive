.class public final synthetic Ll/zre;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/bse;


# direct methods
.method public synthetic constructor <init>(Ll/bse;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zre;->a:Ll/bse;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zre;->a:Ll/bse;

    invoke-static {p0, p1}, Ll/bse;->b(Ll/bse;Landroid/content/DialogInterface;)V

    return-void
.end method
