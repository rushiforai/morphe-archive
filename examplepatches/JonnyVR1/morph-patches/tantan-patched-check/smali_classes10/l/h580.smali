.class public final synthetic Ll/h580;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/q580;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/q580;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h580;->a:Ll/q580;

    iput-object p2, p0, Ll/h580;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h580;->a:Ll/q580;

    iget-object p0, p0, Ll/h580;->b:Landroid/view/View;

    invoke-static {v0, p0}, Ll/q580;->U3(Ll/q580;Landroid/view/View;)V

    return-void
.end method
