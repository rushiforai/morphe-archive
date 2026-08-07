.class public final synthetic Ll/hh2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/yh2;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/yh2;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hh2;->a:Ll/yh2;

    iput-object p2, p0, Ll/hh2;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hh2;->a:Ll/yh2;

    iget-object p0, p0, Ll/hh2;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Ll/yh2;->P3(Ll/yh2;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
