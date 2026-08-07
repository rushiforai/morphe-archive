.class public final synthetic Ll/rkd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/hk0$a;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/hk0$a;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rkd;->a:Ll/hk0$a;

    iput-object p2, p0, Ll/rkd;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rkd;->a:Ll/hk0$a;

    iget-object p0, p0, Ll/rkd;->b:Ljava/util/List;

    check-cast p1, Ll/hk0;

    invoke-static {v0, p0, p1}, Ll/wld;->x1(Ll/hk0$a;Ljava/util/List;Ll/hk0;)V

    return-void
.end method
