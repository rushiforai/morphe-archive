.class public final synthetic Ll/jai;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mai;


# direct methods
.method public synthetic constructor <init>(Ll/mai;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jai;->a:Ll/mai;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jai;->a:Ll/mai;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/mai;->f0(Ll/mai;Landroid/net/NetworkInfo;)V

    return-void
.end method
