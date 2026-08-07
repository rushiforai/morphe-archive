.class public final synthetic Ll/yjd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/hk0$a;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/hk0$a;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yjd;->a:Ll/hk0$a;

    iput p2, p0, Ll/yjd;->b:I

    iput p3, p0, Ll/yjd;->c:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yjd;->a:Ll/hk0$a;

    iget v1, p0, Ll/yjd;->b:I

    iget p0, p0, Ll/yjd;->c:I

    check-cast p1, Ll/hk0;

    invoke-static {v0, v1, p0, p1}, Ll/wld;->b1(Ll/hk0$a;IILl/hk0;)V

    return-void
.end method
