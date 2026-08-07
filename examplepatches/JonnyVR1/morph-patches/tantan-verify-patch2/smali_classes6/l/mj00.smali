.class public final synthetic Ll/mj00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nk00;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/nk00;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mj00;->a:Ll/nk00;

    iput-object p2, p0, Ll/mj00;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mj00;->a:Ll/nk00;

    iget-object p0, p0, Ll/mj00;->b:Landroid/view/View;

    check-cast p1, Lv/VImage;

    invoke-static {v0, p0, p1}, Ll/nk00;->w(Ll/nk00;Landroid/view/View;Lv/VImage;)V

    return-void
.end method
