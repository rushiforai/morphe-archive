.class public final synthetic Ll/hld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/hk0$a;

.field public final synthetic b:I

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/hk0$a;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hld;->a:Ll/hk0$a;

    iput p2, p0, Ll/hld;->b:I

    iput-boolean p3, p0, Ll/hld;->c:Z

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hld;->a:Ll/hk0$a;

    iget v1, p0, Ll/hld;->b:I

    iget-boolean p0, p0, Ll/hld;->c:Z

    check-cast p1, Ll/hk0;

    invoke-static {v0, v1, p0, p1}, Ll/wld;->u1(Ll/hk0$a;IZLl/hk0;)V

    return-void
.end method
