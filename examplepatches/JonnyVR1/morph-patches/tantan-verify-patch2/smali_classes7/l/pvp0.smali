.class public final synthetic Ll/pvp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/tvp0;


# direct methods
.method public synthetic constructor <init>(Ll/tvp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pvp0;->a:Ll/tvp0;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pvp0;->a:Ll/tvp0;

    invoke-static {p0, p1}, Ll/tvp0;->A(Ll/tvp0;Landroid/content/DialogInterface;)V

    return-void
.end method
