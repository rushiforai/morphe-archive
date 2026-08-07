.class public Ll/uj20$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vj20$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/uj20;->b(Ll/z06;Ll/yk90;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/vhi;

.field public final synthetic b:Ll/uj20;


# direct methods
.method public constructor <init>(Ll/uj20;Ll/vhi;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uj20$a;->b:Ll/uj20;

    .line 2
    .line 3
    iput-object p2, p0, Ll/uj20$a;->a:Ll/vhi;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uj20$a;->b:Ll/uj20;

    .line 2
    .line 3
    iget-object p0, p0, Ll/uj20$a;->a:Ll/vhi;

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/uj20;->c(Ll/uj20;Ll/vhi;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b(Ljava/io/InputStream;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "NetworkFetcher->onResponse"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/uj20$a;->b:Ll/uj20;

    .line 13
    .line 14
    iget-object p0, p0, Ll/uj20$a;->a:Ll/vhi;

    .line 15
    .line 16
    invoke-virtual {v0, p0, p1, p2}, Ll/uj20;->m(Ll/vhi;Ljava/io/InputStream;I)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/i9j;->d()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-static {}, Ll/i9j;->b()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public onFailure(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uj20$a;->b:Ll/uj20;

    .line 2
    .line 3
    iget-object p0, p0, Ll/uj20$a;->a:Ll/vhi;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Ll/uj20;->d(Ll/uj20;Ll/vhi;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
