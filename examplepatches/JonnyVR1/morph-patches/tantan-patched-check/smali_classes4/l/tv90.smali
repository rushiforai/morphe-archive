.class public final synthetic Ll/tv90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Ll/aw90;


# direct methods
.method public synthetic constructor <init>(Ll/aw90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tv90;->a:Ll/aw90;

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tv90;->a:Ll/aw90;

    invoke-static {p0, p1, p2, p3}, Ll/aw90;->h(Ll/aw90;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
