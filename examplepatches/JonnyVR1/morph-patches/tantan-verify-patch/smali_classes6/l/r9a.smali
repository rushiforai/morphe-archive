.class public final synthetic Ll/r9a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r9a;->a:Ll/jka;

    iput-object p2, p0, Ll/r9a;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/r9a;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r9a;->a:Ll/jka;

    iget-object v1, p0, Ll/r9a;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/r9a;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {v0, v1, p0, p1}, Ll/jka;->B5(Ll/jka;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
