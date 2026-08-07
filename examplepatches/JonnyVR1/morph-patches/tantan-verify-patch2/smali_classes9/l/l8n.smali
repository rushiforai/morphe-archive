.class public final synthetic Ll/l8n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Ll/o8n;


# direct methods
.method public synthetic constructor <init>(Ll/o8n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l8n;->a:Ll/o8n;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l8n;->a:Ll/o8n;

    invoke-static {p0, p1}, Ll/o8n;->i(Ll/o8n;Landroid/content/DialogInterface;)V

    return-void
.end method
