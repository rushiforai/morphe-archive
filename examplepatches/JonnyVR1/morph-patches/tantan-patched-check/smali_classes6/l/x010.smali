.class public final synthetic Ll/x010;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/c110;


# direct methods
.method public synthetic constructor <init>(Ll/c110;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x010;->a:Ll/c110;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x010;->a:Ll/c110;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/c110;->f(Ll/c110;Landroid/view/View;)V

    return-void
.end method
