.class public final synthetic Ll/mn20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pn20;


# direct methods
.method public synthetic constructor <init>(Ll/pn20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mn20;->a:Ll/pn20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mn20;->a:Ll/pn20;

    invoke-static {p0, p1}, Ll/pn20;->i(Ll/pn20;Landroid/view/View;)V

    return-void
.end method
