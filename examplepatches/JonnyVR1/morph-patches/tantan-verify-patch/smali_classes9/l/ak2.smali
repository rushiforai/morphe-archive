.class public final synthetic Ll/ak2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/ck2;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/ck2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ak2;->a:Ll/ck2;

    iput-object p2, p0, Ll/ak2;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ak2;->a:Ll/ck2;

    iget-object p0, p0, Ll/ak2;->b:Landroid/view/View;

    invoke-static {v0, p0}, Ll/ck2;->J3(Ll/ck2;Landroid/view/View;)V

    return-void
.end method
