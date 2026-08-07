.class Ll/ib4$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ib4;->s1(Ll/ylg;Ll/yuf;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/yuf;

.field final synthetic b:Ll/ib4;


# direct methods
.method public constructor <init>(Ll/ib4;Ll/ylg;Ll/yuf;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ib4$a;->b:Ll/ib4;

    .line 2
    .line 3
    iput-object p3, p0, Ll/ib4$a;->a:Ll/yuf;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ib4$a;->b:Ll/ib4;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/ib4;->e2(Ll/ib4;Ll/ylg;)Ll/ylg;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ib4$a;->b:Ll/ib4;

    .line 8
    .line 9
    iget-object p0, p0, Ll/ib4$a;->a:Ll/yuf;

    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/ib4;->f2(Ll/ib4;Ll/yuf;)Ll/yuf;

    .line 12
    .line 13
    .line 14
    return-void
.end method
