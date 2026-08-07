.class public final synthetic Ll/wo90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ap90;


# direct methods
.method public synthetic constructor <init>(Ll/ap90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wo90;->a:Ll/ap90;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wo90;->a:Ll/ap90;

    invoke-static {p0, p1}, Ll/ap90;->p0(Ll/ap90;Landroid/view/View;)V

    return-void
.end method
