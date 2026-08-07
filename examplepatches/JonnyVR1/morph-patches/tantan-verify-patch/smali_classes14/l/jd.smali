.class public final synthetic Ll/jd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/SignUpData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jd;->a:Lcom/p1/mobile/putong/data/SignUpData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jd;->a:Lcom/p1/mobile/putong/data/SignUpData;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->N(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
