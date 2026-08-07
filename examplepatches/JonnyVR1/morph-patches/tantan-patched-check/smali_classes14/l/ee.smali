.class public final synthetic Ll/ee;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/account_facebook/data/FacebookSignupData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/account_facebook/data/FacebookSignupData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ee;->a:Lcom/p1/mobile/account_facebook/data/FacebookSignupData;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ee;->a:Lcom/p1/mobile/account_facebook/data/FacebookSignupData;

    invoke-static {p0}, Lcom/p1/mobile/putong/account/api/a;->X(Lcom/p1/mobile/account_facebook/data/FacebookSignupData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
