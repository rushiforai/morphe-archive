.class public final synthetic Lwii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvwh;
.implements Ldkj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Liji;


# direct methods
.method public synthetic constructor <init>(Liji;B)V
    .registers 3

    iput-byte p2, p0, Lwii;->a:B

    iput-object p1, p0, Lwii;->b:Liji;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-object p0, p0, Lwii;->b:Liji;

    iget-object v0, p0, Liji;->c:Ldx3;

    new-instance v1, Lw8d;

    const/4 v2, 0x2

    const/4 v3, 0x1

    invoke-direct {v1, v2, p0, v3}, Lw8d;-><init>(BLjava/lang/Object;Z)V

    sget-object p0, Llg7;->a:[[I

    invoke-static {v0}, Lr9n;->X(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_19

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, p0}, Lw8d;->run(Ljava/lang/Object;)V

    return-void

    :cond_19
    iget-object p0, v0, Ldx3;->j:Lqi;

    new-instance v0, Ldz4;

    invoke-direct {v0, v1}, Ldz4;-><init>(Lcom/opera/api/Callback;)V

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {p0, v1, v0}, Lf03;->U(Lorg/chromium/ui/base/WindowAndroid;Ljava/lang/String;Lbag;)V

    return-void
.end method

.method public final f(Lo93;)V
    .registers 2

    iget-object p0, p0, Lwii;->b:Liji;

    invoke-virtual {p0, p1}, Liji;->R(Lo93;)V

    return-void
.end method
