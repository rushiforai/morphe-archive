.class public final synthetic Ll/k020;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/q020;


# direct methods
.method public synthetic constructor <init>(Ll/q020;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k020;->a:Ll/q020;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k020;->a:Ll/q020;

    invoke-static {p0, p1}, Ll/q020;->p(Ll/q020;Landroid/view/View;)V

    return-void
.end method
