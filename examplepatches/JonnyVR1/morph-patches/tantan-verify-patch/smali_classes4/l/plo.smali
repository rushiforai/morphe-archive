.class public final synthetic Ll/plo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tlo;


# direct methods
.method public synthetic constructor <init>(Ll/tlo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/plo;->a:Ll/tlo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/plo;->a:Ll/tlo;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/tlo;->b(Ll/tlo;Landroid/view/View;)V

    return-void
.end method
