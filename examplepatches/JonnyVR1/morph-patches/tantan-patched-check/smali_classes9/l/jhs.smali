.class public final synthetic Ll/jhs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/nhs;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lv/VRadioButton;


# direct methods
.method public synthetic constructor <init>(Ll/nhs;Ll/y20;Lv/VRadioButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jhs;->a:Ll/nhs;

    iput-object p2, p0, Ll/jhs;->b:Ll/y20;

    iput-object p3, p0, Ll/jhs;->c:Lv/VRadioButton;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jhs;->a:Ll/nhs;

    iget-object v1, p0, Ll/jhs;->b:Ll/y20;

    iget-object p0, p0, Ll/jhs;->c:Lv/VRadioButton;

    invoke-static {v0, v1, p0, p1}, Ll/nhs;->b(Ll/nhs;Ll/y20;Lv/VRadioButton;Landroid/view/View;)V

    return-void
.end method
