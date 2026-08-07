.class public final synthetic Ll/chp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


# instance fields
.field public final synthetic a:Ll/nhp0;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/nhp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/chp0;->a:Ll/nhp0;

    iput-object p2, p0, Ll/chp0;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/chp0;->a:Ll/nhp0;

    iget-object p0, p0, Ll/chp0;->b:Landroid/view/View;

    invoke-static {v0, p0, p1, p2}, Ll/nhp0;->H(Ll/nhp0;Landroid/view/View;Landroid/widget/RadioGroup;I)V

    return-void
.end method
