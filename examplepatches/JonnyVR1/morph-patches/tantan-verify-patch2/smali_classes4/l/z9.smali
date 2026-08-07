.class public final synthetic Ll/z9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ea;


# direct methods
.method public synthetic constructor <init>(Ll/ea;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z9;->a:Ll/ea;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z9;->a:Ll/ea;

    invoke-static {p0, p1}, Ll/ea;->u(Ll/ea;Landroid/view/View;)V

    return-void
.end method
