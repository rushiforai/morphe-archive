.class public final synthetic Ll/twl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/vwl0;

.field public final synthetic b:Ll/g1e;


# direct methods
.method public synthetic constructor <init>(Ll/vwl0;Ll/g1e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/twl0;->a:Ll/vwl0;

    iput-object p2, p0, Ll/twl0;->b:Ll/g1e;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/twl0;->a:Ll/vwl0;

    iget-object p0, p0, Ll/twl0;->b:Ll/g1e;

    invoke-static {v0, p0, p1}, Ll/vwl0;->b(Ll/vwl0;Ll/g1e;Landroid/view/View;)V

    return-void
.end method
