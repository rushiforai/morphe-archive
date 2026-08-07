.class public final synthetic Ll/dku;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lv/VRadioButton;


# direct methods
.method public synthetic constructor <init>(Lv/VRadioButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dku;->a:Lv/VRadioButton;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dku;->a:Lv/VRadioButton;

    invoke-static {p0, p1}, Ll/jku;->c(Lv/VRadioButton;Landroid/view/View;)V

    return-void
.end method
