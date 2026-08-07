.class public final synthetic Ll/vue;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/sve;


# direct methods
.method public synthetic constructor <init>(Ll/sve;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vue;->a:Ll/sve;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vue;->a:Ll/sve;

    check-cast p1, Lcom/p1/mobile/putong/account/data/CaptchaData;

    invoke-static {p0, p1}, Ll/sve;->e1(Ll/sve;Lcom/p1/mobile/putong/account/data/CaptchaData;)V

    return-void
.end method
