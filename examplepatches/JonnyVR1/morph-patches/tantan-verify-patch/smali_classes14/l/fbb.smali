.class public final synthetic Ll/fbb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fbb;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fbb;->a:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/core/api/c0$b;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/c0;->a(Ljava/lang/String;Lcom/p1/mobile/putong/core/api/c0$b;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
