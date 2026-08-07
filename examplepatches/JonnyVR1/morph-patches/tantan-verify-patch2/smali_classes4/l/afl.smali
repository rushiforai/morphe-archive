.class public final synthetic Ll/afl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yfl;


# direct methods
.method public synthetic constructor <init>(Ll/yfl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/afl;->a:Ll/yfl;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/afl;->a:Ll/yfl;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/yfl;->p(Ll/yfl;Landroid/view/View;)V

    return-void
.end method
