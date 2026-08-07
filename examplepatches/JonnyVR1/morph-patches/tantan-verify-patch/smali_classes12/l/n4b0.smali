.class public Ll/n4b0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Lcom/immomo/moment/opengl/a;

.field private b:Lcom/immomo/moment/opengl/b;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n4b0;->a:Lcom/immomo/moment/opengl/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/l4b0;->d()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/n4b0;->a:Lcom/immomo/moment/opengl/a;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/n4b0;->b:Lcom/immomo/moment/opengl/b;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/l4b0;->d()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Ll/n4b0;->b:Lcom/immomo/moment/opengl/b;

    .line 19
    .line 20
    :cond_1
    return-void
.end method
