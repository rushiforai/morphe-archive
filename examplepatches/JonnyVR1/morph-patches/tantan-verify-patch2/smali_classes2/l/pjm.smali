.class public final synthetic Ll/pjm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/up80;


# instance fields
.field public final synthetic a:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pjm;->a:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pjm;->a:Landroid/net/Uri;

    check-cast p1, Ll/by3;

    invoke-static {p0, p1}, Ll/rjm;->a(Landroid/net/Uri;Ll/by3;)Z

    move-result p0

    return p0
.end method
