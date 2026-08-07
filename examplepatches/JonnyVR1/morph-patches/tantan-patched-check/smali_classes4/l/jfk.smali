.class public final synthetic Ll/jfk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pfk;


# direct methods
.method public synthetic constructor <init>(Ll/pfk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jfk;->a:Ll/pfk;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfk;->a:Ll/pfk;

    invoke-static {p0, p1}, Ll/pfk;->b(Ll/pfk;Landroid/view/View;)V

    return-void
.end method
