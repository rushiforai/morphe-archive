.class public final synthetic Ll/nwy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Ll/wwy;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/wwy;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nwy;->a:Ll/wwy;

    iput p2, p0, Ll/nwy;->b:I

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nwy;->a:Ll/wwy;

    iget p0, p0, Ll/nwy;->b:I

    invoke-static {v0, p0, p1, p2, p3}, Ll/wwy;->G(Ll/wwy;IIILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
