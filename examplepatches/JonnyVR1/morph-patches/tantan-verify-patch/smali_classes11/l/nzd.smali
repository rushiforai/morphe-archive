.class public final synthetic Ll/nzd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/facebook/login/DeviceAuthDialog;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/facebook/login/DeviceAuthDialog$b;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/util/Date;

.field public final synthetic f:Ljava/util/Date;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/login/DeviceAuthDialog;Ljava/lang/String;Lcom/facebook/login/DeviceAuthDialog$b;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nzd;->a:Lcom/facebook/login/DeviceAuthDialog;

    iput-object p2, p0, Ll/nzd;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/nzd;->c:Lcom/facebook/login/DeviceAuthDialog$b;

    iput-object p4, p0, Ll/nzd;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/nzd;->e:Ljava/util/Date;

    iput-object p6, p0, Ll/nzd;->f:Ljava/util/Date;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/nzd;->a:Lcom/facebook/login/DeviceAuthDialog;

    iget-object v1, p0, Ll/nzd;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/nzd;->c:Lcom/facebook/login/DeviceAuthDialog$b;

    iget-object v3, p0, Ll/nzd;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/nzd;->e:Ljava/util/Date;

    iget-object v5, p0, Ll/nzd;->f:Ljava/util/Date;

    move-object v6, p1

    move v7, p2

    invoke-static/range {v0 .. v7}, Lcom/facebook/login/DeviceAuthDialog;->W3(Lcom/facebook/login/DeviceAuthDialog;Ljava/lang/String;Lcom/facebook/login/DeviceAuthDialog$b;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Landroid/content/DialogInterface;I)V

    return-void
.end method
