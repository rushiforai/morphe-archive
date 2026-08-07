.class public final synthetic Ll/gp50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/hp50;

.field public final synthetic b:Lcom/p1/mobile/putong/data/SignUpData;


# direct methods
.method public synthetic constructor <init>(Ll/hp50;Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gp50;->a:Ll/hp50;

    iput-object p2, p0, Ll/gp50;->b:Lcom/p1/mobile/putong/data/SignUpData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gp50;->a:Ll/hp50;

    iget-object p0, p0, Ll/gp50;->b:Lcom/p1/mobile/putong/data/SignUpData;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, p0, p1}, Ll/hp50;->a(Ll/hp50;Lcom/p1/mobile/putong/data/SignUpData;Landroid/util/Pair;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
