.class public final synthetic Ll/de2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ge2;


# direct methods
.method public synthetic constructor <init>(Ll/ge2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/de2;->a:Ll/ge2;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/de2;->a:Ll/ge2;

    invoke-static {p0, p1}, Ll/ge2;->H(Ll/ge2;Landroid/view/View;)V

    return-void
.end method
