.class public final synthetic Ll/bjn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/fjn;


# direct methods
.method public synthetic constructor <init>(Ll/fjn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bjn;->a:Ll/fjn;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bjn;->a:Ll/fjn;

    invoke-static {p0, p1}, Ll/fjn;->L3(Ll/fjn;Landroid/content/DialogInterface;)V

    return-void
.end method
