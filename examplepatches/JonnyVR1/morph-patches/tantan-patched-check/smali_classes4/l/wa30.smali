.class public final synthetic Ll/wa30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroidx/fragment/app/Fragment;


# direct methods
.method public synthetic constructor <init>(Landroidx/fragment/app/Fragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wa30;->a:Landroidx/fragment/app/Fragment;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wa30;->a:Landroidx/fragment/app/Fragment;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->Y2(Landroidx/fragment/app/Fragment;Landroid/os/Bundle;)V

    return-void
.end method
