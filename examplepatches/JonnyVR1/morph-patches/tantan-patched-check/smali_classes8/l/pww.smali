.class public final synthetic Ll/pww;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$l;


# instance fields
.field public final synthetic a:Ll/sww;


# direct methods
.method public synthetic constructor <init>(Ll/sww;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pww;->a:Ll/sww;

    return-void
.end method


# virtual methods
.method public final onClose()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pww;->a:Ll/sww;

    invoke-static {p0}, Ll/sww;->l(Ll/sww;)Z

    move-result p0

    return p0
.end method
