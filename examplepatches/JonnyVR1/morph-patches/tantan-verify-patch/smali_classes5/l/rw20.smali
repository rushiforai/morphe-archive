.class public final synthetic Ll/rw20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ww20;


# direct methods
.method public synthetic constructor <init>(Ll/ww20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rw20;->a:Ll/ww20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rw20;->a:Ll/ww20;

    invoke-static {p0, p1}, Ll/ww20;->l(Ll/ww20;Landroid/view/View;)V

    return-void
.end method
