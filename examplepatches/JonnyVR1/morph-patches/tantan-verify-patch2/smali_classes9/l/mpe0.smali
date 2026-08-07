.class public final synthetic Ll/mpe0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mpe0;->a:Landroid/app/Dialog;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mpe0;->a:Landroid/app/Dialog;

    invoke-static {p0}, Ll/ope0;->f0(Landroid/app/Dialog;)V

    return-void
.end method
