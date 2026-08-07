.class public final synthetic Ll/y1g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/z1g;


# direct methods
.method public synthetic constructor <init>(Ll/z1g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y1g;->a:Ll/z1g;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y1g;->a:Ll/z1g;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/z1g;->m(Ll/z1g;Landroid/view/View;)V

    return-void
.end method
