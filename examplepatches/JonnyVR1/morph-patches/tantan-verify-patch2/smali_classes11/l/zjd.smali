.class public final synthetic Ll/zjd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/hk0$a;

.field public final synthetic b:Ll/mtv;

.field public final synthetic c:Ll/ktx;

.field public final synthetic d:Ljava/io/IOException;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Ll/hk0$a;Ll/mtv;Ll/ktx;Ljava/io/IOException;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zjd;->a:Ll/hk0$a;

    iput-object p2, p0, Ll/zjd;->b:Ll/mtv;

    iput-object p3, p0, Ll/zjd;->c:Ll/ktx;

    iput-object p4, p0, Ll/zjd;->d:Ljava/io/IOException;

    iput-boolean p5, p0, Ll/zjd;->e:Z

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/zjd;->a:Ll/hk0$a;

    iget-object v1, p0, Ll/zjd;->b:Ll/mtv;

    iget-object v2, p0, Ll/zjd;->c:Ll/ktx;

    iget-object v3, p0, Ll/zjd;->d:Ljava/io/IOException;

    iget-boolean v4, p0, Ll/zjd;->e:Z

    move-object v5, p1

    check-cast v5, Ll/hk0;

    invoke-static/range {v0 .. v5}, Ll/wld;->L0(Ll/hk0$a;Ll/mtv;Ll/ktx;Ljava/io/IOException;ZLl/hk0;)V

    return-void
.end method
