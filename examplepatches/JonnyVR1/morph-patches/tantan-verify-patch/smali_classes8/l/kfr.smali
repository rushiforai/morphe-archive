.class public final synthetic Ll/kfr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ofr;


# direct methods
.method public synthetic constructor <init>(Ll/ofr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kfr;->a:Ll/ofr;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kfr;->a:Ll/ofr;

    invoke-static {p0, p1}, Ll/ofr;->b(Ll/ofr;Landroid/view/View;)V

    return-void
.end method
