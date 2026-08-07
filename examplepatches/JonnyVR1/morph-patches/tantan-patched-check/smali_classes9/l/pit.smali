.class public final synthetic Ll/pit;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/qit;


# direct methods
.method public synthetic constructor <init>(Ll/qit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pit;->a:Ll/qit;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pit;->a:Ll/qit;

    invoke-static {p0, p1}, Ll/qit;->F(Ll/qit;Landroid/view/View;)V

    return-void
.end method
