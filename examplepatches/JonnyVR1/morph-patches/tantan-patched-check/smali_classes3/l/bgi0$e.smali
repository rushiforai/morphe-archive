.class public Ll/bgi0$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/bgi0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field public final a:Ll/xc00;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final synthetic b:Ll/bgi0;


# direct methods
.method public constructor <init>(Ll/bgi0;Ll/xc00;)V
    .locals 0
    .param p1    # Ll/bgi0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/bgi0$e;->b:Ll/bgi0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/bgi0$e;->a:Ll/xc00;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/bgi0;Ll/xc00;Ll/cgi0;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Ll/bgi0$e;-><init>(Ll/bgi0;Ll/xc00;)V

    return-void
.end method


# virtual methods
.method public a(IILandroid/content/Intent;)Z
    .locals 8

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    iget-object v1, p0, Ll/bgi0$e;->b:Ll/bgi0;

    .line 5
    .line 6
    iget-object v2, p0, Ll/bgi0$e;->a:Ll/xc00;

    .line 7
    .line 8
    sget-object v6, Lcom/p1/mobile/android/app/Act;->tempFileName:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1}, Ll/bgi0;->d0(Ll/bgi0;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v7

    .line 14
    move v3, p1

    .line 15
    move v4, p2

    .line 16
    move-object v5, p3

    .line 17
    invoke-static/range {v1 .. v7}, Ll/bgi0;->g0(Ll/bgi0;Ll/xc00;IILandroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    sput-object p0, Lcom/p1/mobile/android/app/Act;->tempFileName:Ljava/lang/String;

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bgi0$e;->a:Ll/xc00;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/bgi0$e;->a:Ll/xc00;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->registerOnActivityResultListener(Lcom/p1/mobile/android/app/a$a;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bgi0$e;->a:Ll/xc00;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/bgi0$e;->a:Ll/xc00;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->unregisterOnActivityResultListener(Lcom/p1/mobile/android/app/a$a;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
