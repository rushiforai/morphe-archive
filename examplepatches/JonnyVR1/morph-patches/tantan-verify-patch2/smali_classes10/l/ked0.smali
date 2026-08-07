.class public final synthetic Ll/ked0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Ll/zed0;


# direct methods
.method public synthetic constructor <init>(Ll/zed0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ked0;->a:Ll/zed0;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ked0;->a:Ll/zed0;

    invoke-static {p0, p1}, Ll/zed0;->D4(Ll/zed0;Landroid/content/DialogInterface;)V

    return-void
.end method
