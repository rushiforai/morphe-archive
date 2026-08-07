.class public final synthetic Ll/mjs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qjs;


# direct methods
.method public synthetic constructor <init>(Ll/qjs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mjs;->a:Ll/qjs;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mjs;->a:Ll/qjs;

    check-cast p1, Landroid/graphics/drawable/Drawable;

    invoke-static {p0, p1}, Ll/qjs;->c(Ll/qjs;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
