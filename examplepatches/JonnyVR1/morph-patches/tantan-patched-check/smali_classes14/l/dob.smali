.class public final synthetic Ll/dob;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/lqb;

.field public final synthetic b:Lcom/alipay/sdk/app/AuthTask;


# direct methods
.method public synthetic constructor <init>(Ll/lqb;Lcom/alipay/sdk/app/AuthTask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dob;->a:Ll/lqb;

    iput-object p2, p0, Ll/dob;->b:Lcom/alipay/sdk/app/AuthTask;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dob;->a:Ll/lqb;

    iget-object p0, p0, Ll/dob;->b:Lcom/alipay/sdk/app/AuthTask;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/lqb;->i3(Ll/lqb;Lcom/alipay/sdk/app/AuthTask;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
