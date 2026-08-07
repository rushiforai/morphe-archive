.class Ll/lt5$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/lt5;->h(ZLjava/lang/String;Ljava/lang/String;Ll/lt5$c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:Ll/lt5$c;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Ljava/lang/String;

.field final synthetic e:Ll/lt5;


# direct methods
.method public constructor <init>(Ll/lt5;ZLl/lt5$c;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/lt5$b;->e:Ll/lt5;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/lt5$b;->a:Z

    .line 4
    .line 5
    iput-object p3, p0, Ll/lt5$b;->b:Ll/lt5$c;

    .line 6
    .line 7
    iput-object p4, p0, Ll/lt5$b;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Ll/lt5$b;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/lt5$b;->a:Z

    .line 2
    .line 3
    iget-object v1, p0, Ll/lt5$b;->b:Ll/lt5$c;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/lt5$b;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {v1, p0}, Ll/lt5$c;->b(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Ll/lt5$b;->c:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p0, Ll/lt5$b;->d:Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {v1, v0, p0}, Ll/lt5$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
