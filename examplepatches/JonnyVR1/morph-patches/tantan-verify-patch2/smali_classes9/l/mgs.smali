.class public final synthetic Ll/mgs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/tgs;


# direct methods
.method public synthetic constructor <init>(Ll/tgs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mgs;->a:Ll/tgs;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mgs;->a:Ll/tgs;

    invoke-static {p0, p1}, Ll/tgs;->K(Ll/tgs;Landroid/view/View;)V

    return-void
.end method
