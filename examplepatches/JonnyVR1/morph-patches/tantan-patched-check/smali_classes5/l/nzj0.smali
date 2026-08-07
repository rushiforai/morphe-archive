.class public final synthetic Ll/nzj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Ll/p0k0;

.field public final synthetic b:Lrx/subjects/a;

.field public final synthetic c:Ll/p0k0$b;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;

.field public final synthetic e:Ll/p0k0$a;


# direct methods
.method public synthetic constructor <init>(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nzj0;->a:Ll/p0k0;

    iput-object p2, p0, Ll/nzj0;->b:Lrx/subjects/a;

    iput-object p3, p0, Ll/nzj0;->c:Ll/p0k0$b;

    iput-object p4, p0, Ll/nzj0;->d:Lcom/p1/mobile/android/app/Act;

    iput-object p5, p0, Ll/nzj0;->e:Ll/p0k0$a;

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 8

    .line 1
    iget-object v0, p0, Ll/nzj0;->a:Ll/p0k0;

    iget-object v1, p0, Ll/nzj0;->b:Lrx/subjects/a;

    iget-object v2, p0, Ll/nzj0;->c:Ll/p0k0$b;

    iget-object v3, p0, Ll/nzj0;->d:Lcom/p1/mobile/android/app/Act;

    iget-object v4, p0, Ll/nzj0;->e:Ll/p0k0$a;

    move v5, p1

    move v6, p2

    move-object v7, p3

    invoke-static/range {v0 .. v7}, Ll/p0k0;->H(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
