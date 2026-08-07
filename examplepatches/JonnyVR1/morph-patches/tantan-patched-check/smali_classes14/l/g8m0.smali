.class public final synthetic Ll/g8m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/j8m0;


# direct methods
.method public synthetic constructor <init>(Ll/j8m0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g8m0;->a:Ll/j8m0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g8m0;->a:Ll/j8m0;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/j8m0;->j(Ll/j8m0;Landroid/net/NetworkInfo;)V

    return-void
.end method
