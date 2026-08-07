.class public final Ll/kgu0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Ll/yew0;

.field public c:Z


# direct methods
.method public constructor <init>(Ll/q6w0;Ll/yew0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Ll/q6w0;->q:Ljava/util/List;

    .line 5
    .line 6
    iput-object p1, p0, Ll/kgu0;->a:Ljava/util/List;

    .line 7
    .line 8
    iput-object p2, p0, Ll/kgu0;->b:Ll/yew0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/kgu0;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/kgu0;->b:Ll/yew0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/kgu0;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/yew0;->d(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Ll/kgu0;->c:Z

    .line 14
    .line 15
    :cond_0
    return-void
.end method
