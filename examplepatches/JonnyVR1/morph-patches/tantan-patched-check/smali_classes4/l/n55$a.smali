.class public Ll/n55$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n55;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/n55;


# direct methods
.method public constructor <init>(Ll/n55;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n55$a;->a:Ll/n55;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/n55$a;->a:Ll/n55;

    .line 2
    .line 3
    iget v0, p1, Ll/n55;->r:I

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p1, Ll/n55;->s:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 8
    .line 9
    iget-object v2, p1, Ll/n55;->t:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 10
    .line 11
    invoke-virtual {p1, v0, v1, v2}, Ll/n55;->K(ILcom/p1/mobile/putong/core/data/CityCData;Lcom/p1/mobile/putong/core/data/CityCBanner;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/n55$a;->a:Ll/n55;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput p1, p0, Ll/n55;->r:I

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p1}, Ll/n55;->dismiss()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
