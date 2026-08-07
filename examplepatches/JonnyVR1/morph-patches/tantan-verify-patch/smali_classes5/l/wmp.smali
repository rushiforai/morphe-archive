.class public final synthetic Ll/wmp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Ll/gnp;


# direct methods
.method public synthetic constructor <init>(Ll/gnp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wmp;->a:Ll/gnp;

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wmp;->a:Ll/gnp;

    invoke-static {p0, p1, p2, p3}, Ll/gnp;->j0(Ll/gnp;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
