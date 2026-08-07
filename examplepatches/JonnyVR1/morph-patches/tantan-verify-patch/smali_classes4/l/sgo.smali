.class public final synthetic Ll/sgo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tgo;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lv/VText_NoTopPadding;


# direct methods
.method public synthetic constructor <init>(Ll/tgo;Landroid/view/View;Lv/VText_NoTopPadding;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sgo;->a:Ll/tgo;

    iput-object p2, p0, Ll/sgo;->b:Landroid/view/View;

    iput-object p3, p0, Ll/sgo;->c:Lv/VText_NoTopPadding;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sgo;->a:Ll/tgo;

    iget-object v1, p0, Ll/sgo;->b:Landroid/view/View;

    iget-object p0, p0, Ll/sgo;->c:Lv/VText_NoTopPadding;

    check-cast p1, [I

    invoke-static {v0, v1, p0, p1}, Ll/tgo;->d(Ll/tgo;Landroid/view/View;Lv/VText_NoTopPadding;[I)V

    return-void
.end method
