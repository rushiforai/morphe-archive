.class public final synthetic Ll/tjd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/hk0$a;

.field public final synthetic b:Z

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/hk0$a;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tjd;->a:Ll/hk0$a;

    iput-boolean p2, p0, Ll/tjd;->b:Z

    iput p3, p0, Ll/tjd;->c:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tjd;->a:Ll/hk0$a;

    iget-boolean v1, p0, Ll/tjd;->b:Z

    iget p0, p0, Ll/tjd;->c:I

    check-cast p1, Ll/hk0;

    invoke-static {v0, v1, p0, p1}, Ll/wld;->h1(Ll/hk0$a;ZILl/hk0;)V

    return-void
.end method
