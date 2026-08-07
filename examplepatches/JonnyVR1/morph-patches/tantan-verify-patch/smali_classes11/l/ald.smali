.class public final synthetic Ll/ald;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/hk0$a;

.field public final synthetic b:Ll/mtv;

.field public final synthetic c:Ll/ktx;


# direct methods
.method public synthetic constructor <init>(Ll/hk0$a;Ll/mtv;Ll/ktx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ald;->a:Ll/hk0$a;

    iput-object p2, p0, Ll/ald;->b:Ll/mtv;

    iput-object p3, p0, Ll/ald;->c:Ll/ktx;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ald;->a:Ll/hk0$a;

    iget-object v1, p0, Ll/ald;->b:Ll/mtv;

    iget-object p0, p0, Ll/ald;->c:Ll/ktx;

    check-cast p1, Ll/hk0;

    invoke-static {v0, v1, p0, p1}, Ll/wld;->Q0(Ll/hk0$a;Ll/mtv;Ll/ktx;Ll/hk0;)V

    return-void
.end method
