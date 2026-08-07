.class public final synthetic Ll/aoz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tvz;

.field public final synthetic b:Z

.field public final synthetic c:[Z


# direct methods
.method public synthetic constructor <init>(Ll/tvz;Z[Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aoz;->a:Ll/tvz;

    iput-boolean p2, p0, Ll/aoz;->b:Z

    iput-object p3, p0, Ll/aoz;->c:[Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/aoz;->a:Ll/tvz;

    iget-boolean v1, p0, Ll/aoz;->b:Z

    iget-object p0, p0, Ll/aoz;->c:[Z

    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {v0, v1, p0, p1}, Ll/tvz;->Pa(Ll/tvz;Z[ZLcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method
