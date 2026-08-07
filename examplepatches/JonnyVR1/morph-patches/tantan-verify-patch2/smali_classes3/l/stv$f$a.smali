.class public Ll/stv$f$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/stv$f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/Object;

.field public volatile b:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ll/stv$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/stv$f$a;->a:Ljava/lang/Object;

    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ll/stv$c;Ll/ttv;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2}, Ll/stv$f$a;-><init>(Ljava/lang/Object;Ll/stv$c;)V

    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "registerReceiver"

    .line 6
    .line 7
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget p1, p0, Ll/stv$f$a;->b:I

    .line 14
    .line 15
    const/16 v0, 0x3e8

    .line 16
    .line 17
    if-lt p1, v0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0

    .line 21
    :cond_0
    iget p1, p0, Ll/stv$f$a;->b:I

    .line 22
    .line 23
    add-int/lit8 p1, p1, 0x1

    .line 24
    .line 25
    iput p1, p0, Ll/stv$f$a;->b:I

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    const-string v0, "unregisterReceiver"

    .line 29
    .line 30
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_3

    .line 35
    .line 36
    iget p1, p0, Ll/stv$f$a;->b:I

    .line 37
    .line 38
    add-int/lit8 p1, p1, -0x1

    .line 39
    .line 40
    iput p1, p0, Ll/stv$f$a;->b:I

    .line 41
    .line 42
    iget p1, p0, Ll/stv$f$a;->b:I

    .line 43
    .line 44
    if-gez p1, :cond_2

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    goto :goto_0

    .line 48
    :cond_2
    iget p1, p0, Ll/stv$f$a;->b:I

    .line 49
    .line 50
    :goto_0
    iput p1, p0, Ll/stv$f$a;->b:I

    .line 51
    .line 52
    :cond_3
    :goto_1
    iget-object p0, p0, Ll/stv$f$a;->a:Ljava/lang/Object;

    .line 53
    .line 54
    invoke-virtual {p2, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method
