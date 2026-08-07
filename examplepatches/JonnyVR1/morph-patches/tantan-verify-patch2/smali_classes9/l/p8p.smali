.class public final synthetic Ll/p8p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Ll/w8p;


# direct methods
.method public synthetic constructor <init>(Ll/w8p;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p8p;->a:Ll/w8p;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p8p;->a:Ll/w8p;

    invoke-static {p0, p1}, Ll/w8p;->N(Ll/w8p;Landroid/content/DialogInterface;)V

    return-void
.end method
