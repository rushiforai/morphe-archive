.class public final synthetic Ll/b44;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/c44;


# direct methods
.method public synthetic constructor <init>(Ll/c44;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b44;->a:Ll/c44;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b44;->a:Ll/c44;

    invoke-static {p0, p1}, Ll/c44;->a(Ll/c44;Landroid/view/View;)V

    return-void
.end method
