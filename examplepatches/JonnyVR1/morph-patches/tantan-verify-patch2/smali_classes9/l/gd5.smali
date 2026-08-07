.class public final synthetic Ll/gd5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/nd5;


# direct methods
.method public synthetic constructor <init>(Ll/nd5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gd5;->a:Ll/nd5;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gd5;->a:Ll/nd5;

    invoke-static {p0, p1}, Ll/nd5;->g(Ll/nd5;Landroid/view/View;)V

    return-void
.end method
