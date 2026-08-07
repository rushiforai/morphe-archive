.class public final synthetic Ll/ug4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bh4;


# direct methods
.method public synthetic constructor <init>(Ll/bh4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ug4;->a:Ll/bh4;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ug4;->a:Ll/bh4;

    check-cast p1, Landroid/widget/TextView;

    invoke-static {p0, p1}, Ll/bh4;->c(Ll/bh4;Landroid/widget/TextView;)V

    return-void
.end method
