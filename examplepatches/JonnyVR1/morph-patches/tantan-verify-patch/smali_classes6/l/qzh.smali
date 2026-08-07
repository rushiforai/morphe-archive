.class public final synthetic Ll/qzh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/rzh;

.field public final synthetic b:Ll/uzh;


# direct methods
.method public synthetic constructor <init>(Ll/rzh;Ll/uzh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qzh;->a:Ll/rzh;

    iput-object p2, p0, Ll/qzh;->b:Ll/uzh;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qzh;->a:Ll/rzh;

    iget-object p0, p0, Ll/qzh;->b:Ll/uzh;

    invoke-static {v0, p0, p1}, Ll/rzh;->H(Ll/rzh;Ll/uzh;Landroid/view/View;)V

    return-void
.end method
