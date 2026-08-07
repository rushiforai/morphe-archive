.class public final synthetic Ll/mqy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/nqy;


# direct methods
.method public synthetic constructor <init>(Ll/nqy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mqy;->a:Ll/nqy;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mqy;->a:Ll/nqy;

    invoke-static {p0, p1}, Ll/nqy;->a(Ll/nqy;Landroid/content/DialogInterface;)V

    return-void
.end method
