.class public final synthetic Ll/nr5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/rr5;


# direct methods
.method public synthetic constructor <init>(Ll/rr5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nr5;->a:Ll/rr5;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nr5;->a:Ll/rr5;

    invoke-static {p0, p1}, Ll/rr5;->e(Ll/rr5;Landroid/view/View;)V

    return-void
.end method
