.class public final synthetic Ll/xjt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yjt0;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Z

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Ll/yjt0;IIZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xjt0;->a:Ll/yjt0;

    .line 5
    .line 6
    iput p2, p0, Ll/xjt0;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/xjt0;->c:I

    .line 9
    .line 10
    iput-boolean p4, p0, Ll/xjt0;->d:Z

    .line 11
    .line 12
    iput-boolean p5, p0, Ll/xjt0;->e:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xjt0;->a:Ll/yjt0;

    .line 2
    .line 3
    iget v1, p0, Ll/xjt0;->b:I

    .line 4
    .line 5
    iget v2, p0, Ll/xjt0;->c:I

    .line 6
    .line 7
    iget-boolean v3, p0, Ll/xjt0;->d:Z

    .line 8
    .line 9
    iget-boolean p0, p0, Ll/xjt0;->e:Z

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3, p0}, Ll/yjt0;->q8(IIZZ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
