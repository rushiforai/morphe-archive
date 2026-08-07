.class public final synthetic Ll/p40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/q40;


# direct methods
.method public synthetic constructor <init>(Ll/q40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p40;->a:Ll/q40;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p40;->a:Ll/q40;

    invoke-static {p0, p1}, Ll/q40;->Q2(Ll/q40;Landroid/content/DialogInterface;)V

    return-void
.end method
