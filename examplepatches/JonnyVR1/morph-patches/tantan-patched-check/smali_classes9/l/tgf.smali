.class public final synthetic Ll/tgf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/zgf;


# direct methods
.method public synthetic constructor <init>(Ll/zgf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tgf;->a:Ll/zgf;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tgf;->a:Ll/zgf;

    invoke-static {p0, p1}, Ll/zgf;->U(Ll/zgf;Landroid/view/View;)V

    return-void
.end method
