.class public final synthetic Ll/opk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# instance fields
.field public final synthetic a:Ll/hqk0;


# direct methods
.method public synthetic constructor <init>(Ll/hqk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/opk0;->a:Ll/hqk0;

    return-void
.end method


# virtual methods
.method public final onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/opk0;->a:Ll/hqk0;

    invoke-static {p0, p1, p2, p3}, Ll/hqk0;->R3(Ll/hqk0;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method
