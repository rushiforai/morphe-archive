.class public final synthetic Ll/x01;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y01;


# direct methods
.method public synthetic constructor <init>(Ll/y01;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x01;->a:Ll/y01;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x01;->a:Ll/y01;

    invoke-static {p0, p1}, Ll/y01;->a(Ll/y01;Landroid/view/View;)V

    return-void
.end method
