.class public final synthetic Ll/hs3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/is3;

.field public final synthetic b:Ll/nsb;


# direct methods
.method public synthetic constructor <init>(Ll/is3;Ll/nsb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hs3;->a:Ll/is3;

    iput-object p2, p0, Ll/hs3;->b:Ll/nsb;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hs3;->a:Ll/is3;

    iget-object p0, p0, Ll/hs3;->b:Ll/nsb;

    invoke-static {v0, p0, p1}, Ll/is3;->E(Ll/is3;Ll/nsb;Landroid/view/View;)V

    return-void
.end method
