.class public final synthetic Ll/drd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ljava/util/Map;

.field public final synthetic c:Lcom/p1/mobile/putong/data/VerificationToken;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ljava/util/Map;Lcom/p1/mobile/putong/data/VerificationToken;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/drd0;->a:Landroid/content/Context;

    iput-object p2, p0, Ll/drd0;->b:Ljava/util/Map;

    iput-object p3, p0, Ll/drd0;->c:Lcom/p1/mobile/putong/data/VerificationToken;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/drd0;->a:Landroid/content/Context;

    iget-object v1, p0, Ll/drd0;->b:Ljava/util/Map;

    iget-object p0, p0, Ll/drd0;->c:Lcom/p1/mobile/putong/data/VerificationToken;

    check-cast p1, Ll/gcg0;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/facertification/RxFacertification;->a(Landroid/content/Context;Ljava/util/Map;Lcom/p1/mobile/putong/data/VerificationToken;Ll/gcg0;)V

    return-void
.end method
