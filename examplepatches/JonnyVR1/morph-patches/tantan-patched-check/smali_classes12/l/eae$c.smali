.class Ll/eae$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/azm;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/eae;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public a:I

.field private b:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/eae$c;->b:I

    .line 6
    .line 7
    iput p1, p0, Ll/eae$c;->a:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public intercept(Ll/azm$a;)Ll/i5d0;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/azm$a;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p1, v0}, Ll/azm$a;->a(Ll/x1d0;)Ll/i5d0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    :goto_0
    invoke-virtual {v1}, Ll/i5d0;->I()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    iget v2, p0, Ll/eae$c;->b:I

    .line 16
    .line 17
    iget v3, p0, Ll/eae$c;->a:I

    .line 18
    .line 19
    if-ge v2, v3, :cond_0

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/i5d0;->close()V

    .line 22
    .line 23
    .line 24
    iget v1, p0, Ll/eae$c;->b:I

    .line 25
    .line 26
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    iput v1, p0, Ll/eae$c;->b:I

    .line 29
    .line 30
    invoke-interface {p1, v0}, Ll/azm$a;->a(Ll/x1d0;)Ll/i5d0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    return-object v1
.end method
