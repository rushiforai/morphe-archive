.class public final synthetic Ll/lnt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/rnt;


# direct methods
.method public synthetic constructor <init>(Ll/rnt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lnt;->a:Ll/rnt;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnt;->a:Ll/rnt;

    invoke-static {p0, p1}, Ll/rnt;->e(Ll/rnt;Landroid/view/View;)V

    return-void
.end method
