.class public final synthetic Llvo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnwo;


# instance fields
.field public final synthetic a:Lnxo;


# direct methods
.method public synthetic constructor <init>(Lnxo;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llvo;->a:Lnxo;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object p0, p0, Llvo;->a:Lnxo;

    iget-object p0, p0, Lnxo;->s:Lcom/opera/ad/view/VolumeMutableButton;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
