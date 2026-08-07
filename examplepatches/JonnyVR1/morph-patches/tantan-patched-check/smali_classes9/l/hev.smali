.class public final synthetic Ll/hev;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/iev;


# direct methods
.method public synthetic constructor <init>(Ll/iev;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hev;->a:Ll/iev;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hev;->a:Ll/iev;

    invoke-static {p0, p1}, Ll/iev;->a(Ll/iev;Landroid/content/DialogInterface;)V

    return-void
.end method
