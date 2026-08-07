.class public final synthetic Ll/gku;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jku;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lv/VRadioButton;


# direct methods
.method public synthetic constructor <init>(Ll/jku;Ll/y20;Lv/VRadioButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gku;->a:Ll/jku;

    iput-object p2, p0, Ll/gku;->b:Ll/y20;

    iput-object p3, p0, Ll/gku;->c:Lv/VRadioButton;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gku;->a:Ll/jku;

    iget-object v1, p0, Ll/gku;->b:Ll/y20;

    iget-object p0, p0, Ll/gku;->c:Lv/VRadioButton;

    invoke-static {v0, v1, p0, p1}, Ll/jku;->a(Ll/jku;Ll/y20;Lv/VRadioButton;Landroid/view/View;)V

    return-void
.end method
